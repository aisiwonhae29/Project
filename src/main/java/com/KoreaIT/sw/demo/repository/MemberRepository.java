package com.KoreaIT.sw.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.KoreaIT.sw.demo.vo.Member;

@Mapper
public interface MemberRepository  {

	@Select("insert into `member` set ")
	public String doJoin();
	
	@Insert("insert into a set `name`=#{name}")
	public void practice(String name);

	@Select("""
			select *
			from `member`
			where userid=#{userid}
			""")
	public void doLogin(String userid, String userpw);
	
	@Select("""
			select *
			from `member`
			where userid=#{userid}
			""")
	Member getMemberByuserId(String userid);
}
