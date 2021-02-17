package gfc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gfc.dto.Artist;
@Mapper
public interface ArtistsMapper {
	int addArtist(Artist artist);
	List<Artist> getArtistList();
}
