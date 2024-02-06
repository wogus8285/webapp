<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <!-- <div class="title">
      <p>헤헤ㅔ헤헤헤헤ㅔ헤헤헤헤ㅔ하매허매ㅔㅐㅓ</p>
    </div> -->
    
    <%@ include file="dbconn.jsp" %>
    <%
    	request.setCharacterEncoding("utf-8");
    	PreparedStatement pstmt=null;
   		String productId=request.getParameter("productId");
   		String name = request.getParameter("name");
   		String price=request.getParameter("price");
   		String info=request.getParameter("info");
   		String manu=request.getParameter("manu");
   		String cate=request.getParameter("cate");
   		String stock=request.getParameter("stock");
   		String status=request.getParameter("status");
   		System.out.println("코드 : " +productId);
   		System.out.println("상품명 : " +name);
   		System.out.println("가격 : " +price);
   		try{
   			
   			String sql="insert into product24 values(?,?,?,?,?,?,?,?)";
   			pstmt=conn.prepareStatement(sql);
   			pstmt.setString(1, productId);
   			pstmt.setString(2, name);
   			pstmt.setString(3, price);
   			pstmt.setString(4, info);
   			pstmt.setString(5, cate);
   			pstmt.setString(6, manu);
   			pstmt.setString(7, stock);
   			pstmt.setString(8, status);
   			pstmt.executeUpdate();
   			%>
			<script>
				alert("상품등록 성공");
				history.back(-1);
			</script>
			<%
   		}catch(Exception e){
   			%>
   			<script>
   				alert("상품등록 실패")
				history.back(-1);
   			</script>
   			<%
   			e.printStackTrace();
   		}
   		
   		%>
  </body>
</html>
