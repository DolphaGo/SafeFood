package com.safe.vo;

public class Comment {
	String cid, qid, id, wdate, content;

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getQid() {
		return qid;
	}

	public void setQid(String qid) {
		this.qid = qid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWdate() {
		return wdate;
	}

	public Comment(String cid, String qid, String id, String wdate, String content) {
		this.cid = cid;
		this.qid = qid;
		this.id = id;
		this.wdate = wdate;
		this.content = content;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Comment [cid=" + cid + ", qid=" + qid + ", id=" + id + ", wdate=" + wdate + ", content=" + content
				+ "]";
	}
}
