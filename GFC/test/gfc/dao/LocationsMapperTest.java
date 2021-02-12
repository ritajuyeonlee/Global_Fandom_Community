package gfc.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import gfc.config.ApplicationConfig;
import gfc.dto.Location;
import gfc.dto.Song;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = ApplicationConfig.class)
public class LocationsMapperTest {
	@Autowired
	private LocationsMapper locationsMapper;
	
	@Test
	public void getLocation() throws Exception {
		Location location = locationsMapper.getLocation(1);
		System.out.println(location);
		assertNotNull(location);
		assertEquals("아이유 부모님네 카페", location.getLname());
	}

	@Test
	public void addLocation() throws Exception {
		Location location = new Location();
		location.setAcode(1);
		location.setLname("리에주커피");
		location.setLaddress("서울특별시 광진구 군자동 군자로 162 1층");
		location.setLdesc("아이유 부모님이 하시는 이쁜 디저트 카페~!");
		location.setUcode(2);
		System.out.println(location);
		int ret = locationsMapper.addLocation(location);
		assertEquals(1, ret);
		assertNotNull(locationsMapper.getLocation(location.getLcode()));
	}
	
}
