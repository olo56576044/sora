<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	if (request.getAttribute("result") != null) {
%>
{
	"result" : "<%=request.getAttribute("result") %>",
	"tag_name" : "<%=request.getAttribute("tag_name") %>"
}
<%		
	}
%>