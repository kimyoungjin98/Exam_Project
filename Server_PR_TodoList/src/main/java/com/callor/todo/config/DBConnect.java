package com.callor.todo.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {

	private static Connection dbConn;

	static {

		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/todo";
		String user = "todoList";
		String pw = "1234";

		try {
			Class.forName(driver);

			if (dbConn == null) {
				dbConn = DriverManager.getConnection(url, user, pw);
			}

			System.out.println("DB 접속 성공");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static Connection getDB() {

		return dbConn;
	}

}
