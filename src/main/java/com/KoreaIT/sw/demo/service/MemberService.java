package com.KoreaIT.sw.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.KoreaIT.sw.demo.repository.MemberRepository;
import com.KoreaIT.sw.demo.util.Ut;
import com.KoreaIT.sw.demo.vo.Member;
import com.KoreaIT.sw.demo.vo.a;

@Service
public class MemberService {
	private MemberRepository memberRepository;
	
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	public String join(String userid, String userpw, String username, int userage, String userlocation, String usergender) {
		/* Member existmember = getMemberByuserId(userid); */
		
		memberRepository.doJoin(userid, userpw, username, userlocation, userage, usergender);
		return Ut.jsHitoryBack("S-1", "회원가입에 성공하였습니다");
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

	public Member getMemberById(int loginedMemberId) {
		return memberRepository.getMemberById(loginedMemberId);
	}


}
