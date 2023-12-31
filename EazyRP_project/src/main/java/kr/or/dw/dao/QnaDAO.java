package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.InquiryVO;
import kr.or.dw.vo.MerchandiseVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.ShopVO;
import kr.or.dw.vo.SiVO;
import kr.or.dw.vo.WareHouseVO;

@Mapper
public interface QnaDAO {

	int selectQnaListCount(SearchCriteria cri)throws SQLException;

	List<Map<String, Object>> selectQnaList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	void insertQna(InquiryVO qna) throws SQLException;

	void deleteQna(int inq_no) throws SQLException;

	void modifyQna(InquiryVO inquiry) throws SQLException;


	
}
