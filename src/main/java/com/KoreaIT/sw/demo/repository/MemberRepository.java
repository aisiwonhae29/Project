package com.KoreaIT.sw.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.KoreaIT.sw.demo.vo.Member;
import com.KoreaIT.sw.demo.vo.a;

@Mapper
public interface MemberRepository  {
	
	@Select("select * from `member` where id=#{loginedMemberId}")
	public Member getMemberById(int loginedMemberId); 

	@Insert("""
			INSERT INTO `member` SET
			userid = #{userid}, 
			userpw = #{userpw}, 
			username = #{username}, 
			userlocation = #{userlocation}, 
			userage = #{userage}, 
			usergender = #{usergender},	
			useremail=#{useremail}		
			""")
	public void doJoin(String userid, String userpw, String username, String userlocation, int userage, String usergender, String useremail);
	
	@Insert("insert into a set `name`=#{name}")
	public void practice(String name);

	@Select("""
			select *
			from `member`
			where userid=#{userid}
			""")
	Member getMemberByuserId(String userid);
	
	@Select("select * from a")
	List<a> getPractice();
	//List generics type make list form and it can setting in properties mybatis : type-aliases-package : class "url"

	@Select("""
			SELECT LAST_INSERT_ID()
			""")
	public int getLastInsertId();
	
	@Select("""
			select *
			from `member`
			where useremail=#{useremail}
			""")
	public Member getMemberByuseremail(String useremail);
}
