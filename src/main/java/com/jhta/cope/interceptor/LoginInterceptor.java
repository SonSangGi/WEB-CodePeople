package com.jhta.cope.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("인터셉터 들어옴");
			if(request.getSession().getAttribute("LOGIN_USER") == null) {
				response.sendRedirect("/home.do?fail=lp");
				return false;
			}
		return true;
	}
}
