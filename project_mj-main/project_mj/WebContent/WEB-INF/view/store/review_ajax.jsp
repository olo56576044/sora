<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.dw.store.vo.ReviewStoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (request.getAttribute("reVo") != null) {
		ReviewStoreVO reVo = (ReviewStoreVO) request.getAttribute("reVo");
		Gson gson = new Gson();
		String review = gson.toJson(reVo);
		float rateAvg = 0;
		if (request.getAttribute("rateAvg") != null) {
			rateAvg = Float.parseFloat(String.valueOf(request.getAttribute("rateAvg")));
		
%>

{
	"review" : <%=review %>,
	"rateAvg" : <%=rateAvg %>
} 
<%
		}
	}

	if (request.getAttribute("result") != null) {
		float rateAvg = 0;
		if (request.getAttribute("rateAvg") != null) {
			rateAvg = Float.parseFloat(String.valueOf(request.getAttribute("rateAvg")));
%>
{
	"result" : "<%=request.getAttribute("result") %>",
	"rateAvg" : <%=rateAvg %>
}
<%		
		}	
	}
%>


