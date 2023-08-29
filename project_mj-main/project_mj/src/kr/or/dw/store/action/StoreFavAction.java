package kr.or.dw.store.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.store.service.IStoreService;
import kr.or.dw.store.service.StoreServiceImpl;
import kr.or.dw.store.vo.FavStoreVO;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.web.IAction;

public class StoreFavAction implements IAction {

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
		boolean favFlag = Boolean.parseBoolean(req.getParameter("favFlag"));
		int user_no = ((UserVO)session.getAttribute("UserVO")).getUser_no();
		
		FavStoreVO favVo = new FavStoreVO();
		favVo.setStore_no(store_no);
		favVo.setUser_no(user_no);
		favVo.setFav_cnt(favFlag == true ? 1 : -1);
		
		int result = 0;
		result = service.updateFav(favVo);	//있으면 없데이트 없으면 밸류스. store_favorites에 머지
		int count = 0;
		service.updateStoreFavCount(store_no);	// 총 즐겨찾기 수 업데이트
		if (result > 0) {// MERGE 구문이 성공하면(update 태그로 되어있어서 성공하면 '1'반환)
//			즐겨찾기갯수를 샘 
			count = service.selectFavCount(store_no);
		}
		req.setAttribute("favCount", count);
		return "/store/fav_ajax.jsp";
	}

}
