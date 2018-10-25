package bean;

public class Purchase_vo {
	private int pur_code = 0;
	private String pur_date = "";
	private String pur_status = "";
	private String pur_adr = "";
	private int pur_final_price = 0;
	private int cud_code = 0;
	
	public int getPur_code() {
		return pur_code;
	}
	public void setPur_code(int pur_code) {
		this.pur_code = pur_code;
	}
	public String getPur_date() {
		return pur_date;
	}
	public void setPur_date(String pur_date) {
		this.pur_date = pur_date;
	}
	public String getPur_status() {
		return pur_status;
	}
	public void setPur_status(String pur_status) {
		this.pur_status = pur_status;
	}
	public String getPur_adr() {
		return pur_adr;
	}
	public void setPur_adr(String pur_adr) {
		this.pur_adr = pur_adr;
	}
	public int getPur_final_price() {
		return pur_final_price;
	}
	public void setPur_final_price(int pur_final_price) {
		this.pur_final_price = pur_final_price;
	}
	public int getCud_code() {
		return cud_code;
	}
	public void setCud_code(Cud_vo cud_vo) {
		this.cud_code = cud_vo.getCud_code();
	}
	
}
