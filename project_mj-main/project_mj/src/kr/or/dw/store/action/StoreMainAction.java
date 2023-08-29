package kr.or.dw.store.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.store.vo.ImgStoreVO;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.user.service.IUserService;
import kr.or.dw.user.service.UserServiceImpl;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.util.PaginationUtil;
import kr.or.dw.web.IAction;

public class StoreMainAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		int user_no = 0;
		if ((UserVO)session.getAttribute("UserVO") != null) {
			UserVO userVo = ((UserVO)session.getAttribute("UserVO"));
			user_no = userVo.getUser_no();
		}
		IAdminService service = AdminServiceImpl.getInstance();
		IUserService userService = UserServiceImpl.getInstance();
		// 페이징처리
		Map<String, Integer> pagingConfigMap = null;
		PaginationUtil pagination = new PaginationUtil();
		String pageParam = req.getParameter("page");	// 사용자가 선택한 페이지 번호
		int page = (pageParam == null ? 1 : Integer.parseInt(pageParam));
		
		String cat = req.getParameter("cat");
		String tag = req.getParameter("tag");
		String likeFlag = req.getParameter("like");
		String favFlag = req.getParameter("fav");
		int totalCount = 0;
		if (cat != null && cat != "") {		// 카테고리 필터시
			totalCount = service.selectStoreCount(cat);
		} else if (tag != null && tag != "") {	// 태그 필터시
			totalCount = service.selectStoreTagCount(tag);
		} else if (user_no != 0 && likeFlag != null && likeFlag.equals("on")) {	//좋아요
			totalCount = userService.selectStoreLikeCount(user_no);
		} else if (user_no != 0 && favFlag != null && favFlag.equals("on")) {	//즐겨찾기
			totalCount = userService.selectStoreFavCount(user_no);
		} else {
			totalCount = service.selectStoreCount(null);	
		} 
		
		pagination.setConfig(page, 9, 10, totalCount);
		pagingConfigMap = pagination.getConfig();
		// ibatis에서 받을 parameterMap 을 만든다.
		Map<String, Object> paramMap = new HashMap<>();
		if (cat != null && cat != "") {	// 카테고리 필터시
			String isCat = req.getParameter("cat");
			paramMap.put("cat", isCat);
			req.setAttribute("cat", isCat);
		} else if (tag != null && tag != "") {
			String isTag = req.getParameter("tag");
			paramMap.put("tag", isTag);
			req.setAttribute("tag", isTag);
		} else if (user_no != 0 && likeFlag != null && likeFlag.equals("on")) {
			String isLike = req.getParameter("like");
			paramMap.put("user_no", user_no);
			req.setAttribute("like", isLike);
		} else if (user_no != 0 && favFlag != null && favFlag.equals("on")) {
			String isFav =req.getParameter("fav");
			paramMap.put("user_no", user_no);
			req.setAttribute("fav", isFav);
			System.out.println("fav!!!");
		} else {
			System.out.println("testelse");
		}
		paramMap.put("start", pagingConfigMap.get("start"));
		paramMap.put("end", pagingConfigMap.get("end"));
		
		List<StoreVO> storeVoList = new ArrayList<StoreVO>();
		if (tag != null && tag != "") {	// 태그 필터시
			storeVoList = service.selectStoreListT(paramMap);
		} else if (user_no != 0 && likeFlag != null && likeFlag.equals("on")) {
			storeVoList = userService.selectStoreListL(paramMap);
		} else if (user_no != 0 && favFlag != null && favFlag.equals("on")) {
			storeVoList = userService.selectStoreListF(paramMap);
		} else {	// 카테고리 필터시
			storeVoList = service.selectStoreList(paramMap);
		}
		List<String> tagList = service.selectTagList();
		List<String> catList = service.selectStoreCatList();
		
		req.setAttribute("pagingConfigMap", pagination);
		req.setAttribute("storeVoList", storeVoList);
		req.setAttribute("tagList", tagList);
		req.setAttribute("catList", catList);
		return "/store/storeMain.jsp";
	}

}
