package com.jhta.cope.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.jhta.cope.service.UserLogService;
import com.jhta.cope.vo.User;
import com.jhta.cope.vo.UserLog;

@Controller
public class HomeController {
	
	@Autowired
	UserLogService userLogService;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) throws Exception {
		
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null) {
            ip = req.getRemoteAddr();
        }
        UserLog userLog = new UserLog();
       	User user = (User) session.getAttribute("LOGIN_USER");
       	
       	if (user == null) {
       		userLog.setAccount("'비회원'님이 home을 방문했습니다.");
       		userLog.setNo(null);
       	} else {
       		userLog.setAccount("'" + user.getId() + "'님이 home을 방문했습니다");
       		userLog.setNo(user.getNo());
       	}
       	userLog.setIp(ip);

       	userLogService.userLogWrite(userLog);
        
		return "home";
	}
}
