package com.jhta.cope.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.BuyLectureDao;
import com.jhta.cope.vo.BuyLecture;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.User;

@Service
public class BuyLectureServiceImpl implements BuyLectureService {

	@Autowired
	BuyLectureDao buyLectureDao;
	
	@Override
	public void insertBuyLecture(int userNo, int lectureNo) {
		User user = new User();
		user.setNo(userNo);
		PaidLecture paidLecture = new PaidLecture();
		paidLecture.setNo(lectureNo);
		
		BuyLecture buyLecture = new BuyLecture();
		buyLecture.setUser(user);
		buyLecture.setPaidLecture(paidLecture);
		
		buyLectureDao.insertBuyLecture(buyLecture);
	}

}
