package com.safe.vo;

import org.apache.ibatis.type.Alias;

@Alias("Notice")
public class Notice {
	private String nid, wdate, title, content, filename;
	int count;

	public Notice() {
	}

	public Notice(String nid, String wdate, String title, String content, int count) {
		this.nid = nid;
		this.wdate = wdate;
		this.title = title;
		this.content = content;
		this.count = count;
	}

	public String getWdate() {
		return wdate;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getNid() {
		return nid;
	}

	public void setNid(String nid) {
		this.nid = nid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "Notice [nid=" + nid + ", wdate=" + wdate + ", title=" + title + ", content=" + content + ", count="
				+ count + "]";
	}

}
