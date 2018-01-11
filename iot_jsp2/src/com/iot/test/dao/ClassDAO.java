package com.iot.test.dao;

import java.util.ArrayList;
import java.util.List;

import com.iot.test.vo.ClassInfo;
import com.iot.test.vo.UserClass;

public interface ClassDAO {
	List<ClassInfo> selectClassList();
	int insertClass(ClassInfo uc);
	int updateClass(ClassInfo uc);
	int deleteClass(ClassInfo uc);
}
