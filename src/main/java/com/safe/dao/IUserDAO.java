package com.safe.dao;

import java.util.List;

import com.safe.vo.User;

public interface IUserDAO {
	boolean login(String id, String pass);

	int join(User u);

	User selectInfoUser(String id);

	List<User> search(String id);

	void delete(String id);

	void update(User u);
}
