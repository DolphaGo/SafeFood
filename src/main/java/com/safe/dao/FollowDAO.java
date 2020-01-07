package com.safe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.safe.vo.Follow;

@Repository("followdao")
public class FollowDAO implements IFollowDAO {

	@Autowired
	SqlSession session;
	
	@Override
	public List<Follow> selectAllFollower(String id) {
		return session.selectList("follow.selectAllFollower",id);
	}
	@Override
	public List<Follow> selectAllFollowing(String id) {
		return session.selectList("follow.selectAllFollowing",id);
	}

	@Override
	public Follow selectOne(String fid) {
		return session.selectOne("follow.selectOne",fid);
	}

	@Override
	public void insert(Follow f) {
		session.insert("follow.insert",f);
	}

	@Override
	public void update(Follow f) {
		session.update("follow.update",f);
	}

	@Override
	public void delete(String fid) {
		session.delete("follow.delete",fid);
	}

	
}
