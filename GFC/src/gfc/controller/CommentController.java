package gfc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gfc.dao.CommentMapper;
import gfc.dto.Comment;

@Controller
@RequestMapping(path = {"/song/songDetail"})
@ResponseBody
public class CommentController {
	
	@Autowired
	CommentMapper commentMapper;

	@GetMapping("/comment")
	public String addComment(Comment comment) {
		
		System.out.println("들어오기 성공 추카추카추카");
		System.out.println(comment);
		
		int result = commentMapper.addComment(comment);
		if(result == 1) {
			return "success";
		}
		else {
			return "fail";
		}
	}
}
