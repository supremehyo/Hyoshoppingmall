package com.shoppingmall.DAO;

import java.util.List;

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

public interface ShopDAO {
	//카테고리별 상품 리스트
	public List<GoodsView> list (int cateCode) throws Exception;
	
	public List<GoodsView> list(int cateCode, int cateCodeRef) throws Exception;
	
	//상품조회
	public GoodsView goodsView(int gdsNum) throws Exception;
	
	//댓글 작성
	public void registReply(Reply reply) throws Exception;
	//댓글 리스트
	public List<ReplyList> replyList(int gdsNum) throws Exception;
	
	// 댓글 삭제
	public void deleteReply (Reply reply) throws Exception;
	
	//아이디 체크
	public String idCheck(int repNum) throws Exception;
	
	//댓글 수정
	public void modifyReply (Reply reply) throws Exception;
	
	//카트 담기
	public void addCart (Cart cart) throws Exception;
	
	//카트 리스트
	public List<CartList> cartList(String userId) throws Exception;
	
	//카트 삭제
	public void deleteCart(Cart cart) throws Exception;
	
	//주문 정보
	public void orderInfo(Order order) throws Exception;
	//주문 상세정보
	public void orderInfo_Details(OrderDetail orderDetail)throws Exception;
	
	//특정 유저 주문 목록
	public List<Order> orderList(Order order) throws Exception;
	
	//물건 클릭 조회 카운트
	
	public void objectCount(int gdsNum) throws Exception;
	
	
	public ObjectCount objectCountSearch(int gdsNum) throws Exception;
	
	public void objectCountinit(ObjectCount objectcount) throws Exception;
	
	public List<ObjectCount> objectCountTop(ObjectCountSub objectCountSub) throws Exception;
	
	public Goods objectRecommended(int gdsNum) throws Exception;
	
	public List<GoodsView> getSearchList(String title) throws Exception;
	
	// 특정 주문 목록
	public List<OrderList> orderView(Order order) throws Exception;
	//2차 카테고리 화면 출력
	public List<Category> secondCateList(int cateCode1) throws Exception;
	
	//카트 비우기
	public void cartAllDelete(String userId) throws Exception;
 }
