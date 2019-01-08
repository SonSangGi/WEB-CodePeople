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
import com.jhta.cope.service.LectureHistoryService;
import com.jhta.cope.service.PaidLectureService;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.BuyLecture;
import com.jhta.cope.vo.Cart;
import com.jhta.cope.vo.LectureHistory;
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
	
	@Autowired
	LectureHistoryService lectureHistoryService;
	
	// 전체 언어 강좌 페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "paid/main";
	}

	// 프로그래밍 언어별 페이지 강좌 이동
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(@RequestParam("lang") String lang, Model model) {
		List<PaidLecture> paidLectures = paidLectureService.getPaidLectureByLang(lang);
		int countLectures = paidLectureService.getCountPaidLectureByLang(lang);
		
		model.addAttribute("countLectures", countLectures);
		model.addAttribute("paidLectures", paidLectures);
		return "paid/home";
	}
	
	// 강좌 상세 페이지 이동
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("no") int no, Model model) {
		SessionUtils.removeAttribute("lectureDetails");
		SessionUtils.removeAttribute("lectureWrapper");
		SessionUtils.removeAttribute("lectureHistories");
		SessionUtils.removeAttribute("paymentFlag");
		
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		// 결제 여부
		String paymentFlag = "N";
		List<LectureHistory> LectureHistories = null;
		
		if (user != null) {
			List<BuyLecture> buyLectures = buyLectureService.getBuyLectureByUserNo(user.getNo());
			
			for (BuyLecture buyLecture : buyLectures) {
				if (buyLecture.getPaidLecture().getNo() == no) {
					paymentFlag = "Y";
					LectureHistories = lectureHistoryService.getLectureHistoryByBuyLectureNo(buyLecture.getNo());
				}
			}
		}
		
		List<PaidLectureDetail> paidLectureDetails = paidLectureService.getPaidLectureDetailByLectureNo(no);
		
		HashMap<Integer, List<PaidLectureDetail>> lectureWrapper = paidLectureService.getLectureWrapper(no);
		String title = paidLectureDetails.get(0).getPaidLecture().getTitle();
		String[] words = title.split(" ");
		
		SessionUtils.addAttribute("lectureHistories", LectureHistories);
		SessionUtils.addAttribute("paymentFlag", paymentFlag);
		SessionUtils.addAttribute("lectureDetails", paidLectureDetails);
		SessionUtils.addAttribute("lectureWrapper", lectureWrapper.values());
		
		model.addAttribute("title", words);
		return "paid/detail";
	}
	
	// cart 등록
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
	
	// cart 페이지 이동
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

	// cart 삭제 요청
	@RequestMapping(value = "/cart/delete", method = RequestMethod.GET)
	public String removeCart(@RequestParam("cartNo") int cartNo) {
		
		System.out.println(cartNo + " 번 상품 삭제");
		cartService.deleteCartByCartNo(cartNo);
		return "paid/cart";
	}
	
	// 결제 요청
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
	
	/*detail ajax 갱신 페이지*/
	
	// 세부 강좌 overview
	@RequestMapping(value = "/detail/overview", method = RequestMethod.GET)
	public String overview() {
		return "paid/detail-overview";
	}

	// 세부 강좌 콘텐츠
	@RequestMapping(value = "/detail/contents", method = RequestMethod.GET)
	public String contents() {
		return "paid/detail-contents";
	}

	// 세부 강좌 마이노트 페이지
	@RequestMapping(value = "/detail/note", method = RequestMethod.GET)
	public String note() {
		return "paid/detail-note";
	}

	// 세부 강좌 Q&A 게시판
	@RequestMapping(value = "/detail/question", method = RequestMethod.GET)
	public String question() {
		return "paid/detail-question";
	}

	// 세부 강좌 선택 후 video 페이지 이동
	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public String video() {
		return "paid/video";
	}
}