package com.KoreaIT.sw.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.KoreaIT.sw.demo.vo.menu;
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
				SELECT * FROM todayeat
				WHERE ${condition}
				GROUP BY menuname
				ORDER BY COUNT(*) DESC LIMIT 5;
			""")
	List<todayeat> getRankLists(String condition);
	
	@Select("""
			SELECT * FROM todayeat
			GROUP BY menuname
			ORDER BY COUNT(*) DESC LIMIT 5;
		""")
	List<todayeat> getMainRankLists();
	
	@Select("""
			SELECT * FROM todayeat
			WHERE ${clause} and ${clause2}
			GROUP BY menuname
			ORDER BY COUNT(*) DESC LIMIT 5;
		""")
	List<todayeat> getRankListsDoubleCons(String clause, String clause2);

	@Select(""" 
			SELECT * FROM menu
			""")
	List<menu> getMenuLists();
	
	@Insert("""
			INSERT INTO todayeat
			SET shopname='${shopname}',
			menuname='${menuname}',
			location='${location}',
			usergender='${usergender}',
			`date`=NOW(),
			userage=${userage};
			""")
	void writeeat(String shopname, String menuname, String location, String usergender, int userage);
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