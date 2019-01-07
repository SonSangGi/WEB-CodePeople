package com.jhta.cope.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.jhta.cope.service.BuyLectureService;
import com.jhta.cope.service.CartService;
import com.jhta.cope.service.PaidLectureService;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.Cart;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.PaidLectureDetail;
import com.jhta.cope.vo.User;

@Controller
@RequestMapping("/paid/*")
public class PaidController {
	
	@Autowired
	PaidLectureService paidLectureService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	BuyLectureService buyLectureService;
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(@RequestParam("lang") String lang, Model model) {
		List<PaidLecture> paidLectures = paidLectureService.getPaidLectureByLang(lang);
		int countLectures = paidLectureService.getCountPaidLectureByLang(lang);

		model.addAttribute("countLectures", countLectures);
		model.addAttribute("paidLectures", paidLectures);
		return "paid/home";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("no") int no, Model model) {
		SessionUtils.removeAttribute("lectureDetails");
		SessionUtils.removeAttribute("lectureWrapper");
		
		List<PaidLectureDetail> paidLectureDetails = paidLectureService.getPaidLectureDetailByLectureNo(no);
		HashMap<Integer, List<PaidLectureDetail>> lectureWrapper = paidLectureService.getLectureWrapper(no);
		String title = paidLectureDetails.get(0).getPaidLecture().getTitle();
		String[] words = title.split(" ");
		
		// ajax 처리 위해 session에 담음
		SessionUtils.addAttribute("lectureDetails", paidLectureDetails);
		SessionUtils.addAttribute("lectureWrapper", lectureWrapper.values());
		model.addAttribute("title", words);
		return "paid/detail";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String cart(@RequestParam("lectureNo") int lectureNo, Model model) {
		
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		if (user == null) {
			return "redirect:/user/signup.do";
		}

		try {
			cartService.insertCart(user.getNo(), lectureNo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<Cart> carts = cartService.getCartByUserNo(user.getNo());
		int totalPrice = cartService.getTotalPrice(carts);
		
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("carts", carts);
			
		return "redirect:cart.do";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Model model) {
		
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		if (user == null) {
			return "redirect:/user/signup.do";
		}

		List<Cart> carts = cartService.getCartByUserNo(user.getNo());
		int totalPrice = cartService.getTotalPrice(carts);
		
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("carts", carts);
		
		return "paid/cart";
	}
	
	
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String payment(@RequestParam("values") String lectures, Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		int startPoint = lectures.indexOf("[");
		int lastPoint = lectures.indexOf("]");
		
		String lectureList = lectures.substring(startPoint+1, lastPoint);
		lectureList = lectureList.replace("\"", "");
		String[] words = lectureList.split(",");
		
		for (String s : words) {
			int lectureNo = Integer.parseInt(s);
			buyLectureService.insertBuyLecture(user.getNo(), lectureNo);
		}
		
		return null;
	}

	// 결제 완료 페이지
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String payment() {
		return "paid/payment";
	}
	

	@RequestMapping(value = "/detail/overview", method = RequestMethod.GET)
	public String overview() {
		return "paid/detail-overview";
	}

	@RequestMapping(value = "/detail/contents", method = RequestMethod.GET)
	public String contents() {
		return "paid/detail-contents";
	}
}