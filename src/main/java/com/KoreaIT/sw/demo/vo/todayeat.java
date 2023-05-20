package com.KoreaIT.sw.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class todayeat {
	private int id;
	private String date;
	private String location;
	private String menuname;
	private String usergender;
	private int userage;
}
