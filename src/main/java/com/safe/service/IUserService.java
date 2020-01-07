package com.safe.service;

import java.io.File;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.safe.vo.User;

public interface IUserService {
	boolean login(String id, String pass);

	int join(User u, MultipartFile file);

	User selectInfoUser(String id);

	List<User> search(String id);

	void delete(String id);

	void update(User u, MultipartFile file);

	File getProfileFile(String id);
}
