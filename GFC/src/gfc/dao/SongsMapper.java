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
	public List<Song> getSongList();
}
