package com.iot.test.dao;

import java.util.List;

import com.iot.test.vo.BoardInfo;

public interface BoardDAO {
	List<BoardInfo> selectBoardList();
	int insertBoard(BoardInfo uc);
	int updateBoard(BoardInfo uc);
	int deleteBoard(BoardInfo uc);
}
