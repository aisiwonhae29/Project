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
	private String userlocation;
	private String usergender;
	private int userage;
}
