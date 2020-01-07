package com.safe.controller;

import java.io.File;

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

import com.safe.service.INoticeService;
import com.safe.vo.Notice;

@CrossOrigin("*")
@Controller
public class NoticeController {
	@Autowired
	INoticeService service;

	@GetMapping("/notice.sf")
	public String notice(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type) {
		if (type == 0)
			model.addAllAttributes(service.getNoticeList(page));
		else {
			model.addAllAttributes(service.getNoticeListByCondition(page, type, keyword));
			model.addAttribute("keyword", keyword);
			model.addAttribute("type", type);
		}
		return "notice";
	}

	@GetMapping("/noticeWrite.sf")
	public String noticeWrite(Model model) {
		return "noticeWrite";
	}

	@PostMapping("/noticeWrite.sf")
	public String noticeWriteProcess(String title, String content, @RequestParam("ufile") MultipartFile file) {
		Notice n = new Notice(null, null, title, content, 0);
		service.insert(n, file);
		return "redirect:/notice.sf";
	}

	@GetMapping("/noticeView.sf")
	public String noticeView(Model model, @RequestParam String nid, @RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type) {
		Notice n = service.selectOne(nid);
		model.addAttribute("n", n);
		model.addAttribute("page", page);
		model.addAttribute("keyword", keyword);
		model.addAttribute("type", type);
		return "noticeView";
	}

	@GetMapping("/noticeUpdate.sf")
	public String noticeUpdate(Model model, String nid) {
		Notice n = service.selectOne(nid);
		model.addAttribute("n", n);
		return "noticeUpdate";
	}

	@PostMapping("/noticeUpdate.sf")
	public String noticeUpdateProcess(Model model, String nid, String title, String content,
			@RequestParam("ufile") MultipartFile file) {
		Notice n = service.selectOne(nid);
		n.setTitle(title);
		n.setContent(content);
		service.update(n, file);
		model.addAttribute("n", n);
		return "noticeView";
	}

	@GetMapping("/noticeDelete.sf")
	public String noticeDelete(Model model, String nid) {
		service.delete(nid);
		return "redirect:/notice.sf";
	}

	@RequestMapping("/download.sf")
	public View download(String nid) {
		File attachFile = service.getAttachedFile(nid);
		View view = new DownloadView(attachFile);
		return view;
	}

}
