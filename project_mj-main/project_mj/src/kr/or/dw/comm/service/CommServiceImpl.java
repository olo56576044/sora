package kr.or.dw.comm.service;

import java.util.List;
import java.util.Map;

import kr.or.dw.comm.dao.CommDaoImpl;
import kr.or.dw.comm.dao.ICommDao;
import kr.or.dw.comm.vo.CommVO;
import kr.or.dw.comm.vo.LikeVO;
import kr.or.dw.comm.vo.ReplyVO;

public class CommServiceImpl implements ICommService{
	private ICommDao dao;
	private static CommServiceImpl service;
	
	private CommServiceImpl() {
		dao = CommDaoImpl.getInstance();
	}
	
	public static CommServiceImpl getInstance() {
		if (service == null) service = new CommServiceImpl();
		return service;
	}

	@Override
	public List<CommVO> selectCommList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return dao.selectCommList(paramMap);
	}

	@Override
	public CommVO selectCommView(int bd_no) {
		// TODO Auto-generated method stub
		return dao.selectCommView(bd_no);
	}

	@Override
	public int selectCommCount() {
		// TODO Auto-generated method stub
		return dao.selectCommCount();
	}

	@Override
	public List<ReplyVO> selectReplyList(int bd_no) {
		// TODO Auto-generated method stub
		return dao.selectReplyList(bd_no);
	}

	@Override
	public int selectUserLike(LikeVO likeVo) {
		// TODO Auto-generated method stub
		return dao.selectUserLike(likeVo);
	}

	@Override
	public void deleteContent(int bd_no) {
		// TODO Auto-generated method stub
		dao.deleteContent(bd_no);
	}

	@Override
	public int updateContent(CommVO commVO) {
		// TODO Auto-generated method stub
		return dao.updateContent(commVO);
	}

	@Override
	public int insertContent(CommVO commVO) {
		// TODO Auto-generated method stub
		return dao.insertContent(commVO);
	}

	@Override
	public List<String> selectCatComm() {
		// TODO Auto-generated method stub
		return dao.selectCatComm();
	}

	@Override
	public int updateLike(LikeVO likeVo) {
		// TODO Auto-generated method stub
		return dao.updateLike(likeVo);
	}

	@Override
	public int selectLikeCount(int bd_no) {
		// TODO Auto-generated method stub
		return dao.selectLikeCount(bd_no);
	}

	@Override
	public int insertReply(ReplyVO replyVo) {
		// TODO Auto-generated method stub
		return dao.insertReply(replyVo);
	}

	@Override
	public ReplyVO selectReply(int re_no) {
		// TODO Auto-generated method stub
		return dao.selectReply(re_no);
	}

	@Override
	public int updateReply(ReplyVO replyVo) {
		// TODO Auto-generated method stub
		return dao.updateReply(replyVo);
	}

	@Override
	public int deleteReply(int re_no) {
		// TODO Auto-generated method stub
		return dao.deleteReply(re_no);
	}

	@Override
	public void updateCommLikeCount(int bd_no) {
		// TODO Auto-generated method stub
		dao.updateCommLikeCount(bd_no);
	}

	
}
