<%@page import="kr.or.dw.util.PaginationUtil"%>
<%@page import="kr.or.dw.store.vo.StoreVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<%
	List<StoreVO> storeList = (List<StoreVO>) request.getAttribute("storeList");
%>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-12" style="text-align: center; margin: 5rem 0 ;">
				<h1>등록 점포</h1>
			</div>
<!-- 			<div class="col-sm-6"> -->
<!-- 				<ol class="breadcrumb float-sm-right"> -->
<!-- 					<li class="breadcrumb-item"><a href="#">Home</a></li> -->
<!-- 					<li class="breadcrumb-item active">Admin Page</li> -->
<!-- 				</ol> -->
<!-- 			</div> -->
		</div>
	</div>
</section>
<div class="row">
	<div class="col-md-12 mb-5">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title"><!-- Simple Full Width Table --></h3>
				<div class="card-tools float-right" style="float: right;">
					<a href="<%=request.getContextPath() %>/admin/modifyTagForm.do" class="btn btn-danger" style="margin:0;">
						<i class="fas fa-solid fa-tag"></i>태그 관리
					</a>
					<a href="<%=request.getContextPath() %>/admin/insertStoreForm.do" class="btn btn-dark" style="margin:0;">
						<i class="fas fa-store"></i>점포 추가
					</a>
<!-- 					<ul class="pagination pagination-sm float-right"> -->
<!-- 						<li class="page-item"><a class="page-link" href="#">«</a></li> -->
<!-- 						<li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 						<li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 						<li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 						<li class="page-item"><a class="page-link" href="#">»</a></li> -->
<!-- 					</ul> -->
				</div>
			</div>

			<div class="card-body p-0">
				<table class="table">
					<thead>
						<tr>
							<th style="width: 5%">#</th>
							<th style="width: 10%">업종</th>
							<th>점포명</th>
							<th style="width: 15%">태그1</th> 
							<th style="width: 15%">태그2</th> 
							<th style="width: 15%">태그3</th> 
							<th style="width: 10%">삭제여부</th>
							<th style="width: 10%">수정</th>
							<th style="width: 10%"></th>
						</tr>
					</thead>
					<tbody>
					<%
						for (StoreVO store : storeList) {
							int store_no = store.getStore_no();
							String store_cat = store.getCat_name();
							String store_name = store.getStore_name();
							String gb_del = store.getGb_del();
							String store_tagNm_1 = store.getStore_tagNm_1();
							String store_tagNm_2 = store.getStore_tagNm_2();
							String store_tagNm_3 = store.getStore_tagNm_3();
					%>
						<tr>
							<td><%=store_no %></td>
							<td><%=store_cat %></td>
							<td><%=store_name %></td>
							<td><%=store_tagNm_1%></td>
							<td><%=store_tagNm_2%></td>
							<td><%=store_tagNm_3%></td>
							<td><%=gb_del %></td>
							<td>
								<a href="<%=request.getContextPath() %>/admin/insertStoreForm.do?store_no=<%=store_no %>&w=m" class="btn btn-success" style="margin:0;">
									<i class="fas fa-solid fa-wrench"></i> 정보수정
								</a>
							</td>
							<td>
								<a href="<%=request.getContextPath() %>/admin/insertStoreImgForm.do?store_no=<%=store_no %>&w=m" class="btn btn-secondary" style="margin:0; padding: 0.375rem 0.75rem;">
									<i class="fas fa-solid fa-image"></i>사진등록
								</a>
							</td>
						</tr>
					<%
						}
					%>
					</tbody>
				</table>
				<%
								PaginationUtil pagination = (PaginationUtil) request.getAttribute("pagingConfigMap");
							%>
							<%= pagination.getPaginationHtml(request, new String[] {"search"}) %>
			</div>
		</div>
	</div>

</div>




<%@ include file="../footer.jsp" %>