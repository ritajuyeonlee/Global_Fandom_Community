package gfc.dao;

import org.apache.ibatis.annotations.Mapper;

import gfc.dto.Comment;

@Mapper
public interface CommentMapper {

	public int addComment(Comment comment);
}
