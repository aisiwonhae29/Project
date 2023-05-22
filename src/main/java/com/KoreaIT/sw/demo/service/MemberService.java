package com.KoreaIT.sw.demo.service;

import org.springframework.stereotype.Service;

import com.KoreaIT.sw.demo.repository.MemberRepository;
import com.KoreaIT.sw.demo.util.Ut;
import com.KoreaIT.sw.demo.vo.Member;
import com.KoreaIT.sw.demo.vo.ResultData;

@Service
public class MemberService {
	private MemberRepository memberRepository;
	
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	public ResultData join(String userid, String userpw, String username, int userage, String location, String usergender, String useremail, String nickname, String cellphoneNum) {
		/* Member existmember = getMemberByuserId(userid); */
		
		memberRepository.doJoin(userid, userpw, username, location, userage, usergender, useremail, nickname, cellphoneNum);
		int id=memberRepository.getLastInsertId();
		return ResultData.from("S-1", "회원가입이 완료되었습니다!","id", id);
	}
	
//	public ResultData<Integer> join(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
//			String email) {
//		// 로그인 아이디 중복체크
//		Member existsMember = getMemberByLoginId(loginId);
//
//		if (existsMember != null) {
//			return ResultData.from("F-7", Ut.f("이미 사용중인 아이디(%s)입니다", loginId));
//		}
//
//		// 이름 + 이메일 중복체크
//		existsMember = getMemberByNameAndEmail(name, email);
//
//		if (existsMember != null) {
//			return ResultData.from("F-8", Ut.f("이미 사용중인 이름(%s)과 이메일(%s)입니다", name, email));
//		}
//
//		memberRepository.join(loginId, loginPw, name, nickname, cellphoneNum, email);
//
//		int id = memberRepository.getLastInsertId();
//
//		return ResultData.from("S-1", "회원가입이 완료되었습니다", "id", id);
//	}

	public void practice(String string) {
		memberRepository.practice(string);
	}

	public Member getMemberByuserId(String userid) {
		Member member = memberRepository.getMemberByuserId(userid);
		return member;
	}
	public Member getMemberByEmail(String useremail) {
		return memberRepository.getMemberByuseremail(useremail);
	}
	
	public Member getMemberById(int loginedMemberId) {
		return memberRepository.getMemberById(loginedMemberId);
	}
	public ResultData modify(int id, String loginPw, String name, String nickname, String cellphoneNum, String email) {
		memberRepository.modify(id, loginPw, name, nickname, cellphoneNum, email);
		return ResultData.from("S-1", "회원 정보 수정이 완료되었습니다");
	}
	
	

}
