package com.jhta.cope.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jhta.cope.service.UserService;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.User;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("id") String id, @RequestParam("password") String password,
			HttpServletRequest request) {
		User user = userService.getUserById(id);

		System.out.println(request.getPathInfo());
		System.out.println(request.getContextPath());

		if (user == null) {
			return "redirect:/home.do?fail=login";
		}
		if (user.getAuthStatus() == 0) {
			return "redirect:/home.do?fail=auth";
		}
		if (!user.getPassword().equals(password)) {
			return "redirect:/home.do?fail=login";
		}
		SessionUtils.addAttribute("LOGIN_USER", user);
		System.out.println(SessionUtils.getAttribute("LOGIN_USER"));
		return "redirect:/home.do";
	}

	@RequestMapping(value = "/logout")
	public String logout() {
		SessionUtils.removeAttribute("LOGIN_USER");
		return "redirect:/home.do";

	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String registerform(Model model) {
		User user = new User();
		model.addAttribute("userform", user);
		return "user/registerform";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String registersubmit(@ModelAttribute("userform") @Valid User user, BindingResult errors) throws Exception {
		if (!errors.hasErrors()) {
			userService.insertUser(user);
		} else {
			System.out.println("-----------------\n 폼 입력 값 검증 실패");
			List<ObjectError> errorr = errors.getAllErrors();
			for (ObjectError objectError : errorr) {
				System.out.println(objectError.getDefaultMessage());
			}
			return "user/registerform";

		}
		return "user/registercomplete";
	}

	@RequestMapping(value = "/emailConfirm")
	public String emailConfirm(@RequestParam("userEmail") String userEmail, @RequestParam("key") String key,
			Model model) {
		System.out.println("[이메일 인증]" + userEmail);
		Map<String, Object> map = new HashMap<>();
		map.put("email", userEmail);
		map.put("key", key);
		User user = userService.userAuth(map);
		model.addAttribute("user", user);
		return "user/confirm";
	}

}
