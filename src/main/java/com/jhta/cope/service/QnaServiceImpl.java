package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.QnaDao;
import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Qna;
import com.jhta.cope.vo.QnaAnswer;
import com.jhta.cope.vo.QnaComment;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	QnaDao qnaDao;
	
	@Override
	public List<Qna> getAllQnas() {
		return qnaDao.getAllQnas();
	}

	@Override
	public Qna getQnaByNo(int no) {
		return qnaDao.getQnaByNo(no);
	}

	@Override
	public List<QnaComment> getCommentByQnaNo(int no) {
		return qnaDao.getCommentByQnaNo(no);
	}

	@Override
	public int getQnaCount() {
		return qnaDao.getQnaCount();
	}

	@Override
	public List<Qna> getAllQnasByCriteria(Criteria criteria) {
		return qnaDao.getAllQnasByCriteria(criteria);
	}

	@Override
	public void insertQna(Qna qna) {
		qnaDao.insertQna(qna);
	}

	@Override
	public void insertAnswer(QnaAnswer qnaAnswer) {
		qnaDao.insertAnswer(qnaAnswer);
	}

	@Override
	public void insertAnswerComment(QnaComment qnaComment) {
		qnaDao.insertAnswerComment(qnaComment);
	}

	@Override
	public List<QnaAnswer> getAllAnswers() {
		return qnaDao.getAllAnswers();
	}

}
