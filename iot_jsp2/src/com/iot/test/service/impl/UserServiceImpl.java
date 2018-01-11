package com.iot.test.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.iot.test.dao.UserDAO;
import com.iot.test.dao.impl.UserDAOImpl;
import com.iot.test.service.UserService;
import com.iot.test.vo.UserClass;

public class UserServiceImpl implements UserService {
	private Gson gs = new Gson();
	private UserDAO ud = new UserDAOImpl();

	@Override
	public HashMap<String, Object> login(HttpServletRequest req, HttpServletResponse res) {
		UserClass uc = gs.fromJson(req.getParameter("param"), UserClass.class);
		UserClass checkUc = ud.selectUser(uc.getUiId());
		HashMap<String, Object> hm = new HashMap<String, Object>();
		hm.put("msg", "로그인 성공");
		hm.put("login", "ok");

		if (checkUc != null) {
			if (!checkUc.getUiPwd().equals(uc.getUiPwd())) {
				hm.put("msg", "비번 확인요");
				hm.put("login", "pwdno");
			} else {
				System.out.println(uc.isSaveId());
				Cookie cId =new Cookie("userId", uc.getUiId());
				cId.setPath("/");
				Cookie cSave = new Cookie("saveId", ""+uc.isSaveId());
				cSave.setPath("/");
				int maxAge=0;
				if(uc.isSaveId()) {
					maxAge=60*60*24;
				}
				cId.setMaxAge(maxAge);
				cSave.setMaxAge(maxAge);
				res.addCookie(cId);
				res.addCookie(cSave);
				HttpSession hs = req.getSession();
				hs.setAttribute("user", checkUc);			
			}
		} else {
			hm.put("msg", "아이디 확인요!");
			hm.put("login", "idno");
		}
		return hm;
	}

	@Override
	public void logout(HttpServletRequest req) {
		HttpSession hs = req.getSession();
		hs.invalidate(); // 세션값 모조리 소멸!!!!!
	}

	@Override
	public void signin(HttpServletRequest req) {
		String json = req.getParameter("param");
		UserClass uc = gs.fromJson(json, UserClass.class);
		int result = ud.insertUser(uc);
		HashMap<String, String> rm = new HashMap<String, String>();
		rm.put("result", "no");
		rm.put("msg", "실패!!!!!!!!!!");
		if(result ==1) {
			rm.put("result", "ok");
			rm.put("msg", "성공해에에에에따!!!!!!!!!");
		}											
		req.setAttribute("resStr", gs.toJson(rm));
	}

	@Override
	public ArrayList<UserClass> getUserList() {
		return ud.selectUserList();
	}

	@Override
	public String deleteUser(HttpServletRequest req) {
		int uiNo=Integer.parseInt(req.getParameter("uiNo"));
		UserClass uc = new UserClass();
		uc.setUiNo(uiNo);
		int result = ud.deleteUser(uc);
		HashMap<String, String> rm = new HashMap<String, String>();
		rm.put("result", "no");
		rm.put("msg", "삭제가 실패!!!!!!!!!!");
		if(result==1) {
			rm.put("result", "ok");
			rm.put("msg", "삭제가 성공!!!!!!!!");
		}
		return gs.toJson(rm);
	}

	@Override
	public String updateUser(HttpServletRequest req) {
		String param=req.getParameter("param");
		UserClass uc = gs.fromJson(param, UserClass.class);
		int result = ud.updateUser(uc);
		Map<String, String> rm = new HashMap<String, String>();
		rm.put("result", "no");
		rm.put("msg", "수정이 실패!!!!!!!!!! why??");
		if(result==1) {
			rm.put("result", "ok");
			rm.put("msg", "수정 성공!!!!!!!!");
		}
		return gs.toJson(rm);
	}

	@Override
	public String myupdateUser(HttpServletRequest req) {
		String param=req.getParameter("param");
		UserClass uc = gs.fromJson(param, UserClass.class);
		int result = ud.myupdateUser(uc);
		Map<String, String> rm = new HashMap<String, String>();
		rm.put("result", "no");
		rm.put("msg", "수정이 실패!!!!!!!!!! why??");
		if(result==1) {
			rm.put("result", "ok");
			rm.put("msg", "수정 성공!!!!!!!!");
		}
		return gs.toJson(rm);
	}
}
