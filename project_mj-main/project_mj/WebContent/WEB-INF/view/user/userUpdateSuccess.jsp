<%@page import="kr.or.dw.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	int result = (int)request.getAttribute("result");
%>
	<script>
	
	location.href ="<%= request.getContextPath()%>/user/userMyPage.do"
	
	</script>

