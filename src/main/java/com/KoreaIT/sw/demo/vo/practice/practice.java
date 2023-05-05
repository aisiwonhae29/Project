package com.KoreaIT.sw.demo.vo.practice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.KoreaIT.sw.demo.service.MemberService;

public class practice {//Rq class
		private HttpServletRequest req;
		private HttpServletResponse resp;
		private HttpSession session;
		
		public practice(HttpServletRequest req, HttpServletResponse resp,
				MemberService memberservice) {
			this.req = req;
			this.resp = resp;
			
			this.session = req.getSession();
		}
}
