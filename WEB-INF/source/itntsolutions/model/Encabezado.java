package itntsolutions.model;

public class Encabezado {
	
	public IdDoc IdDoc;	
	public Emisor Emisor;
	public Receptor Receptor;
	public Totales Totales;
	public IdDoc getIdDoc() {
		return IdDoc;
	}
	public void setIdDoc(IdDoc idDoc) {
		IdDoc = idDoc;
	}
	public Emisor getEmisor() {
		return Emisor;
	}
	public void setEmisor(Emisor emisor) {
		Emisor = emisor;
	}
	public Receptor getReceptor() {
		return Receptor;
	}
	public void setReceptor(Receptor receptor) {
		Receptor = receptor;
	}
	public Totales getTotales() {
		return Totales;
	}
	public void setTotales(Totales totales) {
		Totales = totales;
	}
	
}
