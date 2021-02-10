package gfc.dto;

public class Artist {
	private int acode;
	private String aname;
	
	public Artist() {
	}

	public Artist(int acode, String aname) {
		this.acode = acode;
		this.aname = aname;
	}

	public int getAcode() {
		return acode;
	}

	public void setAcode(int acode) {
		this.acode = acode;
	}
	
	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	@Override
	public String toString() {
		return "Artist [acode=" + acode + ", aname=" + aname + "]";
	}
}
