package com.jhta.cope.dao;

import java.util.List;

import com.jhta.cope.vo.FreeLecture;
import com.jhta.cope.vo.FreeLectureComent;
import com.jhta.cope.vo.FreeLectureSection;

public interface FreeLectureDao {

	void insertFreeLecture(FreeLecture freeLecture);
	void insertFreeLectureSection(FreeLectureSection freeLectureSection);
	List<FreeLecture> getAllFreeLecture();
	FreeLecture getFreeLecture(int freeLectureNo);
	List<FreeLectureSection> getFreeLectureSectionByLectureNo(int freeLectureNo);
	FreeLectureSection getFreeLectureSectionByCount(int count);
	List<FreeLectureComent> getFreeLectureComentesBySno(int sno);
}
