<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="UTF-8" />
    <title>회원목록</title>
    <link rel="stylesheet" href="./memberList.css" />
  </head>
  <body>
    <h2>회원목록</h2>
    <table >
      <tr>
        <td>no</td>
        <td>id</td>
        <td>성명</td>
        <td>비밀번호</td>
        <td>성별</td>
        <td>연락처</td>
        <td>주소</td>
        <td>직업</td>
        <td>구분</td>
      </tr>

      <%@ include file = "dbconn.jsp" %>
      
      <%
       PreparedStatement pstmt = null;
       ResultSet rs = null;
	   String sql = "select * from member24";       	
       pstmt = conn.prepareStatement(sql);
       rs=pstmt.executeQuery();
       
       int no = 0;
       
       while(rs.next()){
    	   String id = rs.getString("id");
    	   String name = rs.getString(2);
    	   String pw = rs.getString(3);
    	   String gender = rs.getString("gender");
    	   String phone = rs.getString("phone");
    	   String add = rs.getString(6);
    	   String job = rs.getString(7);
   		   no++;
       
	   %>
      <tr>
        <td><%=no %></td>
        <td><%=id %></td>
        <td><%=name %></td>
        <td><%=pw %></td>
        <td><%=gender %></td>
        <td><%=phone %></td>
        <td><%=add %></td>
        <td><%=job %></td>
        <td><a href = "memberUpdate.jsp?id=<%=id %>">수정</a>/
        <a href = "memberDeleteProcess.jsp?id=<%=id %>"  onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false" >삭제</a></td>
      </tr>
          <%
    }
       %> 
    </table>
  </body>
</html>
