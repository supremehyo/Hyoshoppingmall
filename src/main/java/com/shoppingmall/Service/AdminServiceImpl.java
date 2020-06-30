package com.shoppingmall.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shoppingmall.DAO.AdminDAO;
import com.shoppingmall.VO.Category;
import com.shoppingmall.VO.Goods;
import com.shoppingmall.VO.GoodsView;
import com.shoppingmall.VO.Order;
import com.shoppingmall.VO.OrderList;
@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	private AdminDAO dao;
	@Override
	public List<Category> category() throws Exception{
		return dao.category();
	}
	@Override
	public void register(Goods vo) throws Exception{
		dao.register(vo);
	}	
	@Override
	public List <GoodsView> goodslist() throws Exception{
		return dao.goodslist();
	}
	
	@Override
	public GoodsView goodsView(int gdsNum) throws Exception{
		return dao.goodsView(gdsNum);
	}
	
	@Override
	public void goodsModify (Goods vo) throws Exception{
		dao.goodsModify(vo);
	}
	
	@Override
	public void goodsDelete(int gdsNum) throws Exception{
		dao.goodsDelete(gdsNum);
	}
	
	// 주문 목록
	@Override
	public List<Order> orderList() throws Exception{
		return dao.orderList();
	}
	//특정 주문 목록
	@Override
	public List<OrderList> orderView(Order order)throws Exception{
		return dao.orderView(order);
	}
	@Override
	//배송 상태 업데이트
	public void delivery(Order order) throws Exception{
		dao.delivery(order);
	}
	@Override
	//주문 완료 시 상품 수량 변경
	public void changeStock(Goods goods) throws Exception{
		dao.changeStock(goods);
	}
}
