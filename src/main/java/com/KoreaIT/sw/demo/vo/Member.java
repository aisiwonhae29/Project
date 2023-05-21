package com.KoreaIT.sw.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {
	private int id;
	private String userid;
	private String userpw;
	private String username; //added at 5/5
	private String location;
	private String usergender;
	private String useremail;
	private int userage;
	
	private String regDate;
	private String updateDate;
	
//	private String loginId;
//	private String loginPw;
	private int authLevel;
//	private String name;
	private String nickname;
	private String cellphoneNum;
//	private String email;
	private boolean delStatus;
	private String delDate;
	
	public String getForPrintType1RegDate() {
		return regDate.substring(2, 16).replace(" ", "<br />");
	}

	public String getForPrintType1UpdateDate() {
		return updateDate.substring(2, 16).replace(" ", "<br />");
	}

	public boolean isAdmin() {
		return this.authLevel == 7;
	}
}