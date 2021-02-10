package gfc.dto;

public class Keyword {
	private int kcode;
	private String kname;
	
	public Keyword() {
	}
	
	public Keyword(int kcode, String kname) {
		this.kcode = kcode;
		this.kname = kname;
	}
	
	public int getKcode() {
		return kcode;
	}
	public void setKcode(int kcode) {
		this.kcode = kcode;
	}
	public String getKname() {
		return kname;
	}
	public void setKname(String kname) {
		this.kname = kname;
	}
	
	@Override
	public String toString() {
		return "Keyword [kcode=" + kcode + ", kname=" + kname + "]";
	}
}
