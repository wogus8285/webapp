<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  
   <%@ include file="dbconn.jsp" %>
    <%
    	request.setCharacterEncoding("utf-8");
    	PreparedStatement pstmt=null;
   		String id=request.getParameter("id");
   		String name = request.getParameter("name");
   		String pw=request.getParameter("pw");
   		String gender=request.getParameter("gender");
   		String phone=request.getParameter("phone");
   		String add=request.getParameter("add");
   		String job=request.getParameter("job");
   		System.out.println("코드 : " +id);
   		System.out.println("상품명 : " +name);
   		System.out.println("가격 : " +pw);
   		try{
   			
   			String sql="insert into member24 values(?,?,?,?,?,?,?)";
   			pstmt=conn.prepareStatement(sql);
   			pstmt.setString(1, id);
   			pstmt.setString(2, name);
   			pstmt.setString(3, pw);
   			pstmt.setString(4, gender);
   			pstmt.setString(5, phone);
   			pstmt.setString(6, add);
   			pstmt.setString(7, job);
   			pstmt.executeUpdate();
   			%>
			<script>
				alert("회원가입 성공");
				history.back(-1);
			</script>
			<%
   		}catch(Exception e){
   			%>
   			<script>
   				alert("회원가입 실패")
				history.back(-1);
   			</script>
   			<%
   			e.printStackTrace();
   		}
   		
   		%>


</body>
</html>