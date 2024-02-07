<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>회원 가입 수정 화면</title>

    <link rel="stylesheet" href="./member.css" />
  </head>
  <body>
  
  	<%@ include file = "dbconn.jsp" %>
  	<%
  		ResultSet rs = null;
  		PreparedStatement pstmt=null;
  		String id=request.getParameter("id");
  		String sql="select * from member24 where id=?";
  		pstmt=conn.prepareStatement(sql);
  		pstmt.setString(1, id);
  		rs=pstmt.executeQuery();
  		if(rs.next()){
  			String name=rs.getString("name");
  			String pw=rs.getString(3);
  			String gender=rs.getString("gender");
  			String phone=rs.getString(5);
  			String add=rs.getString(6);
  			String job=rs.getString("job");
  	%>
  
    <h2>회원 가입 수정 화면</h2>

    <form name="form" method="post" action="memberUpdateProcess.jsp">
      <ul>
        <li>
          <p>아이디</p>
          <p class="p2">
            <input type="text" name="id" value="<%=id %>" placeholder="숫자만 입력하시오!" />
          </p>
        </li>
        <li>
          <p>성명</p>
          <p class="p2">
            <input type="text" name="name" value="<%=name %>" placeholder="가명을 입력하세요!" />
          </p>
        </li>
        <li>
          <p>비밀번호</p>
          <p class="p2">
            <input
              type="text"
              name="pw"
              value="<%=pw %>"
              placeholder="하루에 네 번 사랑을 말하고~"
            />
          </p>
        </li>
        <li>
          <p>비밀번호 확인</p>
          <p class="p2">
            <input
              type="text"
              name="pw2"
              placeholder="여덟 번 웃고 여섯번의 키스를 해줘~"
            />
          </p>
        </li>
        <li>
          <p>성별</p>
          <p class="p2">
            <input
              type="radio"
              name="gender"
              value="1"
              <%=gender.equals("1")? "checked" : ""  %>>남성
            <input
              type="radio"
              name="gender"
              value="1"
              <%=gender.equals("1")? "checked" : ""  %>>남성
      
          </p>
        </li>
        <li>
          <p>연락처</p>
          <p class="p2">
            <input
              type="text"
              name="phone"
              value="<%=phone %>"
              placeholder="보안에 심각한 위협이 있습니다."
            />
          </p>
        </li>
        <li>
          <p>주소</p>
          <p class="p2">
            <input
              type="text"
              name="add"
              value="<%=add %>"
              placeholder="폭탄이 배송될 확률이 있습니다!"
            />
          </p>
        </li>
        <li>
          <p>직업</p>
          <p class="p2">
            <select name="job">
              <option value="인사담당관" <%if(job.equals("인사담당관")){%>selected <%}%>>인사담당관</option>
              <option value="대통령"<%if(job.equals("대통령")){%>selected <%}%>>대통령</option>
              <option value="우주사령관"<%if(job.equals("우주사령관")){%>selected <%}%>>우주사령관</option>
              <option value="수군통제사"<%if(job.equals("수군통제사")){%>selected <%}%>>수군통제사</option>
              <option value="백수"<%if(job.equals("백수")){%>selected <%}%>>백수</option>
            </select>
          </p>
        </li>
      </ul>
      <div class="btn">
        <input class="btn1" type="button" value="저장" onclick="check()" />
        <input class="btn2" type="reset" value="취소" />
      </div>
      <% } %>
    </form>

    <script>
      function check() {
        if (document.form.id.value == '' || isNaN(document.form.id.value)) {
          alert('아이디를 숫자로 입력하세요.')
          document.form.id.focus()
          return false
        }
        if (document.form.name.value == '') {
          alert('이름을 입력하세요.')
          document.form.name.focus()
          return false
        }
        if (document.form.pw.value == '') {
          alert('비밀번호를 입력하세요.')
          document.form.pw.focus()
          return false
        }
        if (document.form.pw2.value == '') {
          alert('비밀번호 확인을 입력하세요.')
          document.form.pw2.focus()
          return false
        }
        if (document.form.pw.value != document.form.pw2.value) {
          alert('비밀번호가 일치하지 않습니다.')
          document.form.pw2.focus()
          return false
        }
        document.form.submit()
      }
    </script>
  </body>
</html>