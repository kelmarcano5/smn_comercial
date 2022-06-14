package proceso;

import dinamica.*;

import javax.sql.DataSource;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;

//import proceso.Recibir

public class Generar_emergencia extends GenericTransaction
{
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
			file =  "C:/log/log_ProcesarPedido"+fechaActual+".txt";
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
		conn.setAutoCommit(false);
				
			try {
				str = "----------"+timestamp+"----------";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				bw.newLine();
				
				Db db = getDb();
				//String str="";
				str = str + "PROCESAR PEDIDO"+ " \n";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				String sqlCheckPed = getSQL(getResource("sql-consultaPedidoCabecera.sql"), inputParams);
				Recordset rsMovimientoPedido = db.get(sqlCheckPed);
			
				if(rsMovimientoPedido.getRecordCount() > 0) {
					String sqlEx = getSQL(getResource("sql-verificasiexiste.sql"), inputParams);

					Recordset rsE = db.get(sqlEx);
					
					   if(rsE.getRecordCount() < 0 ){
						   rsMovimientoPedido.first();	
						   str = str + "Ya este registro esta procesado y con estatus Generado: "+ rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";	
						   bw.write(str);
						   bw.flush();
						   bw.newLine();
						   getRequest().setAttribute("mensaje", str);
						   //rc = 1;
							
					   }else{
								rsMovimientoPedido.first();
								String despacho = rsMovimientoPedido.getString("despacho");
								String modulo = rsMovimientoPedido.getString("modulo");
								int cant_dias = rsMovimientoPedido.getInt("cant_dias");
								String entrega_orden = rsMovimientoPedido.getString("entrega_por_orden");
								String tipo_pedido = rsMovimientoPedido.getString("tipo_pedido");
								String estatus_pago = rsMovimientoPedido.getString("estatus_pago");
								
								str = str + "Generando Factura Impresion. Servicio"+ " \n";
								String sqlCheckCI= getSQL(getResource("sql-consultarComponentesImpresion.sql"), inputParams);
								Recordset compimp = db.get(sqlCheckCI);
								
								if(compimp.getRecordCount() > 0) {
									//rsDPrestacion.first();
									while(compimp.next()){
										str  = str + "Creando Servicio"+ " \n";
										//rsDPrestacion.setValue("cabecera_id", cabeceraid);
										String sqlInsertCI = getResource("insert-facturaimpresiondetalle.sql");
										sqlInsertCI = getSQL(sqlInsertCI, compimp);
										db.exec(sqlInsertCI);
										
									}
									str = str + "Fin proceso Servicio"+ " \n";
								}else{
									str = str + "Error getRecordCount Servicio < 0"+ " \n";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									//rc = 1;
									//return 1;
								}
								
								str = str + "Generando Factura Impresion. Componente"+ " \n";
								String sqlCheckComp= getSQL(getResource("sql-consultarComponentesImpresion_comp.sql"), inputParams);
								Recordset comp = db.get(sqlCheckComp);
								
								if(comp.getRecordCount() > 0) {
									//rsDPrestacion.first();
									while(comp.next()){
										str  = str + "Creando Componente"+ " \n";
										//rsDPrestacion.setValue("cabecera_id", cabeceraid);
										String sqlInsertCI2 = getResource("insert-facturaimpresiondetalle.sql");
										sqlInsertCI2 = getSQL(sqlInsertCI2, comp);
										db.exec(sqlInsertCI2);
										
									}
									str = str + "Fin proceso Componente"+ " \n";
								}else{
									str = str + "Error getRecordCount Componente < 0"+ " \n";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									//rc = 1;
									//return 1;
								}
								
								str = str + "Generando Factura Impresion. Tipo Servicio"+ " \n";
								String sqlCheckTip= getSQL(getResource("sql-consultarComponentesImpresion_tiposerv.sql"), inputParams);
								Recordset tiposerv = db.get(sqlCheckTip);
								
								if(tiposerv.getRecordCount() > 0) {
									//rsDPrestacion.first();
									while(tiposerv.next()){
										str  = str + "Creando Tipo Servicio"+ " \n";
										//rsDPrestacion.setValue("cabecera_id", cabeceraid);
										String sqlInsertCI3 = getResource("insert-facturaimpresiondetalle.sql");
										sqlInsertCI3 = getSQL(sqlInsertCI3, tiposerv);
										db.exec(sqlInsertCI3);
										
									}
									str = str + "Fin proceso Tipo Servicio"+ " \n";
								}else{
									str = str + "Error getRecordCount Tipo Servicio < 0"+ " \n";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									//rc = 1;
									//return 1;
								}
								
								//VT 09-06-2021
								String sqlCheckCI2= getSQL(getResource("sql-consultarComponentesNo_Impresion.sql"), inputParams);
								Recordset compimp2 = db.get(sqlCheckCI2);
								
								if(compimp2.getRecordCount() > 0) {
									//rsDPrestacion.first();
									while(compimp2.next()){
										str  = str + "Creando Detalle"+ " \n";
										//rsDPrestacion.setValue("cabecera_id", cabeceraid);
										String sqlUpdateCI = getResource("update_factura_impresion_detalle.sql");
										sqlUpdateCI = getSQL(sqlUpdateCI, compimp2);
										db.exec(sqlUpdateCI);
										
									}
									str = str + "Fin proceso Update componente calculo por diferencia"+ " \n";
								}else{
									str = str + "Error getRecordCount del Consultar componentes No impresion"+ " \n";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									//rc = 1;
									//return 1;
								}
								//VT 09-06-2021
								if(entrega_orden.equals("NO")){
											
											String sqlInsertOF = getResource("insert-factura_cabecera.sql");
											sqlInsertOF = getSQL(sqlInsertOF, rsMovimientoPedido);
											db.exec(sqlInsertOF);
												
											str = str + "Fin proceso Agregar Cabecera Factura"+ " \n";
											bw.write(str);
											bw.flush();
											bw.newLine();
								//ELSE DEL CONDICIONAL ENTREGA POR ORDEN
								}else{
								
									//VT
									if (despacho.equals("SI")){
										str = str + "Insertando Pedido despacho con ID: "+ rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
										String insertdesp = getSQL(getResource("insert_despacho_cabecera.sql"), inputParams);
										Recordset rsinsertdesp = db.get(insertdesp);
										if(rsinsertdesp.getRecordCount() > 0) {
											while(rsinsertdesp.next()){
										       int id_despacho = rsinsertdesp.getInteger("id_despacho");
										       inputParams.setValue("id_despacho", id_despacho);
										       str = str + "Actualizando secuencia Documento  Despacho con ID: "+ rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
										       bw.write(str);
											   bw.flush();
											   bw.newLine();
											   
										       String updatedoc = getSQL(getResource("update_sec_documento.sql"), inputParams);
											   //Recordset rsupdatedoc = db.get(updatedoc);
											   db.exec(updatedoc);
											}
										}
										else{
											str = str + "No Genero la cabecera de Despacho, Pedido Cabecera ID = " + rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
				
											bw.write(str);
											bw.flush();
											bw.newLine();
											getRequest().setAttribute("mensaje", str);
											//rc = 1;
											//return 1;
											//return rc;
										}
									}
									
									if(despacho.equals("NO")){
										str = str + "Insertando Pedido movimiento con ID: "+ rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
										inputParams.setValue("smn_pedido_cabecera_id", rsMovimientoPedido.getInt("smn_pedido_cabecera_id"));
										String insertmov = getSQL(getResource("insert_movimiento_cabecera.sql"), inputParams);
										Recordset rsinsertmov = db.get(insertmov);
										if(rsinsertmov.getRecordCount() > 0) {
											while(rsinsertmov.next()){
										    int id_mov_cab = rsinsertmov.getInteger("id_mov_cab");
										    inputParams.setValue("id_mov_cab", id_mov_cab);
										    str = str + "Actualizando secuencia Documento  Pedido movimiento con ID: "+ rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
										    bw.write(str);
											bw.flush();
											bw.newLine();
											
										    String updatedoc2 = getSQL(getResource("update_sec_documento.sql"), inputParams);
											//Recordset rsupdatedoc2 = db.get(updatedoc2);
											db.exec(updatedoc2);
											}
										}else{
											str = str + "No Genero la cabecera de movimiento, Pedido Cabecera ID = " + rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
											
											//rc=9;
											bw.write(str);
											bw.flush();
											bw.newLine();
											getRequest().setAttribute("mensaje", str);
											//rc = 1;
											//return 1;
											//return rc;
										}
									}
									
									if(despacho.equals("DP")){
										str = str + "No Genero la cabecera de movimiento porque es un despacho previo, Pedido Cabecera ID = " + rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
										bw.write(str);
										bw.flush();
										bw.newLine();
										getRequest().setAttribute("mensaje", str);
										//rc = 1;
										//return 1;
									}
																						
								str = str + "Fin proceso Agregar Cabecera"+ " \n";	
								bw.write(str);
								bw.flush();
								bw.newLine();
								//VT
								//VT str = str + "Generando detalle de la factura."+ " \n";
								
								String sqlCheckDPed = getSQL(getResource("sql-consultaPedidoDetalle.sql"), inputParams);
								Recordset rsDPedido = db.get(sqlCheckDPed);
											
								if(rsDPedido.getRecordCount() > 0) {
									while(rsDPedido.next()){
										int id_lote=0;
										Date fecha_venc = null;
										int item = rsDPedido.getInteger("smn_item_rf");
										Double cantidad_aprob=rsDPedido.getDouble("fde_cantidad");
										int id_ped_det = rsDPedido.getInteger("smn_pedido_detalle_id");
										inputParams.setValue("smn_pedido_detalle_id", id_ped_det);
										
										String sqlChecklote = getSQL(getResource("sql-consultaLote.sql"), inputParams);
										Recordset rslote = db.get(sqlChecklote);
										if(rslote.getRecordCount() > 0) {
											while(rslote.next()){
												id_lote = rslote.getInteger("id_lote");
												fecha_venc = rslote.getDate("fecha_venc");
											}
										}
										inputParams.setValue("id_lote", id_lote);
										//inputParams.setValue("fecha_venc", fecha_venc);
										inputParams.setValue("id_item", item);
										// Verificar si el item es compuesto o no
										String caractitem = getSQL(getResource("sql-consultacaracteristica_item.sql"), inputParams);
										Recordset rscaractitem = db.get(caractitem);
										if(rscaractitem.getRecordCount() > 0) {
											while(rscaractitem.next()){
												String item_compuesto = rscaractitem.getString("item_compuesto");
												int caracter_id = rscaractitem.getInteger("caracteristica_item_id");
												
												if (item_compuesto.equals("SI")){
													inputParams.setValue("id_caracteristica", caracter_id);
													String itemcompuesto = getSQL(getResource("sql-consultaitem_compuesto.sql"), inputParams);
													Recordset rsitemcompuesto = db.get(itemcompuesto);
													if(rsitemcompuesto.getRecordCount() > 0) {
														int item_comp=rsitemcompuesto.getInteger("item_comp_id");
														Double cantidad_item=rsitemcompuesto.getDouble("cantidad_comp");
														cantidad_aprob=cantidad_aprob*cantidad_item;
														inputParams.setValue("id_item_comp", item_comp);
														inputParams.setValue("cantidad", cantidad_aprob);
														
														if (despacho.equals("SI")){
															str  = str + "Creando Detalle de la Despacho Compuesto"+ " \n";
															bw.write(str);
															bw.flush();
															bw.newLine();
															String insertdespdcomp = getSQL(getResource("insert_despacho_detalle_compuesto.sql"), inputParams);
															db.exec(insertdespdcomp);	
														}
														if(despacho.equals("NO")){
															str  = str + "Creando Detalle de Movimiento Compuesto"+ " \n";
															bw.write(str);
															bw.flush();
															bw.newLine();
															String insertmovdcomp = getSQL(getResource("insert_movimiento_detalle_compuesto.sql"), inputParams);	
															db.exec(insertmovdcomp);
														}
													}	
												}else{
																						
													if (despacho.equals("SI")){
														str  = str + "Creando Detalle de la Despacho"+ " \n";
														bw.write(str);
														bw.flush();
														bw.newLine();
														String insertdespd = getSQL(getResource("insert_despacho_detalle.sql"), inputParams);
														db.exec(insertdespd);	
													}
													
													if(despacho.equals("NO")){
														str  = str + "Creando Detalle de Movimiento"+ " \n";
														bw.write(str);
														bw.flush();
														bw.newLine();
														String insertmovd = getSQL(getResource("insert_movimiento_detalle.sql"), inputParams);
														db.exec(insertmovd);
														
														controlItem(conn, inputParams, str, bw);
													}
													
													if(despacho.equals("DP")){
														str = str + "No Genero el detalle del movimiento porque es un despacho previo, Pedido Cabecera ID = " + rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
														bw.write(str);
														bw.flush();
														bw.newLine();
													      //  fw.close();
													}
												}
											}
										}
										
										
									}	
									}else{
										str = str + "No hay items para procesar en el Pedido"+ " \n";
										bw.write(str);
										bw.flush();
										bw.newLine();
										getRequest().setAttribute("mensaje", str);
										//rc = 1;
										//return 1;
									}
									
									
									//Recibir rec = new Recibir();
									//receive(conn, inputParams, str, bw);
								}
								
								String updatepedido = getSQL(getResource("update_pedido_cabecera.sql"), inputParams);		
								db.exec(updatepedido);
								
								str = str + "Pedido Procesado exitosamente";
								bw.write(str);
								bw.flush();
								bw.newLine();
								
								
								if(cant_dias >= 0 && estatus_pago.equals("Pendiente")){
									str = str + "Entrando al proceso de cobranza";
									generarCobranza(conn, inputParams, str,bw);
									bw.write(str);
									bw.flush();
									bw.newLine();
									//if(rc!=0)
										//return rc;
								}else{
									str = str + "No se puede generar la cobranza porque la condicion financiera es contado no credito";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									//rc = 1;
									//return 1;
								}
								
								if(modulo.equals("SMN_CAJ")){
									str = str + "No se Puede generar ya que viene de su modulo de origen";
									bw.write(str);
									bw.flush();
									bw.newLine();
								}else{
									str = str + "Entrando al proceso de caja";
									generarCaja(conn, inputParams, str,bw);
									bw.write(str);
									bw.flush();
									bw.newLine();
								}
					   }
					}else{
						str = str + "No se pudo leer Pedido Cabecera";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
						rc = 1;
						//return 1;
					}
					
				bw.write(str);
				bw.flush();
				bw.newLine();
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
			
			if(conn!=null)
				conn.close();
		}

