package com.jhta.cope.dao;



import java.util.List;

import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Instructor;
import com.jhta.cope.vo.InstructorNotice;
import com.jhta.cope.vo.PaidLecture;
import com.jhta.cope.vo.User;


public interface InstructorDao {
	Instructor getInstructorByNo(int no);
	public void insertPaidLecture(PaidLecture paidLecture);
	public void regInstructor(Instructor instructor);
	List<PaidLecture> getAllPaidLectures();
/*	public Instructor getInstructorByUserNo(int userNo);*/
	
	/*	public User getUserByNo(int no);*/

	
}