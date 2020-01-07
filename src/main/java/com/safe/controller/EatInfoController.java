package com.safe.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.safe.service.IEatInfoService;
import com.safe.service.IFoodService;
import com.safe.vo.Food;

@CrossOrigin("*")
@Controller
public class EatInfoController {
	final static int numOfFoods = 20;
	@Autowired
	IEatInfoService eservice;
	@Autowired
	IFoodService fservice;
	Date today = new Date();

	@SuppressWarnings("deprecation")
	@GetMapping("/eatInfo.sf")
	public String eatInfo(Model model, HttpSession session,String userid) {
		String defaultDate = today.getYear() + 1900 + "-" + (today.getMonth() + 1) + "-" + today.getDate();
		model.addAttribute("date", defaultDate);
		if(userid==null) return selectByDate(model, session, defaultDate);
		else return selectByDatebyUserId(model,userid,defaultDate);
	}
	
	@GetMapping("/viewEatInfo.sf")
	public String selectByDate(Model model,String userid, @RequestParam String date) {
		int digit[] = new int[numOfFoods + 1];
		List<Integer> list = eservice.selectByDate(userid, date);
		// 해당 날짜에 먹은 코드들을 가져옴
		Collections.sort(list);
		
		double supportpereat=0;
		double calory=0;
		double carbo=0;
		double protein=0;
		double fat=0;
		double sugar=0;
		double natrium=0;
		double chole=0;
		double fattyacid=0;
		double transfat=0;
		List<Food> Foods = new ArrayList<>();
		for (int code : list) {
			digit[code]++;
			Food f = fservice.selectOne(code);
			if (digit[code] == 1) {
				Foods.add(f);
			}
			supportpereat+=f.getSupportpereat();
			calory+=f.getCalory();
			carbo+=f.getCarbo();
			protein+=f.getCarbo();
			fat+=f.getFat();
			sugar+=f.getSugar();
			natrium+=f.getNatrium();
			chole+=f.getChole();
			fattyacid+=f.getFattyacid();
			transfat+=f.getTransfat();
		}
		
		Food graph=new Food();
		
		graph.setSupportpereat(supportpereat);
		graph.setCalory(calory);
		graph.setCarbo(carbo);
		graph.setProtein(protein);
		graph.setFat(fat);
		graph.setSugar(sugar);
		graph.setNatrium(natrium);
		graph.setChole(chole);
		graph.setFattyacid(fattyacid);
		graph.setTransfat(transfat);
		
		System.out.println(graph.toString());
		
		List<Integer> nums = new ArrayList<>();
		for (int i = 1; i <= numOfFoods; i++)
			if (digit[i] != 0)
				nums.add(digit[i]);
		
		model.addAttribute("graph", graph);
		model.addAttribute("nowuser",userid);
		model.addAttribute("nums", nums);
		model.addAttribute("date", date);
		model.addAttribute("list", Foods);
		return "eatInfo";
	}
	
	
	public String selectByDatebyUserId(Model model,String userid,@RequestParam String date) {
		int digit[] = new int[numOfFoods + 1];
		List<Integer> list = eservice.selectByDate(userid, date);
		// 해당 날짜에 먹은 코드들을 가져옴
		Collections.sort(list);
		double supportpereat=0;
		double calory=0;
		double carbo=0;
		double protein=0;
		double fat=0;
		double sugar=0;
		double natrium=0;
		double chole=0;
		double fattyacid=0;
		double transfat=0;
		List<Food> Foods = new ArrayList<>();
		for (int code : list) {
			Food f = fservice.selectOne(code);
			digit[code]++;
			if (digit[code] == 1) {
				Foods.add(f);//푸드 한 종류씩만 모으려고
			}
			supportpereat+=f.getSupportpereat();
			calory+=f.getCalory();
			carbo+=f.getCarbo();
			protein+=f.getCarbo();
			fat+=f.getFat();
			sugar+=f.getSugar();
			natrium+=f.getNatrium();
			chole+=f.getChole();
			fattyacid+=f.getFattyacid();
			transfat+=f.getTransfat();
		}
		Food graph=new Food();
		graph.setSupportpereat(supportpereat);
		graph.setCalory(calory);
		graph.setCarbo(carbo);
		graph.setProtein(protein);
		graph.setFat(fat);
		graph.setSugar(sugar);
		graph.setNatrium(natrium);
		graph.setChole(chole);
		graph.setFattyacid(fattyacid);
		graph.setTransfat(transfat);
		
		
		System.out.println(graph.toString());
		
		List<Integer> nums = new ArrayList<>();
		for (int i = 1; i <= numOfFoods; i++)
			if (digit[i] != 0)	nums.add(digit[i]);
		
		model.addAttribute("graph", graph);
		model.addAttribute("nowuser",userid);
		model.addAttribute("nums", nums);
		model.addAttribute("date", date);
		model.addAttribute("list", Foods);
		return "eatInfo";
	}

	
	
