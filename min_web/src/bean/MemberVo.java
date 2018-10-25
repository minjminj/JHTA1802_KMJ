package bean;

public class MemberVo {
	// 클래스명 끝에 Vo가 붙어있으면 Value & Object => 1건의 데이터 처리.
	// 클래스명 끝에 Dao or DTo가 붙어있으면 Vo를 사용하는 비즈니스 로직이 있는 클래스(그중 DTo는 Network를 포함).
	
	String id = "";	// DB 테이블의 컬럼정보와 거의 일치. 필드에 변수를 선언할때는 null보다는 공백이 좋다.
	String name = "";
	String phone = "";
	String pwd = "";
	String post = "";
	String ar = "";
	String email = "";
	String rdate = "";
	String photo = "";
	String photO = "";
	
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getPhotO() {
		return photO;
	}
	public void setPhotO(String photO) {
		this.photO = photO;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAr() {
		return ar;
	}
	public void setAr(String ar) {
		this.ar = ar;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
}
