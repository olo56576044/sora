package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.MerchandiseVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.ShopVO;
import kr.or.dw.vo.SiVO;
import kr.or.dw.vo.WareHouseVO;

@Mapper
public interface WarehouseDAO {

	List<Map<String, Object>> selectWarehouseList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	int selectWarehouseListCount(SearchCriteria cri) throws SQLException;

	Map<String, Object> selectWarehouseDetail(String wh_no) throws SQLException;

	List<CompanyVO> selectFindCompanyList() throws SQLException;

	List<CompanyVO> selectFindSearchCompany(Map<String, String> dataMap) throws SQLException;

	void updateWarehouse(WareHouseVO warehouse) throws SQLException;

	void insertWarehouse(WareHouseVO warehouse) throws SQLException;

	void deleteWarehouse(WareHouseVO warehouse) throws SQLException;

	
	
}
