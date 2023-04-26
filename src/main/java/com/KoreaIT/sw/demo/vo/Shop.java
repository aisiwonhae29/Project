package com.KoreaIT.sw.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Shop {
	private int id;
	private String shopname;
	private int locationid;
}
