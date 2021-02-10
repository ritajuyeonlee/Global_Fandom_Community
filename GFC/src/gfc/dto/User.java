package gfc.dto;

public class User {
	private int ucode;
	private String userid;
	private String userpw;
	private String uname;
	private int acode;
	
	public User() {
		
	}

	public User(int ucode, String userid, String userpw, String uname, int acode) {
		this.ucode = ucode;
		this.userid = userid;
		this.userpw = userpw;
		this.uname = uname;
		this.acode = acode;
	}
	
	public int getUcode() {
		return ucode;
	}
	public void setUcode(int ucode) {
		this.ucode = ucode;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getAcode() {
		return acode;
	}
	public void setAcode(int acode) {
		this.acode = acode;
	}
	@Override
	public String toString() {
		return "User [ucode=" + ucode + ", userid=" + userid + ", userpw=" + userpw + ", uname=" + uname + ", acode="
				+ acode + "]";
	}
	
	
}
