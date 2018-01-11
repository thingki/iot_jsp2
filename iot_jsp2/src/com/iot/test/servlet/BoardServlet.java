package com.iot.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.iot.test.service.ClassService;
import com.iot.test.service.impl.ClassServiceImpl;
import com.iot.test.vo.ClassInfo;

public class BoardServlet extends HttpServlet {
	ClassService cs = new ClassServiceImpl();
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
		if (cmd.equals("boardlist")) {
			List<ClassInfo> classList = cs.getClassList();
			out.println(gs.toJson(classList));
		} else if (cmd.equals("deleteboard")) {
			out.println(cs.deleteClass(req));
		} else if (cmd.equals("updateboard")) {
			out.println(cs.updateClass(req));
		} else if (cmd.equals("insertboard")) {
			cs.insertClass(req);
			out.println(req.getAttribute("resStr"));
		}
	}
}
