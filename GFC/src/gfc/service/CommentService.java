package gfc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gfc.dao.CommentMapper;
import gfc.dto.Comment;

@Service
public class CommentService {
	
	@Autowired
	CommentMapper commentMapper;

	public int addComment(Comment comment) {
		return commentMapper.addComment(comment);
	}
	
	public List<Comment> getCommentList(int scode){
		return commentMapper.getCommentList(scode);
	}
}
