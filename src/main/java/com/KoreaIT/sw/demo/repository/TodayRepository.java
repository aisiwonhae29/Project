package com.KoreaIT.sw.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.KoreaIT.sw.demo.vo.todayeat;

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
	
	@Select("""
				SELECT COUNT(*) FROM todayeat, ${listElement}
				WHERE todayeat.${listElement} = ${listElement}.${listElement} and todayeat.${listElement}=${listValue}
				GROUP BY menuname
				ORDER BY COUNT(*) DESC LIMIT 5;
			""")
	List<todayeat> getRankLists(String listElement, String listValue);
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