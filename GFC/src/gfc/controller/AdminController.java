package gfc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import gfc.dto.Location;
import gfc.service.AdminService;
import gfc.service.LocationService;

@Controller
@RequestMapping(path = { "/", "/admin" })
public class AdminController {
	// 관리자용 장소컨펌메소드
	@Autowired
	private LocationService locationService;
	@Autowired
	private AdminService adminService;
	

	@GetMapping("/adminConfirmLocation")
	public String adminlocationlist(Model model) {
		List<Location> locations =locationService.getLocationList();
		model.addAttribute("locationList", locations);
		return "admin/adminConfirmLocation";
	}
	
	@PostMapping("/confirmLoc")
	public String ajaxTest(HttpServletRequest request) {
		String[] ajaxMsg=request.getParameterValues("valueArr");
		int size=ajaxMsg.length;
		for(int i=0;i<size;i++) {
			System.out.println(Integer.parseInt(ajaxMsg[i]));
			adminService.confirmLocation(Integer.parseInt(ajaxMsg[i]));
		}
		return "redirect:/adminConfirmLocation";
		//return "admin/adminConfirmLocation";
	}

}
