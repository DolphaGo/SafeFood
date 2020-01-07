package com.safe.service;

import java.util.List;

import com.safe.vo.Food;

public interface IFoodService {
	public List<Food> selectAll();

	public Food selectOne(int code);

	public List<Food> selectByCondition(int key, String word);
}
