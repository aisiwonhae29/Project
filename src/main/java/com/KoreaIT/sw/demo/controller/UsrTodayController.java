package com.KoreaIT.sw.demo.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.sw.demo.util.Ut;

@Controller
public class UsrTodayController {
	@RequestMapping("/usr/today/menu")
	@ResponseBody
	public String doEat(String menu, String location, String shop) {
		return Ut.jsReplace("맛있게 드세요!", "/");	}
	
	@RequestMapping("/usr/today/whopay")
	public  String whopay() {
		return "usr/whopay/whopay";
	}
	
	@RequestMapping("/usr/today/doEat")
	@ResponseBody
	public String doEat(ArrayList<Map<String, Object>> eatmember) {
		
		return "usr/whopay/~!~!";
	}
	
	@RequestMapping("/usr/today/whopaynum")
	public String whopaynum(String number, Model model) {
		model.addAttribute("num", number);
		return "usr/whopay/whopaynum";
	}
	
	@RequestMapping("/usr/today/where")
	public String where() {
		return "usr/menuselec/menuselec";
	}
}
