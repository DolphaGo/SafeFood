package com.safe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safe.dao.IFoodDAO;
import com.safe.vo.Food;

@Service("foodservice")
public class FoodServiceImpl implements IFoodService {

	@Autowired
	IFoodDAO dao;

	@Override
	public List<Food> selectAll() {
		return dao.selectAll();
	}

	@Override
	public Food selectOne(int code) {
		return dao.selectOne(code);
	}

	@Override
	public List<Food> selectByCondition(int key, String word) {
		return dao.selectByCondition(key, word);
	}

}
