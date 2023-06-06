package com.KoreaIT.sw.demo.vo;

import java.io.IOException;
import java.util.Map;

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
	
	private Map<String, String> paramMap;
	
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
	public void initOnBeforeActionInterceptor() {
		// TODO Auto-generated method stub
		
	}
	public boolean isNotLogined() {
		return !isLogined;
	}
	public String getLoginUri() {
		return "/usr/member/login?afterLoginUri=" + getAfterLoginUri();
	}

	public String getLogoutUri() {
		String requestUri = req.getRequestURI();

		switch (requestUri) {
		case "/usr/article/write":
			return "../member/doLogout?afterLogoutUri=" + "/";
		case "/adm/member/list":
			return "../member/doLogout?afterLogoutUri=" + "/";
		}

		return "../member/doLogout?afterLogoutUri=" + getAfterLogoutUri();
	}
	public String getAfterLogoutUri() {
		return getEncodedCurrentUri();
	}

	public String getAfterLoginUri() {
//		로그인 후 접근 불가 페이지

		String requestUri = req.getRequestURI();

		switch (requestUri) {
		case "/usr/member/login":
		case "/usr/member/join":
			return Ut.getEncodedUri(Ut.getAttr(paramMap, "afterLoginUri", ""));
		}

		return getEncodedCurrentUri();
	}
	public String jsHitoryBackOnView(String msg) {
		req.setAttribute("msg", msg);
		req.setAttribute("historyBack", true);
		return "usr/common/js";

	}
	public String getImgUri(int id) {
		return "/common/genFile/file/article/" + id + "/extra/Img/1";
	}

	public String getProfileFallbackImgUri() {
		return "https://via.placeholder.com/150/?text=*^_^*";
	}

	public String getProfileFallbackImgOnErrorHtml() {
		return "this.src = '" + getProfileFallbackImgUri() + "'";
	}

	public String getRemoveProfileImgIfNotExitOnErrorHtmlAttr() {
		return "$(this).remove()";
	}
	public String getEncodedCurrentUri() {
		return Ut.getEncodedCurrentUri(getCurrentUri());
	}

	public String getArticleDetailUriFromArticleList(Article article) {
		return "/usr/article/detail?id=" + article.getId() + "&listUri=" + getEncodedCurrentUri();
	}

	public String getFindLoginIdUri() {
		return "/usr/member/findLoginId?afterFindLoginIdUri=" + getAfterFindLoginIdUri();
	}

	private String getAfterFindLoginIdUri() {
		return getEncodedCurrentUri();
	}

	public String getFindLoginPwUri() {
		return "/usr/member/findLoginPw?afterFindLoginPwUri=" + getAfterFindLoginPwUri();
	}

	private String getAfterFindLoginPwUri() {
		return getEncodedCurrentUri();
	}

	public boolean isAdmin() {
		if (isLogined == false) {
			return false;
		}

		return loginedMember.isAdmin();
	}

}
