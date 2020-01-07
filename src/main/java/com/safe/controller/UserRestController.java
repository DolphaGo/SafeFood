package com.safe.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.safe.service.IUserService;
import com.safe.vo.User;

@CrossOrigin("*")
@RestController
public class UserRestController {

	@Autowired
	IUserService service;

	@GetMapping("duplecheck.sf/{id}")
	public HashMap<String, String> duplecheck(@PathVariable String id) {
		System.out.println("===========================================");
		User u = service.selectInfoUser(id);
		HashMap<String, String> map = new HashMap<>();
		if (u == null)
			map.put("msg", "ok");
		else
			map.put("msg", "fail");
		return map;
	}

}