package gfc.controller;

import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gfc.dao.CommentMapper;
import gfc.dto.Comment;
import gfc.service.CommentService;

@Controller
@RequestMapping(path = {"/song/songDetail"})
@ResponseBody
public class CommentController {
	
	@Autowired
	CommentMapper commentMapper;
	
	@Autowired
	CommentService commentService;

	@GetMapping("/comment")
	public String addComment(Comment comment) {
		
//		System.out.println("들어오기 성공 추카추카추카");
//		System.out.println(comment);
		
		int result = commentMapper.addComment(comment);
		if(result == 1) {
			return "success";
		}
		else {
			return "fail";
		}
	}
	
	@GetMapping("/commentList")
	public List<Comment> getCommentList(int scode){
		System.out.println("HI");
		List<Comment> commentlist =  commentMapper.getCommentList(scode);
		System.out.println(commentlist);
		
		return commentlist;
	}
	
	@GetMapping(value = "/commentTranslate", produces = "application/text; charset=utf-8")
	public String commentTranslate(int ccode) throws ParseException {
		String ccom = commentService.getComment(ccode);
		System.out.println(ccom);
		
		System.out.println("댓글 번역 시작");
		String slang = commentService.langDetection(ccom);
		String temp = "";
		
		if(slang.equals("ko")) {
			System.out.println("koko");
			temp = commentService.translate(ccom, slang, "en");
		}else if(slang.equals("en")) {
			System.out.println("enen");
			temp = commentService.translate(ccom, slang, "ko");
		}
		
		System.out.println(commentService.convertToData(temp));
		
		return commentService.convertToData(temp);
	}
}
