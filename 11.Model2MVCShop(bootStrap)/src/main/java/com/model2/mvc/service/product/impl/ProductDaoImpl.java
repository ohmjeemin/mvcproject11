package com.model2.mvc.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;

@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDao {

	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//C
	public ProductDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addProduct(Product product) throws Exception {
		sqlSession.insert("ProductMapper.addProduct", product);
	}

	@Override
	public Product findProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.getProduct", prodNo);		
	}

	
	@Override
	public Map<String, Object> getProductList(Search search) throws Exception {
		// TODO Auto-generated method stub
		
     Map<String, Object> map = new HashMap<String, Object>();
	 map.put("search", search);
	 System.out.println("getProductList() 의 map: >>>>>>>>>>>>>" + map);

	 List<Product> list = sqlSession.selectList("ProductMapper.getProductList", search);
	
	 map.put("list", list);
	 map.put("totalCount", sqlSession.selectOne("ProductMapper.getTotalCount", search));
	 
	 System.out.println("!DKLSKDLSadklajsdskljdlaskjdsajdlaj 토!탈!카!운!트! : : :" + map.get("totalCount"));
     System.out.println("getProductList() 의 list:>>>>>>>>>>>>>" + list);

		 
	 return map;
		 
	}
	
	@Override
	public void updateProduct(Product product) throws Exception {
		sqlSession.update("ProductMapper.updateProduct", product);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}

	@Override
	public String makeCurrentPageSql(String sql, Search search) {
		// TODO Auto-generated method stub
		return null;
	}
  

	@Override
	public List<String> getProdAuto(Map<String, String> map) throws Exception {
		return sqlSession.selectList("ProductMapper.autoProd", map);
	}

	
}
