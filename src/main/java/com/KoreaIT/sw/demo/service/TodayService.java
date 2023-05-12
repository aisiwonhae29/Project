package com.KoreaIT.sw.demo.service;

import org.springframework.stereotype.Service;

import com.KoreaIT.sw.demo.repository.TodayRepository;

@Service
public class TodayService {
	private TodayRepository todayRepository;
	public TodayService(TodayRepository todayrepository) {
		this.todayRepository=todayrepository;
	}
}
