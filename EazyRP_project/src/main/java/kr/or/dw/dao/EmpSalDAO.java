package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.DeptVO;
import kr.or.dw.vo.EmpVO;
import kr.or.dw.vo.MerchandiseVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.ShopVO;
import kr.or.dw.vo.SiVO;

@Mapper
public interface EmpSalDAO {

	List<Map<String, Object>> selectEmpList(@Param("cri") SearchCriteria cri, RowBounds rowBounds, @Param("c_no") String c_no) throws SQLException;

	int selectEmpListCount(@Param("cri") SearchCriteria cri, @Param("c_no") String c_no) throws SQLException;

	Map<String, Object> selectDetail(int emp_no) throws SQLException;

	List<CompanyVO> getCompany(Map<String, String> dataMap) throws SQLException;

	List<CompanyVO> getCompanyList() throws SQLException;

	List<DeptVO> getDept(Map<String, String> dataMap) throws SQLException;

	List<DeptVO> getDeptList() throws SQLException;

	void insertEmp(EmpVO empVO) throws SQLException;

	List<EmpVO> getEmp(Map<String, String> dataMap) throws SQLException;

	List<EmpVO> getEmpList(String c_no) throws SQLException;

	void modifyEmp(EmpVO empVO) throws SQLException;

	void deleteEmp(EmpVO empVO) throws SQLException;

	List<Map<String, Object>> selectExtrapayList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	int selectExtrapayListCount(SearchCriteria cri) throws SQLException;

	
}
