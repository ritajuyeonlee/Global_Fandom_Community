package gfc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gfc.dao.ArtistsMapper;
import gfc.dto.Artist;

@Service
@Transactional
public class ArtistService {
	@Autowired
	private ArtistsMapper artistmapper;

	public int addArtist(Artist artist) {
		return artistmapper.addArtist(artist);
	}

	public List<Artist> getArtistList() {
		return artistmapper.getArtistList();
	}
}
