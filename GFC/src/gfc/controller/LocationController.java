package gfc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gfc.dto.Location;
import gfc.service.LocationService;

@Controller
@RequestMapping(path = { "/", "/location" })
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
	
	@ResponseBody
	@RequestMapping(value = "/mapData")
	public List<Location> mapdata(int acode) throws Exception {
		List<Location> locations = locationService.getLocationAcode(acode);
		//System.out.println(locations);

		return locations;
	}

	@PostMapping("/addLocation")
	public String addlocation(Model model,Location location) {
		System.out.println(location);
		int result = locationService.addLocation(location);
		System.out.println(result);
		
		if (result == 1) {
			System.out.println("??");
			String msg = "장소추가 성공";
			model.addAttribute("msg", msg);
			return "location/map";
//			return "redirect:/map";
		}
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
