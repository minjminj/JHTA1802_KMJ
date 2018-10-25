package bean;

public class Cart_vo {

	// cart table columns 
	int crt_code;
	int crt_cnt;
	int prod_code; // 릴레이션 키
	int cud_code;
	
	// product table columns 
	String prod_name;
	int prod_price;
	String prod_content;
	
	
	// product_photo 
	String pho_rename1;
	
	// 총 결제금액 연산을 위한 변수
	int sum=0;
	
	// cart Getter/Setter
	public int getCrt_code() {
		return crt_code;
	}
	public void setCrt_code(int crt_code) {
		this.crt_code = crt_code;
	}
	public int getCrt_cnt() {
		return crt_cnt;
	}
	public void setCrt_cnt(int crt_cnt) {
		this.crt_cnt = crt_cnt;
	}
	public int getProd_code() {
		return prod_code;
	}
	public void setProd_code(int prod_code) {
		this.prod_code = prod_code;
	}
	public int getCud_code() {
		return cud_code;
	}
	public void setCud_code(int cud_code) {
		this.cud_code = cud_code;
	}
	
	
	
	// product Getter/Setter
	
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
	public String getProd_content() {
		return prod_content;
	}
	public void setProd_content(String prod_content) {
		this.prod_content = prod_content;
	}
	
	
	// product_photo
	
	public String getPho_rename1() {
		return pho_rename1;
	}
	public void setPho_rename1(String pho_rename1) {
		this.pho_rename1 = pho_rename1;
	}

	// 총액을 위한 변수
	
	public void setSum(int sum) {
		this.sum = sum;
	}
	
}
