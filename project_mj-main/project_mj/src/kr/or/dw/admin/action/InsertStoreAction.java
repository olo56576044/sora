package kr.or.dw.admin.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.web.IAction;

public class InsertStoreAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		IAdminService service = AdminServiceImpl.getInstance();
		StoreVO storeVo = new StoreVO();
		
		BeanUtils bean = new BeanUtils();
		
		try {
			bean.populate(storeVo, req.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		int store_no = 0;
		// 수정일 때
		if (req.getParameter("store_no") != null) {
			store_no = Integer.parseInt(req.getParameter("store_no"));
			System.out.println("[" + req.getParameterValues("gb_del")[0] + "]");
			storeVo.setGb_del(req.getParameterValues("gb_del")[0]);
			service.updateStore(storeVo);
			req.setAttribute("type", "update");
		// 등록일 때
		} else {
//			if (storeVo.getStore_url()==null) {
//				storeVo.setStore_url("");
//			}
			storeVo.setGb_del("N");
			store_no = service.insertStore(storeVo);
			req.setAttribute("type", "insert");
		}
		
		req.setAttribute("store_no", store_no);
		return "/admin/insertStoreSuccess.jsp";
	}

}
