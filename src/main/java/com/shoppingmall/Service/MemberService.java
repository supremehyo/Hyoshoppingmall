package com.shoppingmall.Service;

import javax.servlet.http.HttpSession;

import com.shoppingmall.VO.Member;

public interface MemberService {
	public void signup(Member vo) throws Exception;
	
	public Member signin(Member vo) throws Exception;
	
	public void signout(HttpSession session) throws Exception;
}
