package com.market.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SuperDao {
	protected Connection conn = null;
	private String driver;
	
	public SuperDao() {
		this.driver = "oracle.jdbc.driver.OracleDriver";
		try {
			Class.forName(driver);
			this.conn = this.getConnection();
			
			if(conn != null){
				System.out.println("db-connection success");
			}else {
				System.out.println("db-connection failure");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	protected void closeConnection() {
		try {
			if(conn != null) {conn.close();}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected Connection getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "moongo";
		String password = "moongo";
		try {
			return DriverManager.getConnection(url,id,password);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
