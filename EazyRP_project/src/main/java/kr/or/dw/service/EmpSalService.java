package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.DeptVO;
import kr.or.dw.vo.EmpVO;
import kr.or.dw.vo.ShopVO;
import kr.or.dw.vo.SiVO;

public interface EmpSalService {

	Map<String, Object> selectEmpList(SearchCriteria cri, String c_no) throws SQLException;

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

	Map<String, Object> selectExtrapayList(SearchCriteria cri) throws SQLException;



}
