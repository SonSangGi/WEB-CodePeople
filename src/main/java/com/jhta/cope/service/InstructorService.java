package com.jhta.cope.service;

import java.util.List;

import com.jhta.cope.vo.Instructor;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.User;

public interface InstructorService {

	public void insertPaidLecture(PaidLecture paidLecture);
	public void regInstructor(Instructor instructor);
	public Instructor getInstructorByUserNo(int userNo);
	public List<PaidLecture> getAllPaidLectures() throws Exception;
/*	public User getUserByNo(int no);*/
}
