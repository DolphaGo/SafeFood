package com.safe.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.safe.service.IFoodService;
import com.safe.service.IUserService;
import com.safe.vo.Food;

@CrossOrigin("*")
@Controller("FoodController")
public class FoodController {
	@Autowired
	IFoodService fservice;
	@Autowired
	IUserService uservice;
	Algo algo = new Algo();

	@GetMapping("/index.sf")
	public String index(Model model) {
		model.addAttribute("list", fservice.selectAll());
		return "index";
	}

	@GetMapping("/detail.sf")
	public String detail(Model model, int code) {
		model.addAttribute("f", fservice.selectOne(code));
		return "detail";
	}

	@GetMapping("/search.sf")
	public String search(Model model, @RequestParam(defaultValue = "0") int key,
			@RequestParam(defaultValue = "0") int sort, @RequestParam(defaultValue = "") String word) {
		List<Food> list = new ArrayList<>();
		if (key == 0)
			list = fservice.selectAll();
		else
			list = fservice.selectByCondition(key, word);

		if (sort == 1)
			Collections.sort(list, new Comparator<Food>() {
				@Override
				public int compare(Food f1, Food f2) {
					return f1.getName().compareTo(f2.getName());
				}
			});
		else if (sort == 2)
			Collections.sort(list, new Comparator<Food>() {
				@Override
				public int compare(Food f1, Food f2) {
					return Double.compare(f2.getCalory(), f1.getCalory());
				}
			});
		else if (sort == 3)
			Collections.sort(list, new Comparator<Food>() {
				@Override
				public int compare(Food f1, Food f2) {
					return Integer.compare(f2.getCount(), f1.getCount());
				}
			});

		model.addAttribute("list", list);
		return "search";
	}

	@GetMapping("/best.sf")
	public String best(Model model) {
		return "best";
	}

	@GetMapping("/calcCal.sf")
	public String calcCal(Model model, String active, String height, HttpSession session) {
		double dailyCal = algo.calcCal(active, height);
		List<Food> list = fservice.selectAll();
		List<String> alergen = new ArrayList<>();
		String id = (String) session.getAttribute("userSession");

		if (id != null) {
			String[] alergyList = uservice.selectInfoUser(id).getAllergy().split(",");
			for (int i = 0; i < alergyList.length; i++) {
				String s = alergyList[i].trim();
				alergen.add(s);
			}
			list = algo.recom(list, alergen, active, height);
		} else {
			list = algo.recomPlain(list, active, height);
		}

		double mincal = algo.getBestcal();
		model.addAttribute("list", list);
		model.addAttribute("dailyCal", dailyCal);
		model.addAttribute("minCal", mincal);

		return "best";
	}

	@GetMapping("/qna.sf")
	public String QnaRequest() {
		return "qna";
	}
}