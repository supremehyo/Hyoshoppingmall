package com.shoppingmall.shop;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoppingmall.Service.Shopservice;
import com.shoppingmall.VO.Cart;
import com.shoppingmall.VO.CartList;
import com.shoppingmall.VO.Category;
import com.shoppingmall.VO.Goods;
import com.shoppingmall.VO.GoodsView;
import com.shoppingmall.VO.Member;
import com.shoppingmall.VO.ObjectCount;
import com.shoppingmall.VO.ObjectCountSub;
import com.shoppingmall.VO.Order;
import com.shoppingmall.VO.OrderDetail;
import com.shoppingmall.VO.OrderList;
import com.shoppingmall.VO.Reply;
import com.shoppingmall.VO.ReplyList;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	@Inject
	Shopservice service;
	@Autowired
	ObjectCount objectCount;
	
	
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public void getList(@RequestParam("c") int cateCode,@RequestParam("l") int level , Model model) throws Exception {
		//카테고리 별로 물건 리스트를 보여주는곳
		List<GoodsView> list =null;
		List<ObjectCount> recommendlist = new ArrayList<ObjectCount>();
		List<Goods> recommendGoods = new ArrayList<Goods>();
		List<Category> secondCateList = new ArrayList<Category>();
		ObjectCountSub objectCountSub = new ObjectCountSub();
		
		objectCountSub.setCateCode1(cateCode); 
		recommendlist = service.objectCountTop(objectCountSub);//카테고리별로 가장 조회수가 높은 제품들의 리스트가 담긴다. 
		list = service.list(cateCode ,level);
		secondCateList = service.secondCateList(cateCode);
		for(int i=0;i<recommendlist.size();i++)
		{
			int num1 = recommendlist.get(i).getGdsNum();
			recommendGoods.add(service.objectRecommended(num1));
		}
		model.addAttribute("secondCateList" , secondCateList);
		model.addAttribute("cateCode", cateCode); // 카테고리마다 다른 화면을 보여주기 위해 전달
		model.addAttribute("recommendGoods" ,recommendGoods );
		model.addAttribute("list", list);
	}
	
	//물건 클릭 조회
	@RequestMapping(value="/view" ,method = RequestMethod.GET)
	public void getView(@RequestParam("n") int gdsNum, HttpServletRequest req ,Model model) throws Exception{
		
		GoodsView view = service.goodView(gdsNum);
		model.addAttribute("view",view);
		
		ObjectCount objectCount = service.objectCountSearch(gdsNum);
		if(objectCount == null) {//기존에 없던 물건이라면
			ObjectCount objectCount2 = new ObjectCount();
			int cateCode1 = Integer.parseInt(view.getCateCode());
			objectCount2.setCateCode1(cateCode1);
			objectCount2.setGdsNum(gdsNum);
			service.objectCountinit(objectCount2);
		}
		else { //기존에 있던 물건이라면
			service.objectCount(gdsNum);// 물건 넘버를 등록한뒤에 서비스로 위임
			model.addAttribute("amount", objectCount);
		}
		List<ReplyList> reply = service.replyList(gdsNum);
		model.addAttribute("reply" , reply);
	}
	
	/*@RequestMapping(value = "/view", method = RequestMethod.POST)
	public String registReply(Reply reply, HttpSession session) throws Exception {
	 Member member = (Member)session.getAttribute("member");
	 reply.setUserId(member.getUserId());
	 service.registReply(reply);
	 return "redirect:/shop/view?n=" + reply.getGdsNum();
	}*/
	
	// 상품 소감(댓글) 작성
	@ResponseBody
	@RequestMapping(value = "/view/registReply", method = RequestMethod.POST)
	public void registReply(Reply reply,  HttpSession session) throws Exception {
	 Member member = (Member)session.getAttribute("member");
	 reply.setUserId(member.getUserId());
	 
	 service.registReply(reply);
	} 
	
	// 상품 소감(댓글) 목록
	@ResponseBody
	@RequestMapping(value ="/view/replyList/{gdsNum}",method =RequestMethod.GET)
	public List<ReplyList> getReplyList(@PathVariable("gdsNum") int gdsNum)throws Exception {
		List<ReplyList> reply = service.replyList(gdsNum);
		
		return reply;
	}
	
	// 댓글삭제
	@ResponseBody
	@RequestMapping(value ="/view/deleteReply" ,method =RequestMethod.POST )
	public int getReplyList (Reply reply , HttpSession session) throws Exception{
		
		int result =0;
		Member member = (Member)session.getAttribute("member");
		String userId = service.idCheck(reply.getRepNum());
		
		if(member.getUserId().equals(userId));
		{
			reply.setUserId(member.getUserId());
			service.deleteReply(reply);
			
			result =1;
		}
		
		return result;
	}
	
	// 상품 소감(댓글) 수정
	@ResponseBody
	@RequestMapping(value = "/view/modifyReply", method = RequestMethod.POST)
	public int modifyReply(Reply reply, HttpSession session) throws Exception {
	 
	 int result = 0;
	 
	 Member member = (Member)session.getAttribute("member");
	 String userId = service.idCheck(reply.getRepNum());
	 
	 if(member.getUserId().equals(userId)) {
	  
	  reply.setUserId(member.getUserId());
	  service.modifyReply(reply);
	  result = 1;
	 }
	 
	 return result;
	} 
	
	//카트 담기
	@ResponseBody
	@RequestMapping(value = "/view/addCart" ,method = RequestMethod.POST)
	public int addCart(Cart cart , HttpSession session) throws Exception{
		
		int result =0;
		
		Member member = (Member)session.getAttribute("member");
		if(member != null)
		{
			cart.setUserId(member.getUserId());
			service.addCart(cart);
			result =1;
		}
		return result;
	}
	
	// 카트 목록
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) throws Exception {
	 
	 Member member = (Member)session.getAttribute("member");
	 String userId = member.getUserId();
	 
	 List<CartList> cartList = service.cartList(userId);
	 
	 model.addAttribute("cartList", cartList);
	 
	}
	
	
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session,
	     @RequestParam(value = "chbox[]") List<String> chArr, Cart cart) throws Exception {
	 //ajax 를 통해 넘어온 chbox 배열이 chArr 에 담긴다.
	 Member member = (Member)session.getAttribute("member");
	 String userId = member.getUserId();
	 
	 int result = 0;
	 int cartNum = 0;
	 
	 
	 if(member != null) {
	  cart.setUserId(userId);
	  
	  for(String i : chArr) {  // chArr 배열 포문 
	   cartNum = Integer.parseInt(i);
	   cart.setCartNum(cartNum);
	   service.deleteCart(cart);
	  }   
	  result = 1;
	 }  
	 return result;  
	}
	
	// 주문
	@RequestMapping(value = "/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, Order order, OrderDetail orderDetail) throws Exception {

	 Member member = (Member)session.getAttribute("member");  
	 String userId = member.getUserId();
	 
	 Calendar cal = Calendar.getInstance();
	 int year = cal.get(Calendar.YEAR);
	 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
	 String subNum = "";
	 
	 for(int i = 1; i <= 6; i ++) {
	  subNum += (int)(Math.random() * 10);//날짜와 랜덤숫자를 조합하여 주문 번호를 만든ㄷ
	 }
	 
	 String orderId = ymd + "_" + subNum;
	 
	 order.setOrderId(orderId);
	 order.setUserId(userId);
	  
	 service.orderInfo(order);
	 
	 orderDetail.setOrderId(orderId);   
	 orderDetail.setUserId(userId);
	 service.orderInfo_Details(orderDetail);
	 service.cartAllDelete(userId);
	 
	 return "redirect:/shop/orderList";  
	}
	
	// 주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, Order order, Model model) throws Exception {

	 
	 Member member = (Member)session.getAttribute("member");
	 String userId = member.getUserId();
	 
	 order.setUserId(userId);
	 
	 List<Order> orderList = service.orderList(order);
	 
	 model.addAttribute("orderList", orderList);
	}
	
	@GetMapping("/searchlist")
	public void getSearchList(@RequestParam("title") String title , Model model) throws Exception{
		List<GoodsView> list =null;
		list=service.getSearchList(title);
		model.addAttribute("searchlist",list);
	}
	
	// 주문 상세 목록
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session,
							@RequestParam("n") String orderId,
							Order order, Model model) throws Exception {
		
		Member member = (Member)session.getAttribute("member");
		String userId = member.getUserId();
		
		order.setUserId(userId);
		order.setOrderId(orderId);
		
		List<OrderList> orderView = service.orderView(order);
		
		model.addAttribute("orderView", orderView);
	}
	
}
