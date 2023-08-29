package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.SiVO;


//출하 지시서
public interface SiService {

	Map<String, Object> selectSiList(SearchCriteria cri) throws SQLException;

	Map<String, Object> selectSiDetail(String si_no) throws SQLException;

	String ename(int empno) throws SQLException;

	void insertSi(List<SiVO> siVO) throws SQLException;

	void modifySi(List<SiVO> modify, String empno) throws SQLException;

	void siRemove(String si_no) throws SQLException;
	
	
}
