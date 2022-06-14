package proceso;
import dinamica.*;

import javax.sql.DataSource;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
//import proceso.Recibir

public class GenerarPedidoIng extends GenericTransaction{
	/* (non-Javadoc)
	 * @see dinamica.GenericTransaction#pedido(dinamica.Recordset)
	 */
	public int service(Recordset inputParams) throws Throwable{
		int rc = 0;
		//String response = "";
		String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sistemaOperativo = System.getProperty("os.name");
		String file;
		
		if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
			file =  "C:/log/log_ProcesarPedidoIng"+fechaActual+".txt";
		else
			file = "./log_ProcesarPedidoIng"+fechaActual+".txt";
		
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
		conn.setAutoCommit(false);
		
		try{
			Db db = getDb();
			str = "-----PROCESAR PEDIDO -----"+timestamp+"-----AL INGRESO-----";
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			String sqlCheckBPD = getSQL(getResource("buscar_pedido_detalle.sql"), inputParams);
			Recordset rsPedidoBPD = db.get(sqlCheckBPD);
			 
			if(rsPedidoBPD.getRecordCount() > 0){
				str = str + "muestra 2"+ " \n";
				 bw.write(str);
					bw.flush();
				    bw.newLine();
				 getRequest().setAttribute("mensaje", str);
				 
				//rsPedidoBPD.first();
				while(rsPedidoBPD.next()){
					
					inputParams.setValue("smn_pedido_detalle_id", rsPedidoBPD.getInt("smn_pedido_detalle_id"));
					inputParams.setValue("smn_servicios_rf", rsPedidoBPD.getInt("smn_servicios_rf"));
					 str = str + "muestra 3"+ " \n";
					 bw.write(str);
						bw.flush();
					    bw.newLine();
					 getRequest().setAttribute("mensaje", str);
					 
					 String sqlPCOMP = getSQL(getResource("sql-consultaComponentes.sql"), inputParams);
					 Recordset rsdetcomp = db.get(sqlPCOMP);
					
					  if(rsdetcomp.getRecordCount() > 0){
							while(rsdetcomp.next()){
								//rsdetcomp.first();
								 String sqlInsert = getResource("insert-pedidocomp.sql");
								 sqlInsert = getSQL(sqlInsert, rsdetcomp);
								 db.exec(sqlInsert);
							} 
					  }else{
							str = str + "Error getRecordCount del pedido componente < 0"+ " \n";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							rc = 1;
							return 1;
					  }
				}
			}else{
				str = str + "Error Consultado pedido detalle e insertando pedido componente"+ " \n";
				bw.write(str);
				bw.flush();
			    bw.newLine();
			    getRequest().setAttribute("mensaje", str);
				rc = 1;
			}
		    
			String sqlCheckPCab = getSQL(getResource("consulta_pedido_cabecera.sql"), inputParams);
			Recordset rsPedidoCab = db.get(sqlCheckPCab);
		
			if(rsPedidoCab.getRecordCount() > 0) {
			  str = str + "Inicio proceso Agregando Ingreso"+ " \n";
			  bw.write(str);
			  bw.flush();
			  bw.newLine();
			  
			  rsPedidoCab.first();
			  
			  String sqlInsertOF = getResource("InsertPedidoIngresoCab.sql");
			  sqlInsertOF = getSQL(sqlInsertOF, rsPedidoCab);
			  //db.exec(sqlInsertOF);
			  Recordset parametros = db.get(sqlInsertOF);
			  parametros.first();
			  inputParams.setValue("smn_ingresos_id", parametros.getInt("smn_ingresos_id"));
			 			   
				   String sqlCheckPDet = getSQL(getResource("consulta_pedido_detalle.sql"), inputParams);
				   Recordset rsinsertdesp = db.get(sqlCheckPDet);
					   
					if(rsinsertdesp.getRecordCount() > 0) {
						while(rsinsertdesp.next()){
					       String sqlInsertPedDet = getResource("InsertPedidoIngresoMov.sql");
					       sqlInsertPedDet = getSQL(sqlInsertPedDet, rsinsertdesp);
						   db.exec(sqlInsertPedDet);
						}
						str = str + "Fin proceso Agregando Ingreso Mov"+ " \n";
						bw.write(str);
						bw.flush();
					    bw.newLine();
					}else{
						str = str + "Error Agregando Ingreso Mov"+ " \n";
						bw.write(str);
						bw.flush();
					    bw.newLine();
					    getRequest().setAttribute("mensaje", str);
						rc = 1;
					}
				
				 String InsertRutaPaciente = getResource("InsertRutaPaciente.sql");
				 InsertRutaPaciente = getSQL(InsertRutaPaciente, rsPedidoCab);
				 db.exec(InsertRutaPaciente);
			
					//PROCESO DE PRESTACION SERVICIO MEDICO CABECERA
					String sqlCheckIng = getSQL(getResource("sql-consultaCabecera_group.sql"), inputParams);
					Recordset rsPrestacion = db.get(sqlCheckIng);
					
					if(rsPrestacion.getRecordCount() > 0) {
						while(rsPrestacion.next()){
							String sqlInsertO = getResource("insert-prestacionCabecera.sql");
							sqlInsertO= getSQL(sqlInsertO, rsPrestacion);
							
							Recordset rsPrestacionDb =db.get(sqlInsertO);
							rsPrestacionDb.first();
							inputParams.setValue("smn_prestacion_servicio_medico_cabecera_id", rsPrestacionDb.getInt("smn_prestacion_servicio_medico_cabecera_id"));
							inputParams.setValue("smn_grupo_prestador_rf", rsPrestacionDb.getInt("smn_grupo_prestador_rf"));
							inputParams.setValue("smn_unidades_servicios_rf", rsPrestacionDb.getInt("smn_unidades_servicios_rf"));
							inputParams.setValue("smn_prestador_servicio_rf", rsPrestacionDb.getInt("smn_prestador_servicio_rf"));
							
							str = str+ "Obteniendo ID DE LA CABECERA DE PRESTACION ID: " + rsPrestacionDb.getInt("smn_prestacion_servicio_medico_cabecera_id") + " \n";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							//db.exec(sqlInsertOF);
							
							str = str + "Fin proceso Agregar Cabecera PRESTACION"+ " \n";			
							str = str + "Generando PRESTACION SERVICIO DETALLE."+ " \n";
						
						if(rsPrestacionDb.getInt("smn_prestador_servicio_rf") != 0){
							String sqlCheckDPS = getSQL(getResource("sql-consultaDetalle_new.sql"), inputParams);
							Recordset rsDPrestacion = db.get(sqlCheckDPS);
										
							if(rsDPrestacion.getRecordCount() > 0) {
								//rsDPrestacion.first();
								while(rsDPrestacion.next()){
									str  = str + "Creando Detalle"+ " \n";
									//rsDPrestacion.setValue("cabecera_id", cabeceraid);
									String sqlInsertOF2 = getResource("insert-prestacionDetalle.sql");
									sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPrestacion );
									db.exec(sqlInsertOF2);
								}
								str = str + "Fin proceso Agregar Detalle PRESTACION"+ " \n";
							}
						}else{
							String sqlCheckDPS = getSQL(getResource("sql-consultaDetalle_new_isnull.sql"), inputParams);
							Recordset rsDPrestacion = db.get(sqlCheckDPS);
							
							if(rsDPrestacion.getRecordCount() > 0) {
								//rsDPrestacion.first();
								while(rsDPrestacion.next()){
									str  = str + "Creando Detalle"+ " \n";
									//rsDPrestacion.setValue("cabecera_id", cabeceraid);
									String sqlInsertPrest = getResource("insert-prestacionDetalle.sql");
									sqlInsertPrest = getSQL(sqlInsertPrest, rsDPrestacion );
									db.exec(sqlInsertPrest);
								}
								str = str + "Fin proceso Agregar Detalle PRESTACION"+ " \n";
							}
						}
					}
				}else{
					str = str + "Error getRecordCount de la Cabecera < 0"+ " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					rc = 1;
					return 1;
				}
				 
			}else{
				str = str + "Error Agregando Ingreso Cab"+ " \n";
				bw.write(str);
				bw.flush();
			    bw.newLine();
			    getRequest().setAttribute("mensaje", str);
				rc = 1;
			}
			
			 //**PROCESO INSERCION EN CAJA
			String sqlCheckPed = getSQL(getResource("sql-consultaMovimientoCajaCabecera.sql"), inputParams);
			Recordset rsMovimientoPedido = db.get(sqlCheckPed);
		
			if(rsMovimientoPedido.getRecordCount() > 0) {
			
				rsMovimientoPedido.first();
				str = str + "Pedido Documento ID"+ " \n";			
				str = str + "Insertando movimiento caja cabecera con ID: "+ rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				String sqlInsertOFCaj = getResource("insert-movimiento_caja_cabecera.sql");
				sqlInsertOFCaj = getSQL(sqlInsertOFCaj, rsMovimientoPedido);
				
				Recordset rsPrestacionDb = db.get(sqlInsertOFCaj);
				
				rsPrestacionDb.first();
				inputParams.setValue("smn_mov_caja_cabecera_id", rsPrestacionDb.getInt("smn_mov_caja_cabecera_id"));
				
				str = str + "Fin proceso Agregar movimiento caja cabecera"+ " \n";								
				str = str + "Generando detalle movimiento caja cabecera."+ " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				String sqlCheckDPed = getSQL(getResource("sql-consultaMovimientoCajaDetalle.sql"), inputParams);
				Recordset rsDPedido = db.get(sqlCheckDPed);
							
				if(rsDPedido.getRecordCount() > 0) {
					while(rsDPedido.next()){
						str  = str + "Creando Detalle movimiento caja cabecera"+ " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						String sqlInsertOFCajDet = getResource("insert-movimiento_caja_detalle.sql");
						sqlInsertOFCajDet = getSQL(sqlInsertOFCajDet, rsDPedido );
						db.exec(sqlInsertOFCajDet);
					}
				}else{
					str = str + "Error al crear detalle movimiento caja"+ " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					rc = 1;
					//return 1;
				}	
						
				str = str + "Distribucion Pago Detalle."+ " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				String sqlPagadores= getSQL(getResource("sql-consultaDistribucionPagoDetalle.sql"), inputParams);
				Recordset rsDPagD = db.get(sqlPagadores);
								
				if(rsDPagD.getRecordCount() > 0) {
					while(rsDPagD.next()){
						str = str + "Insert Distribucion Pago Detalle."+ " \n";
						str = str + "Insertando movimiento caja cabecera con ID: "+ rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						String sqlInsertOFD = getResource("insert-distribucion_pago_detalle.sql");
						sqlInsertOFD = getSQL(sqlInsertOFD, rsDPagD);
						db.exec(sqlInsertOFD);
					
					}	
				}
				
				str = str + "Fin proceso Distribucion Pago Detalle"+ " \n";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				String sqlUpdatePedCaja = getSQL(getResource("consultar_pedido_caja.sql"), inputParams);
				Recordset rsPediCaja = db.get(sqlUpdatePedCaja);
				
				rsPediCaja.first();
				//Si el proceso de realiza con existo se actualiza el estatus de pago del pedido a Generado
				String sqlUpdCabecera = getResource("updatePedido.sql");
				sqlUpdCabecera = getSQL(sqlUpdCabecera, rsPediCaja);
				db.exec(sqlUpdCabecera);
				
			}else{
				str = str + "No se pudo leer Movimiento Pedido";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc = 1;
				//return 1;
			}
			
			
			///INICIA PROCESO DE INSERCION EN DEPOSITO Y TABLA RELACION DEPOSITO DIST PAGO DETALLE DE CAJA
			str = str + "Insertando en deposito y relacion deposito dist pago detalle"+ " \n";
			bw.write(str);
			bw.flush();
			bw.newLine();
			//inputParams.setValue("smn_mov_caja_cabecera_id", rsPrestacionDb.getInt("smn_mov_caja_cabecera_id"));
			
			String sqlDeposito= getSQL(getResource("consultar_transferencia_pago_movil.sql"), inputParams);
			Recordset rsDepo = db.get(sqlDeposito);
			
			if(rsDepo.getRecordCount() > 0){
				//rsDepo.first();		
				while(rsDepo.next()){
					str = str + "Insertando Deposito con datos de la caja";
					bw.write(str);
					bw.flush();
					bw.newLine();
					
					String InsertDepo = getResource("insertDeposito.sql");
					InsertDepo = getSQL(InsertDepo, rsDepo);
					
					Recordset rsInsertDepo = db.get(InsertDepo);
					
					rsInsertDepo.first();
					inputParams.setValue("smn_deposito_id", rsInsertDepo.getInt("smn_deposito_id"));
					inputParams.setValue("smn_dist_pago_detalle_id", rsDepo.getInt("smn_dist_pago_detalle_id")); 
					
					String sqlDeposito2= getSQL(getResource("consultar_deposito_caja.sql"), inputParams);
					Recordset rsDepo2 = db.get(sqlDeposito2);
					
					if(rsDepo2.getRecordCount() > 0){
						while(rsDepo2.next()){
							str = str + "Insert Relacion Deposito Distribucion Pago Detalle Caja."+ " \n";
							bw.write(str);
							bw.flush();
							bw.newLine();
							
							String insertRelDeposito = getResource("insert-rel_deposito_dist_pago.sql");
							insertRelDeposito = getSQL(insertRelDeposito, rsDepo2);
							db.exec(insertRelDeposito);								
						}	
					}
				}
			}else{
				str = str + "No hay pagos con forma de pago transferencia ni pago movil."+ " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
			}
			
		}catch (Throwable e){
			conn.rollback();
			throw e;
	}finally{
		if(rc == 0){
			conn.commit();
			str = "Cambios en la base de datos guardados correctamente";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
			
		}else{
			conn.rollback();
			str = "Los cambios en la base de datos no se guardaron";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
			rc = 1;
		}
	}
	return rc;
	
	}
	
}
