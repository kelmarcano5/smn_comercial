package proceso;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

import dinamica.*;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.Timestamp;
import javax.sql.DataSource;
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

public class Recibir extends GenericTransaction {

	// Esta funcion recibe el detalle del cliente

	public int receive(Recordset inputParams) throws Throwable {

		int rc = 0;

		String fechaActual = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String sistemaOperativo = System.getProperty("os.name");
		String file;

		if (sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8")
				|| sistemaOperativo.equals("Windows 10"))
			file = "C:/log/log_ProcesarDTE" + fechaActual + ".txt";
		else
			file = "./log_ProcesarDTE" + fechaActual + ".txt";

		File newLogFile = new File(file);
		FileWriter fw;
		String str = "";

		if (!newLogFile.exists())
			fw = new FileWriter(newLogFile);
		else
			fw = new FileWriter(newLogFile, true);

		BufferedWriter bw = new BufferedWriter(fw);

		Timestamp timestamp = new Timestamp(System.currentTimeMillis());

		//super.receive(inputParams);

		String jndiName = (String) getContext().getAttribute("dinamica.security.datasource");

		if (jndiName == null)
			throw new Throwable(
					"Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");

		DataSource ds = Jndi.getDataSource(jndiName);
		Connection conn = ds.getConnection();
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
					int mtoTotal = rsDFactura.getInteger("fca_monto_factura_ml");
					int mtoNeto = rsDFactura.getInteger("fca_monto_neto_ml");
					int mtoIVA = rsDFactura.getInteger("fca_monto_impuesto_ml");
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
					idDoc.setTpoTranCompra("1");
					idDoc.setTpoTranVenta("1");
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
					receptor.setCmnaRecep("Curicó");

					// Totales
					Totales totales = new Totales();
					totales.setMntNeto(mtoNeto);
					totales.setTasaIVA(TasaIVA);
					totales.setIVA(mtoIVA);
					totales.setMntTotal(mtoTotal);
					totales.setMontoPeriodo(2380);// creo que no es obligatorio
					totales.setVlrPagar(2380);// no se que es este dato

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
					String NombItem = rsDDetalle.getString("smn_activo_fijo_rf");
					int QtyItem = rsDDetalle.getInteger("fde_cantidad");
					int PrcItem = rsDDetalle.getInteger("fde_crecio_ml");
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

			}

		} catch (

		Throwable e)

		{
			throw e;
		} finally

		{
			if (conn != null)
				conn.close();
		}
		return rc;
	}

}
