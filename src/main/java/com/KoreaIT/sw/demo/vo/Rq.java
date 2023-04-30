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

import lombok.Getter;
//@scope is belong to Component, componenets automatically manage baen data and it deals with scope
@Component
@Scope(value = "request", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Rq {
	@Getter
	private boolean isLogined;
	@Getter
	private int loginedMemberId;
	@Getter
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
	public void println(String str) {
		print(str+"\n");
	}
	public void login(Member member) {
		session.setAttribute("loginedMemberId", member.getId());
	}
	public void logout() {
		session.removeAttribute("loginedMemberId");
	}
	public String jsHistoryBack(String resultCode, String msg) {
		return Ut.jsHitoryBack(resultCode, msg);
	}
	public String jsReplace(String msg, String uri) {
		return Ut.jsReplace(msg, uri);
	}
	public String getCurrentUri() {
		String currentUri = req.getRequestURI();
		String QueryString = req.getQueryString();
		
		return currentUri;
	}
}
