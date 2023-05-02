package com.KoreaIT.sw.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.KoreaIT.sw.demo.repository.MemberRepository;
import com.KoreaIT.sw.demo.vo.Member;
import com.KoreaIT.sw.demo.vo.a;

@Service
public class MemberService {
	private MemberRepository memberRepository;
	
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}
	
	public String join(String userid, String userpw, String username, int userage, String userlocation, String usergender) {
		Member existmember = getMemberByuserId(userid);
		return userid;
	}
	

	public void practice(String string) {
		memberRepository.practice(string);
	}

	public Member getMemberByuserId(String userid) {
		Member member = memberRepository.getMemberByuserId(userid);
		return member;
	}

	public List getPractice() {
		return memberRepository.getPractice();
	}

	public Member getMemberById(int loginedMemberId) {
		return memberRepository.getMemberById(loginedMemberId);
	}
}
