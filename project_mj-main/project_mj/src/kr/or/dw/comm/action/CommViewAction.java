package kr.or.dw.comm.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.SessionTrackingMode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.comm.service.CommServiceImpl;
import kr.or.dw.comm.service.ICommService;
import kr.or.dw.comm.vo.CommVO;
import kr.or.dw.comm.vo.LikeVO;
import kr.or.dw.comm.vo.ReplyVO;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.web.IAction;

public class CommViewAction implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("commViewAction 입니다 ");
		int bd_no = 0;
		bd_no = Integer.parseInt(req.getParameter("bd_no"));
		ICommService commService = CommServiceImpl.getInstance();
		CommVO commVo = null;
		commVo = commService.selectCommView(bd_no);
		
		List<ReplyVO> replyList = null;
		replyList = commService.selectReplyList(bd_no);
		
		HttpSession session = req.getSession();
		UserVO userVo = null;
		int user_no = 0;
		if(session.getAttribute("UserVO") != null ) {
			user_no = ((UserVO)session.getAttribute("UserVO")).getUser_no();
		};
		
		System.out.println(user_no);
		
		LikeVO likeVo = new LikeVO();
		likeVo.setBd_no(bd_no);
		likeVo.setUser_no(user_no);
		int userLike = 0;
		userLike = commService.selectUserLike(likeVo);
		req.setAttribute("commVo", commVo);
		req.setAttribute("replyList", replyList);
		req.setAttribute("userLike", userLike);
		System.out.println("게시글 상세보기로 들어갔습니다. ");
		return "/comm/commView.jsp";

	}

}
