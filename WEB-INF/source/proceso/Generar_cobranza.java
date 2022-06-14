package proceso;

import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.sql.DataSource;

import dinamica.Db;
import dinamica.GenericTransaction;
import dinamica.Jndi;
import dinamica.Recordset;

public class Generar_cobranza extends GenericTransaction {
	public int service(Recordset inputParams) throws Throwable{
		int rc = 0;
		
		super.service(inputParams);
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		DataSource ds = Jndi.getDataSource(jndiName); 
		Connection conn = ds.getConnection();
		this.setConnection(conn);	
				
		try {		
			Db db = getDb();
			String str="";
			str = str + "Procesando Movimiento de Cobranza Cab"+ " \n";
			
			String sqlcab = getSQL(getResource("sql-ConsultaCab.sql"), inputParams);
			Recordset rsCab = db.get(sqlcab);
			
			if(rsCab.getRecordCount() > 0){
				str = str + ("Entro al getRecount Cab > 0"+ " \n");
				rsCab.first();
				String InsertCab = getResource("insert-cobranzacab.sql");
				InsertCab = getSQL(InsertCab, rsCab);
				db.exec(InsertCab);
				
				String sqldet = getSQL(getResource("sql-ConsultaDet.sql"), inputParams);
				Recordset rsDet = db.get(sqldet);
				
				if(rsDet.getRecordCount() > 0) {
					//rsDPedido.first();
					while(rsDet.next()){
						str  = str + "Creando Movimiento Detalle Cobranza"+ " \n";
						
						String InsertDet = getResource("insert-cobranzadet.sql");
						InsertDet = getSQL(InsertDet, rsDet);
						db.exec(InsertDet);
					}

					str = str + "Ha finalizado la creacion del detalle con exito"+ " \n";
						
				}else{
					str = str + "Error al crear Movimiento de Cobranza Cab"+ " \n";
				}
			}
			
			String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			File newLogFile = new File("D:/data/Simone/smn_comercial/log/logGenerarMovCobranza_"+fechaActual+".txt");
	
	        FileWriter fw = new FileWriter(newLogFile);
	        fw.write(str);
	        fw.close();	
		}catch (Throwable e){
			throw e;
		}
		finally
		{
			if (conn!=null){
				conn.close();
			}
		}
		return rc;
	}
}
