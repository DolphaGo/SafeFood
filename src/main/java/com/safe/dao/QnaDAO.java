package com.safe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.safe.vo.Qna;

@Repository("qnadao")
public class QnaDAO implements IQnaDAO {
	@Autowired
	SqlSession session;

	@Override
	public List<Qna> selectAll() {
		return session.selectList("qna.selectAll");
	}

	@Override
	public Qna selectOne(String qid) {
		return session.selectOne("qna.selectOne", qid);
	}

	@Override
	public void insert(Qna n) {
		session.insert("qna.insert", n);
	}

	@Override
	public void update(Qna n) {
		session.update("qna.update", n);
	}

	@Override
	public void delete(String qid) {
		session.delete("qna.delete", qid);
	}

	@Override
	public void viewCount(String qid) {
		session.update("qna.viewCount", qid);
	}

}
