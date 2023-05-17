package com.KoreaIT.sw.demo.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TodayRepository {
	@Insert("""
				INSERT INTO eat SET 
				date = #{date},
				location = #{location}, 
				menu = #{menu}, 
				usergendser = #{usergender},
				userage = #{userage}
			""")
	void writeMenu(String date, String location, String menu, String usergendser, int userage);
	
	
}
/*
 * @Insert(
 * """ 
 * <script> 
 * INSERT INTO reply 
 * SET regDate = NOW(), 
 * updateDate = NOW(), memberId = #{actorId}, 
 * relTypeCode = #{relTypeCode}, 
 * relId =#{relId},
 * `body`= #{body} 
 * </script> 
 * """)
 */