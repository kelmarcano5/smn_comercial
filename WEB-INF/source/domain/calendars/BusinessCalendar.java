package domain.calendars;

import java.util.Calendar;
import java.util.Date;
import dinamica.Recordset;
import dinamica.calendar.DefaultCalendar;

/*Supongamos que necesitamos deshabilitar la selección de sábados,
domingos y días feriados (bancarios, semana santa, etc.). Para estos
últimos usaremos una tabla de base de datos para tenerlos
almacenados y configurarlos mediante un módulo de mantenimiento
(un CRUD Simple por ejemplo).
Una clase que cumpla con el propósito de proveer los días a un calendario debe extender a la
clase base dinamica.calendar.DefaultCalendar*/
public class BusinessCalendar extends DefaultCalendar 
{
	//getCellStyle: permite indicar el estilo a aplicar, desactivado, activado, otro.
	@Override
	protected String getCellStyle(Calendar c, int currentDay, Date minDate, Date maxDate) throws Throwable 
	{
		String style = super.getCellStyle(c, currentDay, minDate, maxDate);
		//desactivar sabados y domingos
		if (c.get(Calendar.DAY_OF_WEEK)==1 || c.get(Calendar.DAY_OF_WEEK)==7) 
		{
			style = "calDisabled";
			return style;
		}
		//desactivar feriados
		Recordset rs = this.getRecordset("feriados.sql");
		rs.top();
		while (rs.next())
		{
			if (rs.getDate("fecha").compareTo(c.getTime())==0)
			{
				style="calDisabled";
				break;
			}
		}
		return style;
	}

	//getCellOnClickValue: permite indicar la acción en caso de clic (no hacer nada, retornar la fecha, etc.)
	@Override
	protected String getCellOnClickValue(String elementID, Calendar c, int currentDay, Date minDate, Date maxDate, String date) throws Throwable 
	{
		String value = super.getCellOnClickValue(elementID, c, currentDay, minDate, maxDate, date);

		//desactivar sabados y domingos
		if (c.get(Calendar.DAY_OF_WEEK)==1 || c.get(Calendar.DAY_OF_WEEK)==7) 
		{
			value = "";
			return value;
		}

		//desactivar feriados
		Recordset rs = this.getRecordset("feriados.sql");
		rs.top();
		while (rs.next())
		{			
			if (rs.getDate("fecha").compareTo(c.getTime())==0)
			{
				value="";
				break;
			}
		}
		return value;
	}
}