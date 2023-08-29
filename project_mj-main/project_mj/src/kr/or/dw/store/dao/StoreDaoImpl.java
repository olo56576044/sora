package kr.or.dw.store.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.store.vo.FavStoreVO;
import kr.or.dw.store.vo.ImgReviewStoreVO;
import kr.or.dw.store.vo.LikeStoreVO;
import kr.or.dw.store.vo.ReviewStoreVO;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.util.BuildSqlMapClient;

public class StoreDaoImpl implements IStoreDao {
	private static StoreDaoImpl dao;
	private SqlMapClient client;
	
	private StoreDaoImpl() {
		client = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static StoreDaoImpl getInstance() {
		if (dao == null) dao = new StoreDaoImpl();
		return dao;
	}

	@Override
	public StoreVO selectStoreVo(int store_no) {
		StoreVO storeVo = null;
		
		try {
			storeVo = (StoreVO) client.queryForObject("store.selectStoreVo", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return storeVo;
	}

	@Override
	public void updateStoreViews(int store_no) {
		try {
			client.update("store.updateStoreViews", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int selectUserLike(LikeStoreVO likeVo) {
		Object result;
		int num = 0;
		
		try {
			result = client.queryForObject("store.selectUserLike", likeVo);
			if (result != null) {
				num = Integer.parseInt(result.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return num;
	}

	@Override
	public int updateLike(LikeStoreVO likeVo) {
		int result = 0;
		
		try {
			result = client.update("store.updateLike", likeVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void updateStoreLikeCount(int store_no) {
		try {
			client.update("store.updateStoreLikeCount", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int selectLikeCount(int store_no) {
		int count = 0;
		
		try {
			count = (int) client.queryForObject("store.selectLikeCount", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public int selectUserFav(FavStoreVO favVo) {
		Object result;
		int num = 0;
		try {
			result = client.queryForObject("store.selectUserFav", favVo);
			if (result != null) {
				num = Integer.parseInt(result.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

	@Override
	public int updateFav(FavStoreVO favVo) {
		int result = 0;
		
		try {
			result = client.update("store.updateFav", favVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void updateStoreFavCount(int store_no) {
		try {
			client.update("store.updateStoreFavCount", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int selectFavCount(int store_no) {
		int count = 0;
		
		try {
			count = (int) client.queryForObject("store.selectFavCount", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public List<ReviewStoreVO> selectReviewStoreVoList(int store_no) {
		List<ReviewStoreVO> reviewStoreVoList = null;
		
		try {
			reviewStoreVoList = client.queryForList("store.selectReviewStoreVoList", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		return reviewStoreVoList;
	}

	@Override
	public List<ImgReviewStoreVO> selectImgReviewStoreVoList(int store_no) {
		List<ImgReviewStoreVO> selectImgReviewStoreVoList = null;
		
		try {
			selectImgReviewStoreVoList = client.queryForList("store.selectImgReviewStoreVoList", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return selectImgReviewStoreVoList;
	}

	@Override
	public int insertReview(ReviewStoreVO reVo) {
		int re_no = 0;
		
		try {
			re_no = (int) client.insert("store.insertReview", reVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return re_no;
	}

	@Override
	public ReviewStoreVO selectReview(int re_no) {
		ReviewStoreVO reVo = null;
		
		try {
			reVo = (ReviewStoreVO) client.queryForObject("store.selectReview", re_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return reVo;
	}

	@Override
	public float selectRateAvg(int store_no) {
		float rateAvg = 0;
		
		try {
			rateAvg = (float) client.queryForObject("store.selectRateAvg", store_no);
			System.out.println("rate : " + rateAvg);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rateAvg;
	}

	@Override
	public void updateRateAvg(int store_no) {
		try {
			client.update("store.updateRateAvg", store_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int deleteReview(int re_no) {
		
		int count = 0;
		try {
			count = client.update("store.deleteReview", re_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
}
