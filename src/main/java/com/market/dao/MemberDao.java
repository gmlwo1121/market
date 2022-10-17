package com.market.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.market.model.Member;

public class MemberDao extends SuperDao {
	public MemberDao() {

	}

	public Member SelectData(String id, String password) throws Exception {
		System.out.println(id + "/" + password);
		String sql = "select * from members where m_id = ? and m_pw = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member bean = null;
		Connection conn = null;

		if (conn == null) {
			conn = super.getConnection();
		}
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, id);
		pstmt.setString(2, password);

		rs = pstmt.executeQuery();

		if (rs.next()) {
			bean = new Member(); 

			bean.setId(rs.getString("m_id"));
			bean.setName(rs.getString("m_name"));
			bean.setPassword(rs.getString("m_pw"));
			bean.setHiredate(String.valueOf(rs.getDate("hiredate")));
		}

		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return bean;
	}

	public int DeleteData(String id) throws Exception {
		int cnt = -99999;
		String sql = "delete from members where m_id = ? ";

		PreparedStatement pstmt = null;

		Connection conn = null;

		if (conn == null) {conn = super.getConnection();}

		conn.setAutoCommit(false);

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, id);

		cnt = pstmt.executeUpdate();

		conn.commit();

		if (pstmt != null) {pstmt.close();}
		if (conn != null) {conn.close();}

		return cnt;
	}

	public int InsertData(Member bean) throws Exception {
		String sql = " insert into members(m_id, m_name, m_pw, hiredate)";
		sql += "values(?, ?, ?, sysdate)";

		PreparedStatement pstmt = null;

		Connection conn = null;

		if (conn == null) {
			conn = super.getConnection();
		}

		conn.setAutoCommit(false);

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, bean.getId());
		pstmt.setString(2, bean.getName());
		pstmt.setString(3, bean.getPassword());

		int cnt = -99999;
		cnt = pstmt.executeUpdate();

		conn.commit(); 
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}

		return cnt;
	}

	public int UpdateData(Member bean) throws Exception {
		String sql = "update members set m_name = ?, m_pw= ?";
		sql += " where m_id = ?";

		PreparedStatement pstmt = null;

		Connection conn = null;

		if (conn == null) {conn = super.getConnection();}

		conn.setAutoCommit(false);

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, bean.getName());
		pstmt.setString(2, bean.getPassword());
		pstmt.setString(3, bean.getId());

		int cnt = -99999;
		cnt = pstmt.executeUpdate();

		conn.commit(); 

		if (pstmt != null) {pstmt.close();}
		if (conn != null) {conn.close();}

		return cnt;
	}

	public Member SelectData(String id) throws Exception {
		String sql = "select * from members where m_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;

		if (conn == null) {conn = super.getConnection();}
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, id);

		rs = pstmt.executeQuery();

		Member bean = null;
		if (rs.next()) {
			bean = new Member();

			bean.setId(rs.getString("m_id"));
			bean.setName(rs.getString("m_name"));
			bean.setPassword(rs.getString("m_pw"));
			bean.setHiredate(String.valueOf(rs.getDate("hiredate")));
		}

		if (rs != null) {rs.close();}
		if (pstmt != null) {pstmt.close();}
		if (conn != null) {conn.close();}

		return bean;
	}

	public List<Member> SelectDataList() throws Exception {
		String sql = "select * from members order by m_id asc";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		
		List<Member> list = new ArrayList<Member>();
		
		if(conn == null) {conn = super.getConnection();}
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Member bean = new Member();
			
			bean.setId(rs.getString("m_id"));
			bean.setName(rs.getString("m_name"));
			bean.setHiredate(String.valueOf(rs.getDate("hiredate")));
			
			list.add(bean);
		}
		
		if(rs != null) {rs.close();}
		if(pstmt != null) {pstmt.close();}
		if(conn != null) {conn.close();}
		
		return list;
	}
}