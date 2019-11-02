package com.gsitm.ex01.vo;

public class BoardVO {
	private String boardSeq 		= "";		/* 일련번호                         */
	private String title 		= "";		/* 제목                                   */
	private String content 		= "";		/* 내용                                   */
	public String getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(String boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
}
