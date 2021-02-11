package gfc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gfc.dto.User;

@Mapper
public interface UsersMapper {
	public int loginUser(String userid, String userpw);
	public User getUser(String userid);
	public int addUser(User user);
	public List<User> getUserList();
}

