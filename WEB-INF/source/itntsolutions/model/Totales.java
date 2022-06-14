package itntsolutions.model;

public class Totales {
	
	public int MntNeto;
	public String TasaIVA = null;
	public int IVA;
	public int MntTotal;
	public int MontoPeriodo;
	public int VlrPagar ;
	public int getMntNeto() {
		return MntNeto;
	}
	public void setMntNeto(int mntNeto) {
		MntNeto = mntNeto;
	}
	public String getTasaIVA() {
		return TasaIVA;
	}
	public void setTasaIVA(String tasaIVA) {
		TasaIVA = tasaIVA;
	}
	public int getIVA() {
		return IVA;
	}
	public void setIVA(int iVA) {
		IVA = iVA;
	}
	public int getMntTotal() {
		return MntTotal;
	}
	public void setMntTotal(int mntTotal) {
		MntTotal = mntTotal;
	}
	public int getMontoPeriodo() {
		return MontoPeriodo;
	}
	public void setMontoPeriodo(int montoPeriodo) {
		MontoPeriodo = montoPeriodo;
	}
	public int getVlrPagar() {
		return VlrPagar;
	}
	public void setVlrPagar(int vlrPagar) {
		VlrPagar = vlrPagar;
	}
	
	
}
