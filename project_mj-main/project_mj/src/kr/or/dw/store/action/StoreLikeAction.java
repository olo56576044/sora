package kr.or.dw.store.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.store.service.IStoreService;
import kr.or.dw.store.service.StoreServiceImpl;
import kr.or.dw.store.vo.LikeStoreVO;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.web.IAction;

public class StoreLikeAction implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		IStoreService service = StoreServiceImpl.getInstance();
		
		int store_no = Integer.parseInt(req.getParameter("store_no"));
		boolean likeFlag = Boolean.parseBoolean(req.getParameter("likeFlag"));
		int user_no = ((UserVO)session.getAttribute("UserVO")).getUser_no();
		
		LikeStoreVO likeVo = new LikeStoreVO();
		likeVo.setStore_no(store_no);
		likeVo.setUser_no(user_no);
		likeVo.setLike_cnt(likeFlag == true ? 1 : -1);
		System.out.println("likeFlag : " + likeVo.getLike_cnt());
		int result = 0; //있으면 없데이트 없으면 밸류스 
		int count = 0;	// 좋아요 수를 다시 조회해서 화면으로 가져가기 위한 변수
		result = service.updateLike(likeVo);	// store_like에 머지
		service.updateStoreLikeCount(store_no);	// 
		if (result > 0) {// MERGE 구문이 성공하면(update 태그로 되어있어서 성공하면 '1'반환)
//			좋아요갯수를 샘  
			count = service.selectLikeCount(store_no);
		}
		req.setAttribute("count", count);
		return "/store/like_ajax.jsp";
	}

}
