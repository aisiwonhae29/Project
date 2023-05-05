package com.KoreaIT.sw.demo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.KoreaIT.sw.demo.vo.Rq;

@Component
public class NeedLogoutInterceptor implements HandlerInterceptor{
	@Autowired
	private Rq rq;
	
	//rq.isLogined() state session's loginedMemberId attribute is whether null or not. So if session is in logined state then 
	//this method forbid access to something. LoginInterceptor is opposed with this. 
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception{
		if(rq.isLogined()) {
			rq.printHistoryBackJs("로그아웃 후 이용해 주세요");
			return false;
		}
		return HandlerInterceptor.super.preHandle(req, resp, handler);
		
	}

}
