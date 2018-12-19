package com.jhta.cope.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jhta.cope.service.UserService;
import com.jhta.cope.vo.User;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping("/home")
	public String home() {
		return "user/home";
	}

	@RequestMapping(value = "/register", method=RequestMethod.GET)
	public String registerform(Model model) {
		User user = new User();
		model.addAttribute("userform",user);
		return "user/registerform";
	}

	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String registersubmit(@ModelAttribute("userform") @Valid User user, BindingResult errors,RedirectAttributes rttr) {
		if (!errors.hasErrors()) {
			System.out.println("post 진입");
			userService.insertUser(user);
			rttr.addFlashAttribute("msg","가입시 사용한 이메일로 인증해주세요");
		} else {
			System.out.println("-----------------\n 폼 입력 값 검증 실패");
			List<ObjectError> errorr = errors.getAllErrors();
			for (ObjectError objectError : errorr) {
				System.out.println(objectError.getDefaultMessage());
			}
			return "user/registerform";
			
		}
		return "redirect:home";
	}
	
	/*@RequestMapping(value="/emailConfirm",method=RequestMethod.GET)
	public String emailConfirm(@Valid User user) {
		System.out.println("cont get user"+user);
		
	}*/
}
