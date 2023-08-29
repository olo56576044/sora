package kr.or.dw.comm.vo;

public class CommVO {
	private int bd_no;
	private int user_no;
	private String bd_cat;
	private String bd_title;
	private String user_nick;
	private String bd_content;
	private int bd_hit;
	private int bd_like;
	private String bd_wdt;
	private String gb_del;
	private String user_img;
	private int reply_cnt;
	
	
	public int getReply_cnt() {
		return reply_cnt;
	}
	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
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
	public String getBd_cat() {
		return bd_cat;
	}
	public void setBd_cat(String bd_cat) {
		this.bd_cat = bd_cat;
	}
	public String getBd_title() {
		return bd_title;
	}
	public void setBd_title(String bd_title) {
		this.bd_title = bd_title;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getBd_content() {
		return bd_content;
	}
	public void setBd_content(String bd_content) {
		this.bd_content = bd_content;
	}
	public int getBd_hit() {
		return bd_hit;
	}
	public void setBd_hit(int bd_hit) {
		this.bd_hit = bd_hit;
	}
	public int getBd_like() {
		return bd_like;
	}
	public void setBd_like(int bd_like) {
		this.bd_like = bd_like;
	}
	public String getBd_wdt() {
		return bd_wdt;
	}
	public void setBd_wdt(String bd_wdt) {
		this.bd_wdt = bd_wdt;
	}
	public String getGb_del() {
		return gb_del;
	}
	public void setGb_del(String gb_del) {
		this.gb_del = gb_del;
	}
	
	
}
