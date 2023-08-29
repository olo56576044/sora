package kr.or.dw.user.service;

import java.util.List;
import java.util.Map;

import kr.or.dw.cs.vo.AnnouncementVO;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.user.vo.UserVO;

public interface IUserService {


	public String getUser_nick(String user_nick);   // 닉네임 조회하는 메서드 

	public int insertUser(UserVO vo); 			  // 회원 정보를 등록하는 메서드

	public UserVO loginUser(String user_email);

	public void updateUserPicPath(UserVO userVO);

	public int deleteUser(int user_no);

	public int updateUser(UserVO userVO);



	/**
	 * 공지사항 게시글 리스트를 불러온다
	 * @return
	 */
	public List<AnnouncementVO> selectAnVoList();

	/**
	 * 마이페이지에서 유저가 좋아요를 누른 점포 수를 불러온다.
	 * @param user_no
	 * @return
	 */
	public int selectStoreLikeCount(int user_no);
	
	/**
	 * 해당 유저가 좋아요를 한 점포 리스트를 가져온다.
	 * @param paramMap
	 * @return
	 */
	public List<StoreVO> selectStoreListL(Map<String, Object> paramMap);

	/**
	 * 마이페이지에서 유저가 즐겨찾기를 누른 점포 수를 불러온다.
	 * @param user_no
	 * @return
	 */
	public int selectStoreFavCount(int user_no);
	
	/**
	 * 해당 유저가 즐겨찾기를 한 점포 리스트를 가져온다.
	 * @param paramMap
	 * @return
	 */
	public List<StoreVO> selectStoreListF(Map<String, Object> paramMap);

	public int selectAnCount();
	
	/**
	 * 해당 유저 정보를 가져온다.
	 * @param user_no
	 * @return
	 */
	public UserVO selectUser(int user_no);




}
