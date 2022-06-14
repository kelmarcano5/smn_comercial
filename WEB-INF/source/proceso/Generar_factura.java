package proceso;

import dinamica.*;
import java.sql.*;
import javax.sql.DataSource;

public class Generar_factura extends GenericTransaction
{
	public int service(Recordset inputParams) throws Throwable
	{
		int rc = 0;	//variable a retornar.
		//String mensaje = ""; //mensaje a retornar
		
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		//establecer la conexion con la base de datos.
		
			DataSource ds = Jndi.getDataSource(jndiName); 
			Connection conn = ds.getConnection();
			this.setConnection(conn);
		
		//**
	
		try
		{
			Db db = getDb(); //objeto de conexion.
			
			String sql = getSQL(getResource("select-smn_factura_cabecera.sql"),inputParams);
			Recordset rsFactura = db.get(sql); //consulta la factura.
			
			if(rsFactura.getRecordCount() > 0)
			{
				rsFactura.first();

				double monto_factura_ml = 0;
				double monto_factura_ma = 0;
				
				// INYECCION DE VALORES AL VALIDATOR.
				
				sql = getSQL(getResource("select-modulo.sql"),inputParams);
				Recordset rsModulo = db.get(sql); //consulta el smn_modulo_rf.
				
				if(rsModulo.getRecordCount() > 0)
				{
					rsModulo.first();
					inputParams.setValue("smn_modulo_rf", rsModulo.getInt("smn_modulos_id"));
				}
				else
				{
					inputParams.setValue("mensaje","**error**, no se encontro el campo smn_modulo_rf");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				if(rsFactura.getString("smn_entidad_rf") != null)
				{
					inputParams.setValue("smn_entidad_rf", rsFactura.getInt("smn_entidad_rf"));
				}
				else
				{
					inputParams.setValue("mensaje","**error**, El campo smn_entidad_rf de la factura esta vacio");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				if(rsFactura.getString("smn_sucursal_rf") != null)
					inputParams.setValue("smn_sucursal_rf", rsFactura.getInt("smn_sucursal_rf"));
				else
					inputParams.setValue("smn_sucursal_rf", 0);
				
				if(rsFactura.getString("smn_documento_id") != null)
				{
					inputParams.setValue("smn_documento_id", rsFactura.getInt("smn_documento_id"));
				}
				else
				{
					inputParams.setValue("mensaje","**error**, El campo smn_documento_id de la factura esta vacio");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				sql = getSQL(getResource("select-documento_general.sql"),inputParams);
				Recordset rsDocumento_general = db.get(sql); //consulta el documento_general.
				
				if(rsDocumento_general.getRecordCount() > 0)
				{
					rsDocumento_general.first();
					inputParams.setValue("smn_documentos_generales_rf", rsDocumento_general.getInt("smn_documentos_generales_rf"));
				}
				else
				{
					inputParams.setValue("mensaje","**error**, no se encontro el campo smn_documentos_generales_rf");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				sql = getSQL(getResource("select-tipo_documento.sql"),inputParams);
				Recordset rsTipo_documento = db.get(sql); //consulta el tipo_documento.
				
				if(rsTipo_documento.getRecordCount() > 0)
				{
					rsTipo_documento.first();
					inputParams.setValue("smn_tipo_documento_id", rsTipo_documento.getInt("smn_tipo_documento_id"));
				}
				else
				{
					inputParams.setValue("mensaje","**error**, no se encontro el campo smn_tipo_documento_id");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				if(rsFactura.getString("fca_numero_documento_id") != null)
				{
					inputParams.setValue("doc_numero_documento", rsFactura.getInt("fca_numero_documento_id"));
				}
				else
				{
					inputParams.setValue("mensaje","**error**, El campo fca_numero_documento_id de la factura esta vacio");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				sql = getSQL(getResource("select-auxiliar.sql"),inputParams);
				Recordset rsAuxiliar = db.get(sql); //consulta el auxiliar.
				
				if(rsAuxiliar.getRecordCount() > 0)
				{
					rsAuxiliar.first();
					inputParams.setValue("smn_auxiliar_rf", rsAuxiliar.getInt("smn_auxiliar_rf"));
				}
				else
				{
					inputParams.setValue("mensaje","**error**, no se encontro el auxiliar");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				sql = getSQL(getResource("select-clase_auxiliar.sql"),inputParams);
				Recordset rsClase_auxiliar = db.get(sql); //consulta la clase auxiliar.
				
				if(rsClase_auxiliar.getRecordCount() > 0)
				{
					rsClase_auxiliar.first();
					inputParams.setValue("smn_clase_auxiliar_rf", rsClase_auxiliar.getInt("smn_clase_auxiliar_rf"));
				}
				else
				{
					inputParams.setValue("mensaje","**error**, no se encontro la clase auxiliar");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				sql = getSQL(getResource("select-centro_costo.sql"),inputParams);
				Recordset rsCentro_costo = db.get(sql); //consulta el centro de costo.
				
				if(rsCentro_costo.getRecordCount() > 0)
				{
					rsCentro_costo.first();
					inputParams.setValue("smn_centro_costo_rf", rsCentro_costo.getInt("smn_centro_costo_rf"));
				}
				else
				{
					inputParams.setValue("mensaje","**error**, no se encontro el centro de costo");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				if(rsFactura.getString("fca_fecha_registro") != null)
				{
					inputParams.setValue("fca_fecha_registro", rsFactura.getDate("fca_fecha_registro"));
				}
				else
				{
					inputParams.setValue("mensaje","**error**, El campo fca_fecha_registro de la factura esta vacio");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				if(rsFactura.getString("fca_monto_factura_ml") != null)
				{
					monto_factura_ml = rsFactura.getDouble("fca_monto_factura_ml");
					inputParams.setValue("fca_monto_factura_ml", monto_factura_ml);
				}
				else
				{
					inputParams.setValue("mensaje","**error**, El campo fca_monto_factura_ml de la factura esta vacio");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				if(rsFactura.getString("fca_monto_factura_ma") != null)
				{
					monto_factura_ma = rsFactura.getDouble("fca_monto_factura_ma");
					inputParams.setValue("fca_monto_factura_ma", monto_factura_ma);
				}
				else
					inputParams.setValue("fca_monto_factura_ma", 0.0);
				
				if(rsFactura.getString("smn_moneda_rf") != null)
					inputParams.setValue("smn_moneda_rf", rsFactura.getInt("smn_moneda_rf"));
				else
					inputParams.setValue("smn_moneda_rf", 0);
				
				if(rsFactura.getString("smn_tasa_rf") != null)
					inputParams.setValue("smn_tasa_rf", rsFactura.getInt("smn_tasa_rf"));
				else
					inputParams.setValue("smn_tasa_rf", 0);
				
				if(rsFactura.getString("fca_numero_control_fiscal") != null)
					inputParams.setValue("fca_numero_control_fiscal", rsFactura.getInt("fca_numero_control_fiscal"));
				else
					inputParams.setValue("fca_numero_control_fiscal", 0);
				
				sql = getSQL(getResource("select-tipo_comprobante.sql"),inputParams);
				Recordset rsTipo_comprobante = db.get(sql); //consulta el tipo de comprobante.
				
				if(rsTipo_comprobante.getRecordCount() > 0)
				{
					rsTipo_comprobante.first();
					inputParams.setValue("mcc_tipo_comp", rsTipo_comprobante.getInt("mcc_tipo_comp"));
				}
				else
				{
					inputParams.setValue("mensaje","**error**, no se encontro el tipo de comprobante");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				if(monto_factura_ma>0)
					inputParams.setValue("smn_tasa", monto_factura_ml/monto_factura_ma);
				else
					inputParams.setValue("smn_tasa", 0.0);
				
				//**********************************
				
				sql = getSQL(getResource("insert-control_cierre_contable.sql"),inputParams);
				db.get(sql); //REGISTRA CONTROL DE CIERRE CONTABLE.
				
				sql = getSQL(getResource("insert-smn_documento.sql"),inputParams);
				Recordset rsDocumento = db.get(sql); //registra el documento contable.
				
				rsDocumento.first();
				
				inputParams.setValue("smn_documento_id", rsDocumento.getInt("smn_documento_id"));
				
				sql = getSQL(getResource("select-smn_factura_detalle.sql"),inputParams);
				Recordset rsFactura_detalle = db.get(sql); //busca los detalles de la factura.
				
				if(rsFactura_detalle.getRecordCount() > 0)
				{
					while(rsFactura_detalle.next())
					{
						inputParams.setValue("smn_factura_detalle_id", rsFactura_detalle.getInt("smn_factura_detalle_id"));
						
						sql = getSQL(getResource("select-smn_factura_componentes.sql"),inputParams);
						Recordset rsFactura_componente = db.get(sql); //busca los componentes de la factura.
						
						if(rsFactura_componente.getRecordCount() > 0)
						{
							while(rsFactura_componente.next())
							{
								inputParams.setValue("smn_componente_rf", rsFactura_componente.getInt("smn_componente_rf"));
								
								sql = getSQL(getResource("select-smn_componentes.sql"),inputParams);
								Recordset rsComponente = db.get(sql); //busca el componente del modulo base.
								
								if(rsComponente.getRecordCount()>0)
								{
									rsComponente.first();
									
									String tipo_componente = rsComponente.getString("cmp_tipo_componente");
									
									if(tipo_componente.equals("IT"))
										inputParams.setValue("campo", "smn_item_rf");
									else
									if(tipo_componente.equals("SE") || tipo_componente.equals("HO"))
										inputParams.setValue("campo", "smn_servicio_rf");
									
									sql = getSQL(getResource("select-smn_diccionario.sql"),inputParams);
									Recordset rsDiccionario = db.get(sql); //busca el campo en el diccionario.
									
									if(rsDiccionario.getRecordCount()>0)
									{
										rsDiccionario.first();
										inputParams.setValue("smn_diccionario_id", rsDiccionario.getInt("smn_diccionario_id"));
									}
									else
									{
										inputParams.setValue("mensaje","**error**, no se encontro el campo"+inputParams.getValue("campo")+"en el diccionario de datos");
										System.out.println(inputParams.getValue("mensaje"));
										return 1; //valor null.
									}
									
									sql = getSQL(getResource("select-smn_tipo_elemento.sql"),inputParams);
									Recordset rsTipo_elemento = db.get(sql); //busca el tipo_elemento.
									
									if(rsTipo_elemento.getRecordCount()>0)
									{
										rsTipo_elemento.first();
										inputParams.setValue("smn_tipo_elemento_id", rsTipo_elemento.getInt("smn_tipo_elemento_id"));
									}
									else
									{
										inputParams.setValue("mensaje","**error**, no se encontro el tipo de elemento");
										System.out.println(inputParams.getValue("mensaje"));
										return 1; //valor null.
									}
									
									sql = getSQL(getResource("select-elemento.sql"),inputParams);
									Recordset rsElemento = db.get(sql); //busca el elemento.
									
									if(rsElemento.getRecordCount()>0)
									{
										rsElemento.first();
										inputParams.setValue("smn_elemento_id", rsElemento.getInt("elemento"));
									}
									else
									{
										inputParams.setValue("mensaje","**error**, no se encontro el elemento");
										System.out.println(inputParams.getValue("mensaje"));
										return 1; //valor null.
									}
									
									if(rsFactura_componente.getString("smn_clase_auxiliar_rf") != null)
										inputParams.setValue("smn_clase_auxiliar_rf", rsFactura_componente.getInt("smn_clase_auxiliar_rf"));
									else
										inputParams.setValue("smn_clase_auxiliar_rf", 0);
									
									if(rsFactura_componente.getString("smn_auxiliar_rf") != null)
										inputParams.setValue("smn_auxiliar_rf", rsFactura_componente.getInt("smn_auxiliar_rf"));
									else
										inputParams.setValue("smn_auxiliar_rf", 0);
									
									Recordset rsCentroCosto;
									
									if(inputParams.getValue("campo").equals("smn_item_rf"))
									{
										sql = getSQL(getResource("select-centro_costo_item.sql"),inputParams);
										rsCentroCosto = db.get(sql); //busca el centro de costo del item.
										
										if(rsCentroCosto.getRecordCount()>0)
										{
											rsCentroCosto.first();
											inputParams.setValue("smn_centro_costo_rf", rsCentroCosto.getInt("smn_centro_costo_rf"));
										}
										else
										{
											inputParams.setValue("mensaje","**error**, no se encontro el centro de costo del elemento (item) con el ID = "+inputParams.getValue("smn_elemento_id"));
											System.out.println(inputParams.getValue("mensaje"));
											return 1; //valor null.
										}
									}
									else
									if(inputParams.getValue("campo").equals("smn_servicio_rf"))
									{
										sql = getSQL(getResource("select-centro_facturacion.sql"),inputParams);
										Recordset rsCentroFacturacion = db.get(sql); //busca el area y la unidad de servicio.
										
										if(rsCentroFacturacion.getRecordCount()>0)
										{
											rsCentroFacturacion.first();
											
											if(rsCentroFacturacion.getString("smn_areas_servicios_rf") != null)
												inputParams.setValue("smn_areas_servicios_rf", rsCentroFacturacion.getInt("smn_areas_servicios_rf"));
											else
											{
												inputParams.setValue("mensaje","**error**, no se encontro el area de servicio asociado al centro de facturacion");
												System.out.println(inputParams.getValue("mensaje"));
												return 1; //valor null.
											}
											
											if(rsCentroFacturacion.getString("smn_unidades_servicios_rf") != null)
												inputParams.setValue("smn_unidades_servicios_rf", rsCentroFacturacion.getInt("smn_unidades_servicios_rf"));
											else
											{
												inputParams.setValue("mensaje","**error**, no se encontro la unidad de servicio asociado al centro de facturacion");
												System.out.println(inputParams.getValue("mensaje"));
												return 1; //valor null.
											}
										}
										else
										{
											inputParams.setValue("mensaje","**error**, no se encontro el centro de facturacion asociado a la entidad y la sucusal");
											System.out.println(inputParams.getValue("mensaje"));
											return 1; //valor null.
										}
										
										sql = getSQL(getResource("select-centro_costo_servicio.sql"),inputParams);
										rsCentroCosto = db.get(sql); //busca el centro de costo del servicio.
										
										if(rsCentroCosto.getRecordCount()>0)
										{
											rsCentroCosto.first();
											inputParams.setValue("smn_centro_costo_rf", rsCentroCosto.getInt("smn_centro_costo_rf"));
										}
										else
										{
											inputParams.setValue("mensaje","**error**, no se encontro el centro de costo del elemento (servicio) con el ID = "+inputParams.getValue("smn_elemento_id"));
											System.out.println(inputParams.getValue("mensaje"));
											return 1; //valor null.
										}
									}	
									
									if(rsFactura_componente.getString("fco_monto_ml") != null)
										inputParams.setValue("factura_monto_ml", rsFactura_componente.getDouble("fco_monto_ml"));
									else
										inputParams.setValue("factura_monto_ml", 0.0);
									
									if(rsFactura_componente.getString("smn_moneda_rf") != null)
										inputParams.setValue("smn_moneda_rf", rsFactura_componente.getInt("smn_moneda_rf"));
									else
										inputParams.setValue("smn_moneda_rf", 0);
									
									/*if(rsFactura_componente.getString("cant_moneda") != null)
										inputParams.setValue("cant_moneda", rsFactura_componente.getInt("cant_moneda"));
									else
										inputParams.setValue("cant_moneda", 0);*/
									
									sql = getSQL(getResource("select-tasa_cambio.sql"),inputParams);
									Recordset rsTasa_cambio = db.get(sql); //busca la tasa de cambio asociado con la moneda.
									
									if(rsTasa_cambio.getRecordCount()>0)
									{
										rsTasa_cambio.first();
										
										if(rsTasa_cambio.getString("tasa_cambio") != null)
											inputParams.setValue("tasa_cambio", rsTasa_cambio.getDouble("tasa_cambio"));
											//inputParams.setValue("tasa_cambio", rsTasa_cambio.getDouble("tasa_cambio")*inputParams.getInt("cant_moneda"));
										else
											inputParams.setValue("tasa_cambio", 0.0);
									}
									else
									{
										inputParams.setValue("tasa_cambio", 0.0);
									}
									
									if(rsFactura_componente.getString("smn_monto_ma") != null)
										inputParams.setValue("factura_monto_ma", rsFactura_componente.getDouble("smn_monto_ma"));
									else
										inputParams.setValue("factura_monto_ma", 0.0);
									
									sql = getSQL(getResource("insert-smn_documento_detalle.sql"),inputParams);
									db.get(sql); //registra el documento detalle.
								}
								else
								{
									inputParams.setValue("mensaje","**error**, no se encontro el componente id = "+inputParams.getValue("smn_componente_rf")+" en el modulo base");
									System.out.println(inputParams.getValue("mensaje"));
									return 1; //valor null.
								}
							}//end while
						}
						else
						{
							sql = getSQL(getResource("select-smn_documento_detalle.sql"),inputParams);
							Recordset rsDoc_detalle = db.get(sql); //busca el documento_detalle.
							
							if(rsDoc_detalle.getRecordCount()>0)
							{
								String naturaleza = "";
								double monto_ml;
								double monto_ma;
								double total_monto_ml = 0;
								double total_monto_ma = 0;
								int interruptor = 0;
								
								while(rsDoc_detalle.next())
								{
									if(rsDoc_detalle.getString("dic_campo").equals("smn_item_rf"))
										naturaleza = "IT";
									else
									if(rsDoc_detalle.getString("dic_campo").equals("smn_servicio_rf"))	
										naturaleza = "SE";
									
									if(naturaleza.equals(rsFactura_detalle.getString("fde_naturaleza")))
									{
										if(rsDoc_detalle.getInt("smn_elemento_id") == rsFactura_detalle.getInt("smn_item_rf") || rsDoc_detalle.getInt("smn_elemento_id") == rsFactura_detalle.getInt("smn_servicios_rf"))
										{
											if(rsDoc_detalle.getString("smn_documento_detalle_id") != null)
												inputParams.setValue("smn_documento_detalle_id", rsDoc_detalle.getInt("smn_documento_detalle_id"));
											else
												inputParams.setValue("smn_documento_detalle_id", 0);
											
											if(rsDoc_detalle.getString("dod_monto_ml") != null)
												monto_ml = rsDoc_detalle.getInt("dod_monto_ml");
											else
												monto_ml = 0.0;
											
											if(rsDoc_detalle.getString("dod_monto_ma") != null)
												monto_ma = rsDoc_detalle.getInt("dod_monto_ma");
											else
												monto_ma = 0.0;
											
											total_monto_ml = monto_ml + rsFactura_detalle.getDouble("fde_monto_ml");
											total_monto_ma = monto_ma + rsFactura_detalle.getDouble("fde_monto_ma");
											
											inputParams.setValue("total_monto_ml", total_monto_ml);
											inputParams.setValue("total_monto_ma", total_monto_ma);
											
											sql = getSQL(getResource("update-smn_documento_detalle.sql"),inputParams);
											db.get(sql); //actualiza los campos monto_ml y monto_ma del documento_detalle.
											interruptor = 1; //encontro un registro y lo acumulo
											break;
										}
									}
								}//end while
								
								if(interruptor == 0)
								{
									if(rsFactura_detalle.getString("fde_naturaleza").equals("IT"))
										inputParams.setValue("campo", "smn_item_rf");
									else
										inputParams.setValue("campo", "smn_servicios_rf");
									
									sql = getSQL(getResource("select-smn_diccionario.sql"),inputParams);
									Recordset rsDiccionario = db.get(sql); //busca el campo en el diccionario.
									
									if(rsDiccionario.getRecordCount()>0)
									{
										rsDiccionario.first();
										inputParams.setValue("smn_diccionario_id", rsDiccionario.getInt("smn_diccionario_id"));
									}
									else
									{
										inputParams.setValue("mensaje","**error**, no se encontro el campo"+inputParams.getValue("campo")+"en el diccionario de datos");
										System.out.println(inputParams.getValue("mensaje"));
										return 1; //valor null.
									}
									
									sql = getSQL(getResource("select-smn_tipo_elemento.sql"),inputParams);
									Recordset rsTipo_elemento = db.get(sql); //busca el tipo_elemento.
									
									if(rsTipo_elemento.getRecordCount()>0)
									{
										rsTipo_elemento.first();
										inputParams.setValue("smn_tipo_elemento_id", rsTipo_elemento.getInt("smn_tipo_elemento_id"));
									}
									else
									{
										inputParams.setValue("mensaje","**error**, no se encontro el tipo de elemento");
										System.out.println(inputParams.getValue("mensaje"));
										return 1; //valor null.
									}
									
									sql = getSQL(getResource("select-elemento_factura.sql"),inputParams);
									Recordset rsElemento = db.get(sql); //busca el elemento.
									
									if(rsElemento.getRecordCount()>0)
									{
										rsElemento.first();
										inputParams.setValue("smn_elemento_id", rsElemento.getInt("elemento"));
									}
									else
									{
										inputParams.setValue("mensaje","**error**, no se encontro el elemento");
										System.out.println(inputParams.getValue("mensaje"));
										return 1; //valor null.
									}
									
									inputParams.setValue("smn_clase_auxiliar_rf", 0);
									inputParams.setValue("smn_auxiliar_rf", 0);
									
									Recordset rsCentroCosto;
									
									if(inputParams.getValue("campo").equals("smn_item_rf"))
									{
										sql = getSQL(getResource("select-centro_costo_item.sql"),inputParams);
										rsCentroCosto = db.get(sql); //busca el centro de costo del item.
										
										if(rsCentroCosto.getRecordCount()>0)
										{
											rsCentroCosto.first();
											inputParams.setValue("smn_centro_costo_rf", rsCentroCosto.getInt("smn_centro_costo_rf"));
										}
										else
										{
											inputParams.setValue("mensaje","**error**, no se encontro el centro de costo del elemento (item) con el ID = "+inputParams.getValue("smn_elemento_id"));
											System.out.println(inputParams.getValue("mensaje"));
											return 1; //valor null.
										}
									}
									else
									if(inputParams.getValue("campo").equals("smn_servicio_rf"))
									{
										sql = getSQL(getResource("select-centro_facturacion.sql"),inputParams);
										Recordset rsCentroFacturacion = db.get(sql); //busca el area y la unidad de servicio.
										
										if(rsCentroFacturacion.getRecordCount()>0)
										{
											rsCentroFacturacion.first();
											
											if(rsCentroFacturacion.getString("smn_areas_servicios_rf") != null)
												inputParams.setValue("smn_areas_servicios_rf", rsCentroFacturacion.getInt("smn_areas_servicios_rf"));
											else
											{
												inputParams.setValue("mensaje","**error**, no se encontro el area de servicio asociado al centro de facturacion");
												System.out.println(inputParams.getValue("mensaje"));
												return 1; //valor null.
											}
											
											if(rsCentroFacturacion.getString("smn_unidades_servicios_rf") != null)
												inputParams.setValue("smn_unidades_servicios_rf", rsCentroFacturacion.getInt("smn_unidades_servicios_rf"));
											else
											{
												inputParams.setValue("mensaje","**error**, no se encontro la unidad de servicio asociado al centro de facturacion");
												System.out.println(inputParams.getValue("mensaje"));
												return 1; //valor null.
											}
										}
										else
										{
											inputParams.setValue("mensaje","**error**, no se encontro el centro de facturacion asociado a la entidad y la sucusal");
											System.out.println(inputParams.getValue("mensaje"));
											return 1; //valor null.
										}
										
										sql = getSQL(getResource("select-centro_costo_servicio.sql"),inputParams);
										rsCentroCosto = db.get(sql); //busca el centro de costo del servicio.
										
										if(rsCentroCosto.getRecordCount()>0)
										{
											rsCentroCosto.first();
											inputParams.setValue("smn_centro_costo_rf", rsCentroCosto.getInt("smn_centro_costo_rf"));
										}
										else
										{
											inputParams.setValue("mensaje","**error**, no se encontro el centro de costo del elemento (servicio) con el ID = "+inputParams.getValue("smn_elemento_id"));
											System.out.println(inputParams.getValue("mensaje"));
											return 1; //valor null.
										}
									}
									
									if(rsFactura_detalle.getString("fde_monto_ml") != null)
										inputParams.setValue("factura_monto_ml", rsFactura_detalle.getDouble("fde_monto_ml"));
									else
										inputParams.setValue("factura_monto_ml", 0.0);
									
									if(rsFactura_detalle.getString("smn_moneda_rf") != null)
										inputParams.setValue("smn_moneda_rf", rsFactura_detalle.getInt("smn_moneda_rf"));
									else
										inputParams.setValue("smn_moneda_rf", 0);
									
									sql = getSQL(getResource("select-tasa_cambio.sql"),inputParams);
									Recordset rsTasa_cambio = db.get(sql); //busca la tasa de cambio asociado con la moneda.
									
									if(rsTasa_cambio.getRecordCount()>0)
									{
										rsTasa_cambio.first();
										
										if(rsTasa_cambio.getString("tasa_cambio") != null)
											inputParams.setValue("tasa_cambio", rsTasa_cambio.getDouble("tasa_cambio"));
											//inputParams.setValue("tasa_cambio", rsTasa_cambio.getDouble("tasa_cambio")*inputParams.getInt("cant_moneda"));
										else
											inputParams.setValue("tasa_cambio", 0.0);
									}
									else
									{
										/*inputParams.setValue("mensaje","**error**, no se encontro la tasa de cambio relacionada a la moneda con el ID = "+inputParams.getValue("smn_moneda_rf"));
										System.out.println(inputParams.getValue("mensaje"));
										return 1; //valor null.*/
										inputParams.setValue("tasa_cambio", 0.0);
									}
									
									if(rsFactura_detalle.getString("fde_monto_ma") != null)
										inputParams.setValue("factura_monto_ma", rsFactura_detalle.getDouble("fde_monto_ma"));
									else
										inputParams.setValue("factura_monto_ma", 0.0);
									
									sql = getSQL(getResource("insert-smn_documento_detalle.sql"),inputParams);
									db.get(sql); //registra el documento detalle.
								}
							}
							else
							{
								if(rsFactura_detalle.getString("fde_naturaleza").equals("IT"))
									inputParams.setValue("campo", "smn_item_rf");
								else
									inputParams.setValue("campo", "smn_servicios_rf");
								
								sql = getSQL(getResource("select-smn_diccionario.sql"),inputParams);
								Recordset rsDiccionario = db.get(sql); //busca el campo en el diccionario.
								
								if(rsDiccionario.getRecordCount()>0)
								{
									rsDiccionario.first();
									inputParams.setValue("smn_diccionario_id", rsDiccionario.getInt("smn_diccionario_id"));
								}
								else
								{
									inputParams.setValue("mensaje","**error**, no se encontro el campo "+inputParams.getValue("campo")+" en el diccionario de datos");
									System.out.println(inputParams.getValue("mensaje"));
									return 1; //valor null.
								}
								
								sql = getSQL(getResource("select-smn_tipo_elemento.sql"),inputParams);
								Recordset rsTipo_elemento = db.get(sql); //busca el tipo_elemento.
								
								if(rsTipo_elemento.getRecordCount()>0)
								{
									rsTipo_elemento.first();
									inputParams.setValue("smn_tipo_elemento_id", rsTipo_elemento.getInt("smn_tipo_elemento_id"));
								}
								else
								{
									inputParams.setValue("mensaje","**error**, no se encontro el tipo de elemento");
									System.out.println(inputParams.getValue("mensaje"));
									return 1; //valor null.
								}
								
								sql = getSQL(getResource("select-elemento_factura.sql"),inputParams);
								Recordset rsElemento = db.get(sql); //busca el elemento.
								
								if(rsElemento.getRecordCount()>0)
								{
									rsElemento.first();
									inputParams.setValue("smn_elemento_id", rsElemento.getInt("elemento"));
								}
								else
								{
									inputParams.setValue("mensaje","**error**, no se encontro el elemento");
									System.out.println(inputParams.getValue("mensaje"));
									return 1; //valor null.
								}
								
								inputParams.setValue("smn_clase_auxiliar_rf", 0);
								inputParams.setValue("smn_auxiliar_rf", 0);
								
								Recordset rsCentroCosto;
								
								if(inputParams.getValue("campo").equals("smn_item_rf"))
								{
									sql = getSQL(getResource("select-centro_costo_item.sql"),inputParams);
									rsCentroCosto = db.get(sql); //busca el centro de costo del item.
									
									if(rsCentroCosto.getRecordCount()>0)
									{
										rsCentroCosto.first();
										inputParams.setValue("smn_centro_costo_rf", rsCentroCosto.getInt("smn_centro_costo_rf"));
									}
									else
									{
										inputParams.setValue("mensaje","**error**, no se encontro el centro de costo del elemento (item) con el ID = "+inputParams.getValue("smn_elemento_id"));
										System.out.println(inputParams.getValue("mensaje"));
										return 1; //valor null.
									}
								}
								else
								if(inputParams.getValue("campo").equals("smn_servicio_rf"))
								{
									sql = getSQL(getResource("select-centro_facturacion.sql"),inputParams);
									Recordset rsCentroFacturacion = db.get(sql); //busca el area y la unidad de servicio.
									
									if(rsCentroFacturacion.getRecordCount()>0)
									{
										rsCentroFacturacion.first();
										
										if(rsCentroFacturacion.getString("smn_areas_servicios_rf") != null)
											inputParams.setValue("smn_areas_servicios_rf", rsCentroFacturacion.getInt("smn_areas_servicios_rf"));
										else
										{
											inputParams.setValue("mensaje","**error**, no se encontro el area de servicio asociado al centro de facturacion");
											System.out.println(inputParams.getValue("mensaje"));
											return 1; //valor null.
										}
										
										if(rsCentroFacturacion.getString("smn_unidades_servicios_rf") != null)
											inputParams.setValue("smn_unidades_servicios_rf", rsCentroFacturacion.getInt("smn_unidades_servicios_rf"));
										else
										{
											inputParams.setValue("mensaje","**error**, no se encontro la unidad de servicio asociado al centro de facturacion");
											System.out.println(inputParams.getValue("mensaje"));
											return 1; //valor null.
										}
									}
									else
									{
										inputParams.setValue("mensaje","**error**, no se encontro el centro de facturacion asociado a la entidad y la sucusal");
										System.out.println(inputParams.getValue("mensaje"));
										return 1; //valor null.
									}
									
									sql = getSQL(getResource("select-centro_costo_servicio.sql"),inputParams);
									rsCentroCosto = db.get(sql); //busca el centro de costo del servicio.
									
									if(rsCentroCosto.getRecordCount()>0)
									{
										rsCentroCosto.first();
										inputParams.setValue("smn_centro_costo_rf", rsCentroCosto.getInt("smn_centro_costo_rf"));
									}
									else
									{
										inputParams.setValue("mensaje","**error**, no se encontro el centro de costo del elemento (servicio) con el ID = "+inputParams.getValue("smn_elemento_id"));
										System.out.println(inputParams.getValue("mensaje"));
										return 1; //valor null.
									}
								}
								
								if(rsFactura_detalle.getString("fde_monto_ml") != null)
									inputParams.setValue("factura_monto_ml", rsFactura_detalle.getDouble("fde_monto_ml"));
								else
									inputParams.setValue("factura_monto_ml", 0.0);
								
								if(rsFactura_detalle.getString("smn_moneda_rf") != null)
									inputParams.setValue("smn_moneda_rf", rsFactura_detalle.getInt("smn_moneda_rf"));
								else
									inputParams.setValue("smn_moneda_rf", 0);
								
								sql = getSQL(getResource("select-tasa_cambio.sql"),inputParams);
								Recordset rsTasa_cambio = db.get(sql); //busca la tasa de cambio asociado con la moneda.
								
								if(rsTasa_cambio.getRecordCount()>0)
								{
									rsTasa_cambio.first();
									
									if(rsTasa_cambio.getString("tasa_cambio") != null)
										inputParams.setValue("tasa_cambio", rsTasa_cambio.getDouble("tasa_cambio"));
										//inputParams.setValue("tasa_cambio", rsTasa_cambio.getDouble("tasa_cambio")*inputParams.getInt("cant_moneda"));
									else
										inputParams.setValue("tasa_cambio", 0.0);
								}
								else
								{
									inputParams.setValue("tasa_cambio", 0.0);
								}
								
								if(rsFactura_detalle.getString("fde_monto_ma") != null)
									inputParams.setValue("factura_monto_ma", rsFactura_detalle.getDouble("fde_monto_ma"));
								else
									inputParams.setValue("factura_monto_ma", 0.0);
								
								sql = getSQL(getResource("insert-smn_documento_detalle.sql"),inputParams);
								db.get(sql); //registra el documento detalle.
							}
						}
						
						registrarImpuesto(inputParams,conn); //registra los impuestos de esa smn_factura_detalle
					} //END WHILE
				}
				else
				{
					inputParams.setValue("mensaje","**error**, La factura no tiene detalle");
					rc = 1;
				}
				
				sql = getSQL(getResource("update-smn_factura_cabecera.sql"),inputParams);
				db.exec(sql); //actualiza el estatus de la factura.
					
				inputParams.setValue("mensaje","*Factura contabilizada exitosamente*");
				rc = 0;	
			}
			else
			{
				inputParams.setValue("mensaje","**error**, La factura ya esta contabilizada");
				rc = 1;
			}
		}
		catch(Throwable e)
		{
			throw e;
		}
		
		finally
		{		
			if(conn!=null)
				conn.close();
		}
		
		if(rc>0)
			System.out.print("** ERROR **: " + inputParams.getValue("mensaje"));
		
		return rc;
	}
	
	public int registrarImpuesto(Recordset inputParams, Connection conn) throws Throwable 
	{
		int rc = 0;	//variable a retornar.
		
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");
		
		//establecer la conexion con la base de datos.
		
			/*DataSource ds = Jndi.getDataSource(jndiName); 
			Connection conn = ds.getConnection();*/
			this.setConnection(conn);
		
		//**
			//conn.setAutoCommit(false);
		try
		{
			Db db = getDb(); //objeto de conexion.
			String sql;
			
			sql = getSQL(getResource("select-smn_factura_impuesto.sql"),inputParams);
			Recordset rsFactura_impuesto = db.get(sql); //consulta la factura impuesto.
			
			if(rsFactura_impuesto.getRecordCount() > 0)
			{
				rsFactura_impuesto.first();
				
				if(rsFactura_impuesto.getString("fid_monto_base_ml") != null)
					inputParams.setValue("fid_monto_base_ml", rsFactura_impuesto.getDouble("fid_monto_base_ml"));
				else
				{
					inputParams.setValue("mensaje","**error**, el monto base ml esta vacio");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				inputParams.setValue("imp_base_excenta", inputParams.getDouble("factura_monto_ml")-inputParams.getDouble("fid_monto_base_ml"));
				
				if(rsFactura_impuesto.getString("smn_codigos_impuestos_rf") != null)
					inputParams.setValue("smn_codigos_impuestos_rf", rsFactura_impuesto.getInt("smn_codigos_impuestos_rf"));
				else
				{
					inputParams.setValue("mensaje","**error**, smn_codigos_impuestos_rf esta vacio");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}

				if(rsFactura_impuesto.getString("fid_porcentaje_impuesto") != null)
					inputParams.setValue("fid_porcentaje_impuesto", rsFactura_impuesto.getDouble("fid_porcentaje_impuesto"));
				else
				{
					inputParams.setValue("mensaje","**error**, fid_porcentaje_impuesto esta vacio");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				if(rsFactura_impuesto.getString("fid_monto_impuesto") != null)
					inputParams.setValue("fid_monto_impuesto", rsFactura_impuesto.getDouble("fid_porcentaje_impuesto"));
				else
				{
					inputParams.setValue("mensaje","**error**, fid_monto_impuesto esta vacio");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				if(rsFactura_impuesto.getString("fid_monto_sustraendo") != null)
					inputParams.setValue("fid_monto_sustraendo", rsFactura_impuesto.getDouble("fid_monto_sustraendo"));
				else
				{
					inputParams.setValue("mensaje","**error**, fid_monto_sustraendo esta vacio");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				inputParams.setValue("imp_monto_neto_impuesto", inputParams.getDouble("fid_monto_impuesto")-inputParams.getDouble("fid_monto_sustraendo"));
				
				if(rsFactura_impuesto.getString("smn_moneda_rf") != null)
					inputParams.setValue("smn_moneda_rf_fid", rsFactura_impuesto.getInt("smn_moneda_rf"));
				else
					inputParams.setValue("smn_moneda_rf_fid", 0);
				
				if(rsFactura_impuesto.getString("smn_tasa_rf") != null)
					inputParams.setValue("smn_tasa_rf_fid", rsFactura_impuesto.getInt("smn_tasa_rf"));
				else
					inputParams.setValue("smn_tasa_rf_fid", 0);
				
				if(rsFactura_impuesto.getString("fid_monto_imp_moneda_alterna") != null)
					inputParams.setValue("fid_monto_imp_moneda_alterna", rsFactura_impuesto.getDouble("fid_monto_imp_moneda_alterna"));
				else
					inputParams.setValue("fid_monto_imp_moneda_alterna", 0);
				
				sql = getSQL(getResource("select-smn_factura_cabecera.sql"),inputParams);
				Recordset rsFactura = db.get(sql); //consulta la factura.
				
				if(rsFactura.getRecordCount()>0)
				{
					if(rsFactura.getString("smn_entidad_rf") != null)
					{
						inputParams.setValue("smn_entidad_rf", rsFactura.getInt("smn_entidad_rf"));
					}
					else
					{
						inputParams.setValue("mensaje","**error**, El campo smn_entidad_rf de la factura esta vacio");
						System.out.println(inputParams.getValue("mensaje"));
						return 1; //valor null.
					}
					
					if(rsFactura.getString("smn_sucursal_rf") != null)
						inputParams.setValue("smn_sucursal_rf", rsFactura.getInt("smn_sucursal_rf"));
					else
						inputParams.setValue("smn_sucursal_rf", 0);
					
					if(rsFactura.getString("smn_cliente_id") != null)
						inputParams.setValue("smn_cliente_id", rsFactura.getInt("smn_cliente_id"));
					else
						inputParams.setValue("smn_cliente_id", 0);
					
					sql = getSQL(getResource("select-smn_cliente.sql"),inputParams);
					Recordset rsCliente = db.get(sql); //consulta el cliente para traer el auxiliar y la clase auxiliar.
					
					if(rsCliente.getRecordCount() > 0)
					{
						rsCliente.first();
						
						if(rsCliente.getString("smn_auxiliar_rf") != null)
							inputParams.setValue("smn_auxiliar_rf", rsCliente.getInt("smn_auxiliar_rf"));
						else
						{
							inputParams.setValue("mensaje","**error**, el campo smn_auxiliar_rf del cliente esta vacio");
							System.out.println(inputParams.getValue("mensaje"));
							return 1; //valor null.
						}	
						
						if(rsCliente.getString("smn_clase_auxiliar_rf") != null)
							inputParams.setValue("smn_clase_auxiliar_rf", rsCliente.getInt("smn_clase_auxiliar_rf"));
						else
						{
							inputParams.setValue("mensaje","**error**, el campo smn_clase_auxiliar_rf del cliente esta vacio");
							System.out.println(inputParams.getValue("mensaje"));
							return 1; //valor null.
						}
					}
					else
					{
						inputParams.setValue("mensaje","**error**, No se encontro el cliente con el ID= "+inputParams.getValue("smn_cliente_id"));
						System.out.println(inputParams.getValue("mensaje"));
						return 1; //valor null.
					}
					
					if(rsFactura.getString("fca_rif") != null)
						inputParams.setValue("fca_rif", rsFactura.getString("fca_rif"));
					else
						inputParams.setValue("fca_rif", "n/a");
					
					if(rsFactura.getString("fca_numero_documento_id") != null)
						inputParams.setValue("fca_numero_documento_id", rsFactura.getInt("fca_numero_documento_id"));
					else
						inputParams.setValue("fca_numero_documento_id", 0);
					
					if(rsFactura.getString("fca_numero_control_fiscal_id") != null)
						inputParams.setValue("fca_numero_control_fiscal_id", rsFactura.getInt("fca_numero_control_fiscal_id"));
					else
						inputParams.setValue("fca_numero_control_fiscal_id", 0);
					
					inputParams.setValue("fca_fecha_registro", rsFactura.getDate("fca_fecha_registro"));
					
					sql = getSQL(getResource("select-smn_codigos_impuestos.sql"),inputParams);
					Recordset rsPorcentaje = db.get(sql); //consulta el porcentaje de la base imponible.
					
					if(rsPorcentaje.getRecordCount() > 0)
					{
						rsPorcentaje.first();
						
						if(rsPorcentaje.getString("imp_porcentaje_base") != null)
							inputParams.setValue("imp_porcentaje_base", rsPorcentaje.getDouble("imp_porcentaje_base"));
						else
						{
							inputParams.setValue("mensaje","**error**, el porcentaje_base esta vacio");
							System.out.println(inputParams.getValue("mensaje"));
							return 1; //valor null.
						}
					}
					else
					{
						inputParams.setValue("mensaje","**error**, No se encontro el porcentaje_base");
						System.out.println(inputParams.getValue("mensaje"));
						return 1; //valor null.
					}					
					
					inputParams.setValue("imp_descripcion", "Ventas Diarias");
					inputParams.setValue("imp_cantidad", 1);
				}
				else
				{
					inputParams.setValue("mensaje","**error**, no se encontro la factura_cabecera");
					System.out.println(inputParams.getValue("mensaje"));
					return 1; //valor null.
				}
				
				sql = getSQL(getResource("insert-smn_impuestos.sql"),inputParams);
				db.exec(sql); //registra impuestos.
			}
		}
		catch(Throwable e)
		{
			//conn.rollback();
			throw e;
		}
		/*finally
		{
			if(rc == 0)
				conn.commit();
			else
				conn.rollback();
		}*/
		
		return rc;
	}
}
