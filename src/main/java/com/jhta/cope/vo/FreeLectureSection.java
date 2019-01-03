package com.jhta.cope.vo;

import java.util.Date;

public class FreeLectureSection {

	private int no;
	private int lectureNo;
	private String sectionTitles;
	private String sectionContents;
	private int count;
	private int views;
	private Date createDate;
	
	public FreeLectureSection() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return sectionTitles;
	}

	public FreeLectureSection setTitle(String title) {
		this.sectionTitles = title;
		return this;
	}

	public String getContents() {
		return sectionContents;
	}

	public FreeLectureSection setContents(String contents) {
		this.sectionContents = contents;
		return this;
	}

	public int getCount() {
		return count;
	}

	public FreeLectureSection setCount(int count) {
		this.count = count;
		return this;
	}

	public int getViews() {
		return views;
	}

	public FreeLectureSection setViews(int views) {
		this.views = views;
		return this;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public FreeLectureSection setCreateDate(Date createDate) {
		this.createDate = createDate;
		return this;
	}

	public int getLectureNo() {
		return lectureNo;
	}

	public void setLectureNo(int lectureNo) {
		this.lectureNo = lectureNo;
	}

	@Override
	public String toString() {
		return "FreeLectureSection [no=" + no + ", lectureNo=" + lectureNo + ", title=" + sectionTitles + ", contents="
				+ sectionContents + ", count=" + count + ", views=" + views + ", createDate=" + createDate + ", getNo()="
				+ getNo() + ", getTitle()=" + getTitle() + ", getContents()=" + getContents() + ", getCount()="
				+ getCount() + ", getViews()=" + getViews() + ", getCreateDate()=" + getCreateDate()
				+ ", getLectureNo()=" + getLectureNo() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
}
