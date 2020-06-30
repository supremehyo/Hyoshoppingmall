package com.shoppingmall.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.shoppingmall.VO.LatestReply;

@Repository
public class HomeDAOIm  implements HomeDAO{
	
	@Inject
	public SqlSession sql;
	
	private static String namespace = "com.shoppingmall.mappers.homeMapper";
	
	@Override
	public List<LatestReply> latestRely() throws Exception{
		return sql.selectList(namespace +".lastestReply");
	}
}
