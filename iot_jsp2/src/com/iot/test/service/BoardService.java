package com.iot.test.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import com.iot.test.vo.BoardInfo;


public interface BoardService {
	public List<BoardInfo> getBoardList();
	public String deleteBoard(HttpServletRequest req);
	public String updateBoard(HttpServletRequest req);
	public void insertBoard(HttpServletRequest req);
	
}
