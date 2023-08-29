package kr.or.dw.comm.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.dw.comm.service.CommServiceImpl;
import kr.or.dw.comm.service.ICommService;
import kr.or.dw.comm.vo.CommVO;
import kr.or.dw.util.PaginationUtil;
import kr.or.dw.web.IAction;

public class CommMainAction implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		ICommService service = CommServiceImpl.getInstance();
		
//		HttpSession session = req.getSession();
//		int user_no = ((UserVO)session.getAttribute("userVO")).getUser_no();
		
		// 페이징처리
		Map<String, Integer> pagingConfigMap = null;
		PaginationUtil pagination = null;
		String pageParam = req.getParameter("page");	// 사용자가 선택한 페이지 번호
		int page = (pageParam == null ? 1 : Integer.parseInt(pageParam));
		pagination = new PaginationUtil();
		int totalCount = service.selectCommCount();
		pagination.setConfig(page, 10, 10, totalCount);
		pagingConfigMap = pagination.getConfig();
		
		// ibatis에서 받을 parameterMap 을 만든다.
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("start", pagingConfigMap.get("start"));
		paramMap.put("end", pagingConfigMap.get("end"));
//		paramMap.put("user_no", user_no);
		
		// 게시판 목록을 가져온다.
		List<CommVO> commList = service.selectCommList(paramMap);
		System.out.println("test : " + commList.get(0).getBd_no());
		System.out.println("test : " + commList.get(0).getBd_content());
		System.out.println("test : " + commList.get(0).getUser_img());
		req.setAttribute("commList", commList);
		req.setAttribute("pagingConfigMap", pagination);
		System.out.println("커뮤게시판에 들어갔습니다.");
		
		return "/comm/commMain.jsp";
	}

}
