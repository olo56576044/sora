package kr.or.dw.cs.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.comm.service.CommServiceImpl;
import kr.or.dw.comm.service.ICommService;
import kr.or.dw.comm.vo.CommVO;
import kr.or.dw.cs.dao.CsDaoImpl;
import kr.or.dw.cs.service.CsServiceImpl;
import kr.or.dw.cs.service.ICsService;
import kr.or.dw.cs.vo.AnnouncementVO;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.web.IAction;

public class InsertAnnounceFormAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		ICsService service = CsServiceImpl.getInstance();
		
		if( req.getParameter("bd_no") != null ) {
			int bd_no = Integer.parseInt(req.getParameter("bd_no"));
			AnnouncementVO anVo = service.selectAnView(bd_no);
			req.setAttribute("anVo", anVo);
			
		}
		
		return "/cs/insertAnnounceForm.jsp";
	}

}
