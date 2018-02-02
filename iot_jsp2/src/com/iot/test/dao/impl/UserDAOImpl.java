package com.iot.test.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iot.test.common.DBCon;
import com.iot.test.dao.UserDAO;
import com.iot.test.utils.DBUtil;
import com.iot.test.vo.UserClass;

public class UserDAOImpl implements UserDAO{

	@Override
	public ArrayList<UserClass> selectUserList() {
		ArrayList<UserClass> userList = new ArrayList<UserClass>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DBCon.getCon();
			String sql = "select *, date_format(uiregdate, '%Y-%m-%d') as uiregdate from user_info ui, class_info ci where ui.cino=ci.cino";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserClass uc = new UserClass();
				uc.setAddress(rs.getString("address"));
				uc.setCiDesc	(rs.getString("cidesc"));
				uc.setCiName(rs.getString("ciname"));
				uc.setCiNo(rs.getInt("cino"));
				uc.setUiAge(rs.getInt("uiage"));
				uc.setUiId(rs.getString("uiid"));
				uc.setUiPwd(rs.getString("uipwd"));
				uc.setUiName(rs.getString("uiname"));
				uc.setUiNo(rs.getInt("uino"));
				uc.setUiRegdate(rs.getString("uiregdate"));
				userList.add(uc);			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeAll(rs, con, ps);;
		}
		return userList;
	}

	@Override
	public UserClass selectUser(String uiId) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DBCon.getCon();
			String sql = "select * from user_info ui, class_info ci \r\n" + 
					"where ui.cino=ci.cino and ui.uiid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, uiId);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserClass uc = new UserClass();
				uc.setAddress(rs.getString("address"));
				uc.setCiDesc	(rs.getString("cidesc"));
				uc.setCiName(rs.getString("ciname"));
				uc.setCiNo(rs.getInt("cino"));
				uc.setUiAge(rs.getInt("uiage"));
				uc.setUiId(rs.getString("uiid"));
				uc.setUiPwd(rs.getString("uipwd"));
				uc.setUiName(rs.getString("uiname"));
				uc.setUiNo(rs.getInt("uino"));
				uc.setUiRegdate(rs.getString("uiregdate"));
				return uc;				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeAll(rs, con, ps);
		}
		return null;
	}

	@Override 
	public int insertUser(UserClass uc) {

		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = DBCon.getCon();
			String sql = "insert into user_info(uiname, uiage, uiid, uipwd, cino, uiregdate, address)\r\n" + 
					"values(?,?,?,?,?,now(),?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, uc.getUiName());
			ps.setInt(2, uc.getUiAge());
			ps.setString(3, uc.getUiId());
			ps.setString(4, uc.getUiPwd());
			ps.setInt(5, uc.getCiNo());
			ps.setString(6, uc.getAddress());
			return ps.executeUpdate();
				
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(con);
			DBUtil.close(ps);
		}
		return 0;
	}

	@Override
	public int updateUser(UserClass uc) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = DBCon.getCon();
			String sql = "update user_info\r\n" + 
					"set uiName=?, uiAge=?, address=?, uiid=? where uiNo=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, uc.getUiName());
			ps.setInt(2, uc.getUiAge());
			ps.setString(3, uc.getAddress());
			ps.setString(4, uc.getUiId());
			ps.setInt(5, uc.getUiNo());
			return ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(con);
			DBUtil.close(ps);
		}
		return 0;
	}

	@Override
	public int deleteUser(UserClass uc) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = DBCon.getCon();
			String sql = "delete from user_info where uiNo=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, uc.getUiNo());
			return ps.executeUpdate();		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(con);
			DBUtil.close(ps);
		}
		return 0;
	}

	@Override
	public UserClass selectUser(int uiNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int myupdateUser(UserClass uc) {
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = DBCon.getCon();
			String sql = "update user_info\r\n" + 
					"set uiName=?, uiAge=?, uiId=?, uiPwd=?, ciNo=?, address=? where uiNo=?;";
			ps = con.prepareStatement(sql);
			ps.setString(1, uc.getUiName());
			
			ps.setInt(2, uc.getUiAge());
			ps.setString(3, uc.getUiId());
			ps.setString(4, uc.getUiPwd());
			ps.setInt(5, uc.getCiNo());
			ps.setString(6, uc.getAddress());	
			ps.setInt(7, uc.getUiNo());	
			System.out.println(ps);
			return ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(con);
			DBUtil.close(ps);
		}
		return 0;
	}
}