	public String selectByDate(Model model, HttpSession session, @RequestParam String date) {
		int digit[] = new int[numOfFoods + 1];
		List<Integer> list = eservice.selectByDate((String) session.getAttribute("userSession"), date);
		// 해당 날짜에 먹은 코드들을 가져옴
		Collections.sort(list);
		
		double supportpereat=0;
		double calory=0;
		double carbo=0;
		double protein=0;
		double fat=0;
		double sugar=0;
		double natrium=0;
		double chole=0;
		double fattyacid=0;
		double transfat=0;
		
		
		List<Food> Foods = new ArrayList<>();
		for (int code : list) {
			digit[code]++;
			Food f = fservice.selectOne(code);
			if (digit[code] == 1) {
				Foods.add(f);
			}
			supportpereat+=f.getSupportpereat();
			calory+=f.getCalory();
			carbo+=f.getCarbo();
			protein+=f.getCarbo();
			fat+=f.getFat();
			sugar+=f.getSugar();
			natrium+=f.getNatrium();
			chole+=f.getChole();
			fattyacid+=f.getFattyacid();
			transfat+=f.getTransfat();
		}
		Food graph=new Food();
		graph.setSupportpereat(supportpereat);
		graph.setCalory(calory);
		graph.setCarbo(carbo);
		graph.setProtein(protein);
		graph.setFat(fat);
		graph.setSugar(sugar);
		graph.setNatrium(natrium);
		graph.setChole(chole);
		graph.setFattyacid(fattyacid);
		graph.setTransfat(transfat);
		
		
		
		
		List<Integer> nums = new ArrayList<>();
		for (int i = 1; i <= numOfFoods; i++)
			if (digit[i] != 0)
				nums.add(digit[i]);
		
		
		model.addAttribute("graph", graph);
		model.addAttribute("nowuser",(String) session.getAttribute("userSession"));
		model.addAttribute("nums", nums);
		model.addAttribute("date", date);
		model.addAttribute("list", Foods);
		return "eatInfo";
	}
	

	@PostMapping("/addEatInfo.sf")
	public String addEatInfo(HttpServletRequest request, HttpSession session, String date, int code) {
		eservice.insert((String) session.getAttribute("userSession"), date, code);
		String[] referer = request.getHeader("Referer").split("/");
		return "redirect:/" + referer[referer.length - 1];
	}

	@GetMapping("/deleteEatInfo.sf")
	public String deleteEatInfo(Model model, HttpSession session, @RequestParam String edate, @RequestParam int code) {
		eservice.delete((String) session.getAttribute("userSession"), edate, code);
		return selectByDate(model, session, edate);
	}

	@GetMapping("/cartInfo.sf")
	public String cartInfo(Model model, HttpSession session) {
		List<Food> cart = (List<Food>) session.getAttribute("cartSession");
		model.addAttribute("cart", cart);

		return "cartInfo";
	}

}
