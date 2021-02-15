package gfc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import gfc.dto.Song;

@Mapper
public interface SongsMapper {
	public Song getSong(int scode);
	public int addSong(@Param("s") Map<String, Object> smap, @Param("i") Map<String, Object> imap);
	public List<Song> getSongList();
}
