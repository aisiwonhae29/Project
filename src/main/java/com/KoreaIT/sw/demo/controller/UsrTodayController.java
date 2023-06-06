package com.KoreaIT.sw.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.sw.demo.service.TodayService;
import com.KoreaIT.sw.demo.util.Ut;
import com.KoreaIT.sw.demo.vo.menu;
import com.KoreaIT.sw.demo.vo.todayeat;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class UsrTodayController {
	
	ObjectMapper objectMapper = new ObjectMapper();
	
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
//'광천식당', '맛집', '선화동', '남', '20대']
	@RequestMapping("/usr/today/doEat")
	@ResponseBody
	public Object doEat(String JSON) throws JsonMappingException, JsonProcessingException {
		
		 String[] array = JSON.split(","); 
		 String shopname =	 array[0];
		 String menuname =	 array[1];
		 String location =	 array[2];
		 String usergender=	 array[3];
		 int userage = Integer.parseInt(array[4]);
		 
		 todayService.writeeat(shopname, menuname, location, usergender, userage);
		 
		return array[0] + "/"+array[2];
	}
	
	@RequestMapping("/usr/today/doEats")
	@ResponseBody
	public Object doEats(String JSON) throws JsonMappingException, JsonProcessingException {
		
		 String[] array = JSON.split(","); 
		 String shopname =	 array[0];
		 String menuname =	 array[1];
		 String location =	 array[2];
		 String usergender=	 array[3];
		 int userage = Integer.parseInt(array[4]);
		 
		 todayService.writeeat(shopname, menuname, location, usergender, userage);
		 
		return array[0] + "/"+array[2];
	}

	@RequestMapping("/usr/today/getRankList")
	@ResponseBody
	public List<todayeat> getRankLists(String el1) {
		  String[] consComb = el1.split("#"); 
			  List<todayeat> rankLists=todayService.getRankLists(consComb);
		return rankLists;				
	}
	
	
	@RequestMapping("/usr/today/getRankListDoubleCons")
	@ResponseBody
	public List<todayeat> getRankLists2(String el1, String el2) {
		String[] consComb = el1.split("#");
		String[] consComb2 = el2.split("#");
		List<todayeat> rankLists=todayService.getRankListsDoubleCons(consComb, consComb2);
		return rankLists;
	}

	@RequestMapping("/usr/today/whopaynum")
	public String whopaynum(String number,String array, Model model) {
		model.addAttribute("getpeople", number);
		model.addAttribute("array", array);
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
	
	@RequestMapping("/usr/today/getMenu")
	@ResponseBody
	public List<menu> getMenu(){
		
		List<menu> menuLists = todayService.getmenuLists();;
		
		return menuLists;
	}
	
//	@RequestMapping("/usr/today/aa")
//	@ResponseBody
//	public String as(String aa, String hi) {
//		return aa;
//	}
//
}
