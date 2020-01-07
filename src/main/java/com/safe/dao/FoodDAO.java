package com.safe.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.safe.vo.Food;

@Repository("fooddao")
public class FoodDAO implements IFoodDAO {

	@Autowired
	SqlSession session;

	@Override
	public List<Food> selectAll() {
		return session.selectList("food.selectAll");
	}

	@Override
	public Food selectOne(int code) {
		return session.selectOne("food.selectOne", code);
	}

	@Override
	public List<Food> selectByCondition(int condition, String word) {
		HashMap<String, Object> param = new HashMap<>();
		param.put("condition", condition);
		param.put("word", word);
		return session.selectList("food.selectByCondition", param);
	}

	@Override
	public void updateCount(int code) {
		// TODO Auto-generated method stub

	}

}