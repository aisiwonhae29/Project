package com.KoreaIT.sw.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KoreaIT.sw.demo.service.TodayService;

@Controller
public class UsrHomeController {
	
	@Autowired
	private TodayService todayService;
	
	@RequestMapping("/usr/home/main")
	public String showMain(Model model) {
		model.addAttribute("number", 123);
		return "usr/home/main";
	}

	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
	
	

}
