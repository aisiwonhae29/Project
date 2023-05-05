package com.KoreaIT.sw.demo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.KoreaIT.sw.demo.vo.Rq;

@Component
public class BeforeActionInterceptor implements HandlerInterceptor{
	@Autowired
	private Rq rq;
	
	//This method deal with excluding path pattern about applying interceptor. Write the patter 
	//with form makes the work.
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception{
		rq.initOnBeforeActionInterceptor();
		return HandlerInterceptor.super.preHandle(req, resp, handler);
	}
}
