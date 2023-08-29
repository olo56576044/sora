package kr.or.dw.admin.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.comm.vo.CommVO;
import kr.or.dw.util.PaginationUtil;
import kr.or.dw.web.IAction;

public class UserCommListViewAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int user_no = 0;
		user_no = Integer.parseInt(req.getParameter("user_no"));
		System.out.println(user_no);
		IAdminService service = AdminServiceImpl.getInstance();
		
		List<CommVO> userCommList = (List<CommVO>)service.selectUserCommList(user_no);
		
		req.setAttribute("user_no", user_no);
		req.setAttribute("userCommList", userCommList);
		
		return "/admin/userCommListView.jsp";
	}

}
