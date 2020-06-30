package com.shoppingmall.DAO;

import java.util.List;

import com.shoppingmall.VO.LatestReply;


public interface HomeDAO {
	public List<LatestReply> latestRely() throws Exception;
}
