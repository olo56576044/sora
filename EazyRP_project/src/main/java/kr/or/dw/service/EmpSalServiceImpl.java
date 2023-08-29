package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.EmpSalDAO;
import kr.or.dw.dao.MerchandiseDAO;
import kr.or.dw.dao.ShopDAO;
import kr.or.dw.dao.SiDAO;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.DeptVO;
import kr.or.dw.vo.EmpVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.ShopVO;
import kr.or.dw.vo.SiVO;


@Service
public class EmpSalServiceImpl implements EmpSalService {

	@Autowired
	private EmpSalDAO empsalDAO;

	@Override
	public Map<String, Object> selectEmpList(SearchCriteria cri, String c_no) throws SQLException {

		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);	// RowBounds : 쿼리에서 페이징 처리된 결과를 알아서 필요한 만큼 가져온다.

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기
		List<Map<String, Object>> empList = empsalDAO.selectEmpList(cri, rowBounds, c_no);
		// 전체 board 개수
		int totalCount = empsalDAO.selectEmpListCount(cri, c_no);

		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("empList", empList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> selectDetail(int emp_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		Map<String, Object> emp = (Map<String, Object>) empsalDAO.selectDetail(emp_no);
		
		dataMap.put("emp", emp);
		return dataMap;
	}

	@Override
	public List<CompanyVO> getCompany(Map<String, String> dataMap) throws SQLException {
		
		List<CompanyVO> company = null;
		company = empsalDAO.getCompany(dataMap);
		
		return company;
	}

	@Override
	public List<CompanyVO> getCompanyList() throws SQLException {
		
		List<CompanyVO> company = null;
		company = empsalDAO.getCompanyList();
		
		return company;
	}

	@Override
	public List<DeptVO> getDept(Map<String, String> dataMap) throws SQLException {
		
		List<DeptVO> dept = null;
		dept = empsalDAO.getDept(dataMap);
		
		return dept;
	}

	@Override
	public List<DeptVO> getDeptList() throws SQLException {
		
		List<DeptVO> dept = null;
		dept = empsalDAO.getDeptList();
		
		return dept;
	}

	@Override
	public void insertEmp(EmpVO empVO) throws SQLException {
		
		empsalDAO.insertEmp(empVO);
		
	}

	@Override
	public List<EmpVO> getEmp(Map<String, String> dataMap) throws SQLException {
		
		List<EmpVO> emp = null;
		emp = empsalDAO.getEmp(dataMap);
		
		return emp;
	}

	@Override
	public List<EmpVO> getEmpList(String c_no) throws SQLException {
		
		List<EmpVO> emp = null;
		emp = empsalDAO.getEmpList(c_no);
		
		return emp;
	}

	@Override
	public void modifyEmp(EmpVO empVO) throws SQLException {
		
		empsalDAO.modifyEmp(empVO);
		
	}

	@Override
	public void deleteEmp(EmpVO empVO) throws SQLException {
		
		empsalDAO.deleteEmp(empVO);
		
	}

	@Override
	public Map<String, Object> selectExtrapayList(SearchCriteria cri) throws SQLException {
	
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);		// RowBounds : 쿼리에서 페이징 처리된 결과를 알아서 필요한 만큼 가져온다.

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기
//		merchandiseList = merchandiseDAO.selectMerchandiseList(cri, rowBounds);
		List<Map<String, Object>> extrapayList = empsalDAO.selectExtrapayList(cri, rowBounds);
		// 전체 board 개수
		int totalCount = empsalDAO.selectExtrapayListCount(cri);

		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("extrapayList", extrapayList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	
}
