package com.jhta.cope.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/instructor/*")
public class InstructorController {

	@RequestMapping("/userinfo")
	public String userinfo() {
		return "instructor/userinfo";
	}
	
	
}
