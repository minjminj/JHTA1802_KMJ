package bean;

public class Review_vo {
	private int rew_code = 0;
	private String rew_content = "";
	private String rew_date = "";
	private int olc_code = 0;
	private int rew_seq = 0;
	private int rew_grp;
	private Cud_vo cud_vo;
	
	public Cud_vo getCud_vo() {
		return cud_vo;
	}
	public void setCud_vo(Cud_vo cud_vo) {
		this.cud_vo = cud_vo;
	}
	public int getRew_code() {
		return rew_code;
	}
	public void setRew_code(int rew_code) {
		this.rew_code = rew_code;
	}
	public String getRew_content() {
		return rew_content;
	}
	public void setRew_content(String rew_content) {
		this.rew_content = rew_content;
	}
	public String getRew_date() {
		return rew_date;
	}
	public void setRew_date(String rew_date) {
		this.rew_date = rew_date;
	}
	public int getOlc_code() {
		return olc_code;
	}
	public void setOlc_code(int olc_code) {
		this.olc_code = olc_code;
	}
	public int getRew_seq() {
		return rew_seq;
	}
	public void setRew_seq(int rew_seq) {
		this.rew_seq = rew_seq;
	}
	public int getRew_grp() {
		return rew_grp;
	}
	public void setRew_grp(int rew_grp) {
		this.rew_grp = rew_grp;
	}
	
	
	
}
