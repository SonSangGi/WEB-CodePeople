package com.jhta.cope.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.cope.service.BuyLectureService;
import com.jhta.cope.service.CartService;
import com.jhta.cope.service.LectureHistoryService;
import com.jhta.cope.service.NoteService;
import com.jhta.cope.service.PaidLectureService;
import com.jhta.cope.service.PaidQnaService;
import com.jhta.cope.util.EtcUtils;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.BuyLecture;
import com.jhta.cope.vo.Cart;
import com.jhta.cope.vo.LectureHistory;
import com.jhta.cope.vo.Note;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.PaidLectureDetail;
import com.jhta.cope.vo.PaidQna;
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
	
	@Autowired
	NoteService noteService;
	
	@Autowired
	PaidQnaService paidQnaService;
	
	
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
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		List<LectureHistory> LectureHistories = null;
		List<Note> notes = null;
		String paymentFlag = "N";
		
		if (user != null) {
			List<BuyLecture> buyLectures = buyLectureService.getBuyLectureByUserNo(user.getNo());
			
			for (BuyLecture buyLecture : buyLectures) {
				if (buyLecture.getPaidLecture().getNo() == no) {
					paymentFlag = "Y";
					LectureHistories = lectureHistoryService.getLectureHistoryByBuyLectureNo(buyLecture.getNo());
					notes = noteService.getNoteByBuyLectureNo(buyLecture.getNo());
				}
			}
		}

		List<PaidQna> paidQnas = paidQnaService.getPaidQnaByPaidLectureNo(no);
		List<PaidLectureDetail> paidLectureDetails = paidLectureService.getPaidLectureDetailByLectureNo(no);
		HashMap<Integer, List<PaidLectureDetail>> lectureWrapper = paidLectureService.getLectureWrapper(no);
		
		String title = paidLectureDetails.get(0).getPaidLecture().getTitle();
		String[] words = title.split(" ");
		
		SessionUtils.addAttribute("paidQnas", paidQnas);
		SessionUtils.addAttribute("notes", notes);
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
			return "redirect:/home.do?fail=login";
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
			return "redirect:/home.do?fail=login";
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
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");

		if (user == null) {
			return "redirect:/home.do?fail=login";
		}
		
		return "paid/detail-note";
	}

	// 세부 강좌 마이노트 만들기
	@RequestMapping(value = "/detail/createNote", method = RequestMethod.GET)
	public String createNote(@RequestParam("no") int no) {
		
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");

		if (user == null) {
			return "redirect:/home.do?fail=login";
		}

		SessionUtils.addAttribute("no", no);
		return "paid/detail-createNote";
	}

	// 강좌 노트 이미지 업로드
	@RequestMapping(value = "/detail/noteImage", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String upload(@RequestParam("uploadFile") MultipartFile mf, HttpServletRequest request) {
		String today = new SimpleDateFormat("ddhhmmss").format(new Date());
		String saveDirectory = "C:/project/codepeople/src/main/webapp/resources/img/paid/note";
		String path = "/resources/img/paid/note/";
		String fileName = today + new Random().nextInt(1000);
		try {
			mf.transferTo(new File(saveDirectory, fileName));
			EtcUtils.saveFile(request, saveDirectory, path, fileName);
			return path + fileName;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	// 강좌 노트 전체 컨텐츠 업로드
	@RequestMapping(value = "/detail/addNote", method = RequestMethod.POST)
	public String addNote(@RequestParam("buyLectureNo") int buyLectureNo,
						  @RequestParam("title") String title,
						  @RequestParam("content") String content) {
		
		BuyLecture buyLecture = buyLectureService.getBuyLectureByBuyLectureNo(buyLectureNo);
		Note note = new Note();
		
		buyLecture.setNo(buyLectureNo);
		note.setBuyLecture(buyLecture);
		note.setTitle(title);
		note.setContent(content);
		
		try {
			noteService.insertNote(note);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/paid/detail.do?no=" + buyLecture.getPaidLecture().getNo();
	}
	
	// video 내 note 삽입 및 업데이트
	@RequestMapping(value = "/detail/addVideoNote", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String addVideoNote(@RequestParam("buyLectureNo") int buyLectureNo,
						  @RequestParam("title") String title,
						  @RequestParam("content") String content,
						  @RequestParam(required = false, name="selectedNoteNo") Integer selectedNoteNo) {
			
			if (selectedNoteNo == null) {
				BuyLecture buyLecture = buyLectureService.getBuyLectureByBuyLectureNo(buyLectureNo);
				Note note = new Note();
				
				buyLecture.setNo(buyLectureNo);
				note.setBuyLecture(buyLecture);
				note.setTitle(title);
				note.setContent(content);
				
				try {
					noteService.insertNote(note);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			} else {
				Note note = noteService.getNoteByNoteNo(selectedNoteNo);
				note.setContent(content);
				note.setTitle(title);
				
				noteService.updateNote(note);
			}
			
			return "";
	}
	

	// 세부 강좌 Q&A 게시판
	@RequestMapping(value = "/detail/question", method = RequestMethod.GET)
	public String question() {
		return "paid/detail-question";
	}

	// 세부 강좌 선택 후 video 페이지 이동
	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public String video( @RequestParam("fileName") String fileName, Model model) {
		
		SessionUtils.getAttribute("notes");
		SessionUtils.getAttribute("lectureHistories");
		SessionUtils.getAttribute("paymentFlag");
		SessionUtils.getAttribute("lectureDetails");
		SessionUtils.getAttribute("lectureWrapper");
		
		model.addAttribute("fileName", fileName);
		return "paid/video";
	}
	
	
	
	
	
	
	
	
}