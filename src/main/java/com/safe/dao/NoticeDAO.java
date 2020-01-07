package com.safe.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.safe.vo.Notice;

@Repository("noticedao")
public class NoticeDAO implements INoticeDAO {
	@Autowired
	SqlSession session;

	@Override
	public List<Notice> selectAll() {
		return session.selectList("notice.selectAll");
	}

	@Override
	public Notice selectOne(String nid) {
		return session.selectOne("notice.selectOne", nid);
	}

	@Override
	public void insert(Notice n) {
		session.insert("notice.insert", n);
	}

	@Override
	public void update(Notice n) {
		session.update("notice.update", n);
	}

	@Override
	public void delete(String nid) {
		session.delete("notice.delete", nid);
	}

	@Override
	public void viewCount(String nid) {
		session.update("notice.viewCount", nid);
	}

	@Override
	public int getCount() {
		return session.selectOne("notice.getCount");
	}

	@Override
	public List<Notice> selectPage(HashMap<String, Object> params) {
		return session.selectList("notice.selectPage", params);
	}

	@Override
	public int getCountByKeyword(HashMap<String, Object> params) {
		return session.selectOne("notice.getCountByKeyword", params);
	}

	@Override
	public List<Notice> selectNoticeByKeyword(HashMap<String, Object> params) {
		return session.selectList("notice.selectNoticeByKeyword", params);
	}

}
