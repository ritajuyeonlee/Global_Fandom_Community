package gfc.dto;

import java.sql.Date;

public class Comment {
	private int ccode;
	private int scode;
	private String ccom;
	private int ucode;
	private String cdate;
	
	private User user;	// 추가됨
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Comment() {
	}
	
	public Comment(int ccode, int scode, String ccom, int ucode, String cdate) {
		this.ccode = ccode;
		this.scode = scode;
		this.ccom = ccom;
		this.ucode = ucode;
		this.cdate = cdate;
	}
	
	public int getCcode() {
		return ccode;
	}
	public void setCcode(int ccode) {
		this.ccode = ccode;
	}
	public int getScode() {
		return scode;
	}
	public void setScode(int scode) {
		this.scode = scode;
	}
	public String getCcom() {
		return ccom;
	}
	public void setCcom(String ccom) {
		this.ccom = ccom;
	}
	public int getUcode() {
		return ucode;
	}
	public void setUcode(int ucode) {
		this.ucode = ucode;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	@Override
	public String toString() {
		return "Comment [ccode=" + ccode + ", scode=" + scode + ", ccom=" + ccom + ", ucode=" + ucode + ", cdate="
				+ cdate + ", user=" + user + "]";
	}
	
	
}
