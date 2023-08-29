package kr.or.dw.user.action;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.user.service.IUserService;
import kr.or.dw.user.service.UserServiceImpl;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.util.CryptoUtil;
import kr.or.dw.web.IAction;

public class UserDeleteAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		

		
		IUserService service = UserServiceImpl.getInstance();
		
		HttpSession session = req.getSession();
		String gb_del = ((UserVO) session.getAttribute("UserVO")).getGb_del();

		UserVO userVO = new UserVO();
		userVO.setGb_del(gb_del);

		int user_no = Integer.parseInt(req.getParameter("user_no"));
		int result = service.deleteUser(user_no);
		
		req.setAttribute("result", result);
	
//		session.setAttribute("UserVO", userVO);
		session.invalidate();
		
		return "/user/userDelete.jsp";
	}

}
