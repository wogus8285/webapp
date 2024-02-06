<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;

	try{
		String url = "jdbc:mysql://localhost:3306/yanjung?serverTimezone=UTC";
		String user = "root";
		String pwd = "1234";
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		conn = DriverManager.getConnection(url, user, pwd);
		System.out.println("데이터베이스가 연결되었습니다.<br>");
	} catch (Exception e) {
		System.out.println("데이터베이스 연결이 실패하였습니다.<br>");
		e.printStackTrace();
	}
%>