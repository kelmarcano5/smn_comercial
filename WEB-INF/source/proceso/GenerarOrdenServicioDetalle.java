package proceso;

import java.sql.Connection;

import javax.sql.DataSource;

import dinamica.Db;
import dinamica.GenericTransaction;
import dinamica.Jndi;
import dinamica.Recordset;

import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

public class GenerarOrdenServicioDetalle extends GenericTransaction {
	
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
			str = str + "Consultando Orden de Servicio y tabla intermedia"+ " \n";	
			
			String sqlcheck = getSQL(getResource("query.sql"), inputParams);
			Recordset rs = db.get(sqlcheck);
			
				if(rs.getRecordCount() > 0) {
					//rs.first();
					while(rs.next()){
						str  = str + "Creando Detalle"+ " \n";
						
						String sqlInsert = getResource("insert.sql");
						sqlInsert = getSQL(sqlInsert, rs);
						db.exec(sqlInsert);
					}
				}else{
					str = str + "Error al crear el detalle"+ " \n";
				}
	
			String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			
			String sistemaOperativo = System.getProperty("os.name");
			String file;
			
			if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
				file =  "C:/log/logGenerarOrdenServicioDetalle"+fechaActual+".txt";
			else
				file = "./logGenerarOrdenServicioDetalle"+fechaActual+".txt";
			
			File newLogFile = new File(file);
			//File newLogFile = new File("C:/log/logGenerarOrdenServicioDetalle"+fechaActual+".txt");
	
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
