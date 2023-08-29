<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int result = (int)request.getAttribute("result");
%>
	<script>
	alert("탈퇴가 완료되었습니다.");
	location.href ="<%= request.getContextPath()%>/cs/main.do"
	
	</script>
	
