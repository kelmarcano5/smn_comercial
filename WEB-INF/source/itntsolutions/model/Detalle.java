package itntsolutions.model;

public class Detalle {
	
	public int NroLinDet;
	public String NmbItem = null;
	public String DescItem = null;
	public float QtyItem;
	public float PrcItem;
	public int MontoItem;
	
	public int getNroLinDet() {
		return NroLinDet;
	}
	public void setNroLinDet(int nroLinDet) {
		NroLinDet = nroLinDet;
	}
	public String getNmbItem() {
		return NmbItem;
	}
	public void setNmbItem(String nmbItem) {
		NmbItem = nmbItem;
	}
	public String getDescItem() {
		return DescItem;
	}
	public void setDescItem(String descItem) {
		DescItem = descItem;
	}
	public float getQtyItem() {
		return QtyItem;
	}
	public void setQtyItem(float qtyItem) {
		QtyItem = qtyItem;
	}
	public float getPrcItem() {
		return PrcItem;
	}
	public void setPrcItem(float prcItem) {
		PrcItem = prcItem;
	}
	public int getMontoItem() {
		return MontoItem;
	}
	public void setMontoItem(int montoItem) {
		MontoItem = montoItem;
	}
	
	
}
