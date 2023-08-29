package kr.or.dw.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.store.vo.ImgStoreVO;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.web.IAction;

public class InsertStoreImgFormAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		IAdminService service = AdminServiceImpl.getInstance();
		int store_no = 0;
		
		if (req.getParameter("store_no") != null) {
			store_no = Integer.parseInt(req.getParameter("store_no"));
			StoreVO storeVo = service.selectStoreView(store_no);
			List<ImgStoreVO> imgStoreVoList = service.selectImgStoreList(store_no); 
			req.setAttribute("imgStoreVoList", imgStoreVoList);
			req.setAttribute("storeVo", storeVo);
		}
		return "/admin/insertStoreImgForm.jsp";
	}

}
