package kr.or.dw.comm.vo;


public class ReplyVO {

	private int re_no;
	private int bd_no;
	private int user_no;
	private String user_nick;
	private String re_content;
	private String re_wdt;
	private String gb_del;
	private String user_img;
	
	
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public int getBd_no() {
		return bd_no;
	}
	public void setBd_no(int bd_no) {
		this.bd_no = bd_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_wdt() {
		return re_wdt;
	}
	public void setRe_wdt(String re_wdt) {
		this.re_wdt = re_wdt;
	}
	public String getGb_del() {
		return gb_del;
	}
	public void setGb_del(String gb_del) {
		this.gb_del = gb_del;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	
}
