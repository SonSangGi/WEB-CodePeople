package com.jhta.cope.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhta.cope.service.sample;
import com.jhta.cope.vo.Employee;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private sample sample;
	
	@RequestMapping("/home")
	public String home(Locale locale, Model model) {

		for (Employee employee: sample.getAllEmployees()) {
			System.out.println(employee.getId()+" : "+employee.getName());
		}
		
		return "home";
	}
	
}
