package com.jhta.cope.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jhta.cope.service.ManagerService;
import com.jhta.cope.service.QnaService;
import com.jhta.cope.service.UserLogService;
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
	
	@RequestMapping(value = "/acknowledge")
	public String acknowledge(Model model) {
		
		return "manager/acknowledge";
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String dashboard(Model model) throws Exception {
		
		int countTodayVisitors = userLogService.countTodayVisitors();
		model.addAttribute("countTodayVisitors", countTodayVisitors);
		
		return "manager/dashboard";
	}

	@ResponseBody
	@RequestMapping(value = "/dashboard/ajax", method = RequestMethod.POST)
	public Integer dashboardTodayVisitorCountAjax(@RequestParam("functionName") String functionName) throws Exception {
		
		if ("todayVisitorsCount".equals(functionName)) {
			int visitorCount = userLogService.countTodayVisitors();
			return visitorCount;
		}
		
		return null;
	}
	

	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public String post(Model model) throws Exception {
		
		List<Qna> qnaPosts = qnaService.getAllQnas();
		List<QnaAnswer> qnaAnswers = qnaService.getAllAnswers();
		model.addAttribute("qnaPosts", qnaPosts);
		model.addAttribute("qnaAnswers", qnaAnswers);

		return "manager/post";
	}

	@RequestMapping(value = "/post", method = RequestMethod.POST)
	public String qnaAnswer(Model model) throws Exception {
		
		List<QnaAnswer> qnaAnswers = qnaService.getAllAnswers();
		model.addAttribute("qnaAnswers", qnaAnswers);
		
		return "manager/post";
	}
	
	@ResponseBody
	@RequestMapping(value = "/post/ajax", method = RequestMethod.POST)
	public Qna getQnaAnswerAjax(@RequestParam("functionName") String functionName, @RequestParam("postNo") int postNo, Model model) throws Exception {
		
		Qna qna = qnaService.getQnaByNo(postNo);
		
		return qna;
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
	public List<User> getUserAjax(@RequestParam("functionName") String functionName, @RequestParam(value = "userNo", required = false) String userNo, @RequestParam(value = "userId", required = false) String userId) throws Exception {
				
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
	
}
