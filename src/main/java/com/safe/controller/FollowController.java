package com.safe.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

import com.safe.service.IFollowService;

@CrossOrigin("*")
@Controller
public class FollowController {
	@Autowired
	IFollowService service;
	@GetMapping("/getfollowers.sf")
	String getfollowers(HttpSession session,Model model){
		String curuser=(String)session.getAttribute("userSession");
		model.addAttribute("followerList",service.selectAllFollower(curuser));
		return "follower";
	}
	
	@GetMapping("/getfollowings.sf")
	String getfollowings(HttpSession session,Model model){
		String curuser=(String)session.getAttribute("userSession");
		model.addAttribute("followingList",service.selectAllFollowing(curuser));
		return "follow";
	}
	
}
