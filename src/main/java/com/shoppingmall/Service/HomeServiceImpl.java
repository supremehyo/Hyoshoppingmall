package com.shoppingmall.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shoppingmall.DAO.HomeDAO;
import com.shoppingmall.VO.LatestReply;

@Service
public class HomeServiceImpl implements HomeService {

	@Inject
	private HomeDAO dao;
	
	@Override
	public List<LatestReply> latestRely() throws Exception{
		return dao.latestRely();
	}
}
