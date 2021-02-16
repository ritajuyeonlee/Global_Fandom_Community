package gfc.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import gfc.config.ApplicationConfig;
import gfc.dto.Song;
import gfc.dto.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = ApplicationConfig.class)
@Transactional
public class SongsMapperTest {
	@Autowired
	private SongsMapper songsMapper;
	
	@Test
	public void getSong() throws Exception {
		Song song = songsMapper.getSong(3);
		System.out.println(song);
		assertNotNull(song);
//		assertEquals("Celebrity", song.getStitle());
	}

	@Test
	public void addSong() throws Exception {
		Song song = new Song();
		song.setStitle("iu song");
		song.setAcode(1);
		song.setSwriter("iu writer");
		song.setSlyricist("iu lyricist");
		song.setSdate(Date.valueOf("2020-02-01"));
		song.setSalbum("iu album");
//		song.setSimage("1");
		song.setKlyric("iu 한국가사");
		song.setYoutubelink("iu link");
		System.out.println(song);
//		int ret = songsMapper.addSong(song);
//		assertEquals(1, ret);
//		assertNotNull(songsMapper.getSong(song.getScode()));
	}
	
	@Test
	public void getSongList() throws Exception{
		List<Song> list = songsMapper.getSongList();
		
		System.out.println(list);
		
		assertNotNull(list);
//		Assert.assertEquals(8, list.size());
	}
	
	@Test 
	public void updateViewCnt() throws Exception{
		songsMapper.updateViewCnt(1);
		
	}
	
}
