
<%@page import="java.sql.ResultSet"%>
<%@page import="ch07.GuestBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>박명록</h2>
		<form method="post">
			<div class="form-group">
				<label for="name">이름</label> <input type="text" class="form-control"
					id="name" placeholder="Enter name" name="name">
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="title" placeholder="Enter title"
					name="title">
			</div>

			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" id="content" name="content"></textarea>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>		<br>
	<div class="container">
  <table class="table">
    <thead>
      <tr>
        <th>날자</th>
        <th>이름</th>
        <th>제목</th>
           <th>내용</th>
      </tr>
    </thead>  
    <tbody>
   <%   
   GuestBookDao  gd = new GuestBookDao();   
	int num =		gd.insertBook(request);  
	ResultSet  rs=	gd.selectBook();
        //5) 데이터 처리
      while (rs.next()) {
   %>     
    <tr>
        <td><%=rs.getString("rdate") %></td>
        <td><%=rs.getString("name") %></td>
        <td><%=rs.getString("title") %></td>
         <td><%=rs.getString("content") %></td>
      </tr>
    
   <%} %> 
    </tbody>
  </table>
</div>
	
	
</body>
</html>
