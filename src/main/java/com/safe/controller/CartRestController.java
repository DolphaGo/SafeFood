package com.safe.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.safe.service.IFoodService;
import com.safe.vo.Food;

@RestController
public class CartRestController {
	
	@Autowired
	IFoodService service;
	
	@PostMapping("/addCart.sf/{code}")
	public boolean addCart(HttpSession session,@PathVariable int code) {
		List<Food> cart=(List<Food>)session.getAttribute("cartSession"); //현재 카트의 세션
		Food food=service.selectOne(code);
		boolean flag=true;
		for(Food cartList:cart) {
			if(cartList.getName().equals(food.getName())) {
				flag=false;
				break;
			}
		}
		if(flag) {
			cart.add(food);
			session.setAttribute("cartSession",cart);
			return true;
		}
		return false;
	}
	@DeleteMapping("/deleteCart.sf/{code}")
	public boolean deleteCart(HttpSession session,@PathVariable int code) {
		List<Food> cart=(List<Food>)session.getAttribute("cartSession"); //현재 카트의 세션
		for(int i=0;i<cart.size();i++) {
			Food f=cart.get(i);
			if(f.getCode()==code) {
				cart.remove(i);
				session.setAttribute("cartSession",cart);
				return true;
			}
		}
		return false;
	}
	
}
