package kr.or.dw.user.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.cs.vo.AnnouncementVO;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.util.BuildSqlMapClient;

public class UserDaoImpl implements IUserDao {
	private static UserDaoImpl dao;
	private SqlMapClient client;
	
	public UserDaoImpl () {
		client = BuildSqlMapClient.getSqlMapClient();
	}

	public static UserDaoImpl getInstance() {
		if (dao == null ) dao = new UserDaoImpl();
		return dao;
	}

	@Override
	public String getUser_nick(String user_nick) {

		String nick = null;
		try {
			nick = (String)client.queryForObject("user.getUser_nick", user_nick);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return nick;
	}
	@Override
	public int insertUser(UserVO vo) {
		int result=0;
		
		try {
			result = (int)client.insert("user.insertUser", vo);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	
		return result;
	}
	@Override
	public UserVO loginUser(String user_email) {
		
		UserVO vo = null;
		try {
			vo = (UserVO)client.queryForObject("user.loginUser", user_email);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return vo;
	}
	@Override
	public void updateUserPicPath(UserVO userVO) {
		System.out.println(userVO.getUser_img());
		try {
			client.update("user.updateUserPicPath", userVO);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
	}
	@Override
	public int updateUser(UserVO userVO) {
		 int result = 0;
			try {
				client.update("user.updateUser", userVO);
			} catch (SQLException e) {

				e.printStackTrace();
			}
		return result;
	}
	
	@Override
	public int deleteUser(int user_no) {
		int result = 0;
			try {
				client.update("user.deleteUser", user_no);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			return result;
	}

	@Override
	public List<AnnouncementVO> selectAnVoList() {
		List<AnnouncementVO> AnVoList = null;
		
		try {
			AnVoList = client.queryForList("user.selectAnList");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return AnVoList;
	}

	@Override
	public int selectStoreLikeCount(int user_no) {
		int count = 0;
		
		try {
			count = (int) client.queryForObject("user.selectStoreLikeCount", user_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}

	public List<StoreVO> selectStoreListL(Map<String, Object> paramMap) {
		List<StoreVO> storeVoList = null;
		
		try {
			storeVoList = client.queryForList("user.selectStoreListL", paramMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return storeVoList;
	}

	@Override
	public int selectStoreFavCount(int user_no) {
		int count = 0;
		
		try {
			count = (int) client.queryForObject("user.selectStoreFavCount", user_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public List<StoreVO> selectStoreListF(Map<String, Object> paramMap) {
		List<StoreVO> storeVoList = null;
		
		try {
			storeVoList = client.queryForList("user.selectStoreListF", paramMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return storeVoList;
	}
	public int selectAnCount() {
		int count = 0;

			try {
				count = (int) client.queryForObject("user.selectAnCount");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		return count;
	}

	@Override
	public UserVO selectUser(int user_no) {
		UserVO userVo = null;
		
		try {
			userVo = (UserVO) client.queryForObject("user.selectUser", user_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userVo;
	}


}
