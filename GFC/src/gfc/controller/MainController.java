package gfc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gfc.dto.Location;
import gfc.dto.Song;
import gfc.service.LocationService;
import gfc.service.SongService;

@Controller
public class MainController {
	@Autowired
	private SongService songService;
	
	@Autowired
	private LocationService locationService;
	@GetMapping("/main")
	public String addlocationForm(Model model) throws Exception{
		List<Song> songs = songService.mainList(5);
		model.addAttribute("songList", songs);
		
		List<Location> locations = locationService.getLocationList();
		model.addAttribute("location",locations);
		return "main";
	}
}
