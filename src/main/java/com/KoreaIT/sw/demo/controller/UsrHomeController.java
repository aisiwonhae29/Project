package com.KoreaIT.sw.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.sw.demo.service.TodayService;
import com.KoreaIT.sw.demo.vo.todayeat;

@Controller
public class UsrHomeController {
	
	@Autowired
	private TodayService todayService;
	
	@RequestMapping("/usr/home/main")
//	@ResponseBody
	public String showMain(Model model) {
		List<todayeat> mainRankLists = todayService.getMainRankLists();
		model.addAttribute("mainRankLists", mainRankLists);
		return "usr/home/main";
	}

	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
	
	

}
