package kr.or.dw.admin.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.web.IAction;

public class InsertStoreFormAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		// 수정시
		if (req.getParameter("store_no") != null) {
			
			int store_no = Integer.parseInt(req.getParameter("store_no"));
			StoreVO storeVo = service.selectStoreView(store_no);
			req.setAttribute("storeVo", storeVo);
			
			}
		
		List<String> tagList = service.selectTagList();
		List<String> storeCatList = service.selectStoreCatList();
		req.setAttribute("storeCatList", storeCatList);
		req.setAttribute("tagList", tagList);
		return "/admin/insertStoreForm.jsp";
	}

}
