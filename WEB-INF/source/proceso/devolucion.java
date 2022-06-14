package proceso;

import java.sql.Connection;
import java.sql.Timestamp;

import javax.sql.DataSource;

import dinamica.Db;
import dinamica.GenericTransaction;
import dinamica.Jndi;
import dinamica.Recordset;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

public class devolucion extends GenericTransaction {
	
	public int service(Recordset inputParams) throws Throwable{
		
		int rc = 0;
		
		String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/logGenerarPedidoInventario_"+fechaActual+".txt";
		else
			file = "./log_ProcesarPedido"+fechaActual+".txt";
		
		File newLogFile = new File(file);
		FileWriter fw;
		String str="";
		
		if(!newLogFile.exists())
			fw = new FileWriter(newLogFile);
		else
			fw = new FileWriter(newLogFile,true);
		
		BufferedWriter bw=new BufferedWriter(fw);
		
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		
		super.service(inputParams);
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		DataSource ds = Jndi.getDataSource(jndiName); 
		Connection conn = ds.getConnection();
		this.setConnection(conn);	
				
		try {		
			Db db = getDb();
			str = str + "Procesando Integracion Orden Inventario"+ " \n";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			String sqlCheckPed = getSQL(getResource("query.sql"), inputParams);
			Recordset rsPedido = db.get(sqlCheckPed);
		
			if(rsPedido.getRecordCount() > 0) {
				str = str + ("Registro de Integracion Orden Inventario"+ " \n");
				bw.write(str);
				bw.flush();
				bw.newLine();
				//str = str + ("Insertando Presupuesto con ID: "+ rsImpuesto.getInt("id_ingreso") + " \n");
				rsPedido.first();
				String sqlInsertImp = getResource("insert.sql");
				sqlInsertImp = getSQL(sqlInsertImp, rsPedido);
				db.exec(sqlInsertImp);
				
				String sqlCheckDPed = getSQL(getResource("query_det.sql"), inputParams);
				Recordset rsDPedidoD = db.get(sqlCheckDPed);
							
				if(rsDPedidoD.getRecordCount() > 0) {
					//rsDPedidoD.first();
					while(rsDPedidoD.next()){
						str  = str + "Creando Detalle Integracion Orden Inventario"+ " \n";
						
						String sqlInsertOF2 = getResource("insert-det.sql");
						sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPedidoD );
						db.exec(sqlInsertOF2);
					}
					
					str = str + "Registro de Detalle Integracion Orden Inventario finalizado"+ " \n";
					str = str + "Fin proceso Detalle Integracion Orden Inventario"+ " \n";	
					bw.write(str);
					bw.flush();
					bw.newLine();
						
				}else{
					str = str + "Error al crear el detalle de Integracion Orden Inventario"+ " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();
				}
				
				String updatepedido = getSQL(getResource("update_devolucion.sql"), inputParams);		
				db.exec(updatepedido);
					
			}else{
				str = str + ("Error al crear la cabecera de la Integracion Orden Inventario"+ " \n");
				bw.write(str);
				bw.flush();
				bw.newLine();
			}
			
			str = str + "PROCESAR PEDIDO"+ " \n";	
			bw.write(str);
			bw.flush();
			bw.newLine();
		}catch (Throwable e){
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
			
			str = "FIN DEL PROCESO";	
			bw.write(str);
			bw.flush();
			bw.newLine();
	        bw.close();
			
			if(conn!=null)
				conn.close();
		}

		return rc;
	}
}
