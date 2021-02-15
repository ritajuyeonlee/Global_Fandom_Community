package gfc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gfc.dao.UsersMapper;
import gfc.dto.User;

@Service
@Transactional
public class UserService {
	@Autowired
	private UsersMapper userMapper;

	

	public User loginUser(String userid,String userpw) {
		return userMapper.loginUser(userid, userpw);
	}
	public int addUser(User user) {
		// 회원가입을 하기 위한 비지니스 로직이 있다면 처리

		try {
			return userMapper.addUser(user);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public User getUser(String userid) {
		return userMapper.getUser(userid);
	}

	public List<User> getUserList() {
		return userMapper.getUserList();
	}
}
