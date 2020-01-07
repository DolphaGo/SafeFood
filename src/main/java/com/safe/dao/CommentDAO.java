package com.safe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.safe.vo.Comment;

@Repository("commentdao")
public class CommentDAO implements ICommentDAO {

	@Autowired
	SqlSession session;

	@Override
	public List<Comment> selectAll(String qid) {
		return session.selectList("comment.selectAll", qid);
	}

	@Override
	public Comment selectOne(String cid) {
		return session.selectOne("comment.selectOne", cid);
	}

	@Override
	public void insert(Comment c) {
		session.insert("comment.insert", c);
	}

	@Override
	public void update(Comment c) {
		session.update("comment.update", c);
	}

	@Override
	public void delete(String cid) {
		session.delete("comment.delete", cid);
	}

}
