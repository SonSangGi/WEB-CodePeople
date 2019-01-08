package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.InstructorNoticeDao;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.InstructorNotice;

@Service
public class InstructorNoticeServiceImpl implements InstructorNoticeService {

	@Autowired
	InstructorNoticeDao instructorNoticeDao;
	
	
	@Override
	public void insertNotice(InstructorNotice instructorNotice) {
		instructorNoticeDao.insertNotice(instructorNotice);
	}
	
	@Override
	public int getNoticeCount() {
		return instructorNoticeDao.getNoticeCount();
	}
	
	@Override
	public List<InstructorNotice> getAllNoticesByCriteria(Criteria criteria) {
		return instructorNoticeDao.getAllNoticesByCriteria(criteria);
	}	
}
