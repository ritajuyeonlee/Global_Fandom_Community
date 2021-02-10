package gfc.dto;

import java.sql.Date;

public class Comment {
	private int ccode;
	private int scode;
	private String ccom;
	private int ucode;
	private Date cdate;
	
	public Comment() {
	}
	
	public Comment(int ccode, int scode, String ccom, int ucode, Date cdate) {
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
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	
	@Override
	public String toString() {
		return "Comment [ccode=" + ccode + ", scode=" + scode + ", ccom=" + ccom + ", ucode=" + ucode + ", cdate="
				+ cdate + "]";
	}
	
}
