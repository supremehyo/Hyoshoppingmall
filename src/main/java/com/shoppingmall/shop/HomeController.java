package com.shoppingmall.shop;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoppingmall.Service.HomeService;
import com.shoppingmall.VO.LatestReply;

@Controller
public class HomeController {
	
	@Inject
	HomeService homeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		
		//여기 밑에 최근 후기 불러오는거 작성
		List<LatestReply> latestReply =new  ArrayList<LatestReply>();
		latestReply=homeService.latestRely();
		model.addAttribute("latestReply" , latestReply);
		
		return "home";
	}
	
}
