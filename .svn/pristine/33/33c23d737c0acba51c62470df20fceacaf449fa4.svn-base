package com.jhta.cope.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import com.jhta.cope.service.FreeLectureService;
import com.jhta.cope.vo.FreeLecture;
import com.jhta.cope.vo.FreeLectureComent;
import com.jhta.cope.vo.FreeLectureSection;
import com.jhta.cope.vo.Photo;

@Controller
@RequestMapping("/free/*")
public class FreeLectureController {

	@Value("${freelecture.image.directory}")
	private String freeLectureImageDirectory;
	
	@Value("${freelecture.photo.image.directory}")
	private String freeLecturePhotoImageDirectory;
	
	@Autowired
	FreeLectureService freeLectureService;
	
	@RequestMapping("/form")
	public String form() {
		return "freelecture/form";
	}
	
	@RequestMapping(value="/submit", method=RequestMethod.POST)
	public String submit(HttpServletRequest request, MultipartFile lectureImgFile, 
			FreeLecture freeLecture,
			String[] sectionTitles, String[] sectionContents) throws Exception {
	/*	MultipartFile file = request.getFile("lecture-image");
		String lectureTitle = request.getParameter("lecture-title");
		
		System.out.println("에디터 컨텐츠 값:" + request.getParameter("editor"));
*/	
		
		if (!lectureImgFile.isEmpty()) {
			
			String filename = lectureImgFile.getOriginalFilename();
			freeLecture.setLectureImg(filename);
			
			FileCopyUtils.copy(lectureImgFile.getBytes(), new File(freeLectureImageDirectory, filename));
			
		}
		
		ArrayList<FreeLectureSection> sections = new ArrayList<>();
		for (int i = 0; i < sectionContents.length; i++) {
			FreeLectureSection section = new FreeLectureSection();
			section.setSectionContents(sectionContents[i]).setSectionTitles(sectionTitles[i]).setCount(i+1);
			sections.add(section);
		}
		
		freeLectureService.insertFreeLecture(freeLecture, sections);
		
		
		return "redirect:/free/list.do";
		
		
	}
	//단일파일업로드
	@RequestMapping("/photoUpload")
	public String photoUpload(HttpServletRequest request, Photo vo){
	    String callback = vo.getCallback();
	    String callback_func = vo.getCallback_func();
	    String file_result = "";
	    try {
	        if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
	            //파일이 존재하면
	            String original_name = vo.getFiledata().getOriginalFilename();
	            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
	            //파일 기본경로 _ 상세경로
	            String path = freeLecturePhotoImageDirectory;    
	           
	            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// 서버에 파일쓰기 /////////////////
	            vo.getFiledata().transferTo(new File(path, realname));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resources/img/free/photo_upload/"+realname;
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<FreeLecture> freeLectures = freeLectureService.getAllFreeLecture();
		model.addAttribute("freeLectures", freeLectures);
		return "freelecture/list";
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String detail(Model model, @RequestParam("freeLectureNo") int freeLectureNo) {
		
		FreeLecture freeLecture = freeLectureService.getFreeLecture(freeLectureNo);
		model.addAttribute("freeLecture", freeLecture);
		return "freelecture/detail";
	}
	
	@RequestMapping(value="/section", method=RequestMethod.GET)
	public String section(Model model, @RequestParam("freeLectureNo") int freeLectureNo, Integer count) {
		List<FreeLectureSection> freeLectureSections = freeLectureService.getFreeLectureSectionByLectureNo(freeLectureNo);
		if(count == null) {
			count = 1;
		}
		for (FreeLectureSection freeLectureSection : freeLectureSections) {
			if(count == freeLectureSection.getCount()) {
				List<FreeLectureComent> coments = freeLectureSection.getComments();
				for (FreeLectureComent freelectureCommet : coments) {
					System.out.println(freelectureCommet);
				}
				model.addAttribute("freeSection", freeLectureSection);
			}
		}
		
		model.addAttribute("freeLectureSections", freeLectureSections);
		return "freelecture/section";
	}
}
