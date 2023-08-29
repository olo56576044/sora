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

public class AnnounceViewAction implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int bd_no = 0;
		bd_no = Integer.parseInt(req.getParameter("bd_no"));
		ICsService service = CsServiceImpl.getInstance();

		AnnouncementVO anVo = null;
		
		anVo = service.selectAnView(bd_no); 
		
		System.out.println(anVo.getBd_content());
		System.out.println("bdno : " + anVo.getBd_no());
		System.out.println("제목 : " + anVo.getBd_title());
		req.setAttribute("anVo", anVo);

		return "/cs/announceView.jsp";

	}
}
