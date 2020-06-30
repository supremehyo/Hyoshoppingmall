package com.shoppingmall.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shoppingmall.VO.Category;
import com.shoppingmall.VO.Goods;
import com.shoppingmall.VO.GoodsView;
import com.shoppingmall.VO.Order;
import com.shoppingmall.VO.OrderList;
@Repository
public class AdminDAOIm implements AdminDAO{

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.shoppingmall.mappers.adminMapper";
	@Override
	public List<Category> category() throws Exception{
		return sql.selectList(namespace + ".category");
	}
	
	@Override
	public void register(Goods vo) throws Exception{
		sql.insert(namespace + ".register" , vo);
	}
	
	@Override
	public List<GoodsView> goodslist() throws Exception{
		return sql.selectList(namespace+".goodslist");
	}
	
	@Override
	public GoodsView goodsView(int gdsNum) throws Exception{
		return sql.selectOne(namespace + ".goodsView" , gdsNum);
	}
	
	@Override
	public void goodsModify(Goods vo) throws Exception{
		sql.update(namespace + ".goodsModify" , vo);
	}
	
	@Override
	public void goodsDelete(int gdsNum) throws Exception{
		sql.delete(namespace+".goodsDelete" , gdsNum);
	}
	
	// 주문 목록
	@Override 
	public List<Order> orderList() throws Exception{
		return sql.selectList(namespace+".orderList");
	}
	//특정 주문 목록
	@Override
	public List<OrderList> orderView(Order order)throws Exception{
		return sql.selectList(namespace+".orderView",order);
	}
	@Override
	// 배송 상태 업데이트
	public void delivery(Order order) throws Exception{
		sql.update(namespace+".delivery" , order);
	}
	
	//주문 완료 시 상품 수량 변경
	public void changeStock(Goods goods) throws Exception
	{
		sql.update(namespace+".changeStock" , goods);
	}
}
