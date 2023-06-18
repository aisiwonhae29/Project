package com.KoreaIT.sw.demo.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class TestArticleController {
		@RequestMapping("/usr/test/list")
		public String showList(Model model) {
			return "gkkg";
		}
}
