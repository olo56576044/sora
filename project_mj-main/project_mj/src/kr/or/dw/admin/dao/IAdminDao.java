package kr.or.dw.admin.dao;

import java.util.List;
import java.util.Map;

import kr.or.dw.comm.vo.CommVO;
import kr.or.dw.store.vo.ImgStoreVO;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.user.vo.UserVO;

public interface IAdminDao {

	/**
	 * 관리자-회원관리-회원목록을 가져온다.
	 * @return 회원VO리스트
	 */
	List<UserVO> selectUserList(Map<String, Object> paramMap);
	
	/**
	 * 회원관리-회원을 삭제한다.
	 * @param user_no
	 * @return 결과 1
	 */
	int deleteUser(int user_no);

	int selectUserCount();

	/**
	 * 회원관리-해당회원이 작성한 커뮤니티 게시글 목록을 리스트로 받는다.
	 * @param paramMap 
	 * @return List<CommVO>
	 */

	List<CommVO> selectUserCommList(int user_no);

	List<String> selectStoreCatList();
	
	
	/**
	 * 새로운 점포를 등록한다.
	 * @param storeVo
	 */
	void insertStore(StoreVO storeVo);
	
	/**
	 * 점포에 태그를 등록한다.
	 * @param storeVo
	 */
	int insertStoreTag(StoreVO storeVo);
	
	/**
	 * 등록된 점포의 리스트를 불러온다.
	 * @param paramMap
	 * @return List<StoreVO>
	 */
	List<StoreVO> selectStoreList(Map<String, Object> paramMap);

	/**
	 * 등록된 점포의 수를 센다.
	 * @param cat 
	 * @return 등록점포 수
	 */
	int selectStoreCount(String cat);

	/**
	 * 점포번호로 해당 점포객체의 정보 불러온다.
	 * @param store_no
	 * @return StoreVO
	 */
	StoreVO selectStoreView(int store_no);
	
	/**
	 * 점포의 정보를 업데이트한다.
	 * @param storeVo
	 * @return 결과값 1
	 */
	int updateStore(StoreVO storeVo);
	
	/**
	 * 태그 리스트를 불러온다.
	 * @return List<String>
	 */
	List<String> selectTagList();
	
	/**
	 * 태그를 추가한다.
	 * @param tagName
	 * @return
	 */
	int insertTagName(String tagName);

	/**
	 * 태그를 삭제한다.
	 * @param tagName
	 * @return 삭제한 row 수(1) 
	 */
	int deleteTagName(String tagName);
	
	/**
	 * 	해당 점포의 태그를 업데이트 한다.
	 * @param storeVo
	 */
	void updateStoreTag(StoreVO storeVo);

	/**
	 * 점포 이미지를 등록한다.
	 * @param imgStoreVo
	 */
	void insertImgStore(ImgStoreVO imgStoreVo);

	/**
	 * 기존 점포 이미지를 모두 지운다.
	 * @param store_no
	 */
	void deleteImgStore(int store_no);
	
	/**
	 * 기존에 점포에 등록된 이미지를 모두 가져온다.
	 * @return
	 */
	List<ImgStoreVO> selectImgStoreList(int store_no);

	/**
	 * 기존에 점포에 등록된 썸네일 이미지를 삭제한다.
	 * @param store_no
	 */
	void deleteThumbImgStore(int store_no);

	/**
	 * 썸네일 올린다.
	 * @param storeVo
	 */
	void updateThumb(StoreVO storeVo);

	int selectStoreTagCount(String tag);

	List<StoreVO> selectStoreListT(Map<String, Object> paramMap);
}
