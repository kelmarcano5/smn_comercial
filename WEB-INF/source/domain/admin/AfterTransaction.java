package domain.admin;

import dinamica.Recordset;
import dinamica.audit.AuditableTransaction;

/**
 * Clase que ejecuta un recordset despues que ha
 * se ha realizado la transaccion este recordset
 * es publicado<br><br>
 * Fecha de creacion: 2010-08-06<br>
 * Fecha de actualizacion: 2010-08-06<br>
 * @author Martin Cordova y Asociados C.A
 */
public class AfterTransaction extends AuditableTransaction {

	@Override
	public int service(Recordset inputParams) throws Throwable {
		
		int rc = super.service(inputParams);
		
		String sqlAudit = getConfig().getConfigValue("//audit/recordset");
		if (sqlAudit!=null) {
			if (!sqlAudit.equals("")) {
				Recordset rs = getDb().get(getSQL(getResource(sqlAudit), inputParams));
				publish(sqlAudit, rs);
			}
		}
				
		return rc;
	}

}
