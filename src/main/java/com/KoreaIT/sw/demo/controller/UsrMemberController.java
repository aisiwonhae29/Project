package com.KoreaIT.sw.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.sw.demo.service.MemberService;
import com.KoreaIT.sw.demo.vo.ResultData;
import com.KoreaIT.sw.demo.vo.Rq;

@Controller
public class UsrMemberController {
	private HttpServletRequest req;
	private HttpServletResponse resp;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public ResultData doJoin(String userid, String userpw, String username, int userage, String userlocation, String usergender) {;
		if(userid==null) {
			return ResultData.from("f-1", "Id를 입력해주세요"); 
		}
		if(userpw==null) {
			return ResultData.from("f-2", "Pw를 입력해주세요"); 
		}
		if(username==null) {
			return ResultData.from("f-3", "이름를 입력해주세요"); 
		}
		if(userage==0) {
			return ResultData.from("f-4", "나이를 입력해주세요"); 
		}
		if(userlocation==null) {
			return ResultData.from("f-5", "지역를 입력해주세요"); 
		}
		if(usergender==null) {
			return ResultData.from("f-6", "성별를 입력해주세요"); 
		}
		Rq rq = new Rq(req, resp, memberService);
		memberService.join(userid, userpw, username, userage, userlocation, usergender);
		
		return ResultData.from("s-1", "가입에 성공하였습니다!");
	}
		
	@RequestMapping("/usr/memner/doLogin")
	@ResponseBody
	public ResultData doLogin(String userid, String userpw) {
		if(userid==null) {
			return ResultData.from("f-1", "Id를 입력해주세요");
		}
		memberService.login(userid, userpw);
		
		return ResultData.from("s-1", "로그인에 성공하였습니다");
	}
	
	
	@RequestMapping("/usr/member/practice")
	@ResponseBody
	public Object practice(String name) {
		memberService.practice(name);
		ResultData rd=null;
		if(name==null) {
			rd=ResultData.from("f-1", "Id를 입력해주세요");
			return rd; 
		}
		return "success";
	}
	
	@RequestMapping("/usr/member/geta")
	@ResponseBody
	public String getPractice() {
		return memberService.getPractice().toString();
	}
	
	@RequestMapping("/usr/member/login")
	public String showLogin() {
		return "usr/member/login";
	}
	
	@RequestMapping("/usr/member/join")
	public String showjoin() {
		return "usr/member/join";
	}
	
//	@Autowired
//	private MemberService memberService;
//
//	@RequestMapping("/usr/member/doJoin")
//	@ResponseBody
//	public ResultData<Member> doJoin(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
//			String email) {
//
//		if (Ut.empty(loginId)) {
//			return ResultData.from("F-1", "아이디를 입력해주세요");
//		}
//		if (Ut.empty(loginPw)) {
//			return ResultData.from("F-2", "비밀번호를 입력해주세요");
//		}
//		if (Ut.empty(name)) {
//			return ResultData.from("F-3", "이름을 입력해주세요");
//		}
//		if (Ut.empty(nickname)) {
//			return ResultData.from("F-4", "닉네임을 입력해주세요");
//		}
//		if (Ut.empty(cellphoneNum)) {
//			return ResultData.from("F-5", "전화번호를 입력해주세요");
//		}
//		if (Ut.empty(email)) {
//			return ResultData.from("F-6", "이메일을 입력해주세요");
//		}
//
//		ResultData<Integer> joinRd = memberService.join(loginId, loginPw, name, nickname, cellphoneNum, email);
//
//		if (joinRd.isFail()) {
//			return (ResultData) joinRd;
//		}
//
//		Member member = memberService.getMemberById(joinRd.getData1());
//
//		return ResultData.newData(joinRd, "member", member);
//	}
//
//	@RequestMapping("/usr/member/login")
//	public String showLogin(HttpSession httpSession) {
//		return "usr/member/login";
//	}
//
//	@RequestMapping("/usr/member/doLogin")
//	@ResponseBody
//	public String doLogin(HttpSession httpSession, String loginId, String loginPw) {
//
//		boolean isLogined = false;
//
//		if (httpSession.getAttribute("loginedMemberId") != null) {
//			isLogined = true;
//		}
//
//		if (isLogined) {
//			return Ut.jsHitoryBack("F-5", "이미 로그인 상태입니다");
//		}
//
//		if (Ut.empty(loginId)) {
//			return Ut.jsHitoryBack("F-1", "아이디를 입력해주세요");
//		}
//		if (Ut.empty(loginPw)) {
//			return Ut.jsHitoryBack("F-2", "비밀번호를 입력해주세요");
//		}
//
//		Member member = memberService.getMemberByLoginId(loginId);
//
//		if (member == null) {
//			return Ut.jsHitoryBack("F-3", Ut.f("%s는 존재하지 않는 아이디입니다", loginId));
//		}
//
//		if (member.getLoginPw().equals(loginPw) == false) {
//			return Ut.jsHitoryBack("F-4", Ut.f("비밀번호가 일치하지 않습니다"));
//		}
//
//		httpSession.setAttribute("loginedMemberId", member.getId());
//
//		return Ut.jsReplace("S-1", Ut.f("%s님 환영합니다", member.getName()), "/");
//	}
//
//	@RequestMapping("/usr/member/doLogout")
//	@ResponseBody
//	public ResultData doLogout(HttpSession httpSession) {
//
//		boolean isLogined = false;
//
//		if (httpSession.getAttribute("loginedMemberId") == null) {
//			isLogined = true;
//		}
//
//		if (isLogined) {
//			return ResultData.from("F-1", "이미 로그아웃 상태입니다");
//		}
//
//		httpSession.removeAttribute("loginedMemberId");
//
//		return ResultData.from("S-1", "로그아웃 되었습니다");
//	}
//
}
