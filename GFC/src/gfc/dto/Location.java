package gfc.dto;

public class Location {
	private int lcode;
	private int acode;
	private String lname;
	private String laddress;
	private double llat;
	private double llong;
	private String ldesc;
	private int ucode;
	private char lconfirm;
	
	public Location() {
	}
	
	public Location(int lcode, int acode, String lname, String laddress, double llat, double llong, String ldesc, char lconfirm,
			int ucode) {
		this.lcode = lcode;
		this.acode = acode;
		this.lname = lname;
		this.laddress = laddress;
		this.llat = llat;
		this.llong = llong;
		this.ldesc = ldesc;
		this.ucode = ucode;
		this.lconfirm=lconfirm;
	}
	
	
	public char getLconfirm() {
		return lconfirm;
	}

	public void setLconfirm(char lconfirm) {
		this.lconfirm = lconfirm;
	}

	public int getLcode() {
		return lcode;
	}
	public void setLcode(int lcode) {
		this.lcode = lcode;
	}
	public int getAcode() {
		return acode;
	}
	public void setAcode(int acode) {
		this.acode = acode;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getLaddress() {
		return laddress;
	}
	public void setLaddress(String laddress) {
		this.laddress = laddress;
	}
	public double getLlat() {
		return llat;
	}
	public void setLlat(double llat) {
		this.llat = llat;
	}
	public double getLlong() {
		return llong;
	}
	public void setLlong(double llong) {
		this.llong = llong;
	}
	public String getLdesc() {
		return ldesc;
	}
	public void setLdesc(String ldesc) {
		this.ldesc = ldesc;
	}
	public int getUcode() {
		return ucode;
	}
	public void setUcode(int ucode) {
		this.ucode = ucode;
	}

	@Override
	public String toString() {
		return "Location [lcode=" + lcode + ", acode=" + acode + ", lname=" + lname + ", laddress=" + laddress
				+ ", llat=" + llat + ", llong=" + llong + ", ldesc=" + ldesc + ", ucode=" + ucode + ", lconfirm="
				+ lconfirm + "]";
	}
	
	
}
