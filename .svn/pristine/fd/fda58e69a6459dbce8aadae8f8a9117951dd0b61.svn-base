package com.jhta.cope.controller;

import java.util.List;

import javax.mail.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.cope.service.PaidLectureService;
import com.jhta.cope.service.UserService;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.Badge;
import com.jhta.cope.vo.User;

@Controller
@RequestMapping("/user/my/*")
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/home")
	public String home() {
		return "user/my_home";
	}
	@RequestMapping("/video")
	public String video() {
		return "user/my_video";
	}
	@RequestMapping("/dashboard")
	public String dashboard() {
		return "user/my_dashboard";
	}
	@RequestMapping("/stat")
	public String stat(Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		List<Badge> notHaveBadges = userService.notHaveBadge(user.getNo());
		List<Badge> haveBadges = userService.haveBadge(user.getNo());
		model.addAttribute("notHave",notHaveBadges);
		model.addAttribute("have", haveBadges);
		return "user/my_stat";
	}
	@RequestMapping("/write")
	public String write() {
		return "user/my_write";
	}
	@RequestMapping("/info")
	public String info() {
		return "user/my_info";
	}
}
