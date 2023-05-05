package com.KoreaIT.sw.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.KoreaIT.sw.demo.interceptor.BeforeActionInterceptor;
import com.KoreaIT.sw.demo.interceptor.NeedLoginInterceptor;
import com.KoreaIT.sw.demo.interceptor.NeedLogoutInterceptor;

@Configuration
public class MyWebMvcConfigurer implements WebMvcConfigurer {
	//call BeforeActionInterceptor
	@Autowired
	BeforeActionInterceptor beforeActionInterceptor;
	@Autowired
	NeedLoginInterceptor needLoginInterceptor;
	@Autowired
	NeedLogoutInterceptor needLogoutInterceptor;
	
	// /resource/common.css
	//apply Interceptor
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		InterceptorRegistration ir;
		ir=registry.addInterceptor(beforeActionInterceptor);
		ir.addPathPatterns("/**");
		ir.addPathPatterns("/favicon.ico");
//		ir=registry.addInterceptor(needLoginInterceptor);
		
//		ir.addPathPatterns("/usr/today/whopay");
//		ir=registry.addInterceptor(needLogoutInterceptor);
//		ir.addPathPatterns("/usr/member/login");
	}
//			InterceptorRegistration ir;
//
//			ir = registry.addInterceptor(beforeActionInterceptor);
//			ir.addPathPatterns("/**");
//			ir.addPathPatterns("/favicon.ico");
//			ir.excludePathPatterns("/resource/**");
//			ir.excludePathPatterns("/error");
//
//			ir = registry.addInterceptor(needLoginInterceptor);
//			ir.addPathPatterns("/usr/article/write");
//			ir.addPathPatterns("/usr/article/doWrite");
//			ir.addPathPatterns("/usr/article/modify");
//			ir.addPathPatterns("/usr/article/doModify");
//			ir.addPathPatterns("/usr/article/doDelete");
//
//			ir.addPathPatterns("/usr/member/myPage");
//			ir.addPathPatterns("/usr/member/checkPw");
//			ir.addPathPatterns("/usr/member/doCheckPw");
//			ir.addPathPatterns("/usr/member/modify");
//			ir.addPathPatterns("/usr/member/doModify");
//
//			ir.addPathPatterns("/usr/reply/doWrite");
//			ir.addPathPatterns("/usr/reply/modify");
//			ir.addPathPatterns("/usr/reply/doModify");
//			ir.addPathPatterns("/usr/reply/doDelete");
//
//			ir.addPathPatterns("/usr/reactionPoint/doGoodReaction");
//			ir.addPathPatterns("/usr/reactionPoint/doBadReaction");
//			ir.addPathPatterns("/usr/reactionPoint/doCancelGoodReaction");
//			ir.addPathPatterns("/usr/reactionPoint/doCancelBadReaction");
//
//			ir = registry.addInterceptor(needLogoutInterceptor);
//			ir.addPathPatterns("/usr/member/login");
//			ir.addPathPatterns("/usr/member/doLogin");
//			ir.addPathPatterns("/usr/member/join");
//			ir.addPathPatterns("/usr/member/doJoin");
//			ir.addPathPatterns("/usr/member/findLoginId");
//			ir.addPathPatterns("/usr/member/doFindLoginId");
//			ir.addPathPatterns("/usr/member/findLoginPw");
//			ir.addPathPatterns("/usr/member/doFindLoginPw");
//		}
	
}
