package com.jhta.cope.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.cope.service.FreeLectureService;
import com.jhta.cope.service.ManagerService;
import com.jhta.cope.service.QnaService;
import com.jhta.cope.service.UserLogService;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.FreeLecture;
import com.jhta.cope.vo.Qna;
import com.jhta.cope.vo.QnaAnswer;
import com.jhta.cope.vo.User;

@Controller
@RequestMapping("/manager/*")
public class ManagerController {

	@Autowired
	ManagerService managerService;
	
	@Autowired
	QnaService qnaService;
	
	@Autowired
	UserLogService userLogService;
	
	@Autowired
	FreeLectureService freeLectureService;
	
	@RequestMapping(value = "/acknowledge", method = RequestMethod.GET)
	public String acknowledge(Model model) {
		
		List<FreeLecture> freeLectures = freeLectureService.getAllFreeLecture();
		model.addAttribute("freeLectures", freeLectures);
		
		return "manager/acknowledge";
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(Model model) throws Exception {
		
		int countTodayVisitors = userLogService.countTodayVisitors();
		model.addAttribute("countTodayVisitors", countTodayVisitors);
		
		int countQnaPosts = qnaService.getQnaCount(null,null);
		model.addAttribute("countQnaPosts", countQnaPosts);
		
		return "manager/dashboard";
	}

	@ResponseBody
	@RequestMapping(value = "/dashboard/ajax", method = RequestMethod.POST)
	public Integer dashboardTodayVisitorCountAjax(
												  @RequestParam("functionName") String functionName
												 ) throws Exception {
		
		if ("todayVisitorsCount".equals(functionName)) {
			int visitorCount = userLogService.countTodayVisitors();
			return visitorCount;
		}
		
		return null;
	}
	

	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public String post(Model model) throws Exception {
		
		Criteria criteria = new Criteria();

		Map<String, Integer> qnaMap = pagingProcessing("QNA", 1);
		criteria.setBeginIndex(qnaMap.get("beginIndex"));
		criteria.setEndIndex(qnaMap.get("endIndex"));
		List<Qna> qnaPosts = qnaService.getAllQnasByCriteria(criteria);
		
		Map<String, Integer> qnaAnswerMap = pagingProcessing("QNA Answer", 1);
		criteria.setBeginIndex(qnaAnswerMap.get("beginIndex"));
		criteria.setEndIndex(qnaAnswerMap.get("endIndex"));
		List<QnaAnswer> qnaAnswers = qnaService.getAllAnswers(criteria);
		
		model.addAttribute("qnaPosts", qnaPosts);
		model.addAttribute("qnaPageInfo", qnaMap);
		model.addAttribute("qnaAnswers", qnaAnswers);
		model.addAttribute("qnaAnswerPageInfo", qnaAnswerMap);

		return "manager/post";
	}
	
	@ResponseBody
	@RequestMapping(value = "/post/ajax", method = RequestMethod.POST)
	public Map<String, Object> getQnaAnswerAjax(
//												@RequestParam Map<String, String> param,	//<- @RequestParam 값이 많을경우 Map<String, String>으로 받자.
												@RequestParam(value="boardName", required=false) String boardName,
												@RequestParam(value="qnaPage", required=false) Integer qnaPage,
												@RequestParam(value="qnaAnswerPage", required=false) Integer qnaAnswerPage,
												@RequestParam(value="functionName", required=false) String functionName,
												@RequestParam(value="postNo", required=false) Integer postNo
											   ) throws Exception {
		
		if ("QNA".equals(boardName)) {
			Map<String, Integer> qnaMap = pagingProcessing(boardName, qnaPage);
			Criteria criteria = new Criteria();
			criteria.setBeginIndex(qnaMap.get("beginIndex"));
			criteria.setEndIndex(qnaMap.get("endIndex"));
			List<Qna> qnaPosts = qnaService.getAllQnasByCriteria(criteria);
			
			Map<String, Object> map = new HashMap<>();
			map.put("qnaPosts", qnaPosts);
			map.put("qnaPageInfo", qnaMap);
			
			return map;
			
		} else if ("QNA Answer".equals(boardName)) {
			
			Map<String, Integer> qnaAnswerMap = pagingProcessing(boardName, qnaAnswerPage);
			Criteria criteria = new Criteria();
			criteria.setBeginIndex(qnaAnswerMap.get("beginIndex"));
			criteria.setEndIndex(qnaAnswerMap.get("endIndex"));
			List<QnaAnswer> qnaAnswers = qnaService.getAllAnswers(criteria);
			
			Map<String, Object> map = new HashMap<>();
			map.put("qnaAnswers", qnaAnswers);
			map.put("qnaAnswerPageInfo", qnaAnswerMap);
			
			return map;
			
		}
		
		if ("findQnaAnswerInfoByNo".equals(functionName)) {
			
			Qna qna = qnaService.getQnaByNo(postNo);

			Map<String, Object> map = new HashMap<>();
			map.put("qna", qna);
			
			return map;
		}
		
//		만약 param값이 너무 많으면 Map<String, String> param 으로 받아도 된다.		
		
//		if ("QNA".equals(boardName)) {
//			Map<String, Integer> qnaMap = pagingProcessing(param.get("boardName"), Integer.parseInt(param.get("qnaPage")));
//			Criteria criteria = new Criteria();
//			criteria.setBeginIndex(qnaMap.get("beginIndex"));
//			criteria.setEndIndex(qnaMap.get("endIndex"));
//			List<Qna> qnaPosts = qnaService.getAllQnasByCriteria(criteria);
//			
//			Map<String, Object> map = new HashMap<>();
//			map.put("qnaPosts", qnaPosts);
//			map.put("qnaPageInfo", qnaMap);
//			
//			return map;
//		}
		
		return null;
	}
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String users(Model model) throws Exception {
		
		List<User> users = managerService.getAllUsers();
		model.addAttribute("users", users);
		
		return "manager/users";
	}

	@RequestMapping(value = "/users", method = RequestMethod.POST)
	public String getUserByName(@RequestParam("userId") String userId, Model model) throws Exception {
		
		List<User> users = managerService.getUserById(userId);
		model.addAttribute("users", users);
		
		return "manager/users";
	}
	
	@ResponseBody
	@RequestMapping(value = "/users/ajax", method = RequestMethod.POST)
	public List<User> getUserAjax(
								  @RequestParam("functionName") String functionName,
								  @RequestParam(value = "userNo", required = false) String userNo,
								  @RequestParam(value = "userId", required = false) String userId
								 ) throws Exception {
				
		List<User> users = new ArrayList<User>();
		
		if ("findUserInfoByNo".equals(functionName)) {
			users = managerService.getUserByNo(userNo);
			
		} else if ("findUserInfoById".equals(functionName)) {
			users = managerService.getUserById(userId);
			if (users.isEmpty()) {
				return null;
			}
		}
		return users;
	}
	
	@RequestMapping(value = "/rtchat", method = RequestMethod.GET)
	public String rtchat() {
		
		return "manager/rtchat";
	}
	
	//페이징 처리
	public Map<String, Integer> pagingProcessing(String boardName, int page) {
				
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		int totalCount = 0;
		int listCount = 5;
		int pageCount = 5;
		
		if ("QNA".equals(boardName)) {
			totalCount = qnaService.getQnaCount(null,null);
		} else if ("QNA Answer".equals(boardName)) {
			totalCount = qnaService.getQnaAnswersCount();
		}
		
		int totalPages = totalCount / listCount;
		
		//총 페이지수 계산
		if ((totalCount % listCount) != 0) {
			totalPages++;
		}
		
		//요청 페이지가 총 페이지보다 클때
		if (totalPages < page) {
			page = totalPages;
		}
		
		//처음, 끝 페이지
		int startPage = (int) (((double)(page - 3) / pageCount) * pageCount) + 1;
		if (startPage < 1) {
			startPage = 1;
		}
		int endPage = (startPage + pageCount) - 1;
		
		//마지막 페이지가 총 페이지 수보다 커지지 않게 막음
		if (endPage > totalPages) {
			endPage = totalPages;
		}
		
		//시작 페이지가 총 표시되는 페이지 리스트보다 작아지지 않게 막음
		if (totalPages > (pageCount - 1)) {
			if ((endPage - startPage) < (pageCount - 1)) {
				startPage = (totalPages - pageCount) + 1;
			}
		}
		
		//시작 인덱스, 끝 인덱스를 구함
		int beginIndex = ((page-1) * listCount) + 1;
		int endIndex = beginIndex + (listCount - 1);
		
		map.put("beginIndex", beginIndex);
		map.put("endIndex", endIndex);
		map.put("listCount", listCount);
		map.put("pageCount", pageCount);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("totalPages", totalPages);
		map.put("curPage", page);
		
		return map;
	}
}
