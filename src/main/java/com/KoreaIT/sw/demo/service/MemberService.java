package com.KoreaIT.sw.demo.service;

import org.springframework.stereotype.Service;

import com.KoreaIT.sw.demo.repository.MemberRepository;
import com.KoreaIT.sw.demo.vo.Member;

@Service
public class MemberService {
	private MemberRepository memberRepository;
	
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	public String join(String userid, String userpw, String username, int userage, String userlocation, String usergender) {
		
		return userid;
	}

	public void practice(String string) {
		memberRepository.practice(string);
	}

	public void login(String userid, String userpw) {
		memberRepository.doLogin(userid, userpw);
	}
	
	private Member getMemberByuserId(String userid) {
		Member member = memberRepository.getMemberByuserId(userid);
		return member;
	}
}
