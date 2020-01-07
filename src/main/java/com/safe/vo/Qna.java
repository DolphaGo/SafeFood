package com.safe.vo;

public class Qna {
	String qid, id, wdate, title, content;
	int count;

	public Qna() {
	}

	public Qna(String qid, String id, String wdate, String title, String content, int count) {
		this.qid = qid;
		this.id = id;
		this.wdate = wdate;
		this.title = title;
		this.content = content;
		this.count = count;
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

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Qna [qid=" + qid + ", id=" + id + ", wdate=" + wdate + ", title=" + title + ", content=" + content
				+ ", count=" + count + "]";
	}

}
