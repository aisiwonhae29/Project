package com.KoreaIT.sw.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class eat {
	private int id;
	private String date;
	private String location;
	private String menu;
	private String usergender;
	private int userage;
}
