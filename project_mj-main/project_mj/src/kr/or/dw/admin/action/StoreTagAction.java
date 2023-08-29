package kr.or.dw.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.web.IAction;

public class StoreTagAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		IAdminService service = AdminServiceImpl.getInstance();
		String tagName = req.getParameter("tag_name");
		String cmd = req.getParameter("cmd");
		int result = 0; 
		
		if (cmd.equals("insert")) {
			
			result = service.insertTagName(tagName);
			if (result == 1) {
				req.setAttribute("result", result);
				req.setAttribute("tag_name", tagName);
			} else {
				req.setAttribute("result", 0);
			}
			
		} else if (cmd.equals("delete")) {
			result = service.deleteTagName(tagName);
//			if (result == 1) {
//				System.out.println("삭제성공");
//			} else {
//				System.out.println("삭제실패");
//			}
//			
		}
		
		
		return "/admin/tag_ajax.jsp";
	}

}
