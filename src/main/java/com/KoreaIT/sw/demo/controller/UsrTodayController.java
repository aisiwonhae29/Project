package com.KoreaIT.sw.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.sw.demo.service.TodayService;
import com.KoreaIT.sw.demo.util.Ut;
import com.KoreaIT.sw.demo.vo.todayeat;

@Controller
public class UsrTodayController {

	@Autowired
	private TodayService todayService;

	@RequestMapping("/usr/today/menu")
	@ResponseBody
	public String doEat(String menu, String location, String shop) {
		return Ut.jsReplace("맛있게 드세요!", "/");
	}

	@RequestMapping("/usr/today/whopay")
	public String whopay() {
		return "usr/whopay/whopay";
	}

	@RequestMapping("/usr/today/doEat")
	@ResponseBody
	public String doEat(ArrayList<Map<String, Object>> eatmembers) {
		String date;
		String location;
		String menu;
		String usergender;
		int userage;
		return "usr/whopay/~!~!";
	}

	@RequestMapping("/usr/today/getRankList")
	@ResponseBody
	public List<todayeat> getRankLists(String el1) {
		
		
		  String[] consComb = el1.split("#"); 
		  
		  
			  List<todayeat> rankLists=todayService.getRankLists(consComb);
		return rankLists;				
	}
	
	@RequestMapping("/usr/today/aa")
	@ResponseBody
	public String as(String aa, String hi) {
		return aa;
	}
	
	
	
	@RequestMapping("/usr/today/getRankList2")
	public String getRankLists2(String listElement, String listValue, Model model) {
		return "ASd";
	}

	@RequestMapping("/usr/today/whopaynum")
	public String whopaynum(String number,Model model) {
		model.addAttribute("getpeople", number);
		return "usr/whopay/whopaynum";
	}

	@RequestMapping("/usr/today/where")
	public String where(@RequestParam(defaultValue = "맛집") String menu, Model model) {
		model.addAttribute("menu", menu);
		return "usr/where/where";
	}

	@RequestMapping("/usr/today/eat")
	public String showeat(Model model) {

		return "usr/eat/eat";
	}
}
