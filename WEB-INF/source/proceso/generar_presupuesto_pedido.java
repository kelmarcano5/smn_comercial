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

public class generar_presupuesto_pedido extends GenericTransaction{
	
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
			str = str + "Procesando Integracion Prespuesto Pedido"+ " \n";	
			
			String sqlCheckPed = getSQL(getResource("sql-consultaPresupuestoCabecera.sql"), inputParams);
			Recordset rsPedido = db.get(sqlCheckPed);
		
			if(rsPedido.getRecordCount() > 0) {
				str = str + ("Registro de Presupuesto"+ " \n");
				//str = str + ("Insertando Presupuesto con ID: "+ rsImpuesto.getInt("id_ingreso") + " \n");
				rsPedido.first();
				String sqlInsertImp = getResource("insert-Pedido_cabecera.sql");
				sqlInsertImp = getSQL(sqlInsertImp, rsPedido);
				db.exec(sqlInsertImp);
				
				String sqlCheckDPed = getSQL(getResource("sql-consultaPresupuestoDetalle.sql"), inputParams);
				Recordset rsDPedidoD = db.get(sqlCheckDPed);
							
				if(rsDPedidoD.getRecordCount() > 0) {
					//rsDPedidoD.first();
					while(rsDPedidoD.next()){
						str  = str + "Creando Detalle Prespuesto Pedido Det"+ " \n";
						
						String sqlInsertOF2 = getResource("insert-pedido_detalle.sql");
						sqlInsertOF2 = getSQL(sqlInsertOF2, rsDPedidoD );
						db.exec(sqlInsertOF2);
					}

					str = str + "Registro de Detalle Prespuesto Pedido Det finalizado"+ " \n";
					str = str + "Fin proceso Detalle Prespuesto Pedido Det"+ " \n";		
						
				}else{
					str = str + "Error al crear el detalle del Prespuesto Requisicion"+ " \n";
				}
				
				String sqlComponente = getSQL(getResource("sql-consultaPresupuestoComponentes.sql"), inputParams);
				Recordset rsComponente = db.get(sqlComponente);
							
				if(rsComponente.getRecordCount() > 0) {
					//rsComponente.first();
					while(rsComponente.next()){
						str  = str + "Creando Detalle Prespuesto Pedido Componente"+ " \n";
						
						String InsertComponent = getResource("insert-pedido_componente.sql");
						InsertComponent = getSQL(InsertComponent, rsComponente );
						db.exec(InsertComponent);
					}

					str = str + "Registro Prespuesto Componente"+ " \n";
					str = str + "Fin proceso Prespuesto Componente"+ " \n";		
						
				}else{
					str = str + "Error al crear el detalle del Prespuesto Componente"+ " \n";
				}
				
				str = str + ("Fin proceso Prespuesto Pedido"+ " \n");		
			}else{
				str = str + ("Error al crear la cabecera del Prespuesto Requisicion"+ " \n");
			}
			
			String fechaActual= new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			//String sistemaOperativo = System.getProperty("os.name");
			String file;
			
			//if(sistemaOperativo.equals("Windows 7") || sistemaOperativo.equals("Windows 8") || sistemaOperativo.equals("Windows 10")) 
				file =  "C:/log/logGenerarPresupuestoPedido_"+fechaActual+".txt";
			//else
			//	file = "./logGenerarPresupuestoPedido_"+fechaActual+".txt";
			
			File newLogFile = new File(file);

			//File newLogFile = new File("D:/data/Simone/smn_automotriz/log/logGenerarPresupuestoReq_"+fechaActual+".txt");
			//File newLogFile = new File("C:/log/logGenerarPresupuestoPedido_"+fechaActual+".txt");
			
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
