package bean;

public class Qna_vo {
	// qna table columns
	int qna_code;	
	String qna_sub;
	String qna_content;
	int cud_code;
	String qna_date;
	int prod_code;
	int qna_grp;
	int qna_deep;
	
	// join한 customer 테이블에서 사용할 변수(columns)
	String cud_name;
	
	
	// qna 테이블 변수의 getter/setter
	public int getQna_code() {
		return qna_code;
	}
	public void setQna_code(int qna_code) {
		this.qna_code = qna_code;
	}
	public String getQna_sub() {
		return qna_sub;
	}
	public void setQna_sub(String qna_sub) {
		this.qna_sub = qna_sub;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public int getCud_code() {
		return cud_code;
	}
	public void setCud_code(int cud_code) {
		this.cud_code = cud_code;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	public int getProd_code() {
		return prod_code;
	}
	public void setProd_code(int prod_code) {
		this.prod_code = prod_code;
	}
	public int getQna_grp() {
		return qna_grp;
	}
	public void setQna_grp(int qna_grp) {
		this.qna_grp = qna_grp;
	}
	public int getQna_deep() {
		return qna_deep;
	}
	public void setQna_deep(int qna_deep) {
		this.qna_deep = qna_deep;
	}
	
	// cud_name에 대한 getter/setter
	public String getCud_name() {
		return cud_name;
	}
	public void setCud_name(String cud_name) {
		this.cud_name = cud_name;
	}
}
