package com.iot.test.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.iot.test.vo.UserClass;

public interface UserService {
	
	public HashMap<String, Object> login(HttpServletRequest req);
	public ArrayList<UserClass> getUserList();
	public void logout(HttpServletRequest req);
	public void signin(HttpServletRequest req);
	
	
}
