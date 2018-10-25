package bean;

public class Order_list_cnt_vo {

	private int olc_code = 0;
	private int olc_cnt = 0;
	private int prod_code = 0;
	private int pur_code = 0;
	private int cud_code = 0;
	
	public int getOlc_code() {
		return olc_code;
	}
	public void setOlc_code(int olc_code) {
		this.olc_code = olc_code;
	}
	public int getOlc_cnt() {
		return olc_cnt;
	}
	public void setOlc_cnt(int olc_cnt) {
		this.olc_cnt = olc_cnt;
	}
	public int getProd_code() {
		return prod_code;
	}
	public void setProd_code(Prod_vo prod_vo) {
		this.prod_code = prod_vo.getProd_code();
	}
	public int getPur_code() {
		return pur_code;
	}
	public void setPur_code(Purchase_vo purchase_vo) {
		this.pur_code = purchase_vo.getPur_code();
	}
	public int getCud_code() {
		return cud_code;
	}
	public void setCud_code(Cud_vo cud_vo) {
		this.cud_code = cud_vo.getCud_code();
	}
	
	
}
