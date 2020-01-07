package com.safe.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.safe.controller.FileRenamePolicy;
import com.safe.dao.INoticeDAO;
import com.safe.vo.Notice;

@Service("noticeservice")
public class NoticeServiceImpl implements INoticeService {
	String path = "C:/Users/student/git/safefood/src/main/webapp/Temp/attach/";
	
	@Autowired
	INoticeDAO dao;

	@Override
	public List<Notice> selectAll() {
		return dao.selectAll();
	}

	@Override
	public Notice selectOne(String num) {
		dao.viewCount(num);
		return dao.selectOne(num);
	}

	@Override
	public void insert(Notice n, MultipartFile file) {
		File dir = new File(path);
		if (!dir.canExecute())
			dir.mkdir();

		String fileName = file.getOriginalFilename();
		File attachFile = new File(path + fileName);

		FileRenamePolicy policy = new FileRenamePolicy();
		attachFile = policy.rename(attachFile);

		try {
			file.transferTo(attachFile);
			n.setFilename(attachFile.getName());
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		dao.insert(n);
	}

	@Override
	public void update(Notice n, MultipartFile file) {
		File dir = new File(path);
		if (file.getSize() == 0) {
			n.setFilename(dao.selectOne(n.getNid()).getFilename());
		} else {
			if (!dir.canExecute())
				dir.mkdir();

			String fileName = file.getOriginalFilename();
			File attachFile = new File(path + fileName);

			FileRenamePolicy policy = new FileRenamePolicy();
			attachFile = policy.rename(attachFile);

			try {
				file.transferTo(attachFile);
				n.setFilename(attachFile.getName());
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}

		dao.update(n);
	}

	@Override
	public void delete(String num) {
		dao.delete(num);
	}

	@Override
	public int getStartPage(int page) {
		return page - ((page - 1) % 10);
	}

	@Override
	public int getEndPage(int page) {
		return page - ((page - 1) % 10) + (10 - 1);
	}

	@Override
	public int getLastPage(int numOfNotices) {
		return (numOfNotices - 1) / 10 + 1;
	}

	@Override
	public int getOffset(int page) {
		return (page - 1) * 10 + 1;
	}

	@Override
	public HashMap<String, Object> getNoticeList(int page) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", getOffset(page));
		params.put("noticesPerPage", 10);

		HashMap<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("current", page);
		pageInfo.put("start", getStartPage(page));
		pageInfo.put("end", getEndPage(page));
		pageInfo.put("last", getLastPage(dao.getCount()));
		pageInfo.put("totalNotice", dao.getCount());
		pageInfo.put("noticeList", dao.selectPage(params));

		return pageInfo;
	}

	@Override
	public HashMap<String, Object> getNoticeListByCondition(int page, int type, String keyword) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", getOffset(page));
		params.put("noticesPerPage", 10);
		params.put("type", type);
		params.put("keyword", keyword);

		HashMap<String, Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("current", page);
		pageInfo.put("start", getStartPage(page));
		pageInfo.put("end", getEndPage(page));
		pageInfo.put("last", getLastPage(dao.getCountByKeyword(params)));
		pageInfo.put("totalNotice", dao.getCountByKeyword(params));
		pageInfo.put("noticeList", dao.selectNoticeByKeyword(params));

		return pageInfo;
	}

	@Override
	public File getAttachedFile(String nid) {
		Notice n = dao.selectOne(nid);
		String fileName = n.getFilename();

		return new File(path + fileName);
	}
}
