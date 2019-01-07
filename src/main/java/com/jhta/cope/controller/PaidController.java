package com.jhta.cope.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.cope.service.BuyLectureService;
import com.jhta.cope.service.CartService;
import com.jhta.cope.service.PaidLectureService;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.BuyLecture;
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
	
	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "paid/main";
	}
	
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("no") int no, Model model) {
		SessionUtils.removeAttribute("lectureDetails");
		SessionUtils.removeAttribute("lectureWrapper");
		
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		// 결제 여부
		String paymentFlag = "N";
		
		if (user != null) {
			List<BuyLecture> buyLectures = buyLectureService.getBuyLectureByUserNo(user.getNo());
			
			for (BuyLecture buyLecture : buyLectures) {
				if (buyLecture.getPaidLecture().getNo() == no) {
					paymentFlag = "Y";
				} 
			}

		}
		
		List<PaidLectureDetail> paidLectureDetails = paidLectureService.getPaidLectureDetailByLectureNo(no);
		
		
		HashMap<Integer, List<PaidLectureDetail>> lectureWrapper = paidLectureService.getLectureWrapper(no);
		String title = paidLectureDetails.get(0).getPaidLecture().getTitle();
		String[] words = title.split(" ");
		
		SessionUtils.addAttribute("paymentFlag", paymentFlag);
		SessionUtils.addAttribute("lectureDetails", paidLectureDetails);
		SessionUtils.addAttribute("lectureWrapper", lectureWrapper.values());
		model.addAttribute("title", words);
		return "paid/detail";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public @ResponseBody String cart(@RequestParam("lectureNo") int lectureNo, Model model) {
		
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		if (user == null) {
			return "redirect:/user/signup.do";
		}
		
		// 결제 및 카트에 담았는지 여부
		String cartFlag = "Y";
		
		List<BuyLecture> prevBuyLectures = buyLectureService.getBuyLectureByUserNo(user.getNo());
		List<Cart> carts = cartService.getCartByUserNo(user.getNo());
		
		for (BuyLecture buyLecture : prevBuyLectures) {
			if (buyLecture.getPaidLecture().getNo() == lectureNo) {
				cartFlag = "P";
				return cartFlag;
			}
		}
		
		for (Cart cart : carts) {
			if (cart.getPaidLecture().getNo() == lectureNo) {
				cartFlag = "N";
				return cartFlag;
			}
		}
		

		try {
			cartService.insertCart(user.getNo(), lectureNo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		int totalPrice = cartService.getTotalPrice(carts);
		
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("carts", carts);
			
		return cartFlag;
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

	
	@RequestMapping(value = "/cart/delete", method = RequestMethod.GET)
	public String removeCart(@RequestParam("cartNo") int cartNo) {
		
		System.out.println(cartNo + " 번 상품 삭제");
		cartService.deleteCartByCartNo(cartNo);
		return "paid/cart";
	}
	
	
	
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public @ResponseBody String payment(@RequestParam("values") String lectures, Model model) {
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
		
		cartService.deleteCartByUserNo(user.getNo());
		
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

	@RequestMapping(value = "/detail/note", method = RequestMethod.GET)
	public String note() {
		return "paid/detail-note";
	}

	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public String video() {
		return "paid/video";
	}
	

	
	
	
}