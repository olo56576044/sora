package kr.or.dw.cs.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.dw.cs.vo.AnnouncementVO;
import kr.or.dw.user.service.IUserService;
import kr.or.dw.user.service.UserServiceImpl;
import kr.or.dw.util.PaginationUtil;
import kr.or.dw.web.IAction;

public class AnnounceFormAction implements IAction {
	@Override
	public boolean isRedirect() {
		return false;
	}
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		IUserService service = UserServiceImpl.getInstance();



		// 페이징처리
		Map<String, Integer> pagingConfigMap = null;
		PaginationUtil pagination = null;
		String pageParam = req.getParameter("page");	// 사용자가 선택한 페이지 번호
		int page = (pageParam == null ? 1 : Integer.parseInt(pageParam));
		pagination = new PaginationUtil();
		int totalCount = service.selectAnCount();
		pagination.setConfig(page, 10, 10, totalCount);
		pagingConfigMap = pagination.getConfig();
		req.setAttribute("pagingConfigMap", pagination);



		// ibatis에서 받을 parameterMap 을 만든다.
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("start", pagingConfigMap.get("start"));
		paramMap.put("end", pagingConfigMap.get("end"));
		List<AnnouncementVO> anVoList = service.selectAnVoList();
		System.out.println(anVoList);
		req.setAttribute("anVoList", anVoList);
		return "/cs/announceForm.jsp";
	}
}