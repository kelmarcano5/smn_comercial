package proceso;
import dinamica.*;

import javax.sql.DataSource;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
//import proceso.Recibir
import java.util.Properties;

public class GenerarPedidoIng_copy extends GenericTransaction{
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
			
			
			//COMIENZA CODIGIO DE INTEGRACION CON INFOLAB OBTENIENDO EL ID DE CAJA CON EL NUMERO DEL PEDIDO LUEGO DE GENERADO EL PROCESO DE PEDIDOINGRESO
			
			infolab();
			
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
	
	public void infolab(Connection conn, Recordset inputParams, String str, BufferedWriter bw) throws Throwable {
		String sqlCheckPed = getSQL(getResource("sql-consultaMovimientoCajaCabecera.sql"), inputParams);
		Recordset rsMovimientoCaja = db.get(sqlCheckPed);
		str = str + "Armando información en Ris/InfoLab Cabeceras "+ " \n";		
		String fecha = "";
		//String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String hora = new SimpleDateFormat("HH:mm:ss").format(new Date());									
		// Declare the JDBC objects RIS.
		/*Connection con = null; //Conexión BD				
		PreparedStatement stmt = null; //dbo.Int_adt
	    PreparedStatement stmt2 = null; //dbo.Int_orm												
		SQLServerDataSource ds_ = new SQLServerDataSource();  
		ds_.setUser("simone");  
		ds_.setPassword("Simone$HCE.");  
		ds_.setServerName("HCESRV07");  
		ds_.setPortNumber(1433);   
		ds_.setDatabaseName("OrdExternas"); 
		ds_.setInstanceName("SRVWEB01");
		con = ds_.getConnection(); */
				
		
		SQLServerDataSource ds_infolab = new SQLServerDataSource();
		ds_infolab.setUser("simone");
		ds_infolab.setPassword("Simone$HCE.");
		ds_infolab.setServerName("192.168.1.151");
		ds_infolab.setPortNumber(1433);
		ds_infolab.setDatabaseName("INFOLAB");
		ds_infolab.setInstanceName("HCESRV07");
		ds_infolab.setEncrypt(Boolean.TRUE);		
		ds_infolab.setIntegratedSecurity(Boolean.FALSE);
		ds_infolab.setTrustServerCertificate(Boolean.TRUE);
		
		Connection con_infolab = ds_infolab.getConnection(); //Conexión BD				
		PreparedStatement stmt_infolab = null; //dbo.OrdExternas	
		//ds_infolab.setTrustStore("storeName");
		//ds_infolab.setTrustStorePassword("storeName");
		
		Properties properties = con_infolab.getClientInfo();
		System.out.println("Propiedades = " + properties);
		System.out.println("Conectado.");

		// Continuacion - Cabecera RIS e InfoLab
		fechaActual= new SimpleDateFormat("yyyyMMdd").format(new Date());
		hora = new SimpleDateFormat("HHmmss").format(new Date());
								
		String fecha_admision = String.valueOf(rsMovimientoCaja.getDate("mcc_fecha_ingreso"));
		fecha_admision = fecha_admision.replace("-", "");
		
		String fecha_nacimiento = String.valueOf(rsMovimientoCaja.getString("aux_fecha_nac"));
		fecha_nacimiento = fecha_nacimiento.replace("-", "");
		
		if( rsMovimientoCaja.getString("aux_direccion_rf") == null) 
			rsMovimientoCaja.setValue("aux_direccion_rf", ""); 
		
		String peso_m = String.valueOf(rsMovimientoCaja.getDouble("aux_peso"));
		int peso = 0;
		if(peso_m.equals("") || peso_m.equals(null)){
			peso = 0; 
		}else{																			
			peso = (int)rsMovimientoCaja.getDouble("aux_peso");							
			
		}
		
		//Ris.						
		/*String SQL = " INSERT INTO dbo.Int_adt (Control_id, Appemisor, Fecha_hora, Fecha_admision, Message, Hisid, Cedula, Hisid2, Nombre, Fecha_nacimiento, Sexo, Direccion, Ciudad, Telefono, Estado_paciente, Ubicaccion_paciente, Peso, Fecha_lectura, Estado_fila, Error_desc, Usuario_facturador) VALUES ( " 
					 + rsMovimientoCaja.getInt("smn_mov_caja_cabecera_id") + ", 'SIMONE', '" + fechaActual+hora + "', '"+ fecha_admision + "', " 
					 + "'ADT^A08', '" + rsMovimientoCaja.getString("aux_numero_historia") +"', '" + rsMovimientoCaja.getString("aux_codigo") + "', ' ', '" + rsMovimientoCaja.getString("nombre") + "', '" 
					 + fecha_nacimiento + "', '" + rsMovimientoCaja.getString("aux_sexo") + "' , '"+ rsMovimientoCaja.getString("aux_direccion_rf") +"', '', '"+ rsMovimientoCaja.getString("telefono") +"', 'P', ' ', '" + peso + "', ' ', 'N', '', '" +inputParams.getString("usuario") + "'" 
					 + ")";															            		
		System.out.println(SQL);	*/										
		
		//XML InfoLab						
		String nacionalidad = "";
		String documento = rsMovimientoCaja.getString("tdo_codigo"); //tdo_codigo
		String cedula = rsMovimientoCaja.getString("aux_num_doc_oficial"); //aux_num_doc_oficial
		String nombre = rsMovimientoCaja.getString("aux_nombres"); //aux_nombres
		String apellido = rsMovimientoCaja.getString("aux_apellidos"); //aux_apellidos
		String sexo = rsMovimientoCaja.getString("aux_sexo"); 
		String f_nacimiento = String.valueOf(rsMovimientoCaja.getString("aux_fecha_nac2")); //aux_fecha_nac
		
		if(sexo.equals("")|| sexo.equals(null)){
			str = str + "Sexo: Dato Obligatorio vacio por favor verificar"+ " \n";
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
			rc = 1;
		}
		
		if(f_nacimiento.equals("") || f_nacimiento.equals(null)){
			//f_nacimiento = "";
			str = str + "Fecha Nacimiento: Dato Obligatorio vacio por favor verificar"+ " \n";
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
			rc = 1;
		}
		
		String direccion = String.valueOf(rsMovimientoCaja.getString("aux_direccion_rf"));
		if(direccion.equals("") || direccion.equals(null)){
			//direccion = "";
			str = str + "Direccion: Dato Obligatorio vacio por favor verificar"+ " \n";
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
			rc = 1;
		}
		//String direccion = rsMovimientoCaja.getString("aux_direccion_rf"); //aux_direccion_rf
		
		String telefono = String.valueOf(rsMovimientoCaja.getString("telef"));
		if(telefono.equals("") || telefono.equals(null)){
			//telefono = "";
			str = str + "Telefono: Dato Obligatorio vacio por favor verificar"+ " \n";
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
			rc = 1;
		}
		String celular = String.valueOf(rsMovimientoCaja.getString("celular"));
		if(celular.equals("") || celular.equals(null)){
			//celular = "";
			str = str + "Celular: Dato Obligatorio vacio por favor verificar"+ " \n";
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
			rc = 1;
		}
		String email = String.valueOf(rsMovimientoCaja.getString("correo"));
		if(email.equals("") || email.equals(null)){
			//email = "";
			str = str + "Correo: Dato Obligatorio vacio por favor verificar"+ " \n";
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
			rc = 1;
		}						
		
		String aux_numero_historia = String.valueOf(rsMovimientoCaja.getString("aux_numero_historia2")); //aux_numero_historia
		if(aux_numero_historia.equals("") || aux_numero_historia.equals(null)){
			//aux_numero_historia = "";
			str = str + "Numero de Historia: Dato Obligatorio vacio por favor verificar"+ " \n";
			bw.write(str);
			bw.flush();
			bw.newLine();
			getRequest().setAttribute("mensaje", str);
			rc = 1;
		}
		
		String fechaCurrent = new SimpleDateFormat("dd/MM/yyyy").format(new Date());
		hora = new SimpleDateFormat("HH:mm:ss").format(new Date());
		
		String contratante = rsMovimientoCaja.getString("contratante");
		int convenio_id = rsMovimientoCaja.getInt("convenio_id");
		int numero = rsMovimientoCaja.getInt("numero");
		String des_convenio = rsMovimientoCaja.getString("des_convenio");
		String xml_examenes = "";
		String xml_fin = "";
		String xml_inicio ="<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>"+
					       "<infolab xmlns=\"http://www.infolab.com/schema/1.0/interfaz-infolab\">"+
					        "<paciente>"+
					              "<id></id>"+
					              "<nacionalidad>"+nacionalidad+"</nacionalidad>"+
					              "<documento>"+documento+"</documento>"+
					              "<cedula>"+cedula+"</cedula>"+
					              "<nombre>"+nombre+"</nombre>"+
					              "<apellido>"+apellido+"</apellido>"+
					              "<sexo>"+sexo+"</sexo>"+									              
					              "<fecha-nacimiento>"+f_nacimiento+"</fecha-nacimiento>"+
					              "<direccion>"+direccion+"</direccion>"+
					              "<telefono>"+telefono+"</telefono>"+
					              "<celular>"+celular+"</celular>"+	
					              "<email>"+email+"</email>"+
					              "<historial></historial>"+										           									            									            									              									 			  
					        "</paciente>"+
					        "<orden>"+
					              "<historia>"+aux_numero_historia+"</historia>"+
					              "<consulta></consulta>"+
					              "<estado-admision></estado-admision>"+
					              "<fecha>"+fechaCurrent+"</fecha>"+
					              "<hora>"+hora+"</hora>"+
					              "<stat>N</stat>"+
					              "<tipo></tipo>"+
					              "<envpac>S</envpac>"+
					              "<envmed></envmed>"+									              							        									              									             
					              "<medico>"+
					                  	"<id></id>"+
					                  	"<nombre></nombre>"+
					                  	"<apellido></apellido>"+
					                  	"<consultorio></consultorio>"+
					                  	"<telefono></telefono>"+
					                  	"<email></email>"+
					                  	"<id-especialidad></id-especialidad>"+									                    									                  										         									                    
								  "</medico>"+
					              "<convenio>"+									                
					                    "<id-convenio>"+convenio_id+"</id-convenio>"+
					                    "<desc-convenio>"+des_convenio+"</desc-convenio>"+
					                    "<direccion></direccion>"+
					                    "<email></email>"+
					                    "<credito></credito>"+
					                    "<tipodoc>O</tipodoc>"+
					                    "<desrec></desrec>"+
					                    "<porcentaje></porcentaje>"+									                    									                    
					                    "<subconvenio>"+									                      
					                          "<id-subconvenio></id-subconvenio>"+
					                          "<desc-subconvenio></desc-subconvenio>"+									                          									                          									                       
					                    "</subconvenio>"+
					              "</convenio>"+
					              "<id-ubicacion></id-ubicacion>"+
					              "<piso></piso>"+
					              "<habitacion></habitacion>"+
					              "<cama></cama>"+									              									              									            
					        "</orden>"+
					        "<documento>"+					
					            "<tipdoc>O</tipdoc>"+
					            "<numero>"+numero+"</numero>"+
					            "<fecha></fecha>"+
					            "<llave-documento></llave-documento>"+
					            "<monto-documento></monto-documento>"+
					            "<tipo-cargo></tipo-cargo>"+
					            "<porcentaje-cargo></porcentaje-cargo>"+
					            "<monto-cargo></monto-cargo>"+
					            "<responsable></responsable>"+									            									             
					        "</documento>"+
					        "<pago>"+
					        	  "<numero></numero>"+ 
					        	  "<status></status>"+ 
					        	  "<fecha></fecha>"+ 
					        	  "<monto-pago></monto-pago>"+ 									        	  									             
					              "<forma-pago>"+
					              		"<tipo></tipo>"+
					              		"<idbanco></idbanco>"+
					              		"<numero></numero>"+
					              		"<monto></monto>"+
					              "</forma-pago>"+
					        "</pago>"+
					        "<examenes>";									  												
							xml_fin = "</examenes></infolab>";	
							
							
							
		str = str + "Armando información en Ris/InfoLab Detalle "+ " \n";
		int count_exa = 0;
		int count_est = 0;	            																	            								
		
		String sqlCheckDetalle = getSQL(getResource("sql-consultaDetalle.sql"), inputParams);
		
		//crea un recordset con la data obtenida
		Recordset rsMovimientoDetalle = db.get(sqlCheckDetalle);
		
			if(rsMovimientoDetalle.getRecordCount() > 0) {
				hora = new SimpleDateFormat("HHmmss").format(new Date());
				int incr = 1;
				String exa = "03"; //EXAMENES - InfoLab
				String est = "02"; //ESTUDIOS - RIS
				String tipoServicio = "";
				while(rsMovimientoDetalle.next()){
					
					String fecha_det = String.valueOf(rsMovimientoDetalle.getDate("mcd_fecha_registro"));
					fecha_det = fecha_det.replace("-", "");
					
					tipoServicio = rsMovimientoDetalle.getString("tsr_descripcion");
					tipoServicio = tipoServicio.replaceAll(" ", "");
					
					str = str + "ID: "+ rsMovimientoDetalle.getInt("smn_mov_caja_detalle_id") + ", Tipo: " + tipoServicio +"\n";
					
					/*if(tipoServicio.equalsIgnoreCase(est)){
						str = str + "Movimiento a RIS"+ " \n";
						str = str + "Registrando Detalle - RIS"+ " \n";
						
						count_est++;
						
						String prestador = "";																												
						if(rsMovimientoDetalle.getInt("mcd_prestador_servicio")==0){
							prestador = ""; 
						}else{
							prestador = String.valueOf(rsMovimientoDetalle.getInt("mcd_prestador_servicio"));
						}
					
						String SQL2 = " INSERT INTO dbo.Int_orm(Control_id, Appemisor, Fecha_hora, Message, Hisid, Cedula, Codigo_his, Codigo_ris, Cordigo_ord, Fecha_estudio, Estado_paciente, Emision_orden, Medico_referente, Prioridad, Localizacion, Estado_fila, Error_desc, Usuario_facturador) VALUES ( " +
									+ rsMovimientoDetalle.getInt("smn_mov_caja_detalle_id") + ", 'SIMONE', '" +  fechaActual+hora + "', 'ORM^O01', '" + rsMovimientoCaja.getString("aux_numero_historia") +"', '" + rsMovimientoCaja.getString("aux_codigo") + "', '" + rsMovimientoDetalle.getString("svc_codigo") + "', '" + rsMovimientoDetalle.getString("svc_codigo") + "', '" + incr + "', '" + fecha_det + "', 'P', 'NW', '"+ prestador +"', ' ', '', 'N', '', '"   +inputParams.getString("usuario") + "'"    
									+ ")";
						
						System.out.println(SQL2);
	            		stmt2 = con.prepareStatement(SQL2);
	            		stmt2.execute();
	            		incr++;
					}*/
					
					if(tipoServicio.equalsIgnoreCase(exa)){
						str = str + "Movimiento a INFOLAB"+ " \n";
						str = str + "Construyendo Detalle - INFOLAB"+ " \n";
						count_exa++;
						String svc_codigo = rsMovimientoDetalle.getString("svc_codigo");
						String svc_descripcion = rsMovimientoDetalle.getString("svc_descripcion");
						
						xml_examenes = xml_examenes + "<examen>"+								                
				                    "<codigo>"+svc_codigo+"</codigo>"+
				              		"<descripcion>"+svc_descripcion+"</descripcion>"+
				              		"<tipo></tipo>"+
				              		"<costo></costo>"+								                    
				              "</examen>";																																					
						incr++;
					}
					
				}
				
				bw.write(xml_inicio+xml_examenes+xml_fin);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", xml_inicio+xml_examenes+xml_fin);
				str = str + "Registrando en RIS - INFOLAB"+ " \n";
				
				if(count_exa>0){
					//InfoLab
					fecha = fechaActual= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
					String SQL3 = " INSERT INTO dbo.OrdExternas(TipDoc, Numero, Status, Descrip, Estacion, FecRec, FecEnv, Data, idUsuario, Xml, Log) VALUES ( "
							+ "'XML', '" + rsMovimientoCaja.getString("mcc_doc_referencia") + "', 'N', ' ', '', '"+fecha+"', '"+fecha+"', ' ', 1,'"+ xml_inicio+xml_examenes+xml_fin+"', ' '"
							+ ")";
					System.out.println(SQL3);
					bw.write(str);
					bw.flush();
					bw.newLine();
					getRequest().setAttribute("mensaje", SQL3);
					str = str + "Registrando en InfoLab - dbo.OrdExternas"+ " \n";
					stmt_infolab = con_infolab.prepareStatement(SQL3);
					stmt_infolab.execute();
					str = str + "Fin registro en InfoLab - dbo.OrdExternas"+ " \n";
				}
				
				str = str + "Fin registro en RIS - INFOLAB"+ " \n";
			
			}else{
				str = "El Movimiento no tiene Detalle"+ " \n";
				
			}
		
			//con.close();
			con_infolab.close();
			str = str + "Fin proceso"+ " \n";
	
	}
	
}
