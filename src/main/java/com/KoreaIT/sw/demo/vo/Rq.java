package com.KoreaIT.sw.demo.vo;



import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import com.KoreaIT.sw.demo.service.MemberService;
import com.KoreaIT.sw.demo.util.Ut;
//@scope is belong to Component, componenets automatically manage baen data and it deals with scope
//@Component
//@Scope(value = "request", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Rq {
	private boolean isLogined;
	private int loginedMemberId;
	private Member loginedMember;
	
	private HttpServletRequest req;
	private HttpServletResponse resp;
	private HttpSession session;
	
	public Rq(HttpServletRequest req, HttpServletResponse resp,
			MemberService memberService) {
		this.req=req;
		this.resp=resp;
		
		this.session=req.getSession();
		
		boolean inLogined = false;
		int loginedMemberId=0;
		Member loginedMember = null;
		//if statement check state is null and fill value in each variables
		if(session.getAttribute("loginedMemberId")!=null) { 
			isLogined = true;
			loginedMemberId=(int) session.getAttribute("loginedMemberId");
			loginedMember = memberService.getMemberById(loginedMemberId);
		}
		this.isLogined=isLogined;
		this.loginedMemberId=loginedMemberId;
		this.loginedMember=loginedMember;
		
		this.req.setAttribute("rq", this);
		
	}
	public void printHistoryBackJs(String msg) throws IOException{
		resp.setContentType("text/html; charset=UTF-8");
		print(Ut.jsHitoryBack("F-B",msg));
	}
	public void print(String str) {
		try {
			resp.getWriter().append(str);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
}
