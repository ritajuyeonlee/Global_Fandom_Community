package gfc.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import gfc.config.ApplicationConfig;
import gfc.dto.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = ApplicationConfig.class)
public class UsersMapperTest {

	@Autowired
	private UsersMapper usersMapper;
	
	@Test
	public void getUser() throws Exception {
		User user = usersMapper.getUser("hello");
		System.out.println(user);
		assertNotNull(user);
		assertEquals("블핑조아", user.getUname());
	}
	
	@Test
	public void addUser() throws Exception {
		User user = new User();
		user.setUserid("hello");
		user.setUname("블핑조아");
		user.setUserpw("hh");
		user.setAcode(2);
		user.setUkeyword("2");
		System.out.println(user);
		int ret = usersMapper.addUser(user);
		assertEquals(1, ret);
		assertNotNull(usersMapper.getUser(user.getUserid()));
	}
	
}

