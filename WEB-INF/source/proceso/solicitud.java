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

public class solicitud extends GenericTransaction {
	
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
				str = str + "Procesando Integracion Orden Despacho"+ " \n";	
				
				String sqlCheckPed = getSQL(getResource("query.sql"), inputParams);
				Recordset rsPedido = db.get(sqlCheckPed);
			
				if(rsPedido.getRecordCount() > 0) {
					str = str + ("Registro de Integracion Orden Despacho"+ " \n");
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
							str  = str + "Creando Detalle Integracion Orden Despacho"+ " \n";
							
							String sqlInsertOF2 = getResource("insert_det.sql");
							sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPedidoD );
							db.exec(sqlInsertOF2);
						}	
						str = str + "Registro de Detalle Integracion Orden Despacho finalizado"+ " \n";
						str = str + "Fin proceso Detalle Integracion Orden Despacho"+ " \n";		
							
					}else{
						str = str + "Error al crear el detalle de Integracion Orden Despacho"+ " \n";
					}
					
					String updatepedido = getSQL(getResource("update_solicitud.sql"), inputParams);		
					db.exec(updatepedido);
						
				}else{
					str = str + ("Error al crear la cabecera de la Integracion Orden Despacho"+ " \n");
				}
				
				String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
				String sistemaOperativo = System.getProperty("os.name");
				String file;
				
				if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
					file =  "C:/log/logGenerarPedidoDespacho_"+fechaActual+".txt";
				else
					file = "./logGenerarPedidoDespacho_"+fechaActual+".txt";
				
				File newLogFile = new File(file);
				
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
