package gfc.controller;

import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import gfc.dto.Song;
import gfc.service.SongService;

@Controller
@RequestMapping(path = { "/", "/song" })
public class SongController {
	@Autowired
	private SongService songService;

	@GetMapping("/addSongForm")
	public String addsongForm() {
		return "song/addSongForm";
	}

	@PostMapping("/addSong")
	public String AddSong(Song song) throws ParseException {

		String temp = songService.translate(song.getKlyric()); // 번역
		song.setFlyric(songService.convertToData(temp)); // 번역된거 추출
		
		int result = songService.addSong(song);

		if (result == 1)
			return "redirect:/songList?page=1";
		// return "redirect:/song/songList";
		else
			return "redirect:/addSongForm";
		// return "redirect:/song/addSongForm";
	}

	@GetMapping("/songList")
	public String list(Model model,int page) {
		List<Song> songs = songService.getSongList(page);
		model.addAttribute("songList", songs);
		int songCnt = songService.getSongCnt();
		model.addAttribute("msg","songlist");
		model.addAttribute("songCnt", (songCnt+3)/4);
		
		
		return "song/songList";
	}

	@GetMapping("/adminSongList")
	public String adminSongList(Model model,@RequestParam(value = "page", defaultValue="1")String page) {
		List<Song> songs = songService.getSongList(Integer.parseInt(page));
		model.addAttribute("songList", songs);
		int songCnt = songService.getSongCnt();
		model.addAttribute("msg","songlist");
		model.addAttribute("songCnt", (songCnt+3)/4);
		return "admin/adminSongList";
	}

	@GetMapping("/songDetail")
	public String songDetail(Model model, int scode) {
//		System.out.println(scode);
		songService.updateViewCnt(scode); // 조회수 증가

		Song song = songService.getSong(scode); // 해당하는 곡 정보 가져오기
		model.addAttribute("song", song);
//		System.out.println(song);
		return "song/songDetail";
	}

	@GetMapping("/songMain")

	public String songMain(Model model, int ucode,int page) {
		if(ucode == -1 || ucode == 1) {
			List<Song> mainList = songService.mainList(5); // 갯수 정해 놓을건지
//			List<Song> songs =songService.getSongList();	// 그냥 있는거 다 출력할건지
			System.out.println(mainList);
			model.addAttribute("mainList", mainList);
		}else {
			System.out.println("유저코드!");
			System.out.println(ucode);


			int acode = songService.getAcode(ucode);
			


			List<Song> favoriteList = songService.favoriteList(acode);
			System.out.println(favoriteList);
			model.addAttribute("favoriteList", favoriteList);


			Song favoriteSong = songService.favoriteSong(acode);
			model.addAttribute("favoriteSong", favoriteSong);
		}

		List<Song> songList = songService.getSongList(page);
		model.addAttribute("songList", songList);
		
		int songCnt = songService.getSongCnt();
//		System.out.println(songCnt);
		model.addAttribute("songCnt", songCnt);

		return "song/songMain";
	}

	@GetMapping("/searchSong")
	public String searchSong(Model model, @RequestParam(value = "page", defaultValue="1")String page, @RequestParam(value = "keyword") String keyword,
			@RequestParam(value = "condition") String condition) {
		List<Song> songs = songService.searchSong(keyword, condition, page);
		model.addAttribute("songList", songs);
		int songCnt=songService.getSearchSongCnt(keyword, condition);
		model.addAttribute("songCnt", (songCnt+3)/4);
		model.addAttribute("msg","search");
		model.addAttribute("keyword",keyword);
		model.addAttribute("condition",condition);

		return "song/songList";
	}
}

