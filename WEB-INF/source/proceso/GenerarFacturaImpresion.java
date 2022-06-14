package proceso;

import dinamica.*;

import javax.sql.DataSource;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;


public class GenerarFacturaImpresion extends GenericTransaction{
	/* (non-Javadoc)
	 * @see dinamica.GenericTransaction#service(dinamica.Recordset)
	 */
	
	public int service(Recordset inputParams) throws Throwable	{
		
		//default return code
		int rc = 0;
		
		String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/log_ProcesarFacturaImpresion"+fechaActual+".txt";
		else
			file = "./log_ProcesarFacturaImpresion"+fechaActual+".txt";
		
		File newLogFile = new File(file);
		FileWriter fw;
		String str="";
		
		if(!newLogFile.exists())
			fw = new FileWriter(newLogFile);
		else
			fw = new FileWriter(newLogFile,true);
		
		BufferedWriter bw=new BufferedWriter(fw);
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		//reuse superclass code
		super.service(inputParams);
		
		
		//get security datasource
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		//get datasource and DB connection
		DataSource ds = Jndi.getDataSource(jndiName); 
		Connection conn = ds.getConnection();
		this.setConnection(conn);
		conn.setAutoCommit(false);
				
		try {
		
			//get db channel
			Db db = getDb();
			//rc = 1; 
			
			str = str + "Validando información del Pedido Componente"+ " \n";
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
			//rc = 1;
			 
			String sqlCheckPedido = getSQL(getResource("sql-consultarComponentesImpresion.sql"), inputParams);
			
			//crea un recordset con la data obtenida
			Recordset rsImpresion = db.get(sqlCheckPedido);
			
			if(rsImpresion.getRecordCount() > 0) {
				while(rsImpresion.next()){
					str  = str + "Creando Factura Detalle Impresion"+ " \n";
					String sqlInsertFactImp = getResource("insert-facturaimpresiondetalle.sql");
					sqlInsertFactImp = getSQL(sqlInsertFactImp, rsImpresion);
					db.exec(sqlInsertFactImp);
				}
				str = str + "Registro de Factura Detalle Impresion finalizado"+ " \n";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
			}else{
				str = str + "Error al crear Factura Detalle Impresion"+ " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc = 1;
			}
			//ESTE CODIGO ACTUALIZA EL ESTATUS DE LA CABECERA A PROCESADO PARA QUE PUEDA SER VISUALIZADO EN EL CONTROL DE PEDIDO			
			try {
				String sqlUpdatePedido = "UPDATE smn_comercial.smn_pedido_cabecera " +
						   "SET " + "pca_estatus = 'PR' " + 
						   " WHERE smn_pedido_cabecera_id = " + rsImpresion.getInt("smn_pedido_cabecera_id");
				db.exec(sqlUpdatePedido);
			} catch (Exception e) {
				str = str + "Error al actualizar el estatus de pedido cabecera"+ " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc = 1;
			}
		}catch (Throwable e){
			conn.rollback();
			throw e;
		}
		finally
		{
			if(rc == 0)
			{
				conn.commit();
				str = "Cambios en la base de datos guardados correctamente";	
				bw.write(str);
				bw.flush();
				bw.newLine();
			}
			else
			{
				conn.rollback();
				str = "Los cambios en la base de datos no se guardaron";	
				bw.write(str);
				bw.flush();
				bw.newLine();
			}
		}
		return rc;
	}
}