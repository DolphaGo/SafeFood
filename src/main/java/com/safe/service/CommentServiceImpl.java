package com.safe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safe.dao.ICommentDAO;
import com.safe.vo.Comment;

@Service("commentservice")
public class CommentServiceImpl implements ICommentService {
	@Autowired
	ICommentDAO dao;

	@Override
	public List<Comment> selectAll(String qid) {
		return dao.selectAll(qid);
	}

	@Override
	public Comment selectOne(String cid) {
		return dao.selectOne(cid);
	}

	@Override
	public void insert(Comment c) {
		dao.insert(c);
	}

	@Override
	public void update(Comment c) {
		dao.update(c);
	}

	@Override
	public void delete(String cid) {
		dao.delete(cid);
	}

}
