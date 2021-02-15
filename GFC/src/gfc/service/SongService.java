package gfc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gfc.dao.SongsMapper;
import gfc.dto.Song;

@Service
@Transactional
public class SongService {
	@Autowired
	private SongsMapper songMapper;
	
	public int addSong(Song song) {
		try {
			Map<String, Object> imap = new HashMap<String, Object>();
			Map<String, Object> smap = new HashMap<String, Object>();
			
			imap.put("img", song.getSimage().getBytes());
			smap.put("song", song);
			
			return songMapper.addSong(smap, imap);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public Song getSong(int scode) {
		return songMapper.getSong(scode);
	}

	public List<Song> getSongList() {
		List<Song> song = songMapper.getSongList();
//		for (int i=0;i<song.size(); i++) {
//			System.out.println(song.get(i).getSimage());
//			MultipartFile imageContent = (MultipartFile) song.get(i).getSimage();
//			byte[] imageContent = (byte[]) map.get("img");
//		       final HttpHeaders headers = new HttpHeaders();
//		       headers.setContentType(MediaType.IMAGE_PNG);
//		}
		return song;
	}
	
}
