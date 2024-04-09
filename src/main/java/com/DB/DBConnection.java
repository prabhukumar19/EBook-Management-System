package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	private static Connection conn;
	public static Connection  getConnection() {
		try {
			String url="jdbc:mysql://localhost:3306/ebook_management_system?useSSL=false";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(url,"root","root");
//			System.out.println(conn);
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return conn;
	}
}
