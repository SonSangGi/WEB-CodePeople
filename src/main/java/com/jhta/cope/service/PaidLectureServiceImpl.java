package com.jhta.cope.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.PaidLectureDao;
import com.jhta.cope.vo.PaidLectureDetail;

@Service
public class PaidLectureServiceImpl implements PaidLectureService{

	@Autowired
	PaidLectureDao paidLectureDao;
	
	@Override
	public PaidLectureDetail getPaidLectureDetailByNo(int no) {
		return paidLectureDao.getPaidLectureDetailByNo(no);
	}

}
