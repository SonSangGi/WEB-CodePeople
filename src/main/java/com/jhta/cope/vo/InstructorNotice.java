package com.jhta.cope.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class InstructorNotice {

	private int no;
	private String title;
	private User writer;
	private String contents;
	@DateTimeFormat(pattern="yy-MM-dd")
	private int views;
	private Date createDate;
	
	public InstructorNotice() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "InstructorNotice [no=" + no + ", title=" + title + ", writer=" + writer + ", contents=" + contents
				+ ", views=" + views + ", createDate=" + createDate + "]";
	}
}
