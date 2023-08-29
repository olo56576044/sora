package kr.or.dw.service;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.ContactDAO;
import kr.or.dw.dao.ItemDAO;
import kr.or.dw.dao.WarehouseDAO;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.EmpVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.WareHouseVO;



@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private ItemDAO itemDAO;

	@Override
	public Map<String, Object> selectItemList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Map<String, Object>> itemList = itemDAO.selectItemList(cri, rowBounds);
		int totalCount = itemDAO.selectItemListCount(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("itemList", itemList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
		
	}

	@Override
	public List<Map<String, Object>> getWarehouse(Map<String, String> dataMap) throws SQLException {
		List<Map<String, Object>> warehouseList = itemDAO.selectFindSearchWarehouseList(dataMap);
		return warehouseList;
	}

	@Override
	public List<Map<String, Object>> getWarehouseList() throws SQLException {
		List<Map<String, Object>> warehouseList = itemDAO.selectFindWarehouseList();
		return warehouseList;
	}

	@Override
	public List<Map<String, Object>> getSprice(Map<String, String> dataMap) throws SQLException {
		List<Map<String, Object>> spriceList = itemDAO.selectFindSearchSpriceList(dataMap);
		return spriceList;
	}

	@Override
	public List<Map<String, Object>> getSpriceList() throws SQLException {
		List<Map<String, Object>> spriceList = itemDAO.selectFindSpriceList();
		return spriceList;
	}

	@Override
	public void registItem(ProductVO product) throws SQLException {
		itemDAO.insertItem(product);
		
	}

	@Override
	public Map<String, Object> selectProductDetail(String pr_no) throws SQLException {
		Map<String, Object> product = itemDAO.selectProductDetail(pr_no);
		return product;
	}

	@Override
	public void modifyItem(ProductVO product) throws SQLException {
		itemDAO.updateProduct(product);
		
	}

	@Override
	public void deleteProduct(ProductVO product) throws SQLException {
		itemDAO.deleteProduct(product);
		
	}

	

	
	
}
