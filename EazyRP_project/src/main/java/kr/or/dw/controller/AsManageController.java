package kr.or.dw.controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.AsService;
import kr.or.dw.vo.AsVO;


@Controller
@RequestMapping("/asmanage")
public class AsManageController {

	@Autowired
	private AsService asService;
	
	@RequestMapping("/as")
	public ModelAndView as(ModelAndView mnv, String mcode, SearchCriteria cri ) throws Exception {
		String url = "/as/noteList.page";
		
		Map<String, Object> dataMap = asService.selectAsList(cri);
		
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(dataMap);

		mnv.setViewName(url);
		
		return mnv;

	}
}
