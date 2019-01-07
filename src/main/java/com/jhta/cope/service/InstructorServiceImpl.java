package com.jhta.cope.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.InstructorDao;
import com.jhta.cope.vo.PaidLecture;

@Service
public class InstructorServiceImpl implements InstructorService {
	
	@Autowired
	InstructorDao instructorDao;
	
	@Override
	public void createNewLecture(PaidLecture paidLecture) {
		instructorDao.createNewLecture(paidLecture);		
	}
}
