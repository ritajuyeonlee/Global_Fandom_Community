package gfc.dao;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import gfc.config.ApplicationConfig;
import gfc.dto.Comment;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = ApplicationConfig.class)
public class CommentMapperTest {

	@Autowired
	CommentMapper commentMapper;
	
	@Test
	public void addComment() throws Exception{
		Comment comment = new Comment();
		
		comment.setScode(2);
		comment.setUcode(1);
		comment.setCcom("hihihi");
		
		commentMapper.addComment(comment);
	}
	
	@Test
	public void getCommentList() throws Exception{
		int scode = 1;
		
		List<Comment> commentlist =  commentMapper.getCommentList(scode);
		
		System.out.println(commentlist);
		
//		Assert.assertEquals(2, commentlist.size());
	}
	
	@Test
	public void getComment() throws Exception{
		int ccode = 3;
		
		String ccom = commentMapper.getComment(ccode);
		
		System.out.println(ccom);
		
		assertNotNull(ccom);
	}
	
}
