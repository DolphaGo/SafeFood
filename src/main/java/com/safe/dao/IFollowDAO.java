package com.safe.dao;

import java.util.List;

import com.safe.vo.Follow;

public interface IFollowDAO {
	public List<Follow> selectAllFollower(String id); 
	public List<Follow> selectAllFollowing(String id); 
	public Follow selectOne(String fid);
	public void insert(Follow f);
	public void update(Follow f);
	public void delete(String fid);
}
