package com.KoreaIT.sw.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {
	private int id;
	private String userId;
	private String userPw;
	private String userLocation;
	private String userGender;
	private int userAge;
}
