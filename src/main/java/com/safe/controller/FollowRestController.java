package com.safe.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.safe.service.IFollowService;
import com.safe.vo.Follow;

@CrossOrigin("*")
@RestController
public class FollowRestController {
	@Autowired
	IFollowService service;
	
	@PostMapping("/addfollow.sf/{id}")
	boolean addfollow(@PathVariable String id,HttpSession session) {
		String curuser=(String)session.getAttribute("userSession");
		List<Follow> followingList=service.selectAllFollowing(curuser);
		for(int i=0;i<followingList.size();i++) {
			String s=followingList.get(i).getFollow();
			if(s.equals(id)) return false;
		}
		Follow f=new Follow(null,id,curuser);
		service.insert(f);
		return true;
	}
	
	@DeleteMapping("/unfollow.sf/{id}")
	boolean unfollow(@PathVariable String id,HttpSession session) {
		String curuser=(String)session.getAttribute("userSession");
		List<Follow> followingList=service.selectAllFollowing(curuser);
		for(int i=0;i<followingList.size();i++) {
			String s=followingList.get(i).getFollow();
			if(s.equals(id)) {
				String fid=followingList.get(i).getFid();
				service.delete(fid);
				return true;
			}
		}
		return false;
	}
	
}
