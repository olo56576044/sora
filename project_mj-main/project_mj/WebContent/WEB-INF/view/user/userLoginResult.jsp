<%@page import="kr.or.dw.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script>
<%
	int result = (int)request.getAttribute("result");
	 if (result == 1) {
		UserVO vo = (UserVO)session.getAttribute("UserVO");
%>

		location.href="<%=request.getContextPath()%>/cs/main.do";
<%		
	} else if(result == 0){
%>		
		alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
		history.go(-1);
<%		
	}else if(result == 2){
	%>
		alert("회원 정보를 읽어올 수 없습니다.");
		location.href="<%=request.getContextPath()%>/cs/main.do";
<% } %>
	</script>