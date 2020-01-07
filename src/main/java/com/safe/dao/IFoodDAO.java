package com.safe.dao;

import java.util.List;

import com.safe.vo.Food;

public interface IFoodDAO {

	List<Food> selectAll();

	Food selectOne(int code);

	List<Food> selectByCondition(int condition, String word);

	void updateCount(int code);
}
