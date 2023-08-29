<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.dw.store.vo.StoreVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
	#insertStoreForm .form-group {
		margin-bottom : 1rem;
	}
</style>
<%
	List<String> storeCatList = (List<String>) request.getAttribute("storeCatList");
	List<String> tagList = (List<String>)request.getAttribute("tagList");
	
	StoreVO storeVo = null;
	List<String> storeTagList = new ArrayList<>();
	if (request.getAttribute("storeVo") != null) {
		storeVo = (StoreVO) request.getAttribute("storeVo");
		storeTagList.add(storeVo.getStore_tagNm_1());
		storeTagList.add(storeVo.getStore_tagNm_2());
		storeTagList.add(storeVo.getStore_tagNm_3());
	}
	
%>
<script>
	$(function(){
		
		$("#insertStoreForm").on("submit", function (e) {
			if ($("#insertStoreForm").find(".is-invalid").length > 0) {
				alert("형식에 맞게 입력해주세요.");
				$("#joinForm").find(".is-invalid").focus();
				e.preventDefault();
			}
		});
		
		
		$(".selectTagNm").on("change", function(){
			thisTag = $(this).find("option:selected").val();
			sbTag1 = $(this).closest(".tagBox").siblings(":first").find("option:selected").val();
			sbTag2 =$(this).closest(".tagBox").siblings(":last").find("option:selected").val();
			if (thisTag == sbTag1 || thisTag == sbTag2) {
				$(this).attr("class", "form-control selectTagNm is-invalid");
				$(this).closest(".form-group").attr("class", "form-group is-invalid");
			} 
			else {
				$(this).attr("class", "form-control selectTagNm");
				$(this).closest(".form-group").attr("class", "form-group");

			}
		});
		
	});
</script>

<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-12" style="text-align: center; margin: 5rem 0 ;">
				<h1>점포 등록/수정</h1>
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
	<div class="col-md-2"></div>
	<div class="col-md-8 mb-5">
		<div class="card card-primary">
			<div class="card-header">
				<h3 class="card-title"></h3>
			</div>


			<form method="post"
				action="<%=request.getContextPath()%>/admin/insertStore.do"
				id="insertStoreForm">
				<% if(storeVo != null) { %>
						<input type="hidden" name="store_no" value="<%=storeVo.getStore_no()%>">
						<% } %>
				<div class="card-body">
					<div class="form-group">
						<label for="storeName">점포명</label> <input type="text"
							class="form-control" name="store_name" placeholder="" value="<%=storeVo == null ? "" : storeVo.getStore_name()%>">
					</div>
					<div class="form-group">
						<label for="storeCatName">업종</label> 
						<select class="custom-select" name="cat_name">
						<%
							for (String storeCat :storeCatList) {
						%>	<option value="<%=storeCat%>" <% 
							if (storeVo != null && storeVo.getCat_name().equals(storeCat)) {
						%>selected<%
								} %>
							><%=storeCat %></option>
						<%	}	%>	
						</select>
					</div>
					<div class="form-group">
						<div class="row" style="justify-content: space-around;">
							<div class="col-mid-4 tagBox">
								<label for="store_tagNm_1">태그1</label> <select
									class="form-control selectTagNm" name="store_tagNm_1">
									<%
										for (String tag : tagList) {
									%>
									<option value="<%=tag%>"
										<% if (storeVo == null) {
											if (tag.equals("가족식사")) {
												%>selected<%
											}
										} else if (storeVo != null && storeVo.getStore_tagNm_1().equals(tag)) {%>
										selected <%} %>><%=tag%></option>
									<%
										}
									%>
								</select>
							</div>
							<div class="col-mid-4 tagBox">
								<label for="store_tagNm_2">태그2</label> <select
									class="form-control selectTagNm" name="store_tagNm_2">
									<%
										for (String tag : tagList) {
									%>
									<option value="<%=tag%>"
										<% if (storeVo == null) {
											if (tag.equals("기념일")) {
												%>selected<%
											}
										} else if (storeVo != null && storeVo.getStore_tagNm_2().equals(tag)) {%>
										selected <%} %>><%=tag%></option>
									<%
										}
									%>
								</select>
							</div>
							<div class="col-mid-4 tagBox">
								<label for="store_tagNm_3">태그3</label> <select
									class="form-control selectTagNm" name="store_tagNm_3">
									<%
										for (String tag : tagList) {
									%>
									<option value="<%=tag%>"
										<% if (storeVo == null) {
											if (tag.equals("남자들끼리")) {
												%>selected<%
											}
										} else if (storeVo != null && storeVo.getStore_tagNm_3().equals(tag)) {%>
										selected <%} %>><%=tag%></option>
									<%
										}
									%>
								</select>
							</div>
						</div>
					</div>
					<span class="error invalid-feedback col-md-12" style="padding-bottom: 1rem; text-align: center;">중복된 태그가 선택되었습니다.</span>
					<div class="form-group">
						<div class="form-group">
							<label for="storeAddr">주소</label> <input type="text"
								class="form-control" name="store_addr" placeholder="" value="<%=storeVo == null ? "" : storeVo.getStore_addr()%>">
						</div>
						<div class="form-group">
							<label for="storeTel">전화번호</label> <input type="text"
								class="form-control" name="store_tel" placeholder="" value="<%=storeVo == null ? "" : storeVo.getStore_tel()%>">
						</div>
						<div class="form-group">
							<label for="storeHour">영업시간</label> <input type="text"
								class="form-control" name="store_hour" placeholder="" value="<%=storeVo == null ? "" : storeVo.getStore_hour()%>">
						</div>
						<div class="form-group">
							<label for="storeBreak">휴식시간</label> <input type="text"
								class="form-control" name="store_break" placeholder="" value="<%=storeVo == null ? "" : storeVo.getStore_break()%>">
						</div>
						<div class="form-group">
							<label for="storeUrl">홈페이지 주소</label> <input type="text"
								class="form-control" name="store_url" placeholder="" value="<%=storeVo == null ? "" : storeVo.getStore_url()%>">
						</div>
						<div class="form-group">
							<label for="storeDes_s">점포 간단 설명</label> <input type="text"
								class="form-control" name="store_des_s" placeholder="" value="<%=storeVo == null ? "" : storeVo.getStore_des_s()%>">
						</div>
						<div class="form-group">
							<label for="storeDes_d">점포 상세 설명</label> 
							<textarea class="form-control" rows="6" name="store_des_d" placeholder="" ><%=storeVo == null ? "" : storeVo.getStore_des_d()%></textarea>
						</div>
						<%
						if (storeVo != null) {
						%>
						<div class="form-group">
							<label for="storeCatName">삭제여부</label> 
							<select class="custom-select" name="gb_del">
								<option value="N" selected>등록</option>
								<option value="Y" >삭제</option>
							</select>
						</div>
						<%
						}
						%>
					</div>
				</div>


				<div class="card-footer">
					<button type="submit" class="btn btn-primary"><%= storeVo != null ? "수정" : "등록" %></button>
				</div>
			</form>
		</div>
	</div>
	<div class="col-md-2"></div>
</div>
<%@ include file="../footer.jsp"%>