package com.safe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.safe.vo.User;

@Repository("userdao")
public class UserDAO implements IUserDAO {

	@Autowired
	SqlSession session;

	public boolean login(String id, String pass) {
		boolean loginCheck = false;

		if (session.selectOne("user.login", id).equals(pass)) {
			loginCheck = true;
		}
		return loginCheck;
	}

	public int join(User u) {
		int r = session.insert("user.join", u);
		return r;
	}

	public User selectInfoUser(String id) {
		return session.selectOne("user.selectInfoUser", id);
	}

	public List<User> search(String id) {
		return session.selectList("user.searchById", "%" + id + "%");
	}

	@Override
	public void delete(String id) {
		session.delete("user.delete", id);
	}

	@Override
	public void update(User u) {
		session.update("user.update", u);
	}
}
