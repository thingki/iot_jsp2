package com.iot.test.vo;

public class BoardInfo {
	private int BoardNum;
	private String BoardName;
	private String BoardPassword;
	private String BoardTitle;
	private String BoardMemo;
	private String BoardTime;
	private int BoardHit;
	private int BoardRef;
	private int BoardIndent;
	private int BoardStep;
	private boolean BoardDayNew;
	public int getBoardNum() {
		return BoardNum;
	}
	public void setBoardNum(int boardNum) {
		BoardNum = boardNum;
	}
	public String getBoardName() {
		return BoardName;
	}
	public void setBoardName(String boardName) {
		BoardName = boardName;
	}
	public String getBoardPassword() {
		return BoardPassword;
	}
	public void setBoardPassword(String boardPassword) {
		BoardPassword = boardPassword;
	}
	public String getBoardTitle() {
		return BoardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		BoardTitle = boardTitle;
	}
	public String getBoardMemo() {
		return BoardMemo;
	}
	public void setBoardMemo(String boardMemo) {
		BoardMemo = boardMemo;
	}
	public String getBoardTime() {
		return BoardTime;
	}
	public void setBoardTime(String boardTime) {
		BoardTime = boardTime;
	}
	public int getBoardHit() {
		return BoardHit;
	}
	public void setBoardHit(int boardHit) {
		BoardHit = boardHit;
	}
	public int getBoardRef() {
		return BoardRef;
	}
	public void setBoardRef(int boardRef) {
		BoardRef = boardRef;
	}
	public int getBoardIndent() {
		return BoardIndent;
	}
	public void setBoardIndent(int boardIndent) {
		BoardIndent = boardIndent;
	}
	public int getBoardStep() {
		return BoardStep;
	}
	public void setBoardStep(int boardStep) {
		BoardStep = boardStep;
	}
	public boolean isBoardDayNew() {
		return BoardDayNew;
	}
	public void setBoardDayNew(boolean boardDayNew) {
		BoardDayNew = boardDayNew;
	}
	@Override
	public String toString() {
		return "BoardInfo [BoardNum=" + BoardNum + ", BoardName=" + BoardName + ", BoardPassword=" + BoardPassword
				+ ", BoardTitle=" + BoardTitle + ", BoardMemo=" + BoardMemo + ", BoardTime=" + BoardTime + ", BoardHit="
				+ BoardHit + ", BoardRef=" + BoardRef + ", BoardIndent=" + BoardIndent + ", BoardStep=" + BoardStep
				+ ", BoardDayNew=" + BoardDayNew + "]";
	}



}
