package gfc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import gfc.dto.User;

@Mapper
public interface UsersMapper {
	public User getUser(String userid);
	public int getAcode(int ucode);
	public int addUser(User user);
	public List<User> getUserList();
	public User loginUser(@Param("userid")String userid, @Param("userpw")String userpw);
}

