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

public class GenerarFacturaAcumulada extends GenericTransaction{
	
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
			file =  "C:/log/log_ProcesarFactAcum"+fechaActual+".txt";
		else
			file = "./log_ProcesarFactAcum"+fechaActual+".txt";
		
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
				Double tasa = inputParams.getDouble("tasa2");
				
				str = "----------"+timestamp+"----------"+tasa;	
				bw.write(str);
				bw.flush();
				bw.newLine();
				bw.newLine(); 
							
				String sqlCheckImp = getSQL(getResource("consultar_cab.sql"), inputParams);
				Recordset consultarCab = db.get(sqlCheckImp);
				
				if(consultarCab.getRecordCount() > 0) {
				
						str = str + ("Registro de Impuesto"+ " \n");
						consultarCab.first();
						String sqlInsertImp = getResource("insert_factura.sql");
						sqlInsertImp = getSQL(sqlInsertImp, consultarCab);
						
						Recordset rsDoc= db.get(sqlInsertImp);
						rsDoc.first();
						inputParams.setValue("smn_factura_cabecera_id", rsDoc.getInt("smn_factura_cabecera_id"));
						inputParams.setValue("smn_documento_id", rsDoc.getInt("smn_documento_id"));
						inputParams.setValue("smn_entidades_rf", rsDoc.getInt("smn_entidades_rf"));
						inputParams.setValue("smn_sucursales_rf", rsDoc.getInt("smn_sucursales_rf"));
						inputParams.setValue("smn_cliente_id", rsDoc.getInt("smn_cliente_id"));
						inputParams.setValue("smn_centro_id", rsDoc.getInt("smn_centro_id"));
						
						String sqlCheckDPS = getSQL(getResource("consultar_det.sql"), inputParams);
						Recordset rsDPrestacion = db.get(sqlCheckDPS);
						if(rsDPrestacion.getRecordCount() > 0) {
							while(rsDPrestacion.next()){
								str  = str + "Creando Detalle"+ " \n";
								String sqlInsertOF2 = getResource("insert_factura_imp_det.sql");
								sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPrestacion);
								db.exec(sqlInsertOF2);
							}
							str = str + "Fin proceso Agregar Detalle PRESTACION"+ " \n";
						}else{
							str = str + "Error getRecordCount del Detalle < 0"+ " \n";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							rc = 1;
						}
						
						//PROCESO PARA INSERTAR EN LA RELACION AGRUPANDO LOS PEDIDO CABECERAS
						String sqlRel = getSQL(getResource("consultar_pedido_id.sql"), inputParams);
						Recordset rsRela = db.get(sqlRel);
						
						if(rsRela.getRecordCount() > 0){
							while(rsRela.next()){
								String sqlInsertRPF = getResource("insert_relacion_pedido_factura.sql");
								sqlInsertRPF = getSQL(sqlInsertRPF, rsRela);
								db.exec(sqlInsertRPF);
							}
							
						}else{
							str = str + "Error getRecordCount de la Relacion < 0"+ " \n";
							bw.write(str);
							bw.flush();
							bw.newLine();
							getRequest().setAttribute("mensaje", str);
							rc = 1;
						}
						
						if(tasa>0){
							//INSERCION EN TABLA FACTURA COMPLEMENTO
							str = str + "Inicio proceso Factura Complemento"+ " \n";
							bw.write(str);
							bw.flush();
							bw.newLine();
							bw.newLine();
							String sqlFactComp = getSQL(getResource("consultar_datos_factura_complemento.sql"), inputParams);
							Recordset rsFactComp = db.get(sqlFactComp);
							
							if(rsFactComp.getRecordCount() > 0) {
								while(rsFactComp.next()){
									str  = str + "Creando Factura Complemento"+ " \n";
									String sqlFactCompl= getResource("insert_factura_complemento.sql");
									sqlFactCompl = getSQL(sqlFactCompl, rsFactComp);
									db.exec(sqlFactCompl);
								}	
								str = str + "Fin proceso Factura Complemento"+ " \n";
								bw.write(str);
								bw.flush();
								bw.newLine();
								bw.newLine();
							}else{
								str = str + "Error getRecordCount Factura Complemento < 0"+ " \n";
								bw.write(str);
								bw.flush();
								bw.newLine();
								getRequest().setAttribute("mensaje", str);
								rc = 1;
							}
						}
						
						//**ACTUALIZA LOS ESTATUS DEL PEDIDO Y NUMERO DE CONTROL FISCAL 
						String sqlUpdCabecera = getSQL(getResource("updatePedido.sql"), inputParams);
						db.exec(sqlUpdCabecera);	
						
						//**ACTUALIZA LOS MONTOS DE LA FACTURA 
						String sqlUpdFactCabecera = getSQL(getResource("updateFacturaCabecera.sql"), inputParams);
						db.exec(sqlUpdFactCabecera);
						
						
				}else{
					str = "Error entro getRecordCound 1 ";	
					bw.write(str);
					bw.flush();
					bw.newLine();
					rc = 1;
				}
				
			
					
		}catch (Throwable e){
			conn.rollback();
			throw e;
		}
		finally
		{
			if(rc == 0){
				conn.commit();
				str = "Cambios en la base de datos guardados correctamente";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				getRequest().setAttribute("mensaje", "Se genero correctamente");
			}
			else{
				conn.rollback();
				str = "Los cambios en la base de datos no se guardaron";	
				bw.write(str);
				bw.flush();
				bw.newLine();
				rc = 1;
			}
			
			str = "Fin del Proceso Factura Acumulada";	
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
