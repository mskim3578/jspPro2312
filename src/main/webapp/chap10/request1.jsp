<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><title>Insert title here</title></head>
<body>	<%	request.setCharacterEncoding("utf-8");	%>
	이름 : ${param.name}
	<br> age : ${param.age}
	<br> gender : ${param.gender}
	<br> hobby : ${param.hobby}
	<br> test : ${param.test}
	<br> year : ${param.year}
	<br><h2>요청파라미터에 저장된 모든 값 조회하기</h2>
	<h3>취미 :</h3>
	<%
	String[] hobbies = request.getParameterValues("hobby");
	pageContext.setAttribute("habbies", hobbies);
	%>
	<c:forEach var="v" items="${habbies}">
   ${v}  &nbsp;
</c:forEach>
	
</html>




