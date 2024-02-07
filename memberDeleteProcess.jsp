<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원삭제</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt=null;
	String id = request.getParameter("id");
	try{
		String sql="delete from member24 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,id);
		pstmt.executeUpdate();
%>
	<script>
		alert("삭제성공");
		location.href="memberList.jsp";
	</script>
<%
	}catch(Exception e){		
%>
	<script>
		alert("삭제실패")
	</script>
	<%
	e.printStackTrace();
	}
	%>


</body>
</html>