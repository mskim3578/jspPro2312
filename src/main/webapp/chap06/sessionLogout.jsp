<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	session.invalidate(); %>
<script>
    alert("로그 아웃 되셨습니다 ");
	location.href="sessionLoginConfirm.jsp";
</script>