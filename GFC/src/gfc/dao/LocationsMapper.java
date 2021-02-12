package gfc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gfc.dto.Location;

@Mapper
public interface LocationsMapper {
	public Location getLocation(int lcode);
	public int addLocation(Location location);
	public List<Location> getLocationList();
}
