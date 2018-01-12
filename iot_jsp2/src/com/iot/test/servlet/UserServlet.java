package com.iot.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.iot.test.service.UserService;
import com.iot.test.service.impl.UserServiceImpl;
import com.iot.test.vo.ClassInfo;
import com.iot.test.vo.UserClass;

public class UserServlet extends HttpServlet {
	UserService us = new UserServiceImpl();
	Gson gs = new Gson();

	public String getCommand(String uri) {
		int idx = uri.lastIndexOf("/");
		if (idx != -1) {
			return uri.substring(idx+1);
		}
		return "";
	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doProcess(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doProcess(req, res);
	}

	public void doProcess(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		PrintWriter out = res.getWriter();
		String uri = req.getRequestURI();
		String cmd = getCommand(uri);
		if (cmd.equals("login")) {
			HashMap<String, Object> hm = us.login(req, res);
			out.println(gs.toJson(hm));
		} else if (cmd.equals("logout")) {
			us.logout(req);
			RequestDispatcher rd = req.getRequestDispatcher("/view/user/login");
			rd.forward(req, res);
		} else if (cmd.equals("signin")) {
			us.signin(req);
			out.println(req.getAttribute("resStr"));
		} else if (cmd.equals("list")) {
			//ArrayList<UserClass> userList = us.getUserList();
			//out.println(gs.toJson(userList));
			UserService us = new UserServiceImpl();
			us.getUserList(req);	
	    	RequestDispatcher rd = req.getRequestDispatcher(uri);   
	    	rd.forward(req, res);
		} else if(cmd.equals("delete")) {
			out.println(us.deleteUser(req));
		}else if(cmd.equals("update")) {
			out.println(us.updateUser(req));
		}else if(cmd.equals("myupdate")) {
			out.println(us.myupdateUser(req));
		}
	}
}
