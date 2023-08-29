package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;

@Mapper
public interface AsDAO {

	List<Map<String, Object>> selectAsList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	int selectAsListCount(SearchCriteria cri) throws SQLException;

	
}
