package proceso;

import dinamica.*;
import itntsolutions.ClienteSII;
import itntsolutions.model.DTE;
import itntsolutions.model.Detalle;
import itntsolutions.model.Document;
import itntsolutions.model.Emisor;
import itntsolutions.model.Encabezado;
import itntsolutions.model.IdDoc;
import itntsolutions.model.Organization;
import itntsolutions.model.Receptor;
import itntsolutions.model.Totales;

import javax.sql.DataSource;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
//import proceso.Recibir

public class Generar2 extends GenericTransaction
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
		
		conn.setAutoCommit(false);
		this.setConnection(conn);
				
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
					rsMovimientoPedido.first();
					String despacho = rsMovimientoPedido.getString("despacho");
					String modulo = rsMovimientoPedido.getString("modulo");
					int cant_dias = rsMovimientoPedido.getInt("cant_dias");
					String entrega_orden = rsMovimientoPedido.getString("entrega_por_orden");
					String tipo_pedido = rsMovimientoPedido.getString("tipo_pedido");
					
					if(entrega_orden.equals("NO")){
						
							str = str + "Insertando Pedido Cabecera con ID: "+ rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
							bw.write(str);
							bw.flush();
							bw.newLine();
							
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
								rc = 1;
								return 1;
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
								rc = 1;
								return 1;
								//return rc;
							}
						}
						
						if(despacho.equals("DP")){
							str = str + "No Genero la cabecera de movimiento porque es un despacho previo, Pedido Cabecera ID = " + rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							rc = 1;
							return 1;
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
							rc = 1;
							return 1;
						}
				
						String updatepedido = getSQL(getResource("update_pedido_cabecera.sql"), inputParams);		
						db.exec(updatepedido);
						
						str = str + "Pedido Procesado exitosamente";
						bw.write(str);
						bw.flush();
						bw.newLine();
						
						if(cant_dias > 0){
							str = str + "Entrando al proceso de cobranza";
							rc = generarCobranza(conn, inputParams, str,bw);
							bw.write(str);
							bw.flush();
							bw.newLine();
							if(rc!=0)
								return rc;
						}else{
							str = str + "No se puede generar la cobranza porque la condicion financiera es contado no credito";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							rc = 1;
							return 1;
						}
						
						if(modulo.equals("SMN_CAJA")){
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
						
						//Recibir rec = new Recibir();
						//receive(conn, inputParams, str, bw);
					}
				}else{
					str = str + "No se pudo leer Pedido Cabecera";
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", str);
					rc = 1;
					return 1;
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
				return 1;
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
					return 1;
				}	
			}else{
				str = str + "No se pudo leer Movimiento Pedido";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc = 1;
				return 1;
			}
		}catch (Throwable e){
			conn.rollback();
			throw e;
		}
		return rc;
	}
	
	
	public int generarCobranza(Connection conn, Recordset inputParams, String str, BufferedWriter bw) throws Throwable{
		int rc = 0;
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
		String tipo_movimiento;
		String sql=null;
		Double mdd_saldo_ml=0.00;
		Double mdd_saldo_ma=0.00;
		String mdc_estatus_financiero=null;
		Double cfi_limite_credito=0.00;
		Date scl_fecha;
		// La fecha actual
		Date currency_date = new Date(System.currentTimeMillis());
		
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		this.setConnection(conn);
		
		try {		
			Db db = getDb();
			str = str + "Procesando Movimiento de Cobranza Cab"+ " \n";
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
				String InsertCab = getResource("insert-cobranzacab.sql");
				InsertCab = getSQL(InsertCab, rsCab);
				Recordset rsCabecera =db.get(InsertCab);
				rsCabecera.first();
				inputParams.setValue("smn_mov_documento_cob_cab_id", rsCabecera.getInt("smn_mov_documento_cob_cab_id"));
				
				String sqldet = getSQL(getResource("sql-ConsultaDet.sql"), inputParams);
				Recordset rsDet = db.get(sqldet);
				
				if(rsDet.getRecordCount() > 0) {
					while(rsDet.next()){
						str  = str + "Creando Movimiento Detalle Cobranza"+ " \n";
						bw.write(str);
						bw.flush();
						bw.newLine();
						
						String InsertDet = getResource("insert-cobranzadet.sql");
						InsertDet = getSQL(InsertDet, rsDet);
						db.exec(InsertDet);
					}
					
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
						rsSaldoCliente.first();
						existe=true;
						inputParams.setValue("smn_saldo_cliente_id", rsSaldoCliente.getInt("smn_saldo_cliente_id"));
						scl_saldo_inicial_ml=rsSaldoCliente.getDouble("scl_saldo_inicial_ml");
						scl_debitos_ml=rsSaldoCliente.getDouble("scl_debitos_ml");
						scl_creditos_ml=rsSaldoCliente.getDouble("scl_creditos_ml");
						scl_saldo_final_ml=rsSaldoCliente.getDouble("scl_saldo_final_ml");
						scl_saldo_vencido_ml=rsSaldoCliente.getDouble("scl_saldo_vencido_ml");
						scl_saldo_inicial_ma=rsSaldoCliente.getDouble("scl_saldo_inicial_ma");
						scl_debitos_ma=rsSaldoCliente.getDouble("scl_debitos_ma");
						scl_creditos_ma=rsSaldoCliente.getDouble("scl_creditos_ma");
						scl_saldo_final_ma=rsSaldoCliente.getDouble("scl_saldo_final_ma");
						scl_saldo_vencido_ma=rsSaldoCliente.getDouble("scl_saldo_vencido_ma");
						scl_porcentaje_deuda_vencida=rsSaldoCliente.getDouble("scl_porcentaje_deuda_vencida");
						scl_fecha=rsSaldoCliente.getDate("scl_fecha");
					}
					else
					{
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
			
					sql = getSQL(getResource("select-smn_mov_documento_cob_cab.sql"), inputParams);
					Recordset rsRelCobDocumento = db.get(sql);
					
					str = "Consultando documentos relacionados a la cobranza...";
					bw.write(str);
					bw.flush();
					bw.newLine();
					
					if(rsRelCobDocumento.getRecordCount()>0)
					{
						while(rsRelCobDocumento.next())
						{
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
								return 1;
							}
							
							if(rsRelCobDocumento.getString("mdd_saldo_ml")!=null)
							{
								inputParams.setValue("mdd_saldo_ml",rsRelCobDocumento.getDouble("mdd_saldo_ml"));
								mdd_saldo_ml=rsRelCobDocumento.getDouble("mdd_saldo_ml");
							}
							else
							{
								str = "El documento no tiene saldo en moneda local";
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								return 1;
							}
							
							if(rsRelCobDocumento.getString("mdd_saldo_ma")!=null)
							{
								inputParams.setValue("mdd_saldo_ma",rsRelCobDocumento.getDouble("mdd_saldo_ma"));
								mdd_saldo_ma=rsRelCobDocumento.getDouble("mdd_saldo_ma");
							}
							else
							{
								inputParams.setValue("mdd_saldo_ma",0.0);
								mdd_saldo_ma=0.0;
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
								return 1;
							}
							
							if(rsRelCobDocumento.getString("smn_cliente_rf")!=null)
							{
								inputParams.setValue("smn_cliente_id",rsRelCobDocumento.getInt("smn_cliente_rf"));
							}
							else
							{
								str = "El movimiento de cobranza no tiene cliente registrado";
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								return 1;
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
									return 1;
								}
							}
							else
							{
								str = "No se encontro la condicion financiera del cliente "+inputParams.getInt("smn_cliente_id");
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								return 1;
							}
							
							if(tipo_movimiento.equals("FC") || tipo_movimiento.equals("ND"))
							{
								scl_saldo_inicial_ml=scl_saldo_final_ml;
								scl_saldo_inicial_ma=scl_saldo_final_ma;
								scl_saldo_final_ml+=mdd_saldo_ml;
								scl_saldo_final_ma+=mdd_saldo_ma;
								scl_debitos_ml+=mdd_saldo_ml;
								scl_debitos_ma+=mdd_saldo_ma;
								
								if(mdc_estatus_financiero.equals("VE"))
								{
									scl_saldo_vencido_ml+=mdd_saldo_ml;
									scl_saldo_vencido_ma+=mdd_saldo_ma;
									scl_porcentaje_deuda_vencida=scl_saldo_vencido_ml/cfi_limite_credito;
								}
							}
							else
							if(tipo_movimiento.equals("RC") || tipo_movimiento.equals("NC"))
							{
								scl_saldo_inicial_ml=scl_saldo_final_ml;
								scl_saldo_inicial_ma=scl_saldo_final_ma;
								scl_saldo_final_ml-=mdd_saldo_ml;
								scl_saldo_final_ma-=mdd_saldo_ma;
								scl_creditos_ml+=mdd_saldo_ml;
								scl_creditos_ma+=mdd_saldo_ml;
								
								if(mdc_estatus_financiero.equals("VE"))
								{
									scl_saldo_vencido_ml+=mdd_saldo_ml;
									scl_saldo_vencido_ma+=mdd_saldo_ma;
									scl_porcentaje_deuda_vencida=scl_saldo_vencido_ml/cfi_limite_credito;
								}
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
							
							if(!existe)
							{
								str = "Registrando saldo del cliente...";
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
									str = "Actualizando saldo del cliente...";
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
									str = "Registrando saldo del cliente...";
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
						}//END WHILE
					}
					else
					{
						str = "La relacion de cobranza no tiene documentos relacionados";
						bw.write(str);
						bw.flush();
						bw.newLine();
						getRequest().setAttribute("mensaje", str);
						return 1;
					}
				}else{
					str = str + "Error al crear Movimiento de Cobranza Cab"+ " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();
				}
			}else{
				str = str + "Error al crear la cabecera del movimiento de Cobranza"+ " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
			}
		}catch (Throwable e){
			throw e;
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
		}catch(Throwable e){
			throw e;
		}
		
		return rc;
	}
	
	
	public int receive(Connection conn, Recordset inputParams, String str, BufferedWriter bw) throws Throwable {

		int rc = 0;

		/*String fechaActual = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sistemaOperativo = System.getProperty("os.name");
		String file;

		if (sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8")
				|| sistemaOperativo.equals("Windows 10"))
			file = "C:/log/log_ProcesarDTE" + fechaActual + ".txt";
		else
			file = "./log_ProcesarDTE" + fechaActual + ".txt";

		File newLogFile = new File(file);
		FileWriter fw;
		String str = "";*/

		/*if (!newLogFile.exists())
			fw = new FileWriter(newLogFile);
		else
			fw = new FileWriter(newLogFile, true);

		BufferedWriter bw = new BufferedWriter(fw);*/

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		//super.receive(inputParams);

		String jndiName = (String) getContext().getAttribute("dinamica.security.datasource");

		if (jndiName == null)
			throw new Throwable(
					"Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");

		//DataSource ds = Jndi.getDataSource(jndiName);
		//Connection conn = ds.getConnection();
		this.setConnection(conn);

		DTE dte = new DTE();
		ClienteSII clienteSII = new ClienteSII();

		Organization organization = clienteSII.infoContribuyente();

		String responseOutput[] = { "PDF", "FOLIO" };

		// FT
		// FT str = str + "Recibiendo detalle de la factura."+ " \n";

		try {

			str = "----------" + timestamp + "----------";
			bw.write(str);
			bw.flush();
			bw.newLine();
			bw.newLine();

			Db db = getDb();

			str = str + "RECIBIR FACTURA CABECERA" + " \n";
			bw.write(str);
			bw.flush();
			bw.newLine();

			String sqlCheckDFact = getSQL(getResource("sql-consultaFacturaCabecera.sql"), inputParams);

			Recordset rsDFactura = db.get(sqlCheckDFact);

			if (rsDFactura.getRecordCount() > 0) {

				while (rsDFactura.next()) {

					String rzonSocialEmi = rsDFactura.getString("ent_descripcion_larga");
					String rutEmi = rsDFactura.getString("ent_nro_id_fiscal");
					String dirFiscEmi = rsDFactura.getString("ent_direccion");
					int acteco = rsDFactura.getInteger("ent_sector_economico");
					String telEmi = rsDFactura.getString("ent_telefono_fijo");
					String rzonSocial = rsDFactura.getString("smn_cliente_id");
					String rutRec = rsDFactura.getString("fca_rif");
					String dirFisc = rsDFactura.getString("fca_direccion_fiscal");
					String CnaRec = rsDFactura.getString("aux_direccion_munic");
					int mtoTotal = rsDFactura.getInt("fca_monto_factura_ml");
					int mtoNeto = rsDFactura.getInt("fca_monto_neto_ml");
					int mtoIVA = rsDFactura.getInt("fca_monto_impuesto_ml");
					String TasaIVA = rsDFactura.getString("fde_tasa_rf");
					String fecha_reg = rsDFactura.getString("fca_fecha_registro");
					String GiroEmis = rsDFactura.getString("ent_codigo");
					String CmnaOrigen = rsDFactura.getString("ent_direccion_munic");
					String FmaPago = rsDFactura.getString("smn_forma_pago");
					int TipoDTE = rsDFactura.getInteger("smn_tipo_dte");
					int Folio = Integer.parseInt(rsDFactura.getString("fca_folio"));

					Encabezado encabezado = new Encabezado();

					// IdDoc
					IdDoc idDoc = new IdDoc();
					idDoc.setTipoDTE(TipoDTE);
					idDoc.setFolio(Folio);
					idDoc.setFchEmis(fecha_reg);
					idDoc.setTpoTranCompra("1");// OJO
					idDoc.setTpoTranVenta("1");// OJO
					idDoc.setFmaPago(FmaPago);

					// Emisor
					Emisor emisor = new Emisor();
					emisor.setRUTEmisor(rutEmi);
					emisor.setRznSoc(rzonSocialEmi);
					emisor.setGiroEmis(GiroEmis);
					emisor.setActeco(acteco);
					emisor.setDirOrigen(dirFiscEmi);
					emisor.setCmnaOrigen(CmnaOrigen);
					emisor.setTelefono(telEmi);
					emisor.setCdgSIISucur("81303347");

					// Receptor
					Receptor receptor = new Receptor();
					receptor.setRUTRecep(rutRec);
					receptor.setRznSocRecep(rzonSocial);
					receptor.setGiroRecep("ACTIVIDADES DE CONSULTORIA DE INFORMATIC");
					receptor.setDirRecep(dirFisc);
					receptor.setCmnaRecep(CnaRec);

					// Totales
					Totales totales = new Totales();
					totales.setMntNeto(mtoNeto);
					totales.setTasaIVA(TasaIVA);
					totales.setIVA(mtoIVA);
					totales.setMntTotal(mtoTotal);
					totales.setMontoPeriodo(2380);// creo que no es obligatorio
					totales.setVlrPagar(mtoTotal);

					encabezado.setIdDoc(idDoc);
					encabezado.setEmisor(emisor);
					encabezado.setReceptor(receptor);
					encabezado.setTotales(totales);

					dte.setEncabezado(encabezado);

					str = str + "Fin proceso RECIBIR FACTURA CABECERA" + " \n";
					bw.write(str);
					bw.flush();
					bw.newLine();

				}
			} else {

				str = str + "No se encontraron registros en smn_factura_cabecera" + " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc = 1;
				return 1;

			}

			str = str + "RECIBIR DETALLE PEDIDO" + " \n";
			bw.write(str);
			bw.flush();
			bw.newLine();

			String sqlDataDetalle = getSQL(getResource("sql-consultaPedidoDetalle_fac.sql"), inputParams);
			Recordset rsDDetalle = db.get(sqlDataDetalle);

			if (rsDDetalle.getRecordCount() > 0) {

				while (rsDDetalle.next()) {

					int NroLinDet = rsDDetalle.getInteger("smn_item_rf");
					String NombItem = rsDDetalle.getString("nombre_item");
					int QtyItem = rsDDetalle.getInteger("fde_cantidad");
					int PrcItem = rsDDetalle.getInteger("fde_precio_ml");
					int MontoItem = rsDDetalle.getInteger("fde_monto_ml");

					Detalle detalle = new Detalle();
					detalle.setNroLinDet(NroLinDet);
					detalle.setNmbItem(NombItem);
					detalle.setQtyItem(QtyItem);
					detalle.setPrcItem(PrcItem);
					detalle.setMontoItem(MontoItem);

					Detalle detalleArray[] = { detalle };

					dte.setDetalle(detalleArray);

				}

				str = str + "Fin proceso RECIBIR DETALLE PEDIDO" + " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();

				Document document = clienteSII.emitirDTE(responseOutput, dte);

				System.out.println(document);
			} else {

				str = str + "No se encontaron registros en smn.pedido_detalle" + " \n";
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", str);
				rc = 1;
				return 1;

			}

		} catch (

		Throwable e)

		{
			throw e;
		} /*finally

		{
			if (conn != null)
				conn.close();
		}*/
		return rc;
	}
}

