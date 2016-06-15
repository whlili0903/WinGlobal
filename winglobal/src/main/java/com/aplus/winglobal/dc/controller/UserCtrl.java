package com.aplus.winglobal.dc.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserCtrl {
	/**
	 * 首页转向
	 * 
	 * @return
	 */
	@RequestMapping({ "", "/", "index" })
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("redirect:/tp/load");
		return mav;
	}

	/**
	 * 建设中页面转向
	 * 
	 * @return
	 */
	@RequestMapping("/prep")
	public String prep() {
		Logger logger = LogManager.getLogger("");
		return "prep";
	}

	
}
