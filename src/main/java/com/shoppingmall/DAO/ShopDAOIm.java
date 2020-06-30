package com.shoppingmall.DAO;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shoppingmall.VO.Cart;
import com.shoppingmall.VO.CartList;
import com.shoppingmall.VO.Category;
import com.shoppingmall.VO.Goods;
import com.shoppingmall.VO.GoodsView;
import com.shoppingmall.VO.ObjectCount;
import com.shoppingmall.VO.ObjectCountSub;
import com.shoppingmall.VO.Order;
import com.shoppingmall.VO.OrderDetail;
import com.shoppingmall.VO.OrderList;
import com.shoppingmall.VO.Reply;
import com.shoppingmall.VO.ReplyList;

@Repository
public class ShopDAOIm implements ShopDAO{
	@Inject
	public SqlSession sql;
	
	private static String namespace = "com.shoppingmall.mappers.shopMapper";
	@Override
	public List<GoodsView> list(int cateCode) throws Exception{
		return sql.selectList(namespace + ".list_2" , cateCode);
	}
	
	@Override
	public List<GoodsView> list(int cateCode, int cateCodeRef) throws Exception{
		 HashMap<String, Object> map = new HashMap<String, Object>();
		 
		 map.put("cateCode", cateCode);
		 map.put("cateCodeRef", cateCodeRef);
		 
		 return sql.selectList(namespace + ".list_1", map);
	}
	
	@Override
	public GoodsView goodsView(int gdsNum) throws Exception{
		return sql.selectOne(namespace + ".goodsView",gdsNum);
	}
	
	@Override
	public void registReply(Reply reply) throws Exception{
		sql.insert(namespace + ".registReply" , reply);
	}
	
	@Override
	public List <ReplyList> replyList(int gdsNum) throws Exception{
		return sql.selectList(namespace + ".replyList" , gdsNum); 
	}
	
	@Override
	public void deleteReply (Reply reply) throws Exception{
		sql.delete(namespace + ".deleteReply" , reply);
	}
	
	@Override
	public String idCheck(int repNum) throws Exception{
		return sql.selectOne(namespace + ".replyUserIdCheck" , repNum);
	}
	
	@Override
	public void modifyReply(Reply reply) throws Exception{
		sql.update(namespace+ ".modifyReply" , reply);
	}
	
	@Override
	public void addCart(Cart cart) throws Exception{
		sql.insert(namespace + ".addCart" , cart);
	}
	
	@Override
	public List<CartList> cartList(String userId) throws Exception{
		return sql.selectList(namespace+ ".cartList" , userId);
	}
	
	@Override
	public void deleteCart(Cart cart) throws Exception{
		sql.delete(namespace + ".deleteCart" , cart); 
	}
	
	//주문 정보
	@Override
	public void orderInfo(Order order) throws Exception{
		sql.insert(namespace+ ".orderInfo" , order);
	}
	//주문 상세정보
	@Override
	public void orderInfo_Details(OrderDetail orderDetail)throws Exception{
		sql.insert(namespace+ ".orderInfo_Details" , orderDetail);
	}
	
	@Override
	//특정 유저 주문 목록
	public List<Order> orderList(Order order) throws Exception{
		return sql.selectList(namespace+".orderList",order);
	}
	
	@Override
	public void objectCount(int gdsNum) throws Exception{
		sql.update(namespace+ ".objectCountUpdate" , gdsNum);
	}
	
	@Override
	public ObjectCount objectCountSearch(int gdsNum) throws Exception{
		return sql.selectOne(namespace+ ".objectCountSearch" ,gdsNum);
	}
	
	@Override
	public void objectCountinit(ObjectCount objectcount) throws Exception{
		sql.insert(namespace+".objectCountinit",objectcount);
	}
	
	@Override
	public List<ObjectCount> objectCountTop(ObjectCountSub objectCountSub) throws Exception{
		return sql.selectList(namespace+".objectCountTop" ,objectCountSub);
	}
	
	@Override
	public Goods objectRecommended(int gdsNum) throws Exception{
		return sql.selectOne(namespace+".objectRecommended" ,gdsNum);
	}
	
	@Override
	public List<Category> secondCateList(int cateCode1) throws Exception{
		return sql.selectList(namespace+".secondCateList" , cateCode1);
	}
	
	@Override
	public List<GoodsView> getSearchList(String title) throws Exception{
		return sql.selectList(namespace+".searchList",title);
	}
	@Override
	// 특정 주문 목록
	public List<OrderList> orderView(Order order) throws Exception{
		return sql.selectList(namespace+".orderView" , order);
	}
	//카트에서 주문으로 넘어갈때 카트 목록 비우기
	@Override
	public void cartAllDelete(String userId) throws Exception{
		sql.delete(namespace + ".cartAllDelete", userId);
	}
}

