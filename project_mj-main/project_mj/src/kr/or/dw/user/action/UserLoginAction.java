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

public class UserLoginAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		String user_email = req.getParameter("user_email");
		String user_pass = req.getParameter("user_pass");
		
		IUserService service = UserServiceImpl.getInstance();
		
		UserVO vo = service.loginUser(user_email);
		
		String cpass = "";
		try {
			cpass = CryptoUtil.sha512(user_pass);	// 암호화 
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		int result = 0;
		
		if(vo != null && (cpass.equals(vo.getUser_pass()))) {
			if(vo.getGb_del().equals("Y")) {
				result = 2;
			} else {
				result = 1;
				HttpSession session = req.getSession();
				session.setAttribute("UserVO", vo);
			}
		};
		
		
		
		req.setAttribute("result", result);
		
		return "/user/userLoginResult.jsp";
	}

}
