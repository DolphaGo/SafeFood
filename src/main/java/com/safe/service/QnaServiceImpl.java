package com.safe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safe.dao.IQnaDAO;
import com.safe.vo.Qna;

@Service("qnaservice")
public class QnaServiceImpl implements IQnaService {
	@Autowired
	IQnaDAO dao;

	@Override
	public List<Qna> selectAll() {
		return dao.selectAll();
	}

	@Override
	public Qna selectOne(String qid) {
		dao.viewCount(qid);
		return dao.selectOne(qid);
	}

	@Override
	public void insert(Qna n) {
		dao.insert(n);
	}

	@Override
	public void update(Qna n) {
		dao.update(n);
	}

	@Override
	public void delete(String qid) {
		dao.delete(qid);
	}

}
