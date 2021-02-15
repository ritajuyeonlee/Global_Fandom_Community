package gfc.dao;

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
	
}
