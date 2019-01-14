package com.jhta.cope.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.functors.ExceptionPredicate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.cope.service.InstructorNoticeService;
import com.jhta.cope.service.InstructorService;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.Instructor;
import com.jhta.cope.vo.InstructorNotice;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.User;

@Controller
@RequestMapping("/instructor/*")
public class InstructorController {
	
//	@Value("${instructor.image.directory}")
//	private String instructorImageDirectory;
//	
	@Value("${paidlecture.photo.image.directory}")
	String paidLectureThumbnailDirectory;
	
	@Autowired
	InstructorService instructorService;
	
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
	
	

	@RequestMapping("/noticeform")
	public String notice() {
		return "instructor/noticeform";
	}
	
//	@RequestMapping(value="/submit", method=RequestMethod.POST)
//	public String submit(HttpServletRequest request, MultipartFile instructorNoticeImgFile, InstructorNotice instructorNotice,
//			String[] sectionTitles, String[] sectionContents) throws Exception {
//		
//		if (!instructorNoticeImgFile.isEmpty()) {
//			
//			String filename = instructorNoticeImgFile.getOriginalFilename();
//			instructorNotice.setNoticeImg(filename);
//					
//			FileCopyUtils.copy(instructorImageDirectory.getBytes(), new File(instructorImageDirectory, filename));
//			
//		}
//		
//		ArrayList<Fr>
//	}
//	
	
	@RequestMapping(value = "reginstructor", method = RequestMethod.GET)
	public String reginstructor() {
		return "instructor/reginstructor";
	}
	
	@RequestMapping(value = "reginstructor", method = RequestMethod.POST)
	public String reginstructor(Instructor instructor) {
		
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		
		instructor.setUser(user);
	
		instructorService.regInstructor(instructor);
		
		return "redirect:reginstructor.do";
	
	}
	
	
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createlectures() {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");

		
		return "instructor/createlectures";
	}
	
	
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(PaidLecture paidLecture, @RequestParam("thumbnailfile") MultipartFile thumbnailfile) throws IOException  {
		
		if (!thumbnailfile.isEmpty()) {
			String filename = thumbnailfile.getOriginalFilename();
			FileCopyUtils.copy(thumbnailfile.getBytes(), new File(paidLectureThumbnailDirectory, filename));
			paidLecture.setThumbnail(filename);
		} else {
			paidLecture.setThumbnail("noimage.jpg");
		}
		
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		Instructor instructor = new Instructor();
		instructor.setNo(user.getNo());
		paidLecture.setInstructor(instructor);		
		
		instructorService.insertPaidLecture(paidLecture);
		
		
		return "redirect:dashboard.do";
	}
	
	
	
/*	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String createdetail(Model model) throws Exception {

		List<PaidLecture> paidLectures = instructorService.getAllPaidLectures();
		model.addAttribute("paidLectures", paidLectures);
		
		return "paidLectures/detail";
	}*/
	
	@RequestMapping("/createdetail")
	public String createdetail() {
		return "instructor/createdetail";
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
