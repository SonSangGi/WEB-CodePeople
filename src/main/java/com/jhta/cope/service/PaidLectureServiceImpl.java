package com.jhta.cope.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.InstructorDao;
import com.jhta.cope.dao.PaidLectureDao;
import com.jhta.cope.dao.UserDao;
import com.jhta.cope.vo.Instructor;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.PaidLectureDetail;
import com.jhta.cope.vo.User;

@Service
public class PaidLectureServiceImpl implements PaidLectureService{

	@Autowired
	PaidLectureDao paidLectureDao;
	
	@Autowired
	InstructorDao instructorDao;
	
	@Autowired
	UserDao userDao;
	
	@Override
	public PaidLectureDetail getPaidLectureDetailByNo(int no) {
		return paidLectureDao.getPaidLectureDetailByNo(no);
	}
	
	@Override
	public List<PaidLecture> getPaidLectureByLang(String lang) {
		List<PaidLecture> paidLectures = paidLectureDao.getPaidLectureByLang(lang);
		for (PaidLecture paidLecture : paidLectures) {
			int instructorNo = paidLecture.getInstructor().getNo();
			Instructor instructor = instructorDao.getInstructorByNo(instructorNo);

			int userNo = instructor.getUser().getNo();
			User user = userDao.getUserByNo(userNo);
			instructor.setUser(user);
			
			paidLecture.setInstructor(instructor);
		}
		return paidLectures;
	}

	@Override
	public List<PaidLectureDetail> getPaidLectureDetailByLectureNo(int no) {
		List<PaidLectureDetail> lectureDetails = paidLectureDao.getPaidLectureDetailByLectureNo(no);
		
		for (PaidLectureDetail paidLectureDetail : lectureDetails) {
			int instructorNo = paidLectureDetail.getPaidLecture().getInstructor().getNo();
			Instructor instructor = instructorDao.getInstructorByNo(instructorNo);

			int userNo = instructor.getUser().getNo();
			User user = userDao.getUserByNo(userNo);
			instructor.setUser(user);
			
			paidLectureDetail.getPaidLecture().setInstructor(instructor);
		}
		
		return lectureDetails;
	}

	@Override
	public HashMap<Integer, List<PaidLectureDetail>> getLectureWrapper(int no) {
		
		List<PaidLectureDetail> lectureList = new ArrayList<>();
		HashMap<Integer, List<PaidLectureDetail>> map = new HashMap<>();
		
		
		List<PaidLectureDetail> lectureDetails = paidLectureDao.getPaidLectureDetailByLectureNo(no);

		for (PaidLectureDetail paidLectureDetail : lectureDetails) {
			int instructorNo = paidLectureDetail.getPaidLecture().getInstructor().getNo();
			Instructor instructor = instructorDao.getInstructorByNo(instructorNo);

			int userNo = instructor.getUser().getNo();
			User user = userDao.getUserByNo(userNo);
			instructor.setUser(user);
			
			paidLectureDetail.getPaidLecture().setInstructor(instructor);
		}
		
		
		// List<PaidLectureDetail> lectureDetails = this.getPaidLectureDetailByLectureNo(no);는
		// 왜 되지 않는가!!
		
		
		lectureList.add(lectureDetails.get(0));
		map.put(lectureDetails.get(0).getSectionNo(), lectureList);
		
		for (int i=1; i<lectureDetails.size(); i++) {
			
			int sectionNo = lectureDetails.get(i).getSectionNo();
			
			if (sectionNo == lectureDetails.get(i-1).getSectionNo()) {
				map.get(sectionNo).add(lectureDetails.get(i));
			} else {
				List<PaidLectureDetail> list = new ArrayList<>();
				list.add(lectureDetails.get(i));
				map.put(sectionNo, list);
			}
			
		}

		return map;
	}

	@Override
	public int getCountPaidLectureByLang(String lang) {
		return paidLectureDao.getCountPaidLectureByLang(lang);
	}

	@Override
	public PaidLecture getPaidLectureByNo(int no) {
		PaidLecture lecture = paidLectureDao.getPaidLectureByNo(no);
		
		int instructorNo = lecture.getInstructor().getNo();
		Instructor instructor = instructorDao.getInstructorByNo(instructorNo);

		int userNo = instructor.getUser().getNo();
		User user = userDao.getUserByNo(userNo);
		instructor.setUser(user);
		
		lecture.setInstructor(instructor);

		return lecture;
	}


}