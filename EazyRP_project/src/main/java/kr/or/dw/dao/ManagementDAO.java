package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.vo.DraftGbVO;
import kr.or.dw.vo.DraftVO;
import kr.or.dw.vo.EmpVO;
import kr.or.dw.vo.PlVO;

@Mapper
public interface ManagementDAO {

	List<DraftVO> getAllDraft(Map<String, Object> dataMap, RowBounds rowBounds) throws SQLException;

	int getDraftCount(Map<String, Object> dataMap2) throws SQLException;

	void documentRegist(DraftVO draft) throws SQLException;

	DraftVO selectDraft(String dr_no) throws SQLException;

	PlVO getPl(String pl_no) throws SQLException;

	List<String> getRank(PlVO pl) throws SQLException;

	void updateDraft(Map<String, String> dataMap) throws SQLException;

	void failDraft(Map<String, String> dataMap) throws SQLException;

	String getE_name(int emp_no) throws SQLException;

	DraftVO getDraft(String dr_no) throws SQLException;

	void documentModify(DraftVO draft) throws SQLException;

	String getFileName(String dr_no) throws SQLException;

	void deleteDocument(String dr_no) throws SQLException;

	List<PlVO> getAllPl(String c_no) throws SQLException;

	int getRegistDraftCount(Map<String, Object> dataMap) throws SQLException;

	List<DraftVO> getRegistDraft(Map<String, Object> dataMap, RowBounds rowBounds) throws SQLException;

	void insertPayLine(PlVO pl) throws SQLException;

	List<EmpVO> getEmp(Map<String, String> dataMap) throws SQLException;

	List<EmpVO> getEmpList(String c_no) throws SQLException;

	void deletePayLine(String pl_no) throws SQLException;

	void modifyPayLine(PlVO pl) throws SQLException;

	List<DraftGbVO> getDraftGb() throws SQLException;


}
