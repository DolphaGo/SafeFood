package com.safe.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.safe.controller.FileRenamePolicy;
import com.safe.dao.IUserDAO;
import com.safe.vo.User;

@Service("userservice")
public class UserServiceImpl implements IUserService {
	String path="C:/Users/student/git/safefood/src/main/webapp/Temp/profile/";
	
	@Autowired
	IUserDAO dao;

	@Override
	public boolean login(String id, String pass) {
		return dao.login(id, pass);
	}

	@Override
	public int join(User u, MultipartFile file) {
		File dir = new File(path);
		if (!dir.canExecute())
			dir.mkdir();

		String fileName = file.getOriginalFilename();
		File attachFile = new File(path + fileName);

		FileRenamePolicy policy = new FileRenamePolicy();
		attachFile = policy.rename(attachFile);

		try {
			file.transferTo(attachFile);
			u.setFilename(attachFile.getName());
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return dao.join(u);
	}

	@Override
	public User selectInfoUser(String id) {
		return dao.selectInfoUser(id);
	}

	@Override
	public List<User> search(String id) {
		return dao.search(id);
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
	}

	@Override
	public void update(User u, MultipartFile file) {
		System.out.println("file: " + file);
		File dir = new File(path);

		if (file.getSize() == 0) {
			u.setFilename(dao.selectInfoUser(u.getId()).getFilename());
		} else {
			if (!dir.canExecute())
				dir.mkdir();

			String fileName = file.getOriginalFilename();
			File attachFile = new File(path + fileName);

			FileRenamePolicy policy = new FileRenamePolicy();
			attachFile = policy.rename(attachFile);

			try {
				file.transferTo(attachFile);
				u.setFilename(attachFile.getName());
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}

		dao.update(u);
	}

	@Override
	public File getProfileFile(String id) {
		User u = dao.selectInfoUser(id);
		String fileName = u.getFilename();
		return new File(path + fileName);
	}

}
