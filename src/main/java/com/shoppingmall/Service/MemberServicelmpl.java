package com.shoppingmall.Service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.shoppingmall.DAO.MemberDAO;
import com.shoppingmall.VO.Member;

@Service
public class MemberServicelmpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	@Override
	public void signup(Member vo) throws Exception{
		dao.signup(vo);
	}
	
	@Override
	public Member signin(Member vo) throws Exception{
		return dao.signin(vo);
	}
	
	@Override
	public void signout(HttpSession session) throws Exception{
		session.invalidate();
	}
}
