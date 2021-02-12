package gfc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import gfc.dto.Location;
import gfc.service.LocationService;

@Controller
@RequestMapping(path = {"/", "/location"})
public class LocationController {
	@Autowired
	private LocationService locationService;
	
	@GetMapping("/addLocationForm")
	public String addlocationForm() {
		return "location/addLocationForm";
	}
	
	@GetMapping("/map")
	public String map() {
		return "location/map";
	}

	@PostMapping("/addLocation")
	public String addlocation(Location location) {
		System.out.println(location);
		int result = locationService.addLocation(location);
		if (result == 1)
			//return "redirect:/location/locationList";
			return "redirect:/locationList";
		else
			return "redirect:/addLocationForm";
	}
	
	@GetMapping("/locationList")
	public String locationlist(Model model) {
		List<Location> locations = locationService.getLocationList();
		model.addAttribute("locationList", locations);
		return "location/locationList";
	}
}
