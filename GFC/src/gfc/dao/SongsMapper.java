package gfc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import gfc.dto.Song;

@Mapper
public interface SongsMapper {
	public Song getSong(int scode);
	public int addSong(Song song);
	public List<Song> getSongList();// songlist.jsp
	public List<Song> mainList(int rownum);	// main.jsp , songMain.jsp(로그인 x)
	
	public List<Song> favoriteList(int acode);	// songMain.jsp(로그인 O) + 
	public Song favoriteSong(int acode);	// 최애 조회수 1등
	
	public List<Song> searchSong(Map<String,String> map);
	public void updateViewCnt(int scode);
}
