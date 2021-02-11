package gfc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gfc.dao.SongsMapper;
import gfc.dto.Song;

@Service
@Transactional
public class SongService {
	@Autowired
	private SongsMapper songmapper;
	
	public int addSong(Song song) {
		// 회원가입을 하기 위한 비지니스 로직이 있다면 처리

		try {
			return songmapper.addSong(song);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public Song getSong(int scode) {
		return songmapper.getSong(scode);
	}

	public List<Song> getSongList() {
		return songmapper.getSongList();
	}
	
}
