package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.InstructorDao;
import com.jhta.cope.vo.Instructor;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.User;

@Service
public class InstructorServiceImpl implements InstructorService {
	
	@Autowired
	InstructorDao instructorDao;
	
	@Override
	public void insertPaidLecture(PaidLecture paidLecture) {
		instructorDao.insertPaidLecture(paidLecture);		
	}
	
	@Override
	public void regInstructor(Instructor instructor) {
		instructorDao.regInstructor(instructor);
	}
	
	@Override
	public Instructor getInstructorByUserNo(int userNo) {
		
		return null;
	}
	
	@Override
	public List<PaidLecture> getAllPaidLectures() throws Exception {
		return instructorDao.getAllPaidLectures();
	}
	
	
/*	@Override
	public User getUserByNo(int no) {
		instructorDao.getUserByNo(no);
	}*/
}
