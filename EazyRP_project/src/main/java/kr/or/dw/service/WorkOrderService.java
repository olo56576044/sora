package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.WorkOrderVO;

public interface WorkOrderService {
	Map<String, Object> selectWorkOrderList(Map<String, Object> map) throws SQLException;

	void registWorkOrder(List<WorkOrderVO> woList) throws SQLException;

	Map<String, Object> selectWorkOrderDetail(String wo_no) throws SQLException;
}
