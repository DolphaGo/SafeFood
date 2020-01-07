package com.safe.vo;

public class EatInfo {
	String eid, id, edate;
	int code;

	public EatInfo(String eid, String id, String edate, int code) {
		this.eid = eid;
		this.id = id;
		this.edate = edate;
		this.code = code;
	}

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

}
