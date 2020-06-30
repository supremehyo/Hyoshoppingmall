package com.shoppingmall.DAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shoppingmall.VO.Member;

@Repository
//@Repository 는 해당 클래스가 DAO 라는것을 알리기위해 적어준다.
public class MemberDAOIm implements MemberDAO {

	@Inject
	private SqlSession sql;
	private static String namespace ="com.shoppingmall.mappers.memberMapper";
	
	@Override
	public void signup(Member vo) throws Exception {
		 sql.insert(namespace + ".signup",vo);
	}
	
	@Override
	public Member signin(Member vo) throws Exception {
		return sql.selectOne(namespace + ".signin", vo);
	}
}
