<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 시간 입니다</title>
</head>
<body>
<%
//자바 명령어
Date now = new Date();

%><%=now%>
</body>
</html>