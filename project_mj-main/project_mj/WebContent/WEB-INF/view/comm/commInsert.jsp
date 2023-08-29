<%@page import="java.util.List"%>
<%@page import="kr.or.dw.comm.vo.CommVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<%
	CommVO commVo = null;
	if( request.getAttribute("commVo") != null ){
		commVo = (CommVO) request.getAttribute("commVo");
	}
 	List<String> catCommList = (List<String>) request.getAttribute("catCommList"); 
%>





<%-- 입력 폼 --%>
<br>
<br>
<div class="content">
	<div class="container-fluid">
		<div class="row">
		<div class="col-md-2"></div>
			<div class="col-md-8">
			<div class="card-header">
				<h3 class="card-title">글 등록/수정 페이지  </h3>
			</div>
			
				<form action="<%= request.getContextPath() %>/comm/contentInsert.do" method="post">
					<% if(commVo != null ) { %>
					<input type="hidden" name="bd_no" value="<%=commVo.getBd_no()%>">
					<% } %>
					<input type="hidden" name="bdGroup"> <input type="hidden"
						name="bdOrder"> <input type="hidden" name="bdIndent">

					
					 <select name="choice" class="form-control mt-4 mb-2">
						<%
							for( String catComm : catCommList ) {
						%>
							<option value="<%=catComm %>"><%=catComm %></option>						
						<%		
							}					
						%>
					</select> 
						
					<input type="text" id="inputName" name="bdtitle" class="form-control mt-4 mb-2"
						placeholder="제목을 입력해주세요." required value="<%= commVo != null ? commVo.getBd_title():""%>">
					<div class="form-group">
						<textarea class="form-control" rows="10" name="bdcontent"
							placeholder="내용을 입력해주세요" required><%=commVo != null ? commVo.getBd_content() : "" %></textarea>
					</div>
					<button type="submit" class="btn btn-secondary mb-3">
						<%= commVo != null ? "수정" : "등록" %>
					</button>
					<button class="btn btn-secondary mb-3" onclick="history.go(-1)">
						취소 
					</button>
				</form>
			</div>
		</div>
	</div>
</div>


<%@ include file="../footer.jsp"%>