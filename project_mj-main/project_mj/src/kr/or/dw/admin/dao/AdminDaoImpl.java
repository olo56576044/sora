package kr.or.dw.admin.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.comm.vo.CommVO;
import kr.or.dw.store.vo.ImgStoreVO;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.user.vo.UserVO;
import kr.or.dw.util.BuildSqlMapClient;

public class AdminDaoImpl implements IAdminDao {
	private static AdminDaoImpl dao;
	private SqlMapClient client;
	
	private AdminDaoImpl() {
		client = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static AdminDaoImpl getInstance() {
		if (dao == null) dao = new AdminDaoImpl();
		return dao;
	}

	@Override
	public List<UserVO> selectUserList(Map<String, Object> paramMap) {
		List<UserVO> userList = null;
		try {
			userList = client.queryForList("user.selectUserList", paramMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}

	@Override
	public int deleteUser(int user_no) {
		int result = 0;
		
		try {
			result = client.update("user.deleteUser", user_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int selectUserCount() {
		int count = 0;
		
		try {
			count = (int) client.queryForObject("user.selectUserCount");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public List<CommVO> selectUserCommList(int user_no) {
		List<CommVO> selectUserCommList = null;
		
		try {
			selectUserCommList = client.queryForList("comm.selectUserCommList", user_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return selectUserCommList;
	}

	@Override
	public List<String> selectStoreCatList() {
		List<String> selectStoreCatList = null;
		
		try {
			selectStoreCatList = client.queryForList("store.selectStoreCatList");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return selectStoreCatList;
	}

	@Override
	public void insertStore(StoreVO storeVo) {
		int result = 0;
		
		try {
			result = (int) client.insert("store.insertStore", storeVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public int insertStoreTag(StoreVO storeVo) {
		Object result = 0;
		int result2 = 1;
		try {
			result = client.insert("store.insertStoreTag", storeVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (result == null) {
			result2 = 1;
		}
		return result2;
	}

	@Override
	public List<StoreVO> selectStoreList(Map<String, Object> paramMap) {
		List<StoreVO> storeList = null;
		
		try {
			storeList = client.queryForList("store.selectStoreList", paramMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return storeList;
	}

	@Override
	public int selectStoreCount(String cat) {
		int count = 0;
		
		try {
			count = (int) client.queryForObject("store.selectStoreCount", cat);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public StoreVO selectStoreView(int store_no) {
		StoreVO storeVo = null;
		
		try {
			storeVo = (StoreVO) client.queryForObject("store.selectStoreView", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return storeVo;
	}

	@Override
	public int updateStore(StoreVO storeVo) {
		int result = 0;
		
		try {
			result = client.update("store.updateStore", storeVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<String> selectTagList() {
		List<String> tagList = null;
		
		try {
			tagList = client.queryForList("store.selectTagList");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return tagList;
	}

	@Override
	public int insertTagName(String tagName) {
		int result = 0;
		
		try {
			Object res = client.insert("store.insertTagName", tagName);
			if (res == null) {
				result = 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			return result;
	}

	@Override
	public int deleteTagName(String tagName) {
		int result = 0;
		
		try {
			result = client.delete("store.deleteTagName", tagName);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return result;
	}

	@Override
	public void updateStoreTag(StoreVO storeVo) {
		int store_no = storeVo.getStore_no();
		try {
			client.update("store.updateStoreTag", storeVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertImgStore(ImgStoreVO imgStoreVo) {
		try {
			client.insert("store.insertImgStore", imgStoreVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteImgStore(int store_no) {
		
		try {
			client.delete("store.deleteImgStore", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<ImgStoreVO> selectImgStoreList(int store_no) {
		List<ImgStoreVO> imgStoreVoList = null;
		
		try {
			imgStoreVoList = client.queryForList("store.selectImgStoreList", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return imgStoreVoList;
	}

	@Override
	public void deleteThumbImgStore(int store_no) {
		try {
			client.delete("store.deleteThumbImgStore", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateThumb(StoreVO storeVo) {
		try {
			client.update("store.updateThumb", storeVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int selectStoreTagCount(String tag) {
		int count = 0;
		
		try {
			count = (int) client.queryForObject("store.selectStoreTagCount", tag);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public List<StoreVO> selectStoreListT(Map<String, Object> paramMap) {
		List<StoreVO> storeList = null;
		
		try {
			storeList = client.queryForList("store.selectStoreListT", paramMap);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return storeList;
	}
}
