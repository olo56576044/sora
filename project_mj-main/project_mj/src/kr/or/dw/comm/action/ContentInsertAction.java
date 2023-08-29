package kr.or.dw.comm.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.comm.service.CommServiceImpl;
import kr.or.dw.comm.service.ICommService;
import kr.or.dw.comm.vo.CommVO;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.web.IAction;

public class ContentInsertAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		UserVO userVO = (UserVO) session.getAttribute("UserVO");
		System.out.println("uservo : " + userVO);
		System.out.println(userVO.getUser_nick());
		String title = req.getParameter("bdtitle");
		String content = req.getParameter("bdcontent");
		String choice = req.getParameter("choice");
//		String user_img = userVO.getUser_img();
		CommVO commVO = new CommVO();
		commVO.setBd_title(title);
		commVO.setBd_content(content);
		
		System.out.println(userVO.getUser_no());
		commVO.setUser_no(userVO.getUser_no());
		commVO.setUser_nick(userVO.getUser_nick());
		commVO.setBd_cat(choice);
//		commVO.setUser_img(user_img);
		
		ICommService service = CommServiceImpl.getInstance();
		int bd_no = 0;
		
		if(req.getParameter("bd_no") != null ) {
			bd_no = Integer.parseInt(req.getParameter("bd_no"));
			commVO.setBd_no(bd_no);
			int result = service.updateContent(commVO);
		}else {
			bd_no = service.insertContent(commVO);
		}
		
		return "/comm/commView.do?bd_no=" + bd_no;
	}

}
