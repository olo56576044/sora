package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.EstimateVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.WareHouseVO;

public interface EstimateService {

	Map<String, Object> selectEstimList(SearchCriteria cri) throws SQLException;

	Map<String, Object> selectDetail(String est_no) throws SQLException;

	void estimateInsert(EstimateVO vo) throws SQLException;

	List<ProductVO> getProduct(Map<String, String> map) throws SQLException;

	List<ProductVO> getProductList() throws SQLException;

	List<WareHouseVO> getWareHouse(Map<String, String> dataMap) throws SQLException;

	List<WareHouseVO> getWareHouseList() throws SQLException;

	String ename(int empno) throws SQLException;

	void insertEstimate(List<EstimateVO> vo) throws SQLException;

	String selectFile(String files) throws SQLException;

	void modifyEstimate(List<EstimateVO> modify ,String empno) throws SQLException;

	void deleteEstimate(String est_no) throws SQLException;

	
	
	

}
