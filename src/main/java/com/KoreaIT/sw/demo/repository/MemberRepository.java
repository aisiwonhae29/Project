package com.KoreaIT.sw.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.KoreaIT.sw.demo.vo.Member;
import com.KoreaIT.sw.demo.vo.a;

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
	
	@Select("select * from a")
	List<a> getPractice();
	//List generics type make list form and it can setting in properties mybatis : type-aliases-package : class "url"
}
