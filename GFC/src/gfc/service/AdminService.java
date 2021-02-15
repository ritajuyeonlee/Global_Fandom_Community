package gfc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gfc.dao.AdminMapper;
import gfc.dao.LocationsMapper;

@Service
@Transactional
public class AdminService {
	@Autowired
	private LocationsMapper locationMapper;
	@Autowired
	private AdminMapper adminMapper;

	public int confirmLocation(int lcode) {
		try {
			System.out.println(lcode);
			return adminMapper.confirmLocation(lcode);
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

}