package proceso;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.sql.DataSource;

import dinamica.Db;
import dinamica.GenericTransaction;
import dinamica.Jndi;
import dinamica.Recordset;


public class generar_presupuesto extends GenericTransaction {
	
	public int service(Recordset inputParams) throws Throwable{
		
		//default return code
		int rc = 0;
		
		String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/logGenerarOrdenServicioPresupuesto_"+fechaActual+".txt";
		else
			file = "./logGenerarOrdenServicioPresupuesto_"+fechaActual+".txt";
		
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
			str = "----------"+timestamp+"----------";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			bw.newLine();
			
			Db db = getDb();
			//String str="";
			str = str + "PROCESAR PRESUPUESTO"+ " \n";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			//str = str + "Procesando Integracion Ingreso Prespuesto"+ " \n";	
			
			String sqlCheckImp = getSQL(getResource("sql-consultaPresupuestoCabecera.sql"), inputParams);
			Recordset rsImpuesto = db.get(sqlCheckImp);
		
			if(rsImpuesto.getRecordCount() > 0) {
				str = str + ("Registro de Presupuesto"+ " \n");
				//str = str + ("Insertando Presupuesto con ID: "+ rsImpuesto.getInt("id_ingreso") + " \n");
				rsImpuesto.first();
				String sqlInsertImp = getResource("insert-presupuesto_cabecera.sql");
				sqlInsertImp = getSQL(sqlInsertImp, rsImpuesto);
				
				Recordset rsDoc= db.get(sqlInsertImp);
				rsDoc.first();
				inputParams.setValue("smn_presupuesto_id", rsDoc.getInt("smn_presupuesto_id"));
				//db.exec(sqlInsertImp);
				
				String sqlCheckDPed = getSQL(getResource("sql-consultaPresupuestoDetalle.sql"), inputParams);
				Recordset rsDPedido = db.get(sqlCheckDPed);
							
				if(rsDPedido.getRecordCount() > 0) {
					//rsDPedido.first();
					while(rsDPedido.next()){
							str  = str + "Creando Detalle de la Presupuesto"+ " \n";
							
							String sqlInsertOF2 = getResource("insert-presupuesto_detalle.sql");
							sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPedido );
							
							Recordset rsDoc2= db.get(sqlInsertOF2);
							rsDoc2.first();
							inputParams.setValue("smn_presupuesto_detalle_id", rsDoc2.getInt("smn_presupuesto_detalle_id"));
							inputParams.setValue("smn_presupuesto_id", rsDoc2.getInt("smn_presupuesto_id"));
							inputParams.setValue("smn_servicios_rf", rsDoc2.getInt("smn_servicios_rf"));
							
							String sqlCheckDPedItem = getSQL(getResource("sql-consultaDiagnosticaDetalleComponente.sql"), inputParams);
							Recordset rsDPedidoItem = db.get(sqlCheckDPedItem);
										
							if(rsDPedidoItem.getRecordCount() > 0) {
								//rsDPedido.first();
								while(rsDPedidoItem.next()){
									str  = str + "Creando Detalle item del Presupuesto"+ " \n";
									
									String sqlInsertOF3 = getResource("insert-presupuesto_detalle_componente.sql");
									sqlInsertOF3 = getSQL(sqlInsertOF3, rsDPedidoItem );
									db.exec(sqlInsertOF3);
								}
	
								str = str + "Registro de Detalle Presupuesto item finalizado"+ " \n";
								str = str + "Fin proceso Detalle Presupuesto item"+ " \n";		
									
							}else{
								str = str + "Error al crear el detalle del Presupuesto item"+ " \n";
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								rc = 1;
							}
							
							String slqItemRPPR = getSQL(getResource("sql-consultaPresupuestoDetalleItem.sql"), inputParams);
							Recordset sqlPedidoRP = db.get(slqItemRPPR);
										
							if(sqlPedidoRP.getRecordCount() > 0) {
								//rsDPedidoD.first();
								while(sqlPedidoRP.next()){
									str  = str + "Creando Detalle Prespuesto Pedido Det Item"+ " \n";
									
									String sqlInsertIT = getResource("insert-presupuesto_detalle_item.sql");
									sqlInsertIT = getSQL(sqlInsertIT, sqlPedidoRP );
									db.exec(sqlInsertIT);
								}

								str = str + "Registro de Detalle Prespuesto Pedido Det Item finalizado"+ " \n";
								str = str + "Fin proceso Detalle Prespuesto Pedido Det Item"+ " \n";		
									
							}else{
								str = str + "Error al crear el detalle del Prespuesto Pedido Det Item finalizado"+ " \n";
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								rc = 1;
							}
						 }
					}
					
					str = str + "Registro de Detalle Presupuesto finalizado"+ " \n";
					str = str + "Fin proceso Detalle Presupuesto"+ " \n";		
						
				}else{
					str = str + "Error al crear el detalle del Presupuesto"+ " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					rc = 1;
				}
				

			str = str + ("Fin proceso presupuesto"+ " \n");		
			bw.write(str);
			bw.flush();
			bw.newLine();
			//rc = 0;
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
				getRequest().setAttribute("mensaje", "Se aprobo el pedido correctamente");
			}
			else
			{
				conn.rollback();
				str = "Los cambios en la base de datos no se guardaron";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				//getRequest().setAttribute("mensaje", str);
				rc = 1;
				//return 1;
			}
			
			str = "FIN DEL PROCESO";	
			bw.write(str);
			bw.flush();
			bw.newLine();
	        bw.close();
			
			//if(conn!=null)
			//	conn.close();
		}
	
		return rc;
	}
}
