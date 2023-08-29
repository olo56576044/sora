package kr.or.dw.file;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.or.dw.user.service.IUserService;
import kr.or.dw.user.service.UserServiceImpl;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.web.IAction;

public class ProfilePicture implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
//		UserVO userVO = (UserVO) session.getAttribute("userVO");
		int user_no = Integer.parseInt(req.getParameter("user_no"));
		UserVO userVO = new UserVO();
		userVO.setUser_no(user_no);
		System.out.println(user_no);
		String picFoldName = "" + user_no;
		String realPath = "C:/file_project_mj/upload/userProfile/" + picFoldName;
		
		String fileName = "";
		
		// 프로필사진을 저장하려는 폴더 생성
		File fileUploadDirectory = new File(realPath);
		if(!fileUploadDirectory.exists()) {
			fileUploadDirectory.mkdirs();
		}
		
		// 해당 프로필사진 파일을 해당 경로안에 생성
		MultipartRequest multi = new MultipartRequest(req, realPath, 100*1024*1024, "utf-8");
		fileName = multi.getFilesystemName("selfie");
		
		
		
		System.out.println(fileName);
		userVO.setUser_img(picFoldName + "/" + fileName);
		
		IUserService service = UserServiceImpl.getInstance();
		service.updateUserPicPath(userVO);
		userVO = service.selectUser(user_no);
		req.setAttribute("userVO", userVO);
		session.setAttribute("UserVO", userVO);
		return "/user/myPageModResJson.jsp";
	}

}
