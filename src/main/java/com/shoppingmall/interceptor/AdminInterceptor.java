package com.shoppingmall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.shoppingmall.VO.Member;

public class AdminInterceptor extends HandlerInterceptorAdapter{ 
//인터셉터를 사용하면 페이지 이동전에 세션의 여부를 알아보고 조건을 체크할수 있다. 조건이 맞으면 그대로 진행하게 하고 아니라면 다른 페이지로 리다이렉션 할 수 있음.
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception{
		//preHandle 은 컨트롤러 실행전에 실행 , postHandle 은 컨트롤러 실행후에 실행
		//HttpServletRequest 세션의 정보를 알아 올 수 있는 객체
		//HttpServletResponse 클라이언트에게 응답하기 위한 객체
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("member");
		
		if(member == null) {
			res.sendRedirect("/member/signin");
			return false;
		}
		
		if(member.getVerify()!=9) {
			res.sendRedirect("/");
			return false;
		}
		
		return true; //  true이면 그대로 컨트롤러로 진행함
	}
}
