package kr.or.dw.store.service;

import java.util.List;

import kr.or.dw.store.dao.IStoreDao;
import kr.or.dw.store.dao.StoreDaoImpl;
import kr.or.dw.store.vo.FavStoreVO;
import kr.or.dw.store.vo.ImgReviewStoreVO;
import kr.or.dw.store.vo.LikeStoreVO;
import kr.or.dw.store.vo.ReviewStoreVO;
import kr.or.dw.store.vo.StoreVO;

public class StoreServiceImpl implements IStoreService {
	private IStoreDao dao;
	private static StoreServiceImpl service;
	
	private StoreServiceImpl() {
		dao = StoreDaoImpl.getInstance();
	}
	
	public static StoreServiceImpl getInstance() {
		if (service == null) service = new StoreServiceImpl();
		return service;
	}

	@Override
	public StoreVO selectStoreVo(int store_no) {
		dao.updateStoreViews(store_no);
		return dao.selectStoreVo(store_no);
	}

	@Override
	public int selectUserLike(LikeStoreVO likeVo) {
		return dao.selectUserLike(likeVo);
	}

	@Override
	public void updateStoreLikeCount(int store_no) {
		dao.updateStoreLikeCount(store_no);
	}

	@Override
	public int updateLike(LikeStoreVO likeVo) {
		return dao.updateLike(likeVo);
	}

	@Override
	public int selectLikeCount(int store_no) {
		return dao.selectLikeCount(store_no);
	}

	@Override
	public int selectUserFav(FavStoreVO favVo) {
		return dao.selectUserFav(favVo);
	}

	@Override
	public int updateFav(FavStoreVO favVo) {
		return dao.updateFav(favVo);
	}

	@Override
	public void updateStoreFavCount(int store_no) {
		dao.updateStoreFavCount(store_no);
	}

	@Override
	public int selectFavCount(int store_no) {
		return dao.selectFavCount(store_no);
	}

	@Override
	public List<ReviewStoreVO> selectReviewStoreVoList(int store_no) {
		return dao.selectReviewStoreVoList(store_no);
	}

	@Override
	public List<ImgReviewStoreVO> selectImgReviewStoreVoList(int store_no) {
		return dao.selectImgReviewStoreVoList(store_no);
	}

	@Override
	public int insertReview(ReviewStoreVO reVo) {
		return dao.insertReview(reVo);
	}

	@Override
	public ReviewStoreVO selectReview(int re_no) {
		return dao.selectReview(re_no);
	}

	@Override
	public float selectRateAvg(int store_no) {
		return dao.selectRateAvg(store_no);
	}

	@Override
	public void updateRateAvg(int store_no) {
		dao.updateRateAvg(store_no);
	}

	@Override
	public int deleteReview(int re_no) {
		return dao.deleteReview(re_no);
	}
}
