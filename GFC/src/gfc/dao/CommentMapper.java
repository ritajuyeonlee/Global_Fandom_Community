package gfc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gfc.dto.Comment;

@Mapper
public interface CommentMapper {

	public int addComment(Comment comment);
	public String getComment(int ccode);
	public List<Comment> getCommentList(int scode);
}
