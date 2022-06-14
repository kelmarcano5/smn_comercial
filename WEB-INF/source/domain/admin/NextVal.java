package domain.admin;

import dinamica.*;

/**
 * Clase que publica un recordset que contiene el ID
 * recien generado de la tabla s_application, verifica si
 * la base de datos es de postgre o oracle para cargar un sql
 * o otro<br><br>
 * Fecha de actualizacion: 2010-08-06<br>
 * Fecha de creacion: 2010-08-06<br>
 * @author Martin Cordova y Asociados C.A
 */
public class NextVal extends dinamica.audit.AuditableTransaction {

	@Override
	public int service(Recordset inputParams) throws Throwable {
		 
		String sql = "";
		String dbName = this.getConnection().getMetaData().getDatabaseProductName().toLowerCase();
		if (dbName.contains("oracle"))
			sql = getResource("nextval-oracle.sql");
		else {
			if (dbName.contains("db2"))
				sql = getResource("nextval-db2.sql");
			else
				sql = getResource("nextval-pgsql.sql");
		}
		
		Recordset rs = getDb().get(getSQL(sql, inputParams));
		publish("nextval.sql", rs);
		
		super.service(inputParams);
		
		rs = getDb().get(getSQL(getResource("query.sql"), rs));
		publish("query.sql", rs);
		
		return 0;
	}

}
