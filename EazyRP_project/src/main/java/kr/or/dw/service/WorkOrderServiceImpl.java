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
import kr.or.dw.dao.WorkOrderDAO;
import kr.or.dw.vo.WorkOrderVO;

@Service
public class WorkOrderServiceImpl implements WorkOrderService{

	@Autowired
	private WorkOrderDAO workOrderDAO;
	
	@Override
	public Map<String, Object> selectWorkOrderList(Map<String, Object> map) throws SQLException {
		
		List<WorkOrderVO> woList = null;
		SearchCriteria cri = (SearchCriteria) map.get("cri");
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기
		woList = workOrderDAO.selectSearchWorkOrderList(rowBounds, map);
		
		// 전체 board 개수
		int totalCount = workOrderDAO.selectSearchWorkOrderListCount(map);
		
		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("woList", woList);
		dataMap.put("pageMaker", pageMaker);
		
		// 제품의 이름을 담을 객체를 선언한다.
		// 현재 해당하는 생산입고 게시글에서 창고번호를 조회하고 매퍼에서 가져온 창고명을 넣어준다.
		for(int i = 0; i < woList.size(); i++) {
			
			int getEmp_no = woList.get(i).getEmp_no();
			List<String> eName = workOrderDAO.selectEName(getEmp_no);
			
			woList.get(i).setE_name(eName.get(i));
		
		}
		
		return dataMap;
		
	}
	
	@Override
	public void registWorkOrder(List<WorkOrderVO> woList) throws SQLException {
		
		workOrderDAO.insertWorkOrder(woList.get(0));	// woList의 get 0번째는 wo_no 이다. (wo_no_seq로 시퀀서 등록되어있음)
		
		System.out.println("insertWorkOrder 완료");

		String wo_no = woList.get(0).getWo_no();
		
		for (WorkOrderVO wo : woList) {
			wo.setWo_no(wo_no);
			workOrderDAO.insertWorkOrderDetail(wo);
		}
		
		System.out.println("insertWorkOrderDetail 완료");
		
	}

	@Override
	public Map<String, Object> selectWorkOrderDetail(String wo_no) throws SQLException {

		System.out.println("workOrderServiceImpl.selectWorkOrderDetail - 진입");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> wo = (Map<String, Object>) workOrderDAO.selectWorkOrderDetail(wo_no);
		
		List<Map<String, Object>> woDetail = workOrderDAO.selectWorkOrderDetailList(wo_no);
		
		dataMap.put("wo", wo);
		dataMap.put("woDetail", woDetail);

		return dataMap;

	}

}
