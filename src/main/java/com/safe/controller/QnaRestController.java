package com.safe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.safe.service.ICommentService;
import com.safe.service.IQnaService;
import com.safe.vo.Comment;
import com.safe.vo.Qna;

@CrossOrigin("*")
@RestController
public class QnaRestController {

	@Autowired
	IQnaService service;

	@Autowired
	ICommentService cervice;

	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public List<Qna> selectAll() {
		return service.selectAll();
	}

	@RequestMapping(value = "/qna/{qid}", method = RequestMethod.GET)
	public Map<String, Object> selectOne(@PathVariable String qid) {
		Map<String, Object> hm = new HashMap<>();
		Qna q = service.selectOne(qid);
		List<Comment> list = cervice.selectAll(qid);
		hm.put("qna", q);
		hm.put("comment", list);
		return hm;
	}

	@RequestMapping(value = "/qna/{qid}", method = RequestMethod.DELETE)
	public Map<String, String> delete(@PathVariable String qid) {
		service.delete(qid);
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "delete success");
		return map;
	}

	@RequestMapping(value = "/comment/{cid}", method = RequestMethod.DELETE)
	public Map<String, String> deletecomment(@PathVariable String cid) {
		cervice.delete(cid);
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "delete success");
		return map;
	}

	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	public Map<String, String> addcomment(@RequestBody Comment c) {
		cervice.insert(c);
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "insert success");
		return map;
	}

	@RequestMapping(value = "/qna", method = RequestMethod.POST)
	public Map<String, String> insert(@RequestBody Qna q) {
		service.insert(q);
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "insert success");
		return map;
	}

	@RequestMapping(value = "/qna", method = RequestMethod.PUT)
	public Map<String, String> update(@RequestBody Qna q) {
		service.update(q);
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "update success");
		return map;
	}

}
