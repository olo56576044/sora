<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="kr.or.dw.cs.vo.AnnouncementVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	AnnouncementVO anVo = (AnnouncementVO) request.getAttribute("anVo");
%>
<style>
	.content {
    margin-top: center;
    margin-top: 215px;
		
	}

	.container-fluid {
		padding: 0;
	}

	.card {
		border: 1px solid #ccc;
		border-radius: 5px;
		margin-bottom: 20px;
	}

	.card-header {
		background-color: #f8f9fa;
		padding: 10px;
		border-bottom: 1px solid #ccc;
	}

	.user-block {
		margin-bottom: 0;
	}

	.user-block p {
		font-size: 24px;
		margin-bottom: 0;
	}

	.card-body {
		padding: 20px;
	}

	.card-body p {
		font-size: 18px;
		margin-bottom: 20px;
	}

	.btn {
		margin-right: 5px;
	}

	.btn-sm {
		font-size: 14px;
		padding: 5px 10px;
	}

	.btn-danger {
		background-color: #dc3545;
		border-color: #dc3545;
		color: #fff;
	}

	.btn-primary {
		background-color: #007bff;
		border-color: #007bff;
		color: #fff;
	}

	.btn-secondary {
		background-color: #6c757d;
		border-color: #6c757d;
		color: #fff;
	}

	.fas {
		margin-right: 5px;
	}
</style>

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="card card-widget">
					<div class="card-header">
						<div class="user-block">
							<p class="text-center"><%=anVo.getBd_title()%></p>
						</div>
					</div>
					<div class="card-body text-center">
						<p class="text-center"><%=anVo.getBd_content()%></p>
						<br>
						<br>
						<br>
						<% if (userVO != null && userVO.getAuth_cd().equals("A101")) { %>
						<a class="btn btn-danger btn-sm" href="<%=request.getContextPath()%>/cs/deleteContent.do?bd_no=<%=anVo.getBd_no()%>">
							<i class="fas fa-trash-alt"></i> 삭제
						</a>
						<a class="btn btn-primary btn-sm" href="<%=request.getContextPath()%>/cs/insertAnnounceForm.do?bd_no=<%=anVo.getBd_no()%>">
							<i class="fas fa-pen"></i> 수정
						</a>
						<% } %>
						<a class="btn btn-secondary btn-sm" href="<%=request.getContextPath()%>/cs/announceForm.do">
							<i class="fas fa-reply"></i> 목록
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../footer.jsp"%>


<%-- <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="kr.or.dw.cs.vo.AnnouncementVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	AnnouncementVO anVo = (AnnouncementVO) request.getAttribute("anVo");
%>

<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">

				<div class="card card-widget">
					<div class="card-header">
						<div class="user-block">
							<p style ="text-align: center"><%=anVo.getBd_title()%></p>
						</div>
					</div>

					<div class="card-body text-center">
							<p style="text-align: center"><%=anVo.getBd_content()%></p>						
							<br>
							<br>
							<br> 
							<%
										if (userVO != null && userVO.getAuth_cd().equals("A101")){
							%>
							<a type="button" class="btn btn-default btn-sm"
								href="<%=request.getContextPath()%>/cs/deleteContent.do?bd_no=<%=anVo.getBd_no()%>">
								<i class="fas fa-trash-alt">삭제</i>
							</a>
							 <a type="button" class="btn btn-default btn-sm"
								href="<%=request.getContextPath()%>/cs/insertAnnounceForm.do?bd_no=<%=anVo.getBd_no()%>">
								<i class="fas fa-pen">수정 </i>
							</a> 
							<%}%>
							
							<a type="button" class="btn btn-default btn-sm"
								href="<%=request.getContextPath()%>/cs/announceForm.do"> <i
								class="fas fa-reply"></i> 목록
							</a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

<%@ include file="../footer.jsp"%>
 --%>