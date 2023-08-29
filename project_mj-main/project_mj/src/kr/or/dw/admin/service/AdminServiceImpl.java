package kr.or.dw.admin.service;

import java.util.List;
import java.util.Map;

import kr.or.dw.admin.dao.AdminDaoImpl;
import kr.or.dw.admin.dao.IAdminDao;
import kr.or.dw.comm.vo.CommVO;
import kr.or.dw.store.vo.ImgStoreVO;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.user.vo.UserVO;

public class AdminServiceImpl implements IAdminService {
	private IAdminDao dao;
	private static AdminServiceImpl service;
	
	private AdminServiceImpl() {
		dao = AdminDaoImpl.getInstance();
	}
	
	public static AdminServiceImpl getInstance() {
		if (service == null) service = new AdminServiceImpl();
		return service;
	}

	@Override
	public List<UserVO> selectUserList(Map<String, Object> paramMap) {
		return dao.selectUserList(paramMap);
	}

	@Override
	public int deleteUser(int user_no) {
		return dao.deleteUser(user_no);
	}

	@Override
	public int selectUserCount() {
		return dao.selectUserCount();
	}

	@Override
	public List<CommVO> selectUserCommList(int user_no) {
		return dao.selectUserCommList(user_no);
	}

	@Override
	public List<String> selectStoreCatList() {
		return dao.selectStoreCatList();
	}

	@Override
	public int insertStore(StoreVO storeVo) {
		dao.insertStore(storeVo);
		return dao.insertStoreTag(storeVo);
	}

	@Override
	public List<StoreVO> selectStoreList(Map<String, Object> paramMap) {
		return dao.selectStoreList(paramMap);
	}

	@Override
	public int selectStoreCount(String cat) {
		return dao.selectStoreCount(cat);
	}

	@Override
	public StoreVO selectStoreView(int store_no) {
		return dao.selectStoreView(store_no);
	}

	@Override
	public int updateStore(StoreVO storeVo) {
		dao.updateStoreTag(storeVo);
		return dao.updateStore(storeVo);
	}

	@Override
	public List<String> selectTagList() {
		return dao.selectTagList();
	}

	@Override
	public int insertTagName(String tagName) {
		return dao.insertTagName(tagName);
	}

	@Override
	public int deleteTagName(String tagName) {
		return dao.deleteTagName(tagName);
	}

	@Override
	public void insertImgStore(ImgStoreVO imgStoreVo) {
		dao.insertImgStore(imgStoreVo);
	}

	@Override
	public void deleteImgStore(int store_no) {
		dao.deleteImgStore(store_no);
	}

	@Override
	public List<ImgStoreVO> selectImgStoreList(int store_no) {
		return dao.selectImgStoreList(store_no);
	}

	@Override
	public void deleteThumbImgStore(int store_no) {
		dao.deleteThumbImgStore(store_no);
	}

	@Override
	public void updateThumb(StoreVO storeVo) {
		dao.updateThumb(storeVo);
	}

	@Override
	public int selectStoreTagCount(String tag) {
		return dao.selectStoreTagCount(tag);
	}

	@Override
	public List<StoreVO> selectStoreListT(Map<String, Object> paramMap) {
		return dao.selectStoreListT(paramMap);
	}
}
