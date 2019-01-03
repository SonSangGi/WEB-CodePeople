package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.FreeLectureDao;
import com.jhta.cope.vo.FreeLecture;
import com.jhta.cope.vo.FreeLectureSection;

@Service
public class FreeLectureServiceImpl implements FreeLectureService {
	
	@Autowired
	FreeLectureDao freeLectureDao;
	
	@Override
	public void insertFreeLecture(FreeLecture freeLecture, List<FreeLectureSection> sections) {
		freeLectureDao.insertFreeLecture(freeLecture);
		
		for (FreeLectureSection section : sections) {
			section.setLectureNo(freeLecture.getNo());
			this.insertFreeLectureSection(section);
		}
		
	}@Override
	public void insertFreeLectureSection(FreeLectureSection freeLectureSection) {
		freeLectureDao.insertFreeLectureSection(freeLectureSection);	
	}
	
	@Override
	public List<FreeLecture> getAllFreeLecture() {
		List<FreeLecture> freeLectures = freeLectureDao.getAllFreeLecture();
		return freeLectures;
	}
	@Override
	public FreeLecture getFreeLecture(int freeLectureNo) {
		FreeLecture freeLecture = freeLectureDao.getFreeLecture(freeLectureNo);
		return freeLecture;
	}
}
