package com.KoreaIT.sw.demo.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MemberRepository  {

	@Select("insert into `member` set ")
	public String doJoin();
}
