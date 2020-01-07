package com.safe.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("eatinfodao")
public class EatInfoDAO implements IEatInfoDAO {
	@Autowired
	SqlSession session;

	public List<Integer> selectByDate(String id, String date) {
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("id", id);
		hm.put("edate", date);
		return session.selectList("eatinfo.selectByDate", hm);
	}

	public void insert(String id, String date, int code) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("id", id);
		hm.put("date", date);
		hm.put("code", code);
		session.insert("eatinfo.insert", hm);
	}

	@Override
	public void delete(String id, String date, int code) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("id", id);
		hm.put("date", date);
		hm.put("code", code);
		session.delete("eatinfo.delete", hm);
	}

}
