package kr.or.dw.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.web.IAction;

public class UserDeleteAction implements IAction{

	@Override
	public boolean isRedirect() {
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		int user_no = Integer.parseInt(req.getParameter("user_no"));
		IAdminService service = AdminServiceImpl.getInstance();
		int result = service.deleteUser(user_no);
		
		return "/admin/modifyUserForm.do";
	}

}
