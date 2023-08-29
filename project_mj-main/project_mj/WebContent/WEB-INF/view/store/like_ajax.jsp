<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if(request.getAttribute("count") != null){ %>
{
	"count" : "<%=request.getAttribute("count") %>"
}
<% } %>