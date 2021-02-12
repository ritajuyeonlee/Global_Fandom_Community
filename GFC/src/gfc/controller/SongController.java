package gfc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import gfc.dto.Song;
import gfc.service.SongService;

@Controller
@RequestMapping(path = {"/", "/song"})
public class SongController {
	@Autowired
	private SongService songService;
	
	@GetMapping("/addSongForm")
	public String addsongForm() {
		return "song/addSongForm";
	}

	@PostMapping("/addSong")
	public String addsong(Song song) {
		System.out.println(song);
		int result = songService.addSong(song);
		if (result == 1)
			return "redirect:/song/songList";
		else
			return "redirect:/song/addSongForm";
	}
	
	@GetMapping("/songList")
	public String songlist(Model model) {
		List<Song> songs = songService.getSongList();
		model.addAttribute("songList", songs);
		return "song/songList";
	}
}
