package com.jhta.cope.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.cope.service.InstructorNoticeService;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.InstructorNotice;
import com.jhta.cope.vo.User;

@Controller
@RequestMapping("/instructor/*")
public class InstructorController {

/*	@Autowired
	InstructorNoticeService instructorNoticeService;*/
	
	@RequestMapping("/userinfoNben")
	public String userinfoNben() {
		return "instructor/userinfoNben";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard() {
		return "instructor/dashboard";
	}
	
	@RequestMapping("/lecture")
	public String lecture() {
		return "instructor/lecture";
	}

	@RequestMapping("/result")
	public String result() {
		return "instructor/result";
	}

	@RequestMapping("/outcomereport")
	public String outcomereport() {
		return "instructor/outcomereport";
	}

	@RequestMapping("/ranking")
	public String ranking() {
		return "instructor/ranking";
	}

	
	
	
/*	@RequestMapping(value = "noticeAdd", method=RequestMethod.GET)
	public String notice(Model model) {
		return "instructor/notice";
	}
	
	@RequestMapping(value = "noticeAdd", method=RequestMethod.POST)
	public String notice(InstructorNotice instructorNotice) {
		instructorNotice.setWriter((User)SessionUtils.getAttribute("LOGIN_USER"));
		instructorNoticeService.insertNotice(instructorNotice);
		
		return "redirect:noticeList.do";
	}*/
	
	

	@RequestMapping("/notice")
	public String notice() {
		return "instructor/notice";
	}
	
	@RequestMapping("/creatingtitle")
	public String creatingtitle() {
		return "instructor/creatingtitle";
	}

	@RequestMapping("/creatinginfo")
	public String creatinginfo() {
		return "instructor/creatinginfo";
	}

	@RequestMapping("/upload")
	public String upload() {
		return "instructor/upload";
	}

	@RequestMapping("/uploadcmp")
	public String uploadcmp() {
		return "instructor/uploadcmp";
	}
}
