package com.shoppingmall.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shoppingmall.DAO.ShopDAO;
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

@Service
public class Shopservicelm implements Shopservice{

	@Inject
	private ShopDAO dao;
	
	@Override
	public List<GoodsView> list(int cateCode , int level) throws Exception{
		
		int cateCodeRef = 0;
		
		if(level==1) {
			cateCodeRef = cateCode; //1차 카테코리
			return dao.list(cateCode, cateCodeRef);
		}
		else {
			return dao.list(cateCode); //2차 카테고리
		}
		
	}
	
	@Override
	public GoodsView goodView(int gdsNum) throws Exception{
		return dao.goodsView(gdsNum);
	}
	
	@Override
	public void registReply(Reply reply) throws Exception{
		dao.registReply(reply);
	}
	
	@Override
	public List<ReplyList> replyList(int gdsNum) throws Exception{
		return dao.replyList(gdsNum);
	}
	
	@Override
	public void deleteReply (Reply reply) throws Exception{
		dao.deleteReply(reply);
	}
	
	@Override
	public String idCheck(int repNum) throws Exception{
		return dao.idCheck(repNum);
	}
	@Override
	public void modifyReply(Reply reply) throws Exception{
		dao.modifyReply(reply);
	}
	
	@Override
	public void addCart(Cart cart) throws Exception{
		dao.addCart(cart);
	}
	
	@Override
	public List<CartList> cartList(String userId) throws Exception{
		return dao.cartList(userId);
	}
	
	@Override
	public void deleteCart (Cart cart) throws Exception{
		dao.deleteCart(cart);
	}
	
	@Override
	public void orderInfo(Order order) throws Exception{
		dao.orderInfo(order);
	}
	
	@Override
	public void orderInfo_Details(OrderDetail orderDetail)throws Exception{
		dao.orderInfo_Details(orderDetail);
	}
	

	
	@Override
	public List<Order> orderList(Order order) throws Exception{
		return dao.orderList(order);
	}
	
	@Override
	public void objectCount(int gdsNum) throws Exception{
		dao.objectCount(gdsNum);
	}
	
	@Override
	public ObjectCount objectCountSearch(int gdsNum) throws Exception{
		return dao.objectCountSearch(gdsNum);
	}
	@Override
	public void objectCountinit(ObjectCount objectcount) throws Exception{//조회수가 처음 생겼을때 조회수 테이블에 insert 하는 메소드
		dao.objectCountinit(objectcount);
	}
	
	@Override
	public List<ObjectCount> objectCountTop(ObjectCountSub objectCountSub) throws Exception{
		return dao.objectCountTop(objectCountSub);
	}
	@Override
	public Goods objectRecommended(int gdsNum) throws Exception{
		return dao.objectRecommended(gdsNum);
	}
	@Override
	public List<GoodsView> getSearchList(String title) throws Exception{
		return dao.getSearchList(title);
	}
	@Override
	public List<OrderList> orderView(Order order) throws Exception{
		return dao.orderView(order);
	}
	
	@Override
	public List<Category> secondCateList(int cateCode1) throws Exception{
		return dao.secondCateList(cateCode1);
	}
	// 카트 비우기 
	@Override
	public void cartAllDelete(String userId) throws Exception {
		dao.cartAllDelete(userId);
	}
}
