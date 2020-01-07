package com.safe.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.safe.vo.Notice;

public interface INoticeService {
	public List<Notice> selectAll();

	public Notice selectOne(String num);

	public void insert(Notice n, MultipartFile file);

	public void update(Notice n, MultipartFile file);

	public void delete(String num);

	public int getStartPage(int page);

	public int getEndPage(int page);

	public int getLastPage(int numOfNotices);

	public int getOffset(int page);

	public File getAttachedFile(String nid);

	public HashMap<String, Object> getNoticeList(int page);

	public HashMap<String, Object> getNoticeListByCondition(int page, int type, String keyword);
}
