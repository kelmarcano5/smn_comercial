package proceso;

import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.sql.DataSource;

import dinamica.Db;
import dinamica.GenericTransaction;
import dinamica.Jndi;
import dinamica.Recordset;

public class generar_movimiento_caja extends GenericTransaction {
	
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
			str = str + "Generando movimiento caja cabecera"+ " \n";	
			
			String sqlCheckPed = getSQL(getResource("sql-consultaMovimientoCajaCabecera.sql"), inputParams);
			Recordset rsMovimientoPedido = db.get(sqlCheckPed);
		
			if(rsMovimientoPedido.getRecordCount() > 0) {
			
				rsMovimientoPedido.first();
				str = str + "Pedido Documento ID"+ " \n";			
				str = str + "Insertando movimiento caja cabecera con ID: "+ rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
				
				String sqlInsertOF = getResource("insert-movimiento_caja_cabecera.sql");
				sqlInsertOF = getSQL(sqlInsertOF, rsMovimientoPedido);
				db.exec(sqlInsertOF);
				
				str = str + "Fin proceso Agregar movimiento caja cabecera"+ " \n";								
				str = str + "Generando detalle movimiento caja cabecera."+ " \n";
				
				String sqlCheckDPed = getSQL(getResource("sql-consultaMovimientoCajaDetalle.sql"), inputParams);
				Recordset rsDPedido = db.get(sqlCheckDPed);
							
				if(rsDPedido.getRecordCount() > 0) {
					while(rsDPedido.next()){
						str  = str + "Creando Detalle movimiento caja cabecera"+ " \n";
						
						String sqlInsertOF2 = getResource("insert-movimiento_caja_detalle.sql");
						sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPedido );
						db.exec(sqlInsertOF2);
						
					}
								
					str = str + "Distribucion Pago Detalle."+ " \n";
					String sqlPagadores= getSQL(getResource("sql-consultaDistribucionPagoDetalle.sql"), inputParams);
					Recordset rsDPagD = db.get(sqlPagadores);
									
					if(rsDPagD.getRecordCount() > 0) {
						while(rsDPagD.next()){
							str = str + "Insert Distribucion Pago Detalle."+ " \n";
							str = str + "Insertando movimiento caja cabecera con ID: "+ rsMovimientoPedido.getInt("smn_pedido_cabecera_id") + " \n";
							String sqlInsertOFD = getResource("insert-distribucion_pago_detalle.sql");
							sqlInsertOFD = getSQL(sqlInsertOFD, rsDPagD);
							db.exec(sqlInsertOFD);								
						}
					}
					str = str + "Registro de Distribucion Pago Detalle"+ " \n";
					str = str + "Fin proceso Distribucion Pago Detalle"+ " \n";		
						
				}else{
					str = str + "Error al crear el Generando movimiento caja cabecera"+ " \n";
				}
				
			}
			
			String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			
			//File newLogFile = new File("E:/data/Simone/smn_comercial/log/log_ProcesarFactura"+fechaActual+"_"+inputParams.getInt("smn_mov_caja_cabecera_id")+".txt");
			//File newLogFile = new File("D:/data/Simone/smn_comercial/log/log_ProcesarPedidoCaja"+fechaActual+".txt");
			//File newLogFile = new File("C:/Users/alexander/Desktop/dinamica/log_ProcesarCaja"+fechaActual+"_"+inputParams.getInt("smn_mov_caja_cabecera_id")+".txt");
	
	        //FileWriter fw = new FileWriter(newLogFile);
	        //fw.write(str);
	        //fw.close();
			
		}catch (Throwable e){
			throw e;
		}
		finally
		{
			if (conn!=null)
				conn.close();
		}

		return rc;
	}

}
