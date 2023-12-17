<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="fmt2" uri="/WEB-INF/tlds/el-functions.tld" %>
<%
	request.setAttribute("price", 12345);
%>
<html>
<head><title>EL 함수 호출</title></head>
<body>
/chap09/viewNumber.jsp <br>
가격은 <b>${fmt2:formatNumber(price, '#,##0') }</b>원 입니다.

</body>
</html>