		return rc;
	}
	
	
	public int generarCaja(Connection conn, Recordset inputParams, String str, BufferedWriter bw) throws Throwable{
		
		int rc = 0;
		
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		conn.setAutoCommit(false);
		this.setConnection(conn);
				
		try {
			Db db = getDb();
			str = str + "Generando movimiento caja cabecera"+ " \n";	
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			String sqlCheckPed = getSQL(getResource("sql-consultaMovimientoCajaCabecera.sql"), inputParams);
			Recordset rsMovimientoPedido = db.get(sqlCheckPed);
		
			if(rsMovimientoPedido.getRecordCount() > 0) {
			
				rsMovimientoPedido.first();
				str = str + "Pedido Documento ID"+ " \n";			
				str = str + "Insertando movimiento caja cabecera con ID: "+ rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				String sqlInsertOF = getResource("insert-movimiento_caja_cabecera.sql");
				sqlInsertOF = getSQL(sqlInsertOF, rsMovimientoPedido);
				db.exec(sqlInsertOF);
				
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
						String sqlInsertOF2 = getResource("insert-movimiento_caja_detalle.sql");
						sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPedido );
						db.exec(sqlInsertOF2);
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
						
				}else{
					str = str + "Error al crear el Generando movimiento caja cabecera"+ " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					rc = 1;
					//return 1;
				}	
			}else{
				str = str + "No se pudo leer Movimiento Pedido";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc = 1;
				//return 1;
			}
		}catch (Throwable e){
			conn.rollback();
			throw e;
		}
		return rc;
	}
	
	
	public int generarCobranza(Connection conn, Recordset inputParams, String str, BufferedWriter bw) throws Throwable{
		int rc = 0;	//variable a retornar.
		Double scl_saldo_inicial_ml=0.00;
		Double scl_saldo_inicial_ma=0.00;
		Double scl_saldo_final_ml=0.00;
		Double scl_saldo_final_ma=0.00;
		Double scl_debitos_ml=0.00;
		Double scl_debitos_ma=0.00;
		Double scl_creditos_ml=0.00;
		Double scl_creditos_ma=0.00;
		Double scl_saldo_vencido_ml=0.00;
		Double scl_saldo_vencido_ma=0.00;
		Double scl_porcentaje_deuda_vencida=0.00;
		Boolean existe=false;
		String tipo_movimiento = "";
		String sql=null;
		Double mdd_monto_ml=0.00;
		Double mdd_monto_ma=0.00;
		String mdc_estatus_financiero=null;
		Double cfi_limite_credito=0.00;
		String scl_fecha=null;
		double rco_porcentaje;
		double rco_monto_bruto_cob_ml;
		double rco_monto_bruto_cob_ma;
		double pde_cantidad_pedido;
		//int mdc_dias_vencidos;
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");
		String mdc_estatus_proceso="";
		double mdd_monto_descuento_ml;
		double mdd_monto_descuento_ma;
		double saldo_total_ml=0;
		double saldo_total_ma=0;
		double fim_abonos_ml=0;
		double fim_abonos_ma=0;
		
		//Date currency_date = new Date(System.currentTimeMillis());
		//Date currency_date = sdformat.format(LocalDateTime.now());
		//Date currency_date = Date(sdformat);
		Calendar calendar = Calendar.getInstance();

        Date actual_date = calendar.getTime();
        String currency_date = sdformat.format(actual_date);
		
		
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		conn.setAutoCommit(false);
		this.setConnection(conn);
		
		try {		
			Db db = getDb();
			str = str + "Procesando Movimiento de Cobranza Cab Victor"+ " \n";
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			String sqlcab = getSQL(getResource("sql-ConsultaCab.sql"), inputParams);
			Recordset rsCab = db.get(sqlcab);
			
			if(rsCab.getRecordCount() > 0){
				str = str + ("Entro al getRecount Cab > 0"+ " \n");
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				rsCab.first();
				fim_abonos_ml=rsCab.getDouble("fim_abonos_ml");
				fim_abonos_ma=rsCab.getDouble("fim_abonos_ma");
				
				String InsertCab = getResource("insert-cobranzacab.sql");
				InsertCab = getSQL(InsertCab, rsCab);
				Recordset rsCabecera =db.get(InsertCab);
				rsCabecera.first();
				inputParams.setValue("smn_mov_documento_cob_cab_id", rsCabecera.getInt("smn_mov_documento_cob_cab_id"));
				
				/*String sqldet = getSQL(getResource("sql-ConsultaDet.sql"), inputParams);
				Recordset rsDet = db.get(sqldet);
				
				if(rsDet.getRecordCount() > 0) {
					while(rsDet.next()){*/
						str  = str + "Creando Movimiento Detalle Cobranza"+ " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						
						String InsertDet = getResource("insert-cobranzadet.sql");
						InsertDet = getSQL(InsertDet, rsCab);
						db.exec(InsertDet);
					//}
					
					str = str + "Ha finalizado la creacion del detalle con exito"+ " \n";	
					bw.write(str);
					bw.flush();
					bw.newLine();
					
					str = "Procesando control de saldo del cliente";	
					bw.write(str);
					bw.flush();
					bw.newLine();
						
						sql = getSQL(getResource("select-smn_saldo_cliente.sql"), inputParams);
						Recordset rsSaldoCliente = db.get(sql);
						
						str = "Consultando saldo del cliente...";
						bw.write(str);
						bw.flush();
						bw.newLine();
						
						if(rsSaldoCliente.getRecordCount()>0)
						{
							str = "rsSaldoCliente.getRecordCount()>0...";
							bw.write(str);
							bw.flush();
							bw.newLine();
							
							rsSaldoCliente.first();
							if(rsSaldoCliente.getString("scl_fecha").compareTo(currency_date)==0)
							{
								
								str = "compareTo(currency_date)==0...";
								bw.write(str);
								bw.flush();
								bw.newLine();
								
								existe=true;
								inputParams.setValue("smn_saldo_cliente_id", rsSaldoCliente.getInt("smn_saldo_cliente_id"));
								scl_saldo_inicial_ml=rsSaldoCliente.getDouble("scl_saldo_inicial_ml");
								scl_debitos_ml=rsSaldoCliente.getDouble("scl_debitos_ml");
								scl_creditos_ml=rsSaldoCliente.getDouble("scl_creditos_ml");
								//scl_saldo_final_ml=rsSaldoCliente.getDouble("scl_saldo_final_ml");
								scl_saldo_vencido_ml=rsSaldoCliente.getDouble("scl_saldo_vencido_ml");
								scl_saldo_inicial_ma=rsSaldoCliente.getDouble("scl_saldo_inicial_ma");
								scl_debitos_ma=rsSaldoCliente.getDouble("scl_debitos_ma");
								scl_creditos_ma=rsSaldoCliente.getDouble("scl_creditos_ma");
								//scl_saldo_final_ma=rsSaldoCliente.getDouble("scl_saldo_final_ma");
								scl_saldo_vencido_ma=rsSaldoCliente.getDouble("scl_saldo_vencido_ma");
								scl_porcentaje_deuda_vencida=rsSaldoCliente.getDouble("scl_porcentaje_deuda_vencida");
								scl_fecha=rsSaldoCliente.getString("scl_fecha");
							}
							else
							{
								str = "SINO compareTo(currency_date)==0...";
								bw.write(str);
								bw.flush();
								bw.newLine();
								
								existe=true;
								inputParams.setValue("smn_saldo_cliente_id", rsSaldoCliente.getInt("smn_saldo_cliente_id"));
								scl_saldo_inicial_ml=rsSaldoCliente.getDouble("scl_saldo_final_ml");
								scl_debitos_ml=0.0;
								scl_creditos_ml=0.0;
								scl_saldo_final_ml=0.0;
								scl_saldo_vencido_ml=rsSaldoCliente.getDouble("scl_saldo_vencido_ml");
								scl_saldo_inicial_ma=rsSaldoCliente.getDouble("scl_saldo_final_ma");
								scl_debitos_ma=0.0;
								scl_creditos_ma=0.0;
								scl_saldo_final_ma=0.0;
								scl_saldo_vencido_ma=rsSaldoCliente.getDouble("scl_saldo_vencido_ma");
								scl_porcentaje_deuda_vencida=rsSaldoCliente.getDouble("scl_porcentaje_deuda_vencida");
								scl_fecha=rsSaldoCliente.getString("scl_fecha");
							}
						}
						else
						{
							str = "SINO rsSaldoCliente.getRecordCount()>0...";
							bw.write(str);
							bw.flush();
							bw.newLine();
							
							existe=false;
							scl_saldo_inicial_ml=0.0;
							scl_debitos_ml=0.0;
							scl_creditos_ml=0.0;
							scl_saldo_final_ml=0.0;
							scl_saldo_vencido_ml=0.0;
							scl_saldo_inicial_ma=0.0;
							scl_debitos_ma=0.0;
							scl_creditos_ma=0.0;
							scl_saldo_final_ma=0.0;
							scl_saldo_vencido_ma=0.0;
							scl_porcentaje_deuda_vencida=0.0;
							scl_fecha=null;
						}
						//OJO VT
						String mov_cab = inputParams.getString("smn_mov_documento_cob_cab_id");
						
						sql = getSQL(getResource("select-smn_rel_cob_documento.sql"), inputParams);
						Recordset rsRelCobDocumento = db.get(sql);
						
						str = "Consultando documentos relacionados a la cobranza... "+mov_cab;
						bw.write(str);
						bw.flush();
						bw.newLine();
						
						if(rsRelCobDocumento.getRecordCount()>0)
						{
							while(rsRelCobDocumento.next())
							{
								inputParams.setValue("smn_mov_documento_cob_cab_id", rsRelCobDocumento.getInt("smn_mov_documento_cob_cab_id"));
								
								if(rsRelCobDocumento.getString("smn_tipo_documento_id")!=null)
								{
									inputParams.setValue("smn_tipo_documento_id_mdc",rsRelCobDocumento.getInt("smn_tipo_documento_id"));
								}
								else
								{
									str = "El documento no tiene tipo de documento de cobranza asociado";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									//return 1;
								}
								
								if(rsRelCobDocumento.getString("smn_documento_id")!=null)
								{
									inputParams.setValue("smn_documento_id_mdc",rsRelCobDocumento.getInt("smn_documento_id"));
								}
								else
								{
									str = "El movimiento no tiene documento de cobranza asociado";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									//return 1;
								}
								
								if(rsRelCobDocumento.getString("smn_promotor_rf")!=null)
								{
									inputParams.setValue("smn_promotor_rf",rsRelCobDocumento.getInt("smn_promotor_rf"));
								}
								else
								{
									inputParams.setValue("smn_promotor_rf",0);
								}
								
								if(rsRelCobDocumento.getString("smn_rol_id")!=null)
								{
									inputParams.setValue("smn_rol_id",rsRelCobDocumento.getInt("smn_rol_id"));
								}
								else
								{
									inputParams.setValue("smn_rol_id",0);
								}
								
								if(rsRelCobDocumento.getString("tdo_tipo_movimiento")!=null)
								{
									inputParams.setValue("tdo_tipo_movimiento",rsRelCobDocumento.getString("tdo_tipo_movimiento"));
									tipo_movimiento=rsRelCobDocumento.getString("tdo_tipo_movimiento");
								}
								else
								{
									str = "El documento no tiene tipo de movimiento";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									//return 1;
								}
								
								if(rsRelCobDocumento.getString("mdd_monto_ml")!=null)
								{
									inputParams.setValue("mdd_monto_ml",rsRelCobDocumento.getDouble("mdd_monto_ml"));
									mdd_monto_ml=rsRelCobDocumento.getDouble("mdd_monto_ml");
								}
								else
								{
									str = "El documento no tiene monto en moneda local";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									//return 1;
								}
								
								if(rsRelCobDocumento.getString("mdd_monto_ma")!=null)
								{
									inputParams.setValue("mdd_monto_ma",rsRelCobDocumento.getDouble("mdd_monto_ma"));
									mdd_monto_ma=rsRelCobDocumento.getDouble("mdd_monto_ma");
								}
								else
								{
									inputParams.setValue("mdd_monto_ma",0.0);
									mdd_monto_ma=0.0;
								}
								
								if(rsRelCobDocumento.getString("mdd_monto_descuento_ml")!=null)
								{
									inputParams.setValue("mdd_monto_descuento_ml",rsRelCobDocumento.getDouble("mdd_monto_descuento_ml"));
									mdd_monto_descuento_ml=rsRelCobDocumento.getDouble("mdd_monto_descuento_ml");
								}
								else
								{
									inputParams.setValue("mdd_monto_descuento_ml",0.0);
									mdd_monto_descuento_ml=0.0;
								}
								
								if(rsRelCobDocumento.getString("mdd_monto_descuento_ma")!=null)
								{
									inputParams.setValue("mdd_monto_descuento_ma",rsRelCobDocumento.getDouble("mdd_monto_descuento_ma"));
									mdd_monto_descuento_ma=rsRelCobDocumento.getDouble("mdd_monto_descuento_ma");
								}
								else
								{
									inputParams.setValue("mdd_monto_descuento_ma",0.0);
									mdd_monto_descuento_ma=0.0;
								}
								
								if(rsRelCobDocumento.getString("mdc_estatus_financiero")!=null)
								{
									inputParams.setValue("mdc_estatus_financiero",rsRelCobDocumento.getString("mdc_estatus_financiero"));
									mdc_estatus_financiero=rsRelCobDocumento.getString("mdc_estatus_financiero");
								}
								else
								{
									str = "El documento no tiene estatus financiero registrado";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									//return 1;
								}
								
								if(rsRelCobDocumento.getString("mdc_estatus_proceso")!=null)
								{
									inputParams.setValue("mdc_estatus_proceso",rsRelCobDocumento.getString("mdc_estatus_proceso"));
									mdc_estatus_proceso=rsRelCobDocumento.getString("mdc_estatus_proceso");
								}
								else
								{
									str = "El documento no tiene estatus de proceso registrado";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									//return 1;
								}
								
								sql = getSQL(getResource("select-smn_cliente.sql"), inputParams);
								Recordset rsCliente = db.get(sql);
								
								str = "Consultando Cliente...";
								bw.write(str);
								bw.flush();
								bw.newLine();
								
								if(rsCliente.getRecordCount()>0)
								{
									rsCliente.first();
									
									if(rsCliente.getString("cfi_limite_credito")!=null)
									{
										inputParams.setValue("cfi_limite_credito",rsCliente.getDouble("cfi_limite_credito"));
										cfi_limite_credito=rsCliente.getDouble("cfi_limite_credito");
									}
									else
									{
										str = "El limite de credito del cliente esta vacio";
										bw.write(str);
										bw.flush();
										bw.newLine();
										getRequest().setAttribute("mensaje", str);
										//return 1;
									}
								}
								else
								{
									str = "No se encontro la condicion financiera del cliente";
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									//return 1;
								}
								// VT OJO
								saldo_total_ml=mdd_monto_ml+mdd_monto_descuento_ml-fim_abonos_ml;
								saldo_total_ma=mdd_monto_ma+mdd_monto_descuento_ma-fim_abonos_ma;
								//String tipo_movimiento;
								
								if(tipo_movimiento.equals("FC") || tipo_movimiento.equals("ND"))
								{
									scl_debitos_ml+=saldo_total_ml;
									scl_debitos_ma+=saldo_total_ma;
								}
								else
								if(tipo_movimiento.equals("RC") || tipo_movimiento.equals("NC"))
								{
									scl_creditos_ml+=saldo_total_ml;
									scl_creditos_ma+=saldo_total_ma;
								}
								
								scl_saldo_final_ml=scl_saldo_inicial_ml+scl_debitos_ml-scl_creditos_ml;
								scl_saldo_final_ma=scl_saldo_inicial_ma+scl_debitos_ma-scl_creditos_ma;
								
								if(mdc_estatus_financiero.equals("VE"))
								{
									scl_saldo_vencido_ml-=saldo_total_ml;
									scl_saldo_vencido_ma-=saldo_total_ma;
									scl_porcentaje_deuda_vencida=scl_saldo_vencido_ml/cfi_limite_credito;
								}
								
								inputParams.setValue("scl_saldo_inicial_ml",scl_saldo_inicial_ml);
								inputParams.setValue("scl_saldo_inicial_ma",scl_saldo_inicial_ma);
								inputParams.setValue("scl_saldo_final_ml",scl_saldo_final_ml);
								inputParams.setValue("scl_saldo_final_ma",scl_saldo_final_ma);
								inputParams.setValue("scl_creditos_ml",scl_creditos_ml);
								inputParams.setValue("scl_creditos_ma",scl_creditos_ma);
								inputParams.setValue("scl_debitos_ml",scl_debitos_ml);
								inputParams.setValue("scl_debitos_ma",scl_debitos_ma);
								inputParams.setValue("scl_saldo_vencido_ml",scl_saldo_vencido_ml);
								inputParams.setValue("scl_saldo_vencido_ma",scl_saldo_vencido_ma);
								inputParams.setValue("scl_porcentaje_deuda_vencida",scl_porcentaje_deuda_vencida);

								str = "Validando estatus del proceso...";	
								bw.write(str);
								bw.flush();
								bw.newLine();
								
								if(mdc_estatus_financiero.equals("PA"))
								{
									mdc_estatus_proceso="AP";
								//else
								//if(mdc_estatus_financiero.equals("PP"))
								//	mdc_estatus_proceso="AB";
							
									inputParams.setValue("mdc_estatus_proceso", mdc_estatus_proceso);
									
									str = "Actualizando estatus proceso...";
									bw.write(str);
									bw.flush();
									bw.newLine();
									
									sql = getSQL(getResource("update-smn_mov_documento_cob_cab.sql"), inputParams);
									db.exec(sql);
									
									str = "Estatus proceso actualizado";
									bw.write(str);
									bw.flush();
									bw.newLine();
								}
								
								/*if(mdc_estatus_financiero.equals("PA"))
								{
									//Registrar comisiones...
									
									str = "Buscando coincidencias en las reglas de comisiones...";
									bw.write(str);
									bw.flush();
									bw.newLine();
									
									sql = getSQL(getResource("select-smn_reglas_comisiones.sql"), inputParams);
									Recordset rsReglasComisiones = db.get(sql);
									
									if(rsReglasComisiones.getRecordCount()>0)
									{
										while(rsReglasComisiones.next())
										{
											str = "Regla encontrada ID: "+rsReglasComisiones.getInt("smn_reglas_comisiones_id");
											bw.write(str);
											bw.flush();
											bw.newLine();
											
											if(rsReglasComisiones.getString("smn_documento_id")!=null)
												inputParams.setValue("smn_documento_id_rco", rsReglasComisiones.getInt("smn_documento_id"));
											else
												inputParams.setValue("smn_documento_id_rco",0);
											
											inputParams.setValue("smn_reglas_comisiones_id", rsReglasComisiones.getInt("smn_reglas_comisiones_id"));
											
											str = "Calculando secuencia de la tabla de comisiones...";
											bw.write(str);
											bw.flush();
											bw.newLine();
											
											sql = getSQL(getResource("select-smn_comisiones.sql"), inputParams);
											Recordset rsComisiones = db.get(sql);
											
											if(rsComisiones.getRecordCount()>0)
											{
												rsComisiones.first();
												if(rsComisiones.getString("com_numero_documento")!=null)
													inputParams.setValue("com_numero_documento",rsComisiones.getInt("com_numero_documento"));
												else
													inputParams.setValue("com_numero_documento",1);	
											}
											else
											{
												inputParams.setValue("com_numero_documento",1);	
											}
											
											if(rsReglasComisiones.getString("smn_auxiliar_rf")!=null)
												inputParams.setValue("smn_cliente_rf", rsReglasComisiones.getInt("smn_auxiliar_rf"));
											else
												inputParams.setValue("smn_cliente_rf",0);
											
											if(rsReglasComisiones.getString("smn_promotor_rf")!=null)
												inputParams.setValue("smn_promotor_rf", rsReglasComisiones.getInt("smn_promotor_rf"));
											else
												inputParams.setValue("smn_promotor_rf",0);
											
											if(rsReglasComisiones.getString("smn_rol_id")!=null)
												inputParams.setValue("smn_rol_id", rsReglasComisiones.getInt("smn_rol_id"));
											else
												inputParams.setValue("smn_rol_id",0);
											
											if(rsReglasComisiones.getString("rco_monto_bruto_cob_ml")!=null)
											{
												inputParams.setValue("rco_monto_bruto_cob_ml", rsReglasComisiones.getDouble("rco_monto_bruto_cob_ml"));
												rco_monto_bruto_cob_ml=rsReglasComisiones.getDouble("rco_monto_bruto_cob_ml");
											}
											else
											{
												inputParams.setValue("rco_monto_bruto_cob_ml",0);
												rco_monto_bruto_cob_ml=0;
											}
											
											if(rsReglasComisiones.getString("rco_monto_bruto_cob_ma")!=null)
											{
												inputParams.setValue("rco_monto_bruto_cob_ma", rsReglasComisiones.getDouble("rco_monto_bruto_cob_ma"));
												rco_monto_bruto_cob_ma=rsReglasComisiones.getDouble("rco_monto_bruto_cob_ma");
											}
											else
											{
												inputParams.setValue("rco_monto_bruto_cob_ma",0);
												rco_monto_bruto_cob_ma=0;
											}
											
											if(rsReglasComisiones.getString("smn_moneda_rf")!=null)
												inputParams.setValue("smn_moneda_rf", rsReglasComisiones.getInt("smn_moneda_rf"));
											else
												inputParams.setValue("smn_moneda_rf",0);
											
											if(rsReglasComisiones.getString("pde_cantidad_pedido")!=null)
											{
												inputParams.setValue("pde_cantidad_pedido", rsReglasComisiones.getDouble("pde_cantidad_pedido"));
												pde_cantidad_pedido=rsReglasComisiones.getDouble("pde_cantidad_pedido");
											}
											else
											{
												inputParams.setValue("pde_cantidad_pedido",0);
												pde_cantidad_pedido=0;
											}
											
											if(rsReglasComisiones.getString("rco_porcentaje")!=null)
											{
												inputParams.setValue("rco_porcentaje", rsReglasComisiones.getDouble("rco_porcentaje"));
												rco_porcentaje=rsReglasComisiones.getDouble("rco_porcentaje");
											}
											else
											{
												inputParams.setValue("rco_porcentaje",0);
												rco_porcentaje=0;
											}
											
											if(rsReglasComisiones.getString("rco_valor")!=null)
											{
												inputParams.setValue("com_monto_comision_ml", rsReglasComisiones.getDouble("rco_valor")*pde_cantidad_pedido);
												inputParams.setValue("com_monto_comision_ma", rsReglasComisiones.getDouble("rco_valor")*pde_cantidad_pedido);
											}
											else
											{
												inputParams.setValue("com_monto_comision_ml", (rco_monto_bruto_cob_ml*rco_porcentaje)/100);
												inputParams.setValue("com_monto_comision_ma", (rco_monto_bruto_cob_ma*rco_porcentaje)/100);
											}
											
											str = "Registrando comision...";
											bw.write(str);
											bw.flush();
											bw.newLine();
											
											sql = getSQL(getResource("insert-smn_comisiones.sql"), inputParams);
											db.exec(sql);
											
											str = "Comision registrada";
											bw.write(str);
											bw.flush();
											bw.newLine();
										} //END WHILE
									}
								}*/
							}//END WHILE
							
							if(!existe)
							{
								str = "NO EXISTE Registrando saldo del cliente...";
								bw.write(str);
								bw.flush();
								bw.newLine();
								
								sql = getSQL(getResource("insert-smn_saldo_cliente.sql"), inputParams);
								db.exec(sql);
								
								str = "Saldo del cliente registrado exitosamente";
								bw.write(str);
								bw.flush();
								bw.newLine();
							}
							else
							{
								if(scl_fecha.compareTo(currency_date)==0)
								{
									str = "Actualizando saldo del cliente...scl_fecha "+scl_fecha+" currency_date "+currency_date;
									bw.write(str);
									bw.flush();
									bw.newLine();
									
									sql = getSQL(getResource("update-smn_saldo_cliente.sql"), inputParams);
									db.exec(sql);
									
									str = "Saldo del cliente actualizado exitosamente";
									bw.write(str);
									bw.flush();
									bw.newLine();
								}
								else
								{
									str = "Registrando saldo del cliente...scl_fecha "+scl_fecha+" currency_date "+currency_date;
									bw.write(str);
									bw.flush();
									bw.newLine();
									
									sql = getSQL(getResource("insert-smn_saldo_cliente.sql"), inputParams);
									db.exec(sql);
									
									str = "Saldo del cliente registrado exitosamente";
									bw.write(str);
									bw.flush();
									bw.newLine();
								}
							}
							
							/*str = "Actualizando estatus de la relacion de cobranza...";
							bw.write(str);
							bw.flush();
							bw.newLine();
							
							//sql = getSQL(getResource("update-smn_relacion_cobranza.sql"), inputParams);
							//db.exec(sql);
							
							str = "Estatus de la relacion de cobranza actualizado exitosamente";
							bw.write(str);
							bw.flush();
							bw.newLine();*/
						}
						else
						{
							str = "La relacion de cobranza no tiene documentos relacionados";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							//return 1;
						}				
					/*}
					else
					{
						str = "La relacion de cobranza no esta registrada";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
						//return 1;
					}*/
				}
		}catch(Throwable e){
			conn.rollback();
			throw e;
		}
		
		finally
		{
			//bw.close();
			
			if(rc == 0){
				conn.commit();
			}else{
				conn.rollback();
			}
			
			//if(conn!=null)
			//	conn.close();
		}
		
		return rc;
	}

	
	private int controlItem(Connection conn, Recordset inputParams, String str, BufferedWriter bw) throws Throwable
	{
		int rc = 0;
		Double saldo_inicial_existencia=0.00;
		Double cantidad_entradas=0.00;
		Double cantidad_salidas=0.00; 
		Double saldo_final_existencia=0.00;
		Double valor_inicial=0.00; 
		Double valor_entrada=0.00;
		Double valor_salida=0.00;
		Double valor_final=0.00;
		Double costo_promedio=0.00;
		Double ultimo_costo=0.00;
		Double costo_mas_alto=0.00;
		Double costo_promedio_ponderado=0.00;
		Double valor_inicial_ma=0.00; 
		Double valor_entrada_ma=0.00;
		Double valor_salida_ma=0.00;
		Double valor_final_ma=0.00;
		Double costo_promedio_ma=0.00;
		Double ultimo_costo_ma=0.00;
		Double costo_mas_alto_ma=0.00;
		Double costo_promedio_ponderado_ma=0.00;
		Boolean existe=false;
		Integer almacen;
		Integer item_id;
		String tipo_movimiento;
		String tipo_costo;
		Date fecha_mov_cab;
		Date fecha_movimiento = null;
		double cantidad_recibida;
		Double valor_unitario_ml=0.00;;
		Double valor_unitario_ma=0.00;
		String mensaje = "";
		//
		String tipo_costo_alm = "";
		Double valor_disminucion_ml=0.00;
		Double valor_disminucion_ma=0.00;
		Double cantidad_reservada=0.00;
		Integer numero_documento_origen;
		
		conn.setAutoCommit(false);
		this.setConnection(conn);
				
		try 
		{
			str = "*Procesando control de item*";
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			Db db = getDb();

			String sqlCheckCab = getSQL(getResource("sql-consultaMovimientoCabecera.sql"), inputParams);
			Recordset rsMovimientoCabecera = db.get(sqlCheckCab);
			
			str = "Consultando movimiento cabecera...";
			bw.write(str);
			bw.flush();
			bw.newLine();
			
			if(rsMovimientoCabecera.getRecordCount() > 0) {
			
				rsMovimientoCabecera.first();
				almacen=rsMovimientoCabecera.getInteger("smn_almacen_rf");
				tipo_costo_alm=rsMovimientoCabecera.getString("cal_tipo_calculo_costo");
				inputParams.setValue("smn_almacen_rf", almacen);
				fecha_mov_cab=rsMovimientoCabecera.getDate("mca_fecha_recibida");
				inputParams.setValue("coi_fecha_movimiento", fecha_mov_cab);
				//
				numero_documento_origen=rsMovimientoCabecera.getInteger("mca_numero_documento_origen");
				inputParams.setValue("mca_numero_documento_origen", numero_documento_origen);
				
				String sqlCheckDet = getSQL(getResource("sql-consultaMovimientoDetalle.sql"), inputParams);
				Recordset rsMovimientoDetalle = db.get(sqlCheckDet);
				
				str = "Consultando movimiento detalle...";
				bw.write(str);
				bw.flush();
				bw.newLine();
				
				if(rsMovimientoDetalle.getRecordCount() > 0) {
					str = "Total detalles encontrados = "+rsMovimientoDetalle.getRecordCount();
					bw.write(str);
					bw.flush();
					bw.newLine();
					while (rsMovimientoDetalle.next())
					{
						tipo_movimiento=rsMovimientoDetalle.getString("mde_tipo_movimiento");
						cantidad_recibida=rsMovimientoDetalle.getDouble("mde_cantidad_recibida");
						valor_unitario_ml=rsMovimientoDetalle.getDouble("mde_valor_unitario_ml");
						//
						if(rsMovimientoDetalle.getString("mde_valor_unitario_ma") != null)
							valor_unitario_ma=rsMovimientoDetalle.getDouble("mde_valor_unitario_ma");
						else
							valor_unitario_ma=0.0;
						//
						if(rsMovimientoDetalle.getString("mde_monto_disminucion_ml") != null)
							valor_disminucion_ml=rsMovimientoDetalle.getDouble("mde_monto_disminucion_ml");
						else
							valor_disminucion_ml=0.0;				
						//
						if(rsMovimientoDetalle.getString("mde_monto_disminucion_ma") != null)
							valor_disminucion_ma=rsMovimientoDetalle.getDouble("mde_monto_disminucion_ma");
						else
							valor_disminucion_ma=0.0;
						//
						if(tipo_costo_alm.equals("DI")){
							valor_unitario_ml=valor_unitario_ml-valor_disminucion_ml;
							valor_unitario_ma=valor_unitario_ma-valor_disminucion_ma;
						}
						//
						inputParams.setValue("coi_fecha_movimiento", fecha_mov_cab);
						tipo_costo=rsMovimientoDetalle.getString("cit_tipo_costo");
						item_id=rsMovimientoDetalle.getInteger("item_rf");
						inputParams.setValue("smn_item_rf", item_id);
						Integer movimiento_detalle_id=rsMovimientoDetalle.getInteger("smn_movimiento_detalle_id");
						inputParams.setValue("smn_movimiento_detalle_id", movimiento_detalle_id);
						
						String sqlCheckControl = getSQL(getResource("sql-consultaControlItem.sql"), inputParams);
						Recordset rssqlCheckControl = db.get(sqlCheckControl);
						
						str = "Consultando control de item...";
						bw.write(str);
						bw.flush();
						bw.newLine();
						
						if(rssqlCheckControl.getRecordCount() > 0) {
							while (rssqlCheckControl.next())
							{
								inputParams.setValue("smn_control_item_id", rssqlCheckControl.getInteger("smn_control_item_id"));
								existe=true;
								saldo_inicial_existencia=rssqlCheckControl.getDouble("coi_saldo_inicial_existencia"); 
								cantidad_entradas=rssqlCheckControl.getDouble("coi_cantidad_entradas");  
								cantidad_salidas=rssqlCheckControl.getDouble("coi_cantidad_salidas"); 
								saldo_final_existencia=rssqlCheckControl.getDouble("coi_saldo_final_existencia"); 
								valor_inicial=rssqlCheckControl.getDouble("coi_valor_inicial"); 
								valor_entrada=rssqlCheckControl.getDouble("coi_valor_entrada"); 
								valor_salida=rssqlCheckControl.getDouble("coi_valor_salida"); 
								valor_final=rssqlCheckControl.getDouble("coi_valor_final"); 
								costo_promedio=rssqlCheckControl.getDouble("coi_costo_promedio"); 
								ultimo_costo=rssqlCheckControl.getDouble("coi_ultimo_costo"); 
								costo_mas_alto=rssqlCheckControl.getDouble("coi_costo_mas_alto"); 
								costo_promedio_ponderado=rssqlCheckControl.getDouble("coi_costo_promedio_ponderado");
								fecha_movimiento=rssqlCheckControl.getDate("coi_fecha_movimiento");
								cantidad_reservada=rssqlCheckControl.getDouble("coi_cantidad_reservada");
								
								//
								if(rssqlCheckControl.getString("coi_valor_inicial_ma") != null)
									valor_inicial_ma=rssqlCheckControl.getDouble("coi_valor_inicial_ma");
								else
									valor_inicial_ma=0.0;
								
								if(rssqlCheckControl.getString("coi_valor_entradas_ma") != null)
									valor_entrada_ma=rssqlCheckControl.getDouble("coi_valor_entradas_ma"); 
								else
									valor_entrada_ma=0.0;
								
								if(rssqlCheckControl.getString("coi_valor_salidas_ma") != null)
									valor_salida_ma=rssqlCheckControl.getDouble("coi_valor_salidas_ma"); 
								else
									valor_salida_ma=0.0;
								
								if(rssqlCheckControl.getString("coi_valor_final_ma") != null)
									valor_final_ma=rssqlCheckControl.getDouble("coi_valor_final_ma");
								else
									valor_final_ma=0.0;
								
								if(rssqlCheckControl.getString("coi_costo_promedio_ma") != null)
									costo_promedio_ma=rssqlCheckControl.getDouble("coi_costo_promedio_ma"); 
								else
									costo_promedio_ma=0.0;
								
								if(rssqlCheckControl.getString("coi_ultimo_costo_ma") != null)
									ultimo_costo_ma=rssqlCheckControl.getDouble("coi_ultimo_costo_ma"); 
								else
									ultimo_costo_ma=0.0;
								
								if(rssqlCheckControl.getString("coi_costo_mas_alto_ma") != null)
									costo_mas_alto_ma=rssqlCheckControl.getDouble("coi_costo_mas_alto_ma"); 
								else
									costo_mas_alto_ma=0.0;
								
								if(rssqlCheckControl.getString("coi_costo_promedio_ponderado_ma") != null)
									costo_promedio_ponderado_ma=rssqlCheckControl.getDouble("coi_costo_promedio_ponderado_ma");
								else
									costo_promedio_ponderado_ma=0.0;
							}
						}else{
							existe=false;
							saldo_inicial_existencia=0.00; 
							cantidad_entradas=0.00; 
							cantidad_salidas=0.00;
							saldo_final_existencia=0.00;
							valor_inicial=0.00;
							valor_entrada=0.00;
							valor_salida=0.00;
							valor_final=0.00;
							costo_promedio=0.00;
							ultimo_costo=0.00;
							costo_mas_alto=0.00;
							costo_promedio_ponderado=0.00;
							//
							cantidad_reservada=0.00;
							//
							valor_inicial_ma=0.00;
							valor_entrada_ma=0.00;
							valor_salida_ma=0.00;
							valor_final_ma=0.00;
							costo_promedio_ma=0.00;
							ultimo_costo_ma=0.00;
							costo_mas_alto_ma=0.00;
							costo_promedio_ponderado_ma=0.00;
							
						}
						if(tipo_movimiento.equals("EN") || tipo_movimiento.equals("AE")){
							inputParams.setValue("coi_precio", valor_unitario_ml);
							inputParams.setValue("coi_precio_ma", valor_unitario_ma);
							cantidad_entradas=cantidad_recibida;
							inputParams.setValue("coi_cantidad_entradas", cantidad_entradas);
							saldo_inicial_existencia=saldo_final_existencia;
							saldo_final_existencia=saldo_final_existencia+cantidad_entradas;
							inputParams.setValue("coi_saldo_inicial_existencia", saldo_inicial_existencia);
							inputParams.setValue("coi_saldo_final_existencia", saldo_final_existencia);
							inputParams.setValue("coi_cantidad_salidas", cantidad_salidas);
							valor_inicial=valor_final;
							//
							valor_inicial_ma=valor_final_ma;
							//
							inputParams.setValue("coi_valor_inicial", valor_inicial);
							inputParams.setValue("coi_valor_inicial_ma", valor_inicial_ma);
							valor_entrada=valor_unitario_ml*cantidad_entradas;
							//
							valor_entrada_ma=valor_unitario_ma*cantidad_entradas;
							//
							inputParams.setValue("coi_valor_entrada", valor_entrada);
							inputParams.setValue("coi_valor_entrada_ma", valor_entrada_ma);
							inputParams.setValue("coi_valor_salida", valor_salida);
							inputParams.setValue("coi_valor_salida_ma", valor_salida_ma);
							valor_final=valor_inicial+valor_entrada;
							//
							valor_final_ma=valor_inicial_ma+valor_entrada_ma;
							//
							inputParams.setValue("coi_valor_final", valor_final);
							inputParams.setValue("coi_valor_final_ma", valor_final_ma);
							costo_promedio=valor_final / saldo_final_existencia;
							//
							costo_promedio_ma=valor_final_ma / saldo_final_existencia;
							//
							inputParams.setValue("coi_costo_promedio", costo_promedio);
							inputParams.setValue("coi_costo_promedio_ma", costo_promedio_ma);
							ultimo_costo=valor_unitario_ml;
							//
							ultimo_costo_ma=valor_unitario_ma;
							//
							inputParams.setValue("coi_ultimo_costo", ultimo_costo);
							inputParams.setValue("coi_ultimo_costo_ma", ultimo_costo_ma);
							costo_mas_alto=Math.max(costo_mas_alto, valor_unitario_ml);
							//
							costo_mas_alto_ma=Math.max(costo_mas_alto_ma, valor_unitario_ma);
							//
							inputParams.setValue("coi_costo_mas_alto", costo_mas_alto);
							inputParams.setValue("coi_costo_mas_alto_ma", costo_mas_alto_ma);
							costo_promedio_ponderado=((cantidad_entradas*valor_unitario_ml)+
									(saldo_inicial_existencia*costo_promedio_ponderado)) /
									(cantidad_entradas + saldo_inicial_existencia);
							//
							costo_promedio_ponderado_ma=((cantidad_entradas*valor_unitario_ma)+
									(saldo_inicial_existencia*costo_promedio_ponderado_ma)) /
									(cantidad_entradas + saldo_inicial_existencia);
							//
							inputParams.setValue("coi_costo_promedio_ponderado", costo_promedio_ponderado);
							inputParams.setValue("coi_costo_promedio_ponderado_ma", costo_promedio_ponderado_ma);
							
							
						}else{
							inputParams.setValue("coi_precio", valor_unitario_ml);
							inputParams.setValue("coi_precio_ma", valor_unitario_ma);
							cantidad_salidas=cantidad_salidas+cantidad_recibida;
							inputParams.setValue("coi_cantidad_entradas", cantidad_entradas);
							saldo_inicial_existencia=saldo_final_existencia;
							saldo_final_existencia=saldo_final_existencia-cantidad_salidas;
							inputParams.setValue("coi_saldo_inicial_existencia", saldo_inicial_existencia);
							inputParams.setValue("coi_saldo_final_existencia", saldo_final_existencia);
							inputParams.setValue("coi_cantidad_salidas", cantidad_salidas);
							valor_inicial=valor_final;
							//
							cantidad_reservada=cantidad_reservada-cantidad_salidas;
							//
							valor_inicial_ma=valor_final_ma;
							//
							inputParams.setValue("coi_valor_inicial", valor_inicial);
							inputParams.setValue("coi_valor_inicial_ma", valor_inicial_ma);
							valor_entrada=valor_unitario_ml*cantidad_entradas;
							//
							valor_entrada_ma=valor_unitario_ma*cantidad_entradas;
							//
							inputParams.setValue("coi_valor_entrada", valor_entrada);
							inputParams.setValue("coi_valor_entrada_ma", valor_entrada_ma);
							//
							inputParams.setValue("coi_cantidad_reservada", cantidad_reservada);
							//
							if (tipo_costo.equals("PR")) {
								valor_salida=costo_promedio*cantidad_salidas;
								//
								valor_salida_ma=costo_promedio_ma*cantidad_salidas;
								//
							} else if (tipo_costo.equals("UC")) {
								valor_salida=ultimo_costo*cantidad_salidas;
								//
								valor_salida_ma=ultimo_costo_ma*cantidad_salidas;
								//
							} else if (tipo_costo.equals("CM")) {
								valor_salida=costo_mas_alto*cantidad_salidas;
								//
								valor_salida_ma=costo_mas_alto_ma*cantidad_salidas;
								//
							} else if (tipo_costo.equals("PP")) {
								valor_salida=costo_promedio_ponderado*cantidad_salidas;
								valor_salida_ma=costo_promedio_ponderado_ma*cantidad_salidas;
							}
							//
							inputParams.setValue("coi_valor_salida", valor_salida);
							inputParams.setValue("coi_valor_salida_ma", valor_salida_ma);
							valor_final=valor_inicial-valor_salida;
							//
							valor_final_ma=valor_inicial_ma-valor_salida_ma;
							//
							inputParams.setValue("coi_valor_final", valor_final);
							inputParams.setValue("coi_valor_final_ma", valor_final_ma);
							costo_promedio=valor_final / saldo_final_existencia;
							//
							costo_promedio_ma=valor_final_ma / saldo_final_existencia;
							//
							inputParams.setValue("coi_costo_promedio", costo_promedio);
							inputParams.setValue("coi_costo_promedio_ma", costo_promedio_ma);
							ultimo_costo=valor_unitario_ml;
							//
							ultimo_costo_ma=valor_unitario_ma;
							//
							inputParams.setValue("coi_ultimo_costo", ultimo_costo);
							inputParams.setValue("coi_ultimo_costo_ma", ultimo_costo_ma);
							costo_mas_alto=Math.max(costo_mas_alto, valor_unitario_ml);
							//
							costo_mas_alto_ma=Math.max(costo_mas_alto_ma, valor_unitario_ma);
							//
							inputParams.setValue("coi_costo_mas_alto", costo_mas_alto);
							inputParams.setValue("coi_costo_mas_alto_ma", costo_mas_alto_ma);
							costo_promedio_ponderado=((cantidad_entradas*valor_unitario_ml)+
									(saldo_inicial_existencia*costo_promedio_ponderado)) /
									(cantidad_entradas + saldo_inicial_existencia);
							//
							costo_promedio_ponderado_ma=((cantidad_entradas*valor_unitario_ma)+
									(saldo_inicial_existencia*costo_promedio_ponderado_ma)) /
									(cantidad_entradas + saldo_inicial_existencia);
							//
							inputParams.setValue("coi_costo_promedio_ponderado", costo_promedio_ponderado);
							inputParams.setValue("coi_costo_promedio_ponderado_ma", costo_promedio_ponderado_ma);
						}
						if(!existe){
							str = "Insertando control de item...";
							bw.write(str);
							bw.flush();
							bw.newLine();
							String insertControlItem = getSQL(getResource("insert_ControlItem.sql"), inputParams);
							Recordset insControlItem = db.get(insertControlItem);
							if(insControlItem.getRecordCount() > 0) {
								while(insControlItem.next()){
									Integer control_item_id=insControlItem.getInteger("id_control_item"); 
									inputParams.setValue("smn_control_item_id", control_item_id);
									str = "Insertando relacion control de item detalle...";
									bw.write(str);
									bw.flush();
									bw.newLine();
									String insRelControlItem = getSQL(getResource("insert_relacionControlItem.sql"), inputParams);
									db.exec(insRelControlItem);
								}
								
							}else{
								mensaje = "NO INSERTO CONTROL ITEM";
								str = mensaje;
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								rc = 1;
								return 1;
							}
						}else{
							if(fecha_mov_cab.compareTo(fecha_movimiento)==0){
								mensaje = "MODIFICANDO CONTROL ITEM";
								str = mensaje;
								bw.write(str);
								bw.flush();
								bw.newLine();
								String updateControlItem = getSQL(getResource("update_ControlItem.sql"), inputParams);
								db.exec(updateControlItem);
								mensaje = "INSERTANDO RELACION CONTROL ITEM DETALLE";
								str = mensaje;
								bw.write(str);
								bw.flush();
								bw.newLine();
								String insRelControlItem2 = getSQL(getResource("insert_relacionControlItem.sql"), inputParams);
								db.exec(insRelControlItem2);
								//
								mensaje = "ELIMINANDO RELACION CONTROL ITEM PEDIDO";
								str = mensaje;
								bw.write(str);
								bw.flush();
								bw.newLine();
								String updateControlItem3 = getSQL(getResource("delete_rel_controlitem_pedido.sql"), inputParams);
								db.exec(updateControlItem3);
							}else{
								mensaje = "INSERTANDO CONTROL ITEM";
								str = mensaje;
								bw.write(str);
								bw.flush();
								bw.newLine();
								String insertControlItem2 = getSQL(getResource("insert_ControlItem.sql"), inputParams);
								Recordset insControlItem2 = db.get(insertControlItem2);
								if(insControlItem2.getRecordCount() > 0) {
									while(insControlItem2.next()){
										Integer control_item_id=insControlItem2.getInteger("id_control_item"); 
										inputParams.setValue("smn_control_item_id", control_item_id);
										mensaje = "INSERTANDO RELACION CONTROL ITEM DETALLE";
										str = mensaje;
										bw.write(str);
										bw.flush();
										bw.newLine();
										String insRelControlItem2 = getSQL(getResource("insert_relacionControlItem.sql"), inputParams);
										db.exec(insRelControlItem2);
									}
									
								}else{
									mensaje = "NO INSERTO CONTROL ITEM";
									str = mensaje;
									bw.write(str);
									bw.flush();
									bw.newLine();
									getRequest().setAttribute("mensaje", str);
									rc = 1;
									return 1;
								}
							}
							
						}
						/*mensaje = "MODIFICANDO STATUS CABECERA DE MOVIMIENTO";
						str = mensaje;
						bw.write(str);
						bw.flush();
						bw.newLine();
						String updmovcab = getSQL(getResource("update_Movimiento_cabecera.sql"), inputParams);
						db.exec(updmovcab);*/
					}
				}else{
				mensaje = "NO HAY MOVIMIENTO DETALLE";
				str = mensaje;
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc = 1;
				return 1;
				}
			}
			mensaje = "Proceso de Control Item Exitoso";
			str = mensaje;
			bw.write(str);
			bw.flush();
			bw.newLine();
			inputParams.setValue("mensaje", mensaje);
			mensaje = "FIN DEL PROCESO";
			str = mensaje;
			bw.write(str);
			bw.flush();
			bw.newLine();
		}catch (Throwable e){
			conn.rollback();
			throw e;
		}
		return rc;
	}
	
}

