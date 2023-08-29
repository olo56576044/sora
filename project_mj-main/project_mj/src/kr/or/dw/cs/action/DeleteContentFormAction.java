package kr.or.dw.cs.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.cs.service.CsServiceImpl;
import kr.or.dw.cs.service.ICsService;
import kr.or.dw.cs.vo.AnnouncementVO;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.web.IAction;

public class DeleteContentFormAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		ICsService service = CsServiceImpl.getInstance();
		System.out.println("bdno : " + req.getParameter("bd_no"));
		service.deleteAn(Integer.parseInt(req.getParameter("bd_no")));
		
		
		
		return "/cs/announceForm.do";
	}

}
