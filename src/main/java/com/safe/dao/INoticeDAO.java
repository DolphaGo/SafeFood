package com.safe.dao;

import java.util.HashMap;
import java.util.List;

import com.safe.vo.Notice;

public interface INoticeDAO {
	public List<Notice> selectAll();

	public Notice selectOne(String nid);

	public void insert(Notice n);

	public void update(Notice n);

	public void delete(String nid);

	public void viewCount(String nid);

	public int getCount(); // 전체 게시물 수 구하는 메소드

	public List<Notice> selectPage(HashMap<String, Object> params);

	public int getCountByKeyword(HashMap<String, Object> params);

	public List<Notice> selectNoticeByKeyword(HashMap<String, Object> params);
}
