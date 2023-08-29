<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<%
	int store_no = (int)request.getAttribute("store_no");
	String type = (String)request.getAttribute("type");
%>
	<script>
<%
	if (type.equals("insert")) {
%>
		alert("점포가  등록되었습니다. 점포사진을 넣어주세요");
<%		
	} else if (type.equals("update")){
%>
		alert("(<%=store_no%>)번 점포가 수정되었습니다.");
<%		
	}
%>		
		location.href="<%=request.getContextPath()%>/admin/adminStoreForm.do";
	</script>
	
<%@ include file="../footer.jsp" %>