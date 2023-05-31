package com.KoreaIT.sw.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KoreaIT.sw.demo.repository.TodayRepository;
import com.KoreaIT.sw.demo.vo.menu;
import com.KoreaIT.sw.demo.vo.todayeat;

@Service
public class TodayService {

	@Autowired
	private TodayRepository todayRepository;

	public TodayService(TodayRepository todayrepository) {
		this.todayRepository = todayrepository;
	}

	public List<todayeat> getRankLists(String[] consComb) {
		List<todayeat> rankLists = null;

		String clause = makeConstraint(consComb);

		rankLists = todayRepository.getRankLists(clause);
		return rankLists;
	}

	public List<todayeat> getRankListsDoubleCons(String[] consComb, String[] consComb2) {
		List<todayeat> rankLists = null;

		String clause  = makeConstraint(consComb);
		String clause2 = makeConstraint(consComb2);

		rankLists = todayRepository.getRankListsDoubleCons(clause, clause2);
		return rankLists;
	}

	
	public List<todayeat> getMainRankLists() {
		List<todayeat> mainRankLists = null;

		mainRankLists = todayRepository.getMainRankLists();

		return mainRankLists;
	}

	public String makeConstraint(String[] consComb) {
		
		if (consComb[0].equals("userage")) {
			consComb[1] = consComb[1].substring(0, 2);
			int consNum = Integer.parseInt(consComb[1]);
			return String.format("userage between %d and %d", consNum, consNum + 10);
			
		} else if (consComb[0].equals("usergender")) {
			consComb[1] = consComb[1].substring(0, 1);
			return String.format("usergender = '%s'", consComb[1]);
			
		} else {
			return String.format(
					"menuname IN(SELECT menuname FROM `menu`, foodtype WHERE menu.foodtype=foodtype.id AND foodtype.foodtype='%s') ",
					consComb[1]);
		}
	}

	public String test1(String el1) {
		return el1;
	}

	public List<menu> getmenuLists() {
		List<menu> menuLists = todayRepository.getMenuLists();
		return menuLists;
	}
}
