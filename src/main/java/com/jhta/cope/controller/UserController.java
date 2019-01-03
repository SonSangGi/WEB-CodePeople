package com.jhta.cope.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jhta.cope.service.UserService;
import com.jhta.cope.util.EtcUtils;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.Badge;
import com.jhta.cope.vo.User;

@Controller
@RequestMapping("/user/my/*")
public class UserController {

	@Autowired
	UserService userService;
	@Resource(name = "iconPath")
	String iconPath;

	@RequestMapping("/home")
	public String home() {
		return "user/my_home";
	}

	@RequestMapping("/video")
	public String video() {
		return "user/my_video";
	}

	@RequestMapping("/dashboard")
	public String dashboard() {
		return "user/my_dashboard";
	}

	@RequestMapping("/stat")
	public String stat(Model model) {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		List<Badge> notHaveBadges = userService.notHaveBadge(user.getNo());
		List<Badge> haveBadges = userService.haveBadge(user.getNo());
		model.addAttribute("notHave", notHaveBadges);
		model.addAttribute("have", haveBadges);
		return "user/my_stat";
	}

	@RequestMapping("/write")
	public String write() {
		return "user/my_write";
	}

	@RequestMapping("/info")
	public String info() {
		return "user/my_info";
	}

	@RequestMapping(value = "/iconmodify", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String iconModify(MultipartHttpServletRequest mr) throws UnsupportedEncodingException {
		MultipartFile mf = mr.getFile("file");
		String today = new SimpleDateFormat("ddhhmmss").format(new Date());
		String fileName = today + mf.getOriginalFilename();
		String path = "/resources/img/user/icon/";
		try {
			mf.transferTo(new File(iconPath, fileName));
			EtcUtils.saveFile(mr, iconPath, path, fileName);
			User user = (User) SessionUtils.getAttribute("LOGIN_USER");
			user.getAvatar().setImage(fileName);
			userService.updateAvatar(user.getAvatar());
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return URLEncoder.encode(fileName, "UTF-8");
	}

	@RequestMapping(value = "/icondel")
	@ResponseBody
	public void iconDel() {
		User user = (User) SessionUtils.getAttribute("LOGIN_USER");
		user.getAvatar().setImage("Default");
		userService.updateAvatar(user.getAvatar());
	}
}
