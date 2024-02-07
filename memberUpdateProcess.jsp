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
   			
   			String sql="update member24 set name=?, password=?, gender=?, phone=?, address=?, job=? where id=?";
   			pstmt=conn.prepareStatement(sql);
   			pstmt.setString(7, id);
   			pstmt.setString(1, name);
   			pstmt.setString(2, pw);
   			pstmt.setString(3, gender);
   			pstmt.setString(4, phone);
   			pstmt.setString(5, add);
   			pstmt.setString(6, job);
   			pstmt.executeUpdate();
   			%>
			<script>
				alert("수정 성공~!! 정말 대단해요!!!");
				location.href="memberList.jsp"
			</script>
			<%
   		}catch(Exception e){
   			%>
   			<script>
   				alert("수정 실패ㅠㅠㅠ ㅠ.ㅠ")
				history.back(-1);
   			</script>
   			<%
   			e.printStackTrace();
   		}
   		
   		%>


</body>
</html>