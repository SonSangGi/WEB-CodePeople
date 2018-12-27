package com.jhta.cope.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.cope.service.UserService;

@Controller
@RequestMapping("/user/my/*")
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/home")
	public String home() {
		return "user/home";
	}
	
	@RequestMapping("sample")
	public String sample() {
		return "qna/detail";
	}
}
