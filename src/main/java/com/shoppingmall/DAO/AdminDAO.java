package com.shoppingmall.DAO;

import java.util.List;

import com.shoppingmall.VO.Category;
import com.shoppingmall.VO.Goods;
import com.shoppingmall.VO.GoodsView;
import com.shoppingmall.VO.Order;
import com.shoppingmall.VO.OrderList;

public interface AdminDAO {
	public List<Category> category() throws Exception;
	public void register(Goods vo) throws Exception;
	public List<GoodsView> goodslist() throws Exception;
	public GoodsView goodsView(int gdsNum) throws Exception;
	public void goodsModify(Goods vo) throws Exception;
	public void goodsDelete(int gdsNum) throws Exception;
	// 주문 목록
	public List<Order> orderList() throws Exception;
	//특정 주문 목록
	public List<OrderList> orderView(Order order)throws Exception; 
	// 배송 상태 업데이트
	public void delivery(Order order) throws Exception;
	//주문 완료 시 상품 수량 변경
	public void changeStock(Goods goods) throws Exception;
}
