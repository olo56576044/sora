package kr.or.dw.store.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.store.service.IStoreService;
import kr.or.dw.store.service.StoreServiceImpl;
import kr.or.dw.store.vo.ReviewStoreVO;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.web.IAction;

public class InsertReviewAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		IStoreService service = StoreServiceImpl.getInstance();
		HttpSession session = req.getSession();
		UserVO userVo = (UserVO) session.getAttribute("UserVO");
		
		int user_no = userVo.getUser_no();
		String user_nick = userVo.getUser_nick();
		int store_no = Integer.parseInt(req.getParameter("store_no"));
		String re_content = req.getParameter("re_content");
		String cmd = req.getParameter("cmd");
		if (cmd.equals("insert")) {
			int rate = Integer.parseInt(req.getParameter("rate"));
			ReviewStoreVO reVo = new ReviewStoreVO();
			reVo.setStore_no(store_no);
			reVo.setUser_no(user_no);
			reVo.setUser_nick(user_nick);
			reVo.setRe_content(re_content);
			reVo.setRate(rate);
			
			int re_no = service.insertReview(reVo);
			ReviewStoreVO resultReVo = service.selectReview(re_no);
			req.setAttribute("reVo", resultReVo);
			
//			float rateAvg = service.selectRateAvg(store_no);
//			service.updateRateAvg(store_no);
//			req.setAttribute("rateAvg", rateAvg);
		} else if (cmd.equals("delete")) {
			int re_no = Integer.parseInt(req.getParameter("re_no"));
			int result = service.deleteReview(re_no);
			System.out.println("result : " + result);
			req.setAttribute("result", result);
		}
		service.updateRateAvg(store_no);
		float rateAvg = service.selectRateAvg(store_no);
		req.setAttribute("rateAvg", rateAvg);
		
		return "/store/review_ajax.jsp";
	}

}
