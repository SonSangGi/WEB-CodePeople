package com.jhta.cope.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jhta.cope.service.UserService;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			if(request.getSession().getAttribute("LOGIN_USER") == null) {
//				String[] url = request.getRequestURI().split("/");
//				String uri = url[1];
//				if(uri.equals("qna")) {
//					response.sendRedirect("/qna/list.do?fail=lp");
//				}else {
//				response.sendRedirect("/home.do?fail=lp");
//				}
//				return false;
			}
		return true;
	}
}
