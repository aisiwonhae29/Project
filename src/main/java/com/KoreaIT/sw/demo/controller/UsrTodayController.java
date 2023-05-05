package com.KoreaIT.sw.demo.controller;

import org.springframework.stereotype.Controller;
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
}
