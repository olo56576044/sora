<%@page import="kr.or.dw.util.PaginationUtil"%>
<%@page import="kr.or.dw.comm.vo.CommVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%
	int user_no = (int)request.getAttribute("user_no");
	List<CommVO> userCommList = (List<CommVO>)request.getAttribute("userCommList");
%>
<script>
	$(function(){
		$(".userRow").hover(function(){
			$(this).css("cursor","pointer");
		});
		$(".userRow").on("click", function(){
			let no = $(this).find("#bd_no").text();
			location.href="<%=request.getContextPath()%>/admin/userCommView.do?bd_no="+no;
		});
	});
</script>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-12" style="text-align: center; margin: 5rem 0 ;">
				<h3>'No_<%=user_no %>' 회원 커뮤니티 게시글</h3>
			</div>
		</div>
	</div>
</section>

<!-- Main content -->
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title"></h3>
						<div class="card-tools">
<!-- 							<div class="input-group input-group-sm"> -->
<!-- 								<input type="text" class="form-control" placeholder="Search"> -->
<!-- 								<div class="input-group-append"> -->
<!-- 									<div class="btn btn-primary"> -->
<!-- 										<i class="fas fa-search"></i> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
						</div>    
					</div>
					<div class="card-body p-0">
						<table class="table table-striped projects">
							<thead>
							
								<tr>
									<th style="width: 15%;">게시번호</th>
									<th style="width: 15%;">카테고리</th>
									<th style="">제목</th>
									<th style="width: 20%;">작성일자</th>
<!-- 									<th style="width: 5%;"></th> -->
<!-- 									<th style="width: 5%;"></th> -->
								</tr>
							</thead>
							<% 
							for (CommVO comm : userCommList) {
								int bd_no = comm.getBd_no();
								String bd_cat = comm.getBd_cat();
								String bd_title = comm.getBd_title();
								String bd_wdt = comm.getBd_wdt();
							%>
							<tbody>
								
								<tr class="userRow">
										<td id="bd_no"><%= bd_no %></td>
										<td><%= bd_cat %></td>
										<td><%= bd_title %></td>
										<td><%= bd_wdt %></td>
								</tr>
							<% } %>
							</tbody>
				
						</table>
						<div class="container"style="margin-top:20px;">
							
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>
</div>
<%@ include file="../footer.jsp" %>