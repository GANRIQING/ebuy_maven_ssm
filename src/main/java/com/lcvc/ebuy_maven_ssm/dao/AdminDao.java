package com.lcvc.ebuy_maven_ssm.dao;

import com.lcvc.ebuy_maven_ssm.model.Admin;
import com.lcvc.ebuy_maven_ssm.util.SHA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDao {
	/**
	 * 根据账户名和密码去数据库查询，进行登录判断
	 * @param username 账户名
	 * @param password 密码
	 * @return null 表示获取不到
	 */
	public Admin login(String username, String password){
		Admin admin=null;//最后返回的对象

		Connection conn=DBHelper.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			String sql="select * from ebuy where username=? and password=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()){//如果能够从数据库找到记录
				admin=new Admin();
				admin.setId(rs.getInt("id"));
				admin.setUsername(rs.getString("username"));
				admin.setPassword(rs.getString("password"));
				admin.setName(rs.getString("name"));
				admin.setCreateTime(rs.getDate("createTime"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closeConn(conn,pstmt,rs);
		}
		return admin;
	}

	/*
	 * 张三丰
	 * 20180330
	 * 将新密码保存到数据库中
	 * @return true表示密码更改成功，false表示密码更改失败
	 */
	public int updatePassword(String newPass,Integer id){
		int i =0;
		Connection conn=DBHelper.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			String sql="update ebuy set password=? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, newPass);
			pstmt.setInt(2, id);
			i=pstmt.executeUpdate();//更改了多少条记录


		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBHelper.closeConn(conn,pstmt,rs);
		}
		return i;
	}
	
	
	public static void main(String[] args) {
		AdminDao adminDao=new AdminDao();
		System.out.println(adminDao.login("admin", "123"));
		System.out.println(adminDao.login("user", "123"));
		System.out.println(adminDao.login("user", "123456"));
	}
}
