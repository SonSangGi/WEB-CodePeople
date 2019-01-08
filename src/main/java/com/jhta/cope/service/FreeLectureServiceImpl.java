package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.FreeLectureDao;
import com.jhta.cope.vo.FreeLecture;
import com.jhta.cope.vo.FreeLectureComent;
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
	@Override
	public List<FreeLectureSection> getFreeLectureSectionByLectureNo(int freeLectureNo) {
		List<FreeLectureSection> freeLectureSections = freeLectureDao.getFreeLectureSectionByLectureNo(freeLectureNo);
		return freeLectureSections;
	}
	@Override
	public FreeLectureSection getFreeLectureSectionByCount(int count) {
		FreeLectureSection freeLectureSection = freeLectureDao.getFreeLectureSectionByCount(count);
		return freeLectureSection;
	}
	@Override
	public List<FreeLectureComent> getFreeLectureComentesBySno(int sno) {
		List<FreeLectureComent> freeLectureComents = freeLectureDao.getFreeLectureComentesBySno(sno);
		return freeLectureComents;
	}
	@Override
	public void insertFreeLectureComent(FreeLectureComent freeLectureComent) {
		freeLectureDao.insertFreeLectureComent(freeLectureComent);		
	}
	@Override
	public FreeLectureComent getFreeLectureComent(int cno) {
		FreeLectureComent freeLectureComent = freeLectureDao.getFreeLectureComent(cno);
		return freeLectureComent;
	}
	@Override
	public void deleteFreeLectureComent(int cno) {
		freeLectureDao.deleteFreeLectureComent(cno);
	}
	@Override
	public void updateFreeLectureComent(FreeLectureComent freeLectureComent) {
		freeLectureDao.updateFreeLectureComent(freeLectureComent);	
	}
}
