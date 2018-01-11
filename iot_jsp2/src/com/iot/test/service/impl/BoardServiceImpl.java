package com.iot.test.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.iot.test.dao.BoardDAO;
import com.iot.test.dao.impl.BoardDAOImpl;
import com.iot.test.service.BoardService;
import com.iot.test.vo.BoardInfo;

public class BoardServiceImpl implements BoardService{
	
	private BoardDAO bdao	= new BoardDAOImpl();
	private Gson gs = new Gson();
	
	@Override
	public List<BoardInfo> getBoardList() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String deleteBoard(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String updateBoard(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void insertBoard(HttpServletRequest req) {
		// TODO Auto-generated method stub
		
	}

}
