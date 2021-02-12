package gfc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gfc.dao.LocationsMapper;
import gfc.dto.Location;

@Service
@Transactional
public class LocationService {
	@Autowired
	private LocationsMapper locationMapper;

	public int addLocation(Location location) {
		try {
			return locationMapper.addLocation(location);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public Location getLocation(int lcode) {
		return locationMapper.getLocation(lcode);
	}

	public List<Location> getLocationList() {
		return locationMapper.getLocationList();
	}

}
