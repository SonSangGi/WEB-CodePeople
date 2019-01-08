package com.jhta.cope.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.InstructorNotice;


public interface InstructorNoticeService {

	public void insertNotice(InstructorNotice instructorNotice);
	public int getNoticeCount();
	public List<InstructorNotice> getAllNoticesByCriteria(Criteria criteria);
	
	
}
