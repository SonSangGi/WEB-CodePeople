package com.jhta.cope.service;

import java.util.List;

import com.jhta.cope.vo.LectureHistory;

public interface LectureHistoryService {
	public List<LectureHistory> getLectureHistoryByBuyLectureNo(int buyLectureNo);
	public void insertLectureHistory(LectureHistory lectureHistory);

}