package com.KoreaIT.sw.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KoreaIT.sw.demo.repository.TodayRepository;
import com.KoreaIT.sw.demo.vo.todayeat;

@Service
public class TodayService {
	
	@Autowired
	private TodayRepository todayRepository;
	
	public TodayService(TodayRepository todayrepository) {
		this.todayRepository=todayrepository;
	}
	
	public List<todayeat> getRankLists(String listElement, String listValue) {
		List<todayeat> rankLists = null;
		
		rankLists=todayRepository.getRankLists(listElement, listValue);
		return rankLists;
	}
	
	public List<todayeat> getMainRankLists(){
		List<todayeat> mainRankLists = null;
		
		mainRankLists=todayRepository.getMainRankLists();
		
		return mainRankLists;
	}
}
