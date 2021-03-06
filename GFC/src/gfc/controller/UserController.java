package gfc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import gfc.dto.User;
import gfc.service.UserService;

@Controller
@RequestMapping(path = {"/", "/user"})
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("/loginForm")
	public String loginform() {
		return "user/loginForm";
	}
	
	@PostMapping("/loginUser")
	public String loginUser(String userid, String userpw, HttpSession session, RedirectAttributes rttr) throws Exception{

		System.out.println("login");

		session.setMaxInactiveInterval(30*60);
		User login=userService.loginUser(userid, userpw);
		
		if(login==null) {
			session.setAttribute("user", null);
			session.setAttribute("ucode", null);
			rttr.addFlashAttribute("msg","fail");
			System.out.println("post login fail");
			//rttr.addAttribute("msg", "false");
			return "redirect:/loginForm";
		}else {
			int ucode=login.getUcode();
			session.setAttribute("user", login);
			session.setAttribute("ucode", ucode);
			System.out.println("post login success");
			return "redirect:/main";
		}
			
	}
	@GetMapping("/logoutUser")
	public String logoutUser(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/addUserForm")
	public String adduserform() {
		return "user/addUserForm";
	}

	@ResponseBody
	@PostMapping(value = "/dupCheck")
	public String dupcheck(int check, String id) throws Exception {
		int result = userService.checkUser(check, id);
		if (result == 0) {
			return "success";
		}
		return "error";
	}
	
	@PostMapping("/addUser")
	public String adduser(User user) {
		// 보통은 sysout으로 console에 하지 않고 log 파일을 만든다던가 다른 방법으로 함
		System.out.println(user);
		int result = userService.addUser(user);
		if (result == 1)
			return "redirect:/loginForm";
		else
			return "redirect:/addUserForm";
	}

	@GetMapping("/userList")
	public String userlist(Model model) {
		List<User> users = userService.getUserList();
		model.addAttribute("userList", users);
		return "user/userList";
	}
}
