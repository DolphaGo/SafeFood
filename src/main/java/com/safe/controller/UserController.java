package com.safe.controller;

import java.io.File;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import com.safe.service.IUserService;
import com.safe.vo.Food;
import com.safe.vo.User;

@CrossOrigin("*")
@Controller
public class UserController {

	@Autowired
	IUserService service;

	@GetMapping("/join.sf")
	public String joinForm(Model model) {
		return "join";
	}

	@PostMapping("/join.sf")
	public String join(Model model, String id, String pass, String name, String address, String phone, String[] allergy,
			@RequestParam("ufile") MultipartFile file) {
		String secPass = encrypt(pass);
		String allergyString = Arrays.toString(allergy);
		allergyString = allergyString.substring(1, allergyString.length() - 1);
		User user = new User(id, secPass, name, address, phone, allergyString);
		service.join(user, file);
		return "redirect:/index.sf";
	}

	@GetMapping("/login.sf")
	public String login(Model model) {
		return "login";
	}

	@PostMapping("/login.sf")
	public String login(Model model, HttpSession session, String id, String pass) {
		String secPass = encrypt(pass);
		if (service.login(id, secPass)) {
			session.setAttribute("userSession", id);
			List<Food> cart = new ArrayList<>();
			session.setAttribute("cartSession", cart);
			return "redirect:/index.sf";
		} else {
			return "login";
		}
	}

	@GetMapping("/logout.sf")
	public String logout(HttpSession session) {
		session.setAttribute("userSession", null);
		session.setAttribute("cartSession", null);
		return "redirect:/index.sf";
	}

	@GetMapping("/info.sf")
	public String userInfo(Model model, HttpSession session) {
		User user = service.selectInfoUser((String) session.getAttribute("userSession"));
		String[] allergyString = user.getAllergy().split(",");
		List<String> allergyInfo = new ArrayList<>();
		for (int i = 0; i < allergyString.length; i++) {
			allergyString[i] = allergyString[i].trim();
			allergyInfo.add(allergyString[i]);
		}
		model.addAttribute("user", user);
		model.addAttribute("allergy", allergyInfo);
		return "info";
	}

	@PostMapping("/deleteUser.sf")
	public String delete(HttpSession session, String pw) {
		String id = (String) session.getAttribute("userSession");
		service.delete(id);
		session.invalidate();
		return "redirect:/index.sf";
	}

	@PostMapping("/updateUser.sf")
	public String update(HttpSession session, String pass, String name, String address, String phone, String[] allergy,
			@RequestParam("ufile") MultipartFile file) {
		String id = (String) session.getAttribute("userSession");
		String secPass = encrypt(pass);
		String allergyString = Arrays.toString(allergy);
		allergyString = allergyString.substring(1, allergyString.length() - 1);
		User user = new User(id, secPass, name, address, phone, allergyString);
		service.update(user, file);

		return "redirect:/index.sf";
	}

	@GetMapping("/searchUser.sf")
	public String search(Model model, HttpSession session, String id) {
		List<User> list = service.search(id);
		String sessionUser = (String) session.getAttribute("userSession");
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getId().equals(sessionUser)) {
				list.remove(i);
				break;
			}
		}
		model.addAttribute("id", id);
		model.addAttribute("list", list);
		return "users";
	}

	@RequestMapping("/profile.sf")
	public View profile(String id) {
		File attachFile = service.getProfileFile(id);
		View view = new DownloadView(attachFile);
		return view;
	}

	@GetMapping("/users.sf")
	public String users(Model model) {
		return "users";
	}

	public String userRead(Model model, String id) {
		User u = service.selectInfoUser(id);
		System.out.println(u);
		model.addAttribute("u", u);
		return "userRead";
	}

	public static String encrypt(String rawpass) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(rawpass.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

}
