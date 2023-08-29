package kr.or.dw.cs.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Set;
import com.ibatis.sqlmap.client.SqlMapClient;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.cs.vo.AnnouncementVO;
import kr.or.dw.util.BuildSqlMapClient;

public class CsDaoImpl implements ICsDao {
	private static CsDaoImpl dao;
	private SqlMapClient client;
	
	private CsDaoImpl() {
		client = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static CsDaoImpl getInstance() {
		if (dao == null) dao = new CsDaoImpl();
		return dao;
	}


//	@Override
//	public List<StoreVO> selectMainStoreVoList(Map<String, Integer> randomMap) {
//		List<StoreVO> mainStoreVoList = null;
//		
//		try {
//			mainStoreVoList = client.queryForList("store.mainStoreVoList");
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		return mainStoreVoList;
//	}

	@Override
	public int selectStoreTotalCount() {
		int count = 0;
		
		try {
			count = (int) client.queryForObject("store.selectStoreTotalCount");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}



	@Override
	public int insertContent(AnnouncementVO anVo) {
		int bd_no = 0;		
				try {
					bd_no= (int) client.insert("user.insertContent",anVo);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
		return bd_no;
	}

	@Override
	public AnnouncementVO selectAnView(int bd_no) {
		AnnouncementVO anVo = null;
			try {
				anVo = (AnnouncementVO) client.queryForObject("user.selectAnView", bd_no);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return anVo;
	}

	@Override
	public void deleteAn(int bd_no) {

	
			try {
				client.update("user.deleteAn", bd_no);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

	@Override
	public int updateAn(AnnouncementVO anVo) {
		int result = 0;
		
		 try {
			result = client.update("user.updateAn", anVo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}

	@Override
	public List<StoreVO> selectStoreVoList() {
		// TODO Auto-generated method stub
		List<StoreVO> stvolist = null;
		
		try {
			stvolist = client.queryForList("store.selectStoreVoList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return stvolist;
	}

	@Override
	public List<StoreVO> selectMainStoreVoList() {
		// TODO Auto-generated method stub
		List<StoreVO> mainStoreVoList = null;
		
		try {
			mainStoreVoList = client.queryForList("store.mainStoreVoList");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mainStoreVoList;
	}

	


	

}
