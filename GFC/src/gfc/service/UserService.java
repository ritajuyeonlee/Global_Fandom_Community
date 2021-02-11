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

	public int loginUser(String userid, String userpw) {
		// id 존재 확인 > 있으면 pw 맞는지 확인
		// 맞으면 로그인 성공 > 메인페이지 (세션)
		// 틀리면 로그인 화면
		try {
			User user = userMapper.getUser(userid);
			if (user != null) {
				if (user.getUserpw().equals(userpw)) {
					// 성공 > 메인화면
					// 세션처리...
					return 1;
				}
			}
			// 실패 > 로그인 화면
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
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
