<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.dw.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserVO userVO = (UserVO)request.getAttribute("userVO");
	Gson gson = new Gson();
	String result = gson.toJson(userVO);
	out.println(result);
%>

<!-- 바로 바뀌기 위해서 넣어야함~! -->