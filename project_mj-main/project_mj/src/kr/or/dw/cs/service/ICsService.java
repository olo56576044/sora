package kr.or.dw.cs.service;

import java.util.List;

import kr.or.dw.cs.vo.AnnouncementVO;
import kr.or.dw.store.vo.StoreVO;

public interface ICsService {


	int insertContent(AnnouncementVO anVO);

	static ICsService getInstance() {
	

		return null;
	}

	static AnnouncementVO selectAnList(int bd_no) {

		
		return null;
	}


	/**
	 * 메인화면 캐러셀에 들어갈 점포 3개를 불러온다.
	 * @return
	 */
	List<StoreVO> selectMainStoreVoList();

	AnnouncementVO selectAnView(int bd_no);


	void deleteAn(int parseInt);

	int updateAn(AnnouncementVO anVo);

	List<StoreVO> selectStoreVoList();

}
