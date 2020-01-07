package com.safe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safe.dao.IEatInfoDAO;

@Service("eatinfoservice")
public class EatInfoServiceImpl implements IEatInfoService {
	@Autowired
	IEatInfoDAO dao;

	@Override
	public List<Integer> selectByDate(String id, String date) {
		return dao.selectByDate(id, date);
	}

	@Override
	public void insert(String id, String date, int code) {
		dao.insert(id, date, code);
	}

	@Override
	public void delete(String id, String date, int code) {
		dao.delete(id, date, code);
	}

}
