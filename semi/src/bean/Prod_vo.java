package bean;

public class Prod_vo {
	private int prod_code = 0;
	private String prod_name = "";
	private int prod_price = 0;
	private int prod_inven = 0;
	private String prod_region = "";
	private String prod_cate = "";
	private String prod_content = "";
	
	private Pho_vo pho_vo = null;
	
	public Pho_vo getPho_vo() {
		return pho_vo;
	}
	public void setPho_vo(Pho_vo pho_vo) {
		this.pho_vo = pho_vo;
	}
	public int getProd_code() {
		return prod_code;
	}
	public void setProd_code(int prod_code) {
		this.prod_code = prod_code;
	}
	public String getProd_content() {
		return prod_content;
	}
	public void setProd_content(String prod_content) {
		this.prod_content = prod_content;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public int getProd_inven() {
		return prod_inven;
	}
	public void setProd_inven(int prod_inven) {
		this.prod_inven = prod_inven;
	}
	public String getProd_region() {
		return prod_region;
	}
	public void setProd_region(String prod_region) {
		this.prod_region = prod_region;
	}
	public String getProd_cate() {
		return prod_cate;
	}
	public void setProd_cate(String prod_cate) {
		this.prod_cate = prod_cate;
	}
	
	
}
