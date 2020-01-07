package com.safe.dao;

import java.util.List;

import com.safe.vo.Comment;

public interface ICommentDAO {
	public List<Comment> selectAll(String qid);

	public Comment selectOne(String cid);

	public void insert(Comment c);

	public void update(Comment c);

	public void delete(String cid);
}
