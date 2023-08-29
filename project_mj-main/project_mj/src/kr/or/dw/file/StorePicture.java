package kr.or.dw.file;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import kr.or.dw.admin.service.AdminServiceImpl;
import kr.or.dw.admin.service.IAdminService;
import kr.or.dw.store.vo.ImgStoreVO;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.web.IAction;

public class StorePicture implements IAction{

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		int store_no = Integer.parseInt(req.getParameter("store_no"));
		String cmd = req.getParameter("cmd");
		StoreVO storeVo = new StoreVO();
		storeVo.setStore_no(store_no);
		
		IAdminService service = AdminServiceImpl.getInstance();
		if (cmd.equals("thumb")) {
			// 일단 올려놓은 썸네일 지운다(db)
			service.deleteThumbImgStore(store_no);
			String picFoldName = String.valueOf(storeVo.getStore_no());		// 점포번호(폴더이름)
			String realPath = "C:/file_project_mj/upload/storeImg/" + picFoldName + "/thumb";
			
			String fileName = "";	//파일 이름을 담을 곳
			File fileUploadDirectory = new File(realPath);	//  
			
			File[] alreadyFiles = fileUploadDirectory.listFiles();
			// 그 파일들의 이름을 구하고 새로운 파일 객체에 경로+파일 이름을 담아 delete한다. 
			if (alreadyFiles != null) {
				for (int i = 0; i < alreadyFiles.length; i++) {
					fileName = alreadyFiles[i].getName();
					new File(realPath + "/" + fileName).delete();
				}
			}
			
			if (!fileUploadDirectory.exists()) {
				fileUploadDirectory.mkdirs();
			}
			
			MultipartRequest multi = new MultipartRequest(req, realPath, 100*1024*1024, "utf-8");
			fileName = multi.getFilesystemName("thumbUp");
			
			storeVo.setThumb_url(picFoldName + "/thumb/" + fileName);
			System.out.println(storeVo.getThumb_url());
			service.updateThumb(storeVo);
			
		} else if (cmd.equals("notThumb")) {
			// 일단 올려놓은거 다 지운다(db)
			service.deleteImgStore(store_no);
			
			// 이미지 추가한다
			String picFoldName = String.valueOf(storeVo.getStore_no());		// 점포번호(폴더이름)
			String realPath = "C:/file_project_mj/upload/storeImg/" + picFoldName + "/notThumb";	// 실제폴더경로
			
			String fileName = "";	//파일 이름을 담을 곳
			File fileUploadDirectory = new File(realPath);	//  
			
			// 해당 디렉토리 안에 있는 모든 파일을 구한다.
			File[] alreadyFiles = fileUploadDirectory.listFiles();
			// 그 파일들의 이름을 구하고 새로운 파일 객체에 경로+파일 이름을 담아 delete한다. 
			if (alreadyFiles != null) {
				for (int i = 0; i < alreadyFiles.length; i++) {
					fileName = alreadyFiles[i].getName();
					new File(realPath + "/" + fileName).delete();
				}
			}
			
			if (!fileUploadDirectory.exists()) {
				fileUploadDirectory.mkdirs();
			}
			
			MultipartRequest multi = new MultipartRequest(req, realPath, 100*1024*1024, "utf-8");
			Enumeration en = multi.getFileNames();
			int cnt = 0;
			ImgStoreVO imgStoreVo = new ImgStoreVO();
			imgStoreVo.setStore_no(store_no);
			while (en.hasMoreElements()) {
				cnt++;
				fileName = multi.getFilesystemName((String) en.nextElement());
				imgStoreVo.setImg_url(picFoldName + "/notThumb/" + fileName);
				service.insertImgStore(imgStoreVo);
			}
		}
		
		return null;
	}

}
