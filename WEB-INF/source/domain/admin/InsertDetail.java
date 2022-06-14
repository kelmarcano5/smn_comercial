package domain.admin;

import dinamica.*;

/**
 * Reusable class to insert array of values into DB.<br>
 * <br><br>
 * Creation date: 5/03/2004<br>
 * Last Update: 5/03/2004<br>
 * (c) 2004 Martin Cordova<br>
 * This code is released under the LGPL license<br>
 * @author Martin Cordova (dinamica@martincordova.com)
 * */
public class InsertDetail extends dinamica.GenericTransaction
{

	/**
	 * Insert array in DB
	 * @param sql SQL template for the INSERT statement, may vary according to 
	 * the context (a new user or an existing user).
	 * @param colName parameter name for the array of values
	 * @throws Throwable
	 */
	public void save(String sql, String colName) throws Throwable
	{
		
		//get db channel
		Db db = getDb();
		
		//create recordset to hold array
		Recordset detail = new Recordset();
		detail.append(colName, java.sql.Types.INTEGER);
		
		//get array
		String v[] = getRequest().getParameterValues(colName);
		
		//read values if not empty
		if (v!=null)
		{
			for (int i=0;i<v.length;i++)
			{
				//add to recordset
				detail.addNew();
				detail.setValue(colName, new Integer(v[i]));
				
				//generate sql
				String cmd = getSQL(sql, detail);
				
				//add to batch 
				db.addBatchCommand(cmd);
			}
	
			//insert all records in batch
			db.exec();
		}
		
	}

}
