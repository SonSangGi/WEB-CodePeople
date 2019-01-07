package com.jhta.cope.dao;

import java.util.List;

import com.jhta.cope.vo.Criteria;
import com.jhta.cope.vo.Qna;
import com.jhta.cope.vo.QnaAnswer;
import com.jhta.cope.vo.QnaComment;

public interface QnaDao {
	
	public List<Qna> getAllQnas();
	public List<QnaAnswer> getAllAnswers();
	public List<Qna> getAllQnasByCriteria(Criteria criteria);
	public Qna getQnaByNo(int no);
	public List<QnaComment> getCommentByQnaNo(int no);
	public void insertQna(Qna qna);
	public void insertAnswer(QnaAnswer qnaAnswer);
	public void insertAnswerComment(QnaComment qnaComment);
	public List<Qna> getQnaByUserNo(int userNo);
	public List<QnaAnswer> getAnswerByUserNo(int userNo);
	public List<QnaComment> getCommentByUserNo(int userNo);
	public int getQnaCount();
}
