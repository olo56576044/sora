package kr.or.dw.cs.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kr.or.dw.cs.dao.CsDaoImpl;
import kr.or.dw.cs.dao.ICsDao;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.cs.vo.AnnouncementVO;


public class CsServiceImpl implements ICsService{
	private ICsDao dao;
	private static CsServiceImpl service;
	
	private CsServiceImpl() {
		dao = CsDaoImpl.getInstance();
	}
	
	public static CsServiceImpl getInstance() {
		if (service == null) service = new CsServiceImpl();
		return service;
	}


	@Override
	public List<StoreVO> selectMainStoreVoList() {
		//총 점포 수 알아오기, 
//		int count = dao.selectStoreTotalCount();
		//랜덤 숫자 세개 뽑기
//		Map<String, Integer> randomMap = new HashMap<>();
//		for (int i = 1; i < 4; i++) {
//			int random = (int)(Math.random()*count + 1);
//			if (!randomMap.containsValue(random)) {
//				randomMap.put(("num"+i), random);
//			} else {
//				System.out.println("중복");
//				i--;
//			} 
//		}
//		System.out.println("randomMap : " + randomMap);
		return dao.selectMainStoreVoList();
	}


	public int insertContent(AnnouncementVO anVo) {
		
		return dao.insertContent(anVo);

	}

	@Override
	public AnnouncementVO selectAnView(int bd_no) {
		
		return dao.selectAnView(bd_no);
	}

	@Override
	public void deleteAn(int bd_no) {
		
		 dao.deleteAn(bd_no);
	}

	@Override
	public int updateAn(AnnouncementVO anVo) {
		
		return dao.updateAn(anVo);
	}

	@Override
	public List<StoreVO> selectStoreVoList() {
		// TODO Auto-generated method stub
		return dao.selectStoreVoList();
	}



}
