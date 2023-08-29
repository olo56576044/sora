package kr.or.dw.user.service;

import java.util.List;
import java.util.Map;

import kr.or.dw.cs.vo.AnnouncementVO;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.user.dao.IUserDao;
import kr.or.dw.user.dao.UserDaoImpl;
import kr.or.dw.user.vo.UserVO;

public class UserServiceImpl implements IUserService {
	
	private IUserDao dao;
	private static UserServiceImpl service;
	
	
	
	public UserServiceImpl() {
		dao = UserDaoImpl.getInstance();
	}

	public static UserServiceImpl getInstance() {
		if(service == null) service = new UserServiceImpl();
		return service;
	}


	@Override
	public int insertUser(UserVO vo) {
		return dao.insertUser(vo);
	}

	@Override
	public UserVO loginUser(String user_email) {
		return dao.loginUser(user_email);
	}

	@Override
	public String getUser_nick(String user_nick) {
		return dao.getUser_nick(user_nick);
	}

	@Override
	public void updateUserPicPath(UserVO userVO) {
		dao.updateUserPicPath(userVO);
		
	}

	@Override
	public int updateUser(UserVO userVO) {
	
		return dao.updateUser(userVO);
	}

  @Override
	public int deleteUser(int user_no) {
	
		return dao.deleteUser(user_no);
	}

	@Override
	public List<AnnouncementVO> selectAnVoList() {
		return dao.selectAnVoList();
	}

	@Override
	public int selectStoreLikeCount(int user_no) {
		return dao.selectStoreLikeCount(user_no);
	}

	@Override
	public List<StoreVO> selectStoreListL(Map<String, Object> paramMap) {
		return dao.selectStoreListL(paramMap);
	}

	@Override
	public int selectStoreFavCount(int user_no) {
		return dao.selectStoreFavCount(user_no);
	}

	@Override
	public List<StoreVO> selectStoreListF(Map<String, Object> paramMap) {
		return dao.selectStoreListF(paramMap);
	}
	
	@Override
	public int selectAnCount() {
		// TODO Auto-generated method stub
		return dao.selectAnCount();
	}

	@Override
	public UserVO selectUser(int user_no) {
		return dao.selectUser(user_no);
	}





	
}
