package com.KoreaIT.sw.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.sw.demo.service.MemberService;
import com.KoreaIT.sw.demo.util.Ut;
import com.KoreaIT.sw.demo.vo.Member;
import com.KoreaIT.sw.demo.vo.ResultData;
import com.KoreaIT.sw.demo.vo.Rq;

@Controller
public class UsrMemberController {
	private HttpServletRequest req;
	private HttpServletResponse resp;
	//automatically link with memberService class object
	@Autowired
	MemberService memberService;
	@Autowired
	private Rq rq;
	//verify userId is duplicated
	@RequestMapping("/usr/member/getLoginIdDup")
	@ResponseBody
	public ResultData getLoginDup(String loginId) {
		//loginId retrieved userId from jsp page especially join.jsp in ajax method 
		 if(Ut.empty(loginId)) { return ResultData.from("F-1", "아이디를 입력해주세요"); }
		 Member existsMember = memberService.getMemberByuserId(loginId);
		 
		 if(existsMember != null) { return ResultData.from("F-2" , "해당 아이디는 사용중입니다",
		  "loginId", loginId); }
		
		 return ResultData.from("S-1","사용 가능!", "loginId", loginId);
	}
	@RequestMapping("/usr/member/getemailDup")
	@ResponseBody
	public ResultData getemailDup(String useremail) {
		
		 if(Ut.empty(useremail)) { return ResultData.from("F-1", "이메일을 입력해주세요"); }
		 Member existsMember = memberService.getMemberByEmail(useremail);
	 
		 if(existsMember != null) { return ResultData.from("F-2" , "해당 이메일은 사용중입니다",
		  "useremail", useremail); }
		
		 return ResultData.from("S-1","사용 가능!", "useremail", useremail);
	}
	
	@RequestMapping("/usr/member/doModify")
	@ResponseBody
	public String doModify(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {

		Member member = memberService.getMemberByuserId(loginId);


		ResultData modifyRd = memberService.modify(rq.getLoginedMemberId(), loginPw, name, nickname, cellphoneNum,
				email);

		return rq.jsReplace(modifyRd.getMsg(), "../member/mypage");
	}
	
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(@RequestParam(defaultValue = "/") String afterLoginUri, String userid, String userpw, String username,  @RequestParam("userage") int userage, String location, String usergender,
				String useremail, String nickname, String cellphoneNum) {
		/*
		 * if(Ut.empty(userid) ) { return Ut.jsHitoryBack("f-1", "Id를 입력해주세요"); }
		 * if(Ut.empty(userpw)) { return Ut.jsHitoryBack("f-2", "PW를 입력해주세요"); }
		 * if(Ut.empty(username)) { return Ut.jsHitoryBack("f-3", "이름를 입력해주세요"); }
		 * if(Ut.empty(userage)) { return Ut.jsHitoryBack("f-4", "나이를 입력해주세요"); }
		 * if(Ut.empty(userlocation)) { return Ut.jsHitoryBack("f-5", "지약를 입력해주세요"); }
		 * if(Ut.empty(usergender)) { return Ut.jsHitoryBack("f-6", "상뱔를 입력해주세요"); }
		 */
		ResultData<Integer> joinRd = memberService.join(userid, userpw, username, userage, location, usergender, useremail, nickname, cellphoneNum);
		
		if(joinRd.isFail()) {
			return rq.jsHistoryBack(joinRd.getResultCode(), joinRd.getMsg());
		}
		Member member = memberService.getMemberById(joinRd.getData1());
		
		String afterJoinUri = "../member/login?afterLoginUri="+Ut.getEncodedCurrentUri(afterLoginUri);
		
		return Ut.jsReplace("S-1", Ut.f("회원가입이 완료되었습니다"), afterJoinUri);
	}
		
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(String userid, String userpw,  @RequestParam(defaultValue = "/") String afterLoginUri) {
		
		if(rq.isLogined()) {
			return Ut.jsHitoryBack("F-5", "이미 로그인 상태입니다");
		}
		
		if(Ut.empty(userid)) {
			return Ut.jsHitoryBack("f-1", "Id를 입력해주세요");
		}
//		rq.print("Asdasd");
		if(Ut.empty(userpw)) {
			return Ut.jsHitoryBack("f-1","Pw를 입력해주세요");
		}
		Member member = memberService.getMemberByuserId(userid);
		
		if(member == null) {
			return Ut.jsHitoryBack("f-3", Ut.f("%s는 존재하지 않는 아이디입니다", userid));
		}
		if(userpw.equals(member.getUserpw())==false) {
			return  Ut.jsHitoryBack("f-4",Ut.f("비밀번호가 일치하지 않습니다"));
		}
		
		rq.login(member);
//		return Ut.jsHitoryBack("asd", "df");
		return Ut.jsReplace("S-1", Ut.f("%s님 환영합니다", member.getUsername()), afterLoginUri);
	}
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogout(@RequestParam(defaultValue="/") String afterLogoutUri) {
		afterLogoutUri="login";
		rq.logout();
		
		return Ut.jsReplace("s-1","안녕히가세요", afterLogoutUri);
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
	
	@RequestMapping("/usr/member/doCheckPw")
	@ResponseBody
	public String doCheckPw(String loginPw, String replaceUri) {
		 if(((String) rq.getLoginedMember().getUserpw()).equals(loginPw)==false) {
//			 return "<script>"+ "alert(\'"+rq.getLoginedMember().getUserpw()+"\')</script>";
			 return "<script>"+ "alert(\'"+rq.getLoginedMember().getUserpw().equals(loginPw)+"pW:"+loginPw +"\');   </script>";
//			 return rq.jsHistoryBack("", "비밀번호가 다릅니다");
		 };
//		 return "<script>"+ "alert(\'"+"맞았는데 왜그래;"+"\')</script>";
		 return "<script>location.replace(\"/usr/member/modify\")</script>";
	}
	
	@RequestMapping("/usr/member/modify")
	public String showModify() {
		return "usr/member/modify";
	}
	
	@RequestMapping("/usr/member/geta")
	@ResponseBody
	public void getPracice() {
	}
	
	@RequestMapping("/usr/member/login")
	public String showLogin(HttpSession httpSession) {
		return "usr/member/login";
	}
	
	@RequestMapping("/usr/member/join")
	public String showjoin() {
		return "usr/member/join";
	}
	
	@RequestMapping("/usr/member/mypage")
	public String showMyPage() {
		return "usr/member/mypage";
	}
	
	@RequestMapping("/usr/member/checkPw")
	public String showcheckPw() {
		return "usr/member/checkPw";
	}
}
