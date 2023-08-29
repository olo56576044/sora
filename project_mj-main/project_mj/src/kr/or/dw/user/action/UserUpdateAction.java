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

public class UserUpdateAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		IUserService service = UserServiceImpl.getInstance();
		
		HttpSession session = req.getSession();
		String user_email = ((UserVO) session.getAttribute("UserVO")).getUser_email(); // 상재오빠한테 물어보기 
		
		
			int user_no = Integer.parseInt(req.getParameter("user_no")); // 히든으로 가져와야함
			String user_pass = req.getParameter("user_pass");   //  
			String user_nick = req.getParameter("user_nick");

			UserVO userVO = new UserVO();
			userVO.setUser_no(user_no);
			userVO.setUser_nick(user_nick);
			try {
				user_pass = CryptoUtil.sha512(user_pass);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			userVO.setUser_pass(user_pass);
			
			
			int result = service.updateUser(userVO);
			
			req.setAttribute("result", result);
			
			userVO = service.loginUser(user_email);		// 상재오빠한테 물어보기 
			
			session.setAttribute("UserVO", userVO);		// 상재오빠한테 물어보기 

		
		return "/user/userUpdateSuccess.jsp";
	}

}
