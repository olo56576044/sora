<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String user_nick = (String)request.getAttribute("user_nick");
	if(user_nick == null){
%>
	{"chk" : "사용 가능한 닉네임입니다."}

<%
	}else {	// 사용 불가능
%>
	{"chk" : "중복된 닉네임입니다. 다른 닉네임을 입력해 주세요!"}
<%
	}
%>
