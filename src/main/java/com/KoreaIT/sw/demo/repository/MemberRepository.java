package com.KoreaIT.sw.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.KoreaIT.sw.demo.vo.Member;
import com.KoreaIT.sw.demo.vo.a;

@Mapper
public interface MemberRepository  {
	
	@Select("select * from `member` where id=#{loginedMemberId}")
	public Member getMemberById(int loginedMemberId); 

	@Update("""
			<script>
			UPDATE `member`
			<set>
				<if test="loginPw != null">
					userpw = #{loginPw},
				</if>
				<if test="name != null">
					username = #{name},
				</if>
				<if test="nickname != null">
					nickname = #{nickname},
				</if>
				<if test="cellphoneNum != null">
					cellphoneNum = #{cellphoneNum},
				</if>
				<if test="email != null">
					useremail = #{email},
				</if>
				updateDate= NOW()
			</set>
			WHERE id = #{id}
			</script>
			""")
	void modify(int id, String loginPw, String name, String nickname, String cellphoneNum, String email);
	
	@Insert("""
			INSERT INTO `member` SET
			userid = #{userid}, 
			userpw = #{userpw}, 
			username = #{username}, 
			location= #{location}, 
			userage = #{userage}, 
			usergender = #{usergender},	
			useremail=#{useremail}	,
			nickname=#{nickname},
			cellphoneNum=#{cellphoneNum},
			regDate=now(),	
			updateDate=now()
			""")
	public void doJoin(String userid, String userpw, String username, String location, int userage, String usergender, String useremail, String nickname, String cellphoneNum);
	
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
