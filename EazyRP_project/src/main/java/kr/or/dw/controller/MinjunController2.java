package kr.or.dw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.EmpSalService;
import kr.or.dw.service.ManagementService;
import kr.or.dw.service.MenuService;
import kr.or.dw.service.MerchandiseService;
import kr.or.dw.service.OrderService;
import kr.or.dw.service.ProcessService;
import kr.or.dw.service.ProductService;
import kr.or.dw.service.ShopService;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.DeptVO;
import kr.or.dw.vo.EmpVO;
import kr.or.dw.vo.ExtrapayVO;
import kr.or.dw.vo.MenuVO;
import kr.or.dw.vo.MerchandiseVO;
import kr.or.dw.vo.NoteVO;
import kr.or.dw.vo.OrderVO;
import kr.or.dw.vo.ProcessVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.ShopVO;

@Controller
@RequestMapping("/management")
public class MinjunController2 {
	
	private static final Logger logger = LoggerFactory.getLogger(MinjunController2.class);
	
	@Autowired
	private MenuService menuService;

	@Autowired
	private EmpSalService empsalService;
	
	@Autowired
	private ManagementService managementService;
	
	// EMP CRUD -----------------------------------------------------------------------------------------
	
	@RequestMapping("/emp")
	public ModelAndView empMain(ModelAndView mnv, String mcode, EmpVO empVO, SearchCriteria cri, HttpSession session) throws SQLException {
		String url = "/minjun2/emp.page";
		System.out.println("emp session c_no : " + session.getAttribute("c_no").toString());
		String c_no = session.getAttribute("c_no").toString();
		Map<String, Object> dataMap = empsalService.selectEmpList(cri, c_no);
		
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/empDetail")
	public ModelAndView empDetail(ModelAndView mnv ,int emp_no) throws SQLException {
		
		Map<String, Object> dataMap = empsalService.selectDetail(emp_no);
		
		String url = "minjun2/emp_detail.open";
		System.out.println("empDetail dataMap : " + dataMap);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/empRegistForm")
	public String shopRegistForm() {
		String url = "minjun2/emp_regist";
		return url;
	}
	
	@RequestMapping("/insertEmp")
	public void insertEmp(@RequestParam("files")MultipartFile multi, EmpVO empVO, HttpServletResponse res, HttpSession session) throws Exception {
		
		String fileName = "";
		
		if(!multi.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			
			String uniqueName = uuids[0];
			
			String fileRealName = multi.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			String uploadFolder = "C:\\upload\\EmpStamp\\";
			
			fileName = uniqueName+fileExtension;
			
			File saveFile = new File(uploadFolder+uniqueName+fileExtension);  // 적용 후
			
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			}
			
			try {
				multi.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		int emp_no = Integer.parseInt(session.getAttribute("emp_no").toString());
		empVO.setSys_reg(emp_no + "");
		empVO.setSys_up(emp_no + "");
		empVO.setStampimg(fileName);
		
		empsalService.insertEmp(empVO);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 등록되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
	
	@RequestMapping("/modifyEmp.do")
	public void modifyEmp (EmpVO empVO, HttpServletResponse res, HttpSession session, Integer emp_no, String oldPicture, String uploadPicture, @RequestParam("files")MultipartFile multi) throws SQLException , Exception {
		
		String fileName = oldPicture;
		
		empVO.setStampimg(fileName);
		
		if(!(oldPicture.equals(uploadPicture) || uploadPicture.equals("") || uploadPicture == null) ) {	
			if(!multi.isEmpty()) {
				UUID uuid = UUID.randomUUID();
				String[] uuids = uuid.toString().split("-");
				
				String uniqueName = uuids[0];
				
				String fileRealName = multi.getOriginalFilename();
				String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
				String uploadFolder = "C:\\upload\\EmpStamp\\";
				
				fileName = uniqueName+fileExtension;
				
				File saveFile = new File(uploadFolder+uniqueName+fileExtension);
				if(!saveFile.exists()) {
					saveFile.mkdirs();
				}
				try {
					multi.transferTo(saveFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				if(!oldPicture.equals("")) {
					File oldFile = new File(uploadFolder, oldPicture);
					if(oldFile.exists()) {
						oldFile.delete();
					};
				};
			};
			empVO.setStampimg(fileName);
		} else if (uploadPicture.equals("") || uploadPicture == null) {
			String uploadFolder = "C:\\upload\\EmpStamp\\";
			File oldFile = new File(uploadFolder, oldPicture);
			if(oldFile.exists()) {
				oldFile.delete();
			};
			
			empVO.setStampimg("");
		}
		
		int SSemp_no = Integer.parseInt(session.getAttribute("emp_no").toString());
		
		empVO.setEmp_no(emp_no);
		empVO.setSys_up(SSemp_no + "");
		
		
		empsalService.modifyEmp(empVO);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 수정되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
	
	@RequestMapping("/deleteEmp.do")
	public void deleteEmp (EmpVO empVO, HttpServletResponse res, HttpSession session, Integer emp_no) throws SQLException , Exception {
		int SSemp_no = Integer.parseInt(session.getAttribute("emp_no").toString());
		empVO.setEmp_no(emp_no);
		empVO.setSys_up(SSemp_no + "");
		System.out.println("modifyEmp emp_no : " + emp_no);
		
		empsalService.deleteEmp(empVO);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 삭제되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
	
	@RequestMapping("/findCompany")
	public ModelAndView findCompany(ModelAndView mnv, String searchType, String keyword) throws SQLException {
		String url = "minjun2/findCompany";
		
		if(searchType == "") {
			searchType = null;
		}
		if(keyword == "") {
			keyword = null;
		}
		
		List<CompanyVO> company = null;
		Map<String, String> dataMap = new HashMap<>();
		
	
		dataMap.put("searchType", searchType);
		dataMap.put("keyword", keyword);
		
		if(keyword != null){
			company = empsalService.getCompany(dataMap);
		} else {
			company = empsalService.getCompanyList();
		}
		
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);
		mnv.addObject("company", company);
		
		return mnv;
	}
	
	@RequestMapping("/findDept")
	public ModelAndView findDept(ModelAndView mnv, String searchType, String keyword) throws SQLException {
		String url = "minjun2/findDept";
		
		if(searchType == "") {
			searchType = null;
		}
		if(keyword == "") {
			keyword = null;
		}
		
		List<DeptVO> dept = null;
		Map<String, String> dataMap = new HashMap<>();
		
		dataMap.put("searchType", searchType);
		dataMap.put("keyword", keyword);
		
		if(keyword != null){
			dept = empsalService.getDept(dataMap);
		} else {
			dept = empsalService.getDeptList();
		}
		
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);
		mnv.addObject("dept", dept);
		
		return mnv;
	}
	
	@RequestMapping("/findEmp")
	public ModelAndView findEmp(ModelAndView mnv, String searchType, String keyword, String c_no) throws SQLException {
		String url = "minjun2/findEmp";
		
		if(searchType == "") {
			searchType = null;
		}
		if(keyword == "") {
			keyword = null;
		}
		List<EmpVO> emp = null;
		Map<String, String> dataMap = new HashMap<>();
		
		dataMap.put("searchType", searchType);
		dataMap.put("keyword", keyword);
		dataMap.put("c_no", c_no);
		if(keyword != null){
			emp = empsalService.getEmp(dataMap);
		} else {
			emp = empsalService.getEmpList(c_no);
		}
		
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);
		mnv.addObject("emp", emp);
		
		return mnv;
	}
	
	@RequestMapping("/getPicture")
	public ResponseEntity<byte[]> getPicture(String picture) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = "C:\\upload\\EmpStamp\\";
		
		if (picture != null || picture != "") {
			try {
				in = new FileInputStream(new File(imgPath, picture));
				
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), HttpStatus.CREATED);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
			}finally {
				in.close();
			}
		}
		
		return entity;
	}
	
	// Extrapay CRUD -----------------------------------------------------------------------------------------
	
	@RequestMapping("/extrapay")
	public ModelAndView extrapayMain(ModelAndView mnv, String mcode,SearchCriteria cri, HttpSession session) throws SQLException {
		String url = "/minjun2/extrapay.page";
		
		Map<String, Object> dataMap = empsalService.selectExtrapayList(cri);
		
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
}
