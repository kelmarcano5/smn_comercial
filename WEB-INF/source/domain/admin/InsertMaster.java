package domain.admin;

import dinamica.*;

/**
 * Insert master record and an associated array of values (detail) 
 * <br><br>
 * Creation date: 5/03/2004<br>
 * Last Update: 5/03/2004<br>
 * (c) 2004 Martin Cordova<br>
 * This code is released under the LGPL license<br>
 * @author Martin Cordova (dinamica@martincordova.com)
 * */
public class InsertMaster extends dinamica.audit.AuditableTransaction
{

	/* (non-Javadoc)
	 * @see dinamica.GenericTransaction#service(dinamica.Recordset)
	 */
	public int service(Recordset inputParams) throws Throwable
	{

		//execute all recordsets and queries defined in config.xml
		int rc = 0;
		super.service(inputParams);
				
		//read confir parameters
		String colName = getConfig().getConfigValue("colname");
		String sqlFile = getConfig().getConfigValue("sql-template");
		
		//pre-fill sql template with master record values
		String sql = getSQL(getResource(sqlFile), inputParams);

		//insert detail records using reusable object
		InsertDetail r = (InsertDetail)getObject("domain.admin.InsertDetail");
		r.save(sql, colName);
		
		String sqlAudit = getConfig().getConfigValue("//audit/recordset");
		if (sqlAudit!=null) {
			if (!sqlAudit.equals("")) {
				Recordset rs = getDb().get(getSQL(getResource(sqlAudit), inputParams));
				publish(sqlAudit, rs);
			}
		}
		
		return rc;
		
	}

}
