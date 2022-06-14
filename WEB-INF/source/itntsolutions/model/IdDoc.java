package itntsolutions.model;

public class IdDoc {
	
	public int TipoDTE;
	public int Folio;
	public String FchEmis = null;
	public String TpoTranCompra = null;
	public String TpoTranVenta = null;
	public String FmaPago = null;
	public int getTipoDTE() {
		return TipoDTE;
	}
	public void setTipoDTE(int tipoDTE) {
		TipoDTE = tipoDTE;
	}
	public int getFolio() {
		return Folio;
	}
	public void setFolio(int folio) {
		Folio = folio;
	}
	public String getFchEmis() {
		return FchEmis;
	}
	public void setFchEmis(String fchEmis) {
		FchEmis = fchEmis;
	}
	public String getTpoTranCompra() {
		return TpoTranCompra;
	}
	public void setTpoTranCompra(String tpoTranCompra) {
		TpoTranCompra = tpoTranCompra;
	}
	public String getTpoTranVenta() {
		return TpoTranVenta;
	}
	public void setTpoTranVenta(String tpoTranVenta) {
		TpoTranVenta = tpoTranVenta;
	}
	public String getFmaPago() {
		return FmaPago;
	}
	public void setFmaPago(String fmaPago) {
		FmaPago = fmaPago;
	}
	
		

}
