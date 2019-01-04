package com.jhta.cope.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.cope.service.QnaService;
import com.jhta.cope.util.EtcUtils;
import com.jhta.cope.util.SessionUtils;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Pagination;
import com.jhta.cope.vo.Qna;
import com.jhta.cope.vo.QnaAnswer;
import com.jhta.cope.vo.QnaComment;
import com.jhta.cope.vo.User;

@Controller
@RequestMapping("/qna/*")
public class QnaController {

	@Autowired
	QnaService qnaService;
	
	
	//QNA 맵핑 및 페이징처리, 검색, 정렬 등
	@RequestMapping(value = "list")
	public String list(Model model, Integer cp, @RequestParam(required = false, name = "keyword") String keyword,
			@RequestParam(required = false, name = "searchType") String searchType,
			@RequestParam(required = false, name = "sort") String sort
			) {

		if (cp == null) {
			cp = 1;
		}
		int rows = 10;
		Criteria criteria = new Criteria(cp, rows);
		criteria.setSearchType(searchType);
		criteria.setKeyword(keyword);
		criteria.setSort(sort);

		Pagination pagination = new Pagination(cp, rows, qnaService.getQnaCount());
		List<Qna> qnas = qnaService.getAllQnasByCriteria(criteria);
		model.addAttribute("pagination",pagination);
		model.addAttribute("qnas", qnas);
		
		return "qna/list";
	}

	@RequestMapping(value = "detail")
	public String detail(Model model, int qnaNo) {
		Qna qna = qnaService.getQnaByNo(qnaNo);
		model.addAttribute("qna", qna);
		return "qna/detail";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String form(Model model) {
		return "qna/form";
	}
	
	// 질문하기 등록
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(Qna qna) {
		qna.setWriter((User) SessionUtils.getAttribute("LOGIN_USER"));
		qnaService.insertQna(qna);
		
		return "redirect:list.do";
	}

	
	// 질문하기 사진 업로드
	@RequestMapping(value = "upload", method = RequestMethod.POST, produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String upload(@RequestParam("uploadFile") MultipartFile mf, HttpServletRequest request) {
		String today = new SimpleDateFormat("ddhhmmss").format(new Date());
		String saveDirectory = "C:/project/codepeople/src/main/webapp/resources/img/qna";
		String path = "/resources/img/qna/";
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
	
	//답글 작성
	@RequestMapping(value = "addAns", method = RequestMethod.POST)
	public String addAnswer(QnaAnswer qnaAnswer,int qnaNo) {
		qnaAnswer.setWriter((User) SessionUtils.getAttribute("LOGIN_USER"));
		qnaAnswer.setQnaNo(qnaNo);
		qnaService.insertAnswer(qnaAnswer);
		String id = qnaService.getQnaByNo(qnaNo).getWriter().getId();
		
		return "redirect:detail.do?qnaNo="+qnaNo;
	}
	
	//댓글 작성
	@RequestMapping(value="comment")
	@ResponseBody
	public QnaComment insertComment(QnaComment qnaComment,int answerNo) {
		qnaComment.setWriter((User)SessionUtils.getAttribute("LOGIN_USER"));
		qnaService.insertAnswerComment(qnaComment);
		return qnaComment;
	}
}
