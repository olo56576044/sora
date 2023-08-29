package kr.or.dw.user.dao;

import java.util.List;
import java.util.Map;

import kr.or.dw.cs.vo.AnnouncementVO;
import kr.or.dw.store.vo.StoreVO;
import kr.or.dw.user.vo.UserVO;

public interface IUserDao {

	public int insertUser(UserVO vo);

	public UserVO loginUser(String user_email);

	public String getUser_nick(String user_nick);

	int updateUser(UserVO userVO);

	int deleteUser(int user_no);

	void updateUserPicPath(UserVO vo);

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
	 * 마이페이지에서 유저가 스크랩을 누른 점포 수를 불러온다.
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
