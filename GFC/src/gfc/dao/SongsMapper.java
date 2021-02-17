package gfc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import gfc.dto.Song;

@Mapper
public interface SongsMapper {
	public int getSongCnt();		// 노래 갯수 반환
	public Song getSong(int scode);
	public List<Song> getAllSong();
	public int addSong(Song song);
	
	public List<Song> getSongList(int page);		// songlist.jsp => 전체 곡 추가한 순서 리스트
	public List<Song> mainList(int rownum);	// main.jsp , songMain.jsp(로그인 x) => 전체 곡 조회수 순위 리스트
	public Song recommendSong(int songCnt);			// main.jsp => 랜덤 추천곡
	
	public List<Song> favoriteList(int acode);	// songMain.jsp(로그인 O) => 최애 곡 리스트 
	public Song favoriteSong(int acode);	// 최애 조회수 1등
	
	public List<Song> searchSong(Map<String,Object> map);
	public int getSearchSongCnt(Map<String,Object> map);
	
	public void updateViewCnt(int scode);
}