package com.KoreaIT.sw.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.sw.demo.service.MemberService;
import com.KoreaIT.sw.demo.util.Ut;
import com.KoreaIT.sw.demo.vo.Rq;

@Controller
public class TestController {
	//why make httpServlet independent varaible ??
	HttpServletRequest req;
	HttpServletResponse resp;
	MemberService memberService;
	@RequestMapping("/usr/practice/practice")
	public String practicehome() {
		return "usr/practice/practice";
	}
	
	//historyback method need ResponseBody must!
	@RequestMapping("/practice/home/historyback")
	@ResponseBody
	public String historyback() {
		return Ut.jsHitoryBack("gd", "연습이다");
	}
	
	@RequestMapping("/practice/postexample")
	@ResponseBody
	public String postexample(HttpServletRequest rq,String id) {
		return "asdasd";
	}
}
