package gfc.controller;

import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import gfc.dto.Artist;
import gfc.dto.Location;
import gfc.service.ArtistService;

@Controller
@RequestMapping(path = { "/", "/artist" })
public class ArtistController {
	@Autowired
	private ArtistService artistService;

	@GetMapping("/addArtistForm")
	public String addArtistForm() {
		return "artist/addArtistForm";
	}

	@PostMapping("/addArtist")
	public String AddArtist(Artist artist) throws ParseException {
		int result = artistService.addArtist(artist);
		if (result == 1)
			return "redirect:/artistList";
		else
			return "redirect:/addArtistForm";
	}

	@GetMapping("/artistList")
	public String artistlist(Model model) {
		List<Artist> artists = artistService.getArtistList();
		model.addAttribute("artistList", artists);
		return "artist/artistList";
	}

}
