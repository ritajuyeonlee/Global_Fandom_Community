package gfc.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AdminMapper {
	public int confirmLocation(@Param("lcode")int lcode);

}
