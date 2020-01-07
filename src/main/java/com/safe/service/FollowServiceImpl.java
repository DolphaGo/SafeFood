package com.safe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safe.dao.IFollowDAO;
import com.safe.vo.Follow;

@Service("followservice")
public class FollowServiceImpl implements IFollowService {

	@Autowired
	IFollowDAO dao;

	@Override
	public List<Follow> selectAllFollower(String id) {
		return dao.selectAllFollower(id);
	}

	@Override
	public List<Follow> selectAllFollowing(String id) {
		return dao.selectAllFollowing(id);
	}
	
	@Override
	public Follow selectOne(String fid) {
		return dao.selectOne(fid);
	}

	@Override
	public void insert(Follow f) {
		dao.insert(f);
	}

	@Override
	public void update(Follow f) {
		dao.update(f);
	}

	@Override
	public void delete(String fid) {
		dao.delete(fid);
	}

	
}
