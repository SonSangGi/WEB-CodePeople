package com.jhta.cope.vo;

import java.util.Date;

public class InstructorNoticeComment {

	private int no;
	private int answerNo;
	private User writer;
	private String contents;
	private Date cteateDate;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getAnswerNo() {
		return answerNo;
	}
	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}
	public User getWriter() {
		return writer;
	}
	public void setWriter(User writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getCteateDate() {
		return cteateDate;
	}
	public void setCteateDate(Date cteateDate) {
		this.cteateDate = cteateDate;
	}
	
	@Override
	public String toString() {
		return "InstructorNoticeComment [no=" + no + ", answerNo=" + answerNo + ", writer=" + writer + ", contents="
				+ contents + ", cteateDate=" + cteateDate + "]";
	}	
}
