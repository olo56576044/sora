package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.WorkOrderVO;

@Mapper
public interface WorkOrderDAO {
	
	List<WorkOrderVO> selectSearchWorkOrderList(RowBounds rowBounds, Map<String, Object> map) throws SQLException;
	
	int selectSearchWorkOrderListCount(Map<String, Object> map) throws SQLException;
	
	// 담당자 이름 가져오기
	List<String> selectEName(int getEmp_no) throws SQLException;

	String selectWono(int wono) throws SQLException;

	void insertWorkOrder(WorkOrderVO woList) throws SQLException;

	void insertWorkOrderDetail(WorkOrderVO wo) throws SQLException;

	Map<String, Object> selectWorkOrderDetail(String wo_no) throws SQLException;

	List<Map<String, Object>> selectWorkOrderDetailList(String wo_no) throws SQLException;

}
