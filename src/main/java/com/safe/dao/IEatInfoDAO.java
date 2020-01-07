package com.safe.dao;

import java.util.List;

public interface IEatInfoDAO {
	public List<Integer> selectByDate(String id, String date);

	public void insert(String id, String date, int code);

	public void delete(String id, String date, int code);
}
