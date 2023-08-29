package kr.or.dw.comm.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.dw.comm.vo.CommVO;
import kr.or.dw.comm.vo.LikeVO;
import kr.or.dw.comm.vo.ReplyVO;
import kr.or.dw.util.BuildSqlMapClient;

public class CommDaoImpl implements ICommDao {
	private static CommDaoImpl dao;
	private SqlMapClient client;
	
	private CommDaoImpl() {
		client = BuildSqlMapClient.getSqlMapClient();
	}
	
	public static CommDaoImpl getInstance() {
		if (dao == null) dao = new CommDaoImpl();
		return dao;
	}

	@Override
	public List<CommVO> selectCommList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		List<CommVO> commList = null;
		try {
			commList = client.queryForList("comm.selectCommList", paramMap);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("daoimpl" + commList);
		return commList;
	}

	@Override
	public CommVO selectCommView(int bd_no) {
		// TODO Auto-generated method stub
		CommVO commVo = null;
		
		try {
			commVo = (CommVO) client.queryForObject("comm.selectCommView", bd_no);
			client.update("comm.increaseHit", bd_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return commVo;
	}

	@Override
	public int selectCommCount() {
		// TODO Auto-generated method stub
		int count = 0;
		try {
			count = (int) client.queryForObject("comm.selectCommCount");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public List<ReplyVO> selectReplyList(int bd_no) {
		// TODO Auto-generated method stub
		List<ReplyVO> replyList = null;
		try {
			replyList = client.queryForList("comm.selectReplyList", bd_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return replyList;
	}

	@Override
	public int selectUserLike(LikeVO likeVo) {
		// TODO Auto-generated method stub
		Object result;
		int num = 0;
		
		try {
			result = client.queryForObject("comm.selectUserLike", likeVo);
			if(result != null) {
				num = Integer.parseInt(result.toString());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(num);
		return num;
	}

	@Override
	public void deleteContent(int bd_no) {
		// TODO Auto-generated method stub
		try {
			client.update("comm.deleteContent", bd_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public int updateContent(CommVO commVO) {
		// TODO Auto-generated method stub
		int result = 0;
		
		try {
			result = client.update("comm.updateContent", commVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int insertContent(CommVO commVO) {
		// TODO Auto-generated method stub
		int bd_no = 0;
		
		try {
			bd_no = (int) client.insert("comm.insertContent", commVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return bd_no;
	}

	@Override
	public List<String> selectCatComm() {
		// TODO Auto-generated method stub
		List<String> catCommList = null;
		
		try {
			catCommList = client.queryForList("comm.selectCatComm");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return catCommList;
	}

	@Override
	public int updateLike(LikeVO likeVo) {
		// TODO Auto-generated method stub
		int result = 0;
		
		try {
			result = client.update("comm.updateLike", likeVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int selectLikeCount(int bd_no) {
		// TODO Auto-generated method stub
		int count = 0;
		
		try {
			count = (int) client.queryForObject("comm.selectLikeCount", bd_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}

	@Override
	public int insertReply(ReplyVO replyVo) {
		
		int re_no = 0;
		
		try {
			re_no = (int) client.insert("comm.insertReply", replyVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return re_no;
	}

	@Override
	public ReplyVO selectReply(int re_no) {
		ReplyVO replyVo = null;
		
		try {
			replyVo = (ReplyVO) client.queryForObject("comm.selectReply", re_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return replyVo;
	
	
	
	}

	@Override
	public int updateReply(ReplyVO replyVo) {
		int result = 0;
		
		try {
			result = client.update("comm.updateReply", replyVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	
	}

	@Override
	public int deleteReply(int re_no) {

		int result = 0;
		
		try {
			result = client.update("comm.deleteReply", re_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void updateCommLikeCount(int bd_no) {
		// TODO Auto-generated method stub
		try {
			client.update("comm.updateCommLikeCount" , bd_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
