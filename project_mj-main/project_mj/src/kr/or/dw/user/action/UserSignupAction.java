package kr.or.dw.user.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.dw.user.service.IUserService;
import kr.or.dw.user.service.UserServiceImpl;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.util.CryptoUtil;
import kr.or.dw.web.IAction;

public class UserSignupAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		UserVO vo = new UserVO();
//		vo.setUser_email(req.getParameter("user_email"));
//		vo.setUser_pass(req.getParameter("user_pass"));
//		vo.setUser_nick(req.getParameter("user_nick"));
//		vo.setUser_name(req.getParameter("user_name"));

		
		BeanUtils bean = new BeanUtils();
		
		try {
			bean.populate(vo, req.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		// 비밀번호 암호화 
		String user_pass = req.getParameter("user_pass");
		try {
			user_pass = CryptoUtil.sha512(user_pass);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		vo.setUser_pass(user_pass);
		
		IUserService service = UserServiceImpl.getInstance();
		int user_no = service.insertUser(vo);
		req.setAttribute("user_no", user_no);
		
		return "/user/userSignupSuccess.jsp";

	
//		res.setContentType("application/json; charset=UTF-8");
//		String nick = req.getParameter("nick");
//		return null;

	}

}
