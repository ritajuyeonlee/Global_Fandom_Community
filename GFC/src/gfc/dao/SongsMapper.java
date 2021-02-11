package gfc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gfc.dto.Song;

@Mapper
public interface SongsMapper {
	public Song getSong(int scode);
	public int addSong(Song song);
	public List<Song> getSongList();
}
