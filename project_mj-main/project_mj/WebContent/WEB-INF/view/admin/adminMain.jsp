<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.col-md-6 .card {
		text-align: center;
   		height: 25rem;
    	justify-content: space-evenly;
	}
</style>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-12" style="text-align: center; margin: 5rem 0 ;">
				<h1>ADMIN</h1>
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
<div class="content">
	<div class="container-fluid">
		<div class="row" style="/* padding-top: 150px */">
			
			<div class="col-md-6">
				<div class="card">
					<a href="<%=request.getContextPath() %>/admin/modifyUserForm.do" style="color:black;">
						<div class="card-body">
							<h4 class="card-title">회원 관리</h4>
							<p class="card-text">회원들의 정보를 수정하고 관리하는 페이지</p>
						</div>
					</a>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card">
					<a href="<%=request.getContextPath() %>/admin/adminStoreForm.do" style="color:black;">
						<div class="card-body">
							<h4 class="card-title">점포 관리</h4>
							<p class="card-text">기존에 등록되있는 점포의 정보를 수정하고 새 점포를 등록한다.</p>
						</div>
					</a>
				</div>
<!-- 				<div class="card"> -->
<!-- 					<a href="#" style="color:black;"> -->
<!-- 						<div class="card-body"> -->
<!-- 							<h4 class="card-title">점포 태그 관리</h4> -->
<!-- 							<p class="card-text">점포와 연관된 태그를 추가,수정,삭제하는 페이지</p> -->
<!-- 						</div> -->
<!-- 				</div> -->
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</div>
</div>

<%@ include file="../footer.jsp" %>