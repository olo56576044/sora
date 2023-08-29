package kr.or.dw.store.service;

import java.util.List;

import kr.or.dw.store.vo.FavStoreVO;
import kr.or.dw.store.vo.ImgReviewStoreVO;
import kr.or.dw.store.vo.LikeStoreVO;
import kr.or.dw.store.vo.ReviewStoreVO;
import kr.or.dw.store.vo.StoreVO;

public interface IStoreService {

	/**
	 * 점포리스트에서 조회하러갈때
	 * 조회수를 1 늘리고,
	 * 점포번호로 점포VO를 부른다
	 * @param store_no
	 * @return
	 */
	StoreVO selectStoreVo(int store_no);
	
	/**
	 * 해당 유저 좋아요 수를 체크한다.
	 * @param likeVo
	 * @return
	 */
	int selectUserLike(LikeStoreVO likeVo);

	/**
	 * 유저 총 좋아요 수를 업데이트 하러 간다
	 * @param store_no
	 */
	void updateStoreLikeCount(int store_no);

	/**
	 * 유저가 좋아요를 눌렀을때 1 증가시키러 간다
	 * @param likeVo
	 * @return
	 */
	int updateLike(LikeStoreVO likeVo);
	
	/**
	 * 해당 점포 총 좋아요 수를 센다
	 * @param store_no
	 * @return
	 */
	int selectLikeCount(int store_no);

	/**
	 * 해당 유저 즐겨찾기 여부를 체크한다.
	 * @param favVo
	 * @return
	 */
	int selectUserFav(FavStoreVO favVo);

	/**
	 * 유저가 즐겨찾기를 눌렀을때 1 증가시키러 간다
	 * @param likeVo
	 * @return
	 */
	int updateFav(FavStoreVO favVo);

	/**
	 * 유저 총 즐겨찾기 수를 업데이트 하러 간다
	 * @param store_no
	 */
	void updateStoreFavCount(int store_no);

	/**
	 * 해당 점포 총 즐겨찾기 수를 센다
	 * @param store_no
	 * @return
	 */
	int selectFavCount(int store_no);
	
	/**
	 * 해당 점포의 리뷰글들을 가져온다
	 * @param store_no
	 * @return
	 */
	List<ReviewStoreVO> selectReviewStoreVoList(int store_no);
	
	/**
	 * 해당 점포의 리뷰글 사진 목록을 가져온다.
	 * @param store_no
	 * @return
	 */
	List<ImgReviewStoreVO> selectImgReviewStoreVoList(int store_no);
	
	/**
	 * 새로운 리뷰를 추가한다.
	 * @param reVo
	 * @return
	 */
	int insertReview(ReviewStoreVO reVo);
	
	/**
	 * 새로 추가한 리뷰를 불러온다.
	 * @param re_no
	 * @return
	 */
	ReviewStoreVO selectReview(int re_no);
	
	/**
	 * 해당 점포의 평점평균을 구한다.
	 * @param store_no
	 * @return
	 */
	float selectRateAvg(int store_no);

	/**
	 * 해당 점포의 평점평균을 업데이트한다.
	 * @param store_no
	 */
	void updateRateAvg(int store_no);
	
	/**
	 * 해당 리뷰를 삭제한다.
	 * @param re_no
	 * @return
	 */
	int deleteReview(int re_no);

}
