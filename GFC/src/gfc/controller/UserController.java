package gfc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import gfc.dto.User;
import gfc.service.UserService;

@Controller
@RequestMapping(path = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	// @RequestMapping인데 메소드는 Get임을 함축해서 보여주는 어노테이션
	@GetMapping("/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}

	// @RequestMapping인데 메소드는 Get임을 함축해서 보여주는 어노테이션
	@PostMapping("/login")
	public String login(String userid, String userpw) {
		// login 가능한지 안한지 서비스에서
		int result = userService.loginUser(userid, userpw);
		if (result == 1)
			return "redirect:/user/userList";
		else
			return "redirect:/user/loginForm";
	}

	// @RequestMapping인데 메소드는 Get임을 함축해서 보여주는 어노테이션
	@GetMapping("/addUserForm")
	public String JoinForm() {
		return "user/addUserForm";
	}

	@PostMapping("/add")
	public String Add(User user) {
		// 보통은 sysout으로 console에 하지 않고 log 파일을 만든다던가 다른 방법으로 함
		System.out.println(user);
		int result = userService.addUser(user);
		if (result == 1)
			return "redirect:/user/userList";
		else
			return "redirect:/user/addUserForm";
	}

	@GetMapping("/userList")
	public String list(Model model) {
		List<User> users = userService.getUserList();
		model.addAttribute("userList", users);
		return "user/userList";
	}
}
