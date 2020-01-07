package com.safe.dao;

import java.util.List;

import com.safe.vo.Qna;

public interface IQnaDAO {
	public List<Qna> selectAll();

	public Qna selectOne(String qid);

	public void insert(Qna n);

	public void update(Qna n);

	public void delete(String qid);

	public void viewCount(String qid);
}
