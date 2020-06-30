package com.shoppingmall.DAO;

import com.shoppingmall.VO.Member;

public interface MemberDAO {

		public void signup(Member vo ) throws Exception;
		
		public Member signin(Member vo) throws Exception;
}
