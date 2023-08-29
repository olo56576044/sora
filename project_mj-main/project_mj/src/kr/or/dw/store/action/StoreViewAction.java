package kr.or.dw.store.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.store.service.IStoreService;
import kr.or.dw.store.service.StoreServiceImpl;
import kr.or.dw.store.vo.FavStoreVO;
import kr.or.dw.store.vo.ImgReviewStoreVO;
import kr.or.dw.store.vo.ImgStoreVO;
import kr.or.dw.store.vo.LikeStoreVO;
import kr.or.dw.store.vo.ReviewStoreVO;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.user.service.IUserService;
import kr.or.dw.user.service.UserServiceImpl;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.web.IAction;

public class StoreViewAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		IStoreService service = StoreServiceImpl.getInstance();
		IAdminService serviceAdmin = AdminServiceImpl.getInstance();
		// storeVo 정보 가져오기
		int store_no = Integer.parseInt(req.getParameter("store_no"));
		StoreVO storeVo = service.selectStoreVo(store_no);
		List<ImgStoreVO> imgStoreVoList = serviceAdmin.selectImgStoreList(store_no);
		req.setAttribute("storeVo", storeVo);
		req.setAttribute("imgStoreVoList", imgStoreVoList);
		
		// 로그인한지 확인하고 좋아요 체크
		HttpSession session = req.getSession();
		UserVO userVo = new UserVO();
		int user_no = 0;
		
		if(session.getAttribute("UserVO") != null ) {
			userVo = (UserVO)session.getAttribute("UserVO");
			user_no = userVo.getUser_no();
		};
		
		// 좋아요 여부 체크
		LikeStoreVO likeVo = new LikeStoreVO();
		likeVo.setStore_no(store_no);
		likeVo.setUser_no(user_no);
		int userLike = 0;
		userLike = service.selectUserLike(likeVo);
		req.setAttribute("userLike", userLike);
		
		// 즐겨찾기 여부 체크
		FavStoreVO favVo = new FavStoreVO();
		favVo.setStore_no(store_no);
		favVo.setUser_no(user_no);
		int userFav = 0;
		userFav = service.selectUserFav(favVo);
		req.setAttribute("userFav", userFav);
		
		// 해당 점포 리뷰글 리스트 체크
		List<ReviewStoreVO> reviewStoreVoList = (List<ReviewStoreVO>) service.selectReviewStoreVoList(store_no);
		req.setAttribute("reviewStoreVoList", reviewStoreVoList);
		List<ImgReviewStoreVO> imgReviewStoreVoList = (List<ImgReviewStoreVO>) service.selectImgReviewStoreVoList(store_no);
		req.setAttribute("imgReviewStoreVoList", imgReviewStoreVoList);
		return "/store/storeView.jsp";
	}

}
