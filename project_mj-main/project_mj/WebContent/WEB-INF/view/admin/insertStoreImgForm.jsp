<%@page import="kr.or.dw.store.vo.ImgStoreVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.dw.store.vo.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<%
	StoreVO storeVo = (StoreVO) request.getAttribute("storeVo");
	List<ImgStoreVO> imgStoreVoList = (List<ImgStoreVO>)request.getAttribute("imgStoreVoList");
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style>
	.boxImg {
		display:block;
		width:100%;
		height:auto;
	}
	.botPadding {
		padding-bottom : 1.0rem;
	}
	.xbtn {
		position : absolute;
		left : 8rem;
		display : none;
		color : red;
	}

</style>
<script>
	$(function(){
		
	<%
		if (!imgStoreVoList.isEmpty()) {
			for (ImgStoreVO imgStore : imgStoreVoList) {
	%>
				$(".imgList .row").append("<div class='col-md-6 alreadyImg botPadding' style='text-align: -webkit-center;'><a href='#' class='xbtn'><span class='glyphicon glyphicon-minus'></span></a><img src='/storePath/<%=imgStore.getImg_url()%>' class='boxImg' style='width: 40rem; height:30rem; padding:0.3rem; border: 1px solid #6c757d;'>");
	<%
			}
		}
		if (storeVo.getThumb_url() != null) {
	%>
			$(".thumbnailImg .row").prepend("<div class='col-md-6 alreadyThumbImg botPadding' style='text-align: -webkit-center;'><a href='#' class='xbtn'><span class='glyphicon glyphicon-minus'></span></a><img src='/storePath/<%=storeVo.getThumb_url()%>' class='boxImg' style='width: 40rem; height:30rem; padding:0.3rem; border: 1px solid #6c757d;'>");
	<%				
		} 
	%>
	
		$(document).on("mouseenter", ".botPadding",function(){
			$(this).find(".xbtn").css("display", "block")
		});
		$(document).on("mouseleave", ".botPadding",function(){
			$(this).find(".xbtn").css("display", "none")
		});
		$(document).on("click", ".xbtn",function(){
			$(this).closest(".botPadding").remove();
		});
		
		
		
		// 썸네일 이미지 업로드시 ajax로 즉시 프리뷰
		$("#thumbUp").on("change", imgThumbFilePreview);
		
		function imgThumbFilePreview (e) {
			$(".alreadyThumbImg").remove();
			let previewBox = $(this);
			let formData = new FormData();
			let fileList = e.target.files;
			let priviewImg;
			let reader = new FileReader();
			reader.onload = function (e) {
				previewBox.closest(".rowImg").prepend("<div class='col-md-6 botPadding' style='text-align: -webkit-center;'><a href='#' class='xbtn'><span class='glyphicon glyphicon-minus'></span></a><img src='" + e.target.result + "'class='boxImg' style='width: 40rem; height:30rem; padding:0.3rem; border: 1px solid #6c757d;'></div>");
			};
			reader.readAsDataURL(e.target.files[0]);
		};
		
		// 썸네일 이미지 업로드
		$("#saveThumbnailImgBtn").on("click", function(){
			if (confirm("기존의 사진을 지우고 새롭게 올리시겠습니까?")) {
				let formData = new FormData($("#thumb_upload_form")[0]);
				console.log(formData);
				
				$.ajax({
					url : "<%=request.getContextPath()%>/file/storePicture.do?store_no=<%=storeVo.getStore_no()%>&cmd=thumb",
					processData : false,
					contentType : false,
					data : formData,
					dataType : "json",
					method : "post",
					success : function(res){
						console.log(res);
					},
					error : function(){
						
					}
				});
				alert("사진이 변경되었습니다.");
			}
		});
		
		// 일반 이미지 업로드시 ajax로 즉시 프리뷰
		$("#imgUp").on("change", imgFilePreview);
		
		let cnt = 0;
		function imgFilePreview (e) {
			$(".alreadyImg").remove();
			
			let previewBox = $(this);
			let formData = new FormData();
			let fileList = e.target.files;
			let priviewImg;
			for(let file of fileList){
				let reader = new FileReader();
				reader.onload = function (e) {

					previewBox.closest(".imgList .row").append("<div class='col-md-6 botPadding' style='text-align: -webkit-center;'><a href='#' class='xbtn'><span class='glyphicon glyphicon-minus'></span></a><img src='" + e.target.result + "'class='boxImg' id='" + cnt + "' style='width:40rem; height:30rem; padding:0.3rem; border: 1px solid #6c757d;'></div>");

				};
				reader.readAsDataURL(e.target.files[cnt]);
				cnt++;
			}
		};
		
		// 일반 이미지들  업로드
		$("#saveImgBtn").on("click", function(){
			if (confirm("기존의 사진을 지우고 새롭게 올리시겠습니까?")) {
				let formData = new FormData();
				let fileList = ($('#imgUp')[0]).files;
				
				console.log(fileList);
				let cnt = 0;
				for(let file of fileList){
					cnt++;
					formData.append('imgUp'+cnt, file);
				}
				$.ajax({
					url : "<%=request.getContextPath()%>/file/storePicture.do?store_no=<%=storeVo.getStore_no()%>&cmd=notThumb",
					processData : false,
					contentType : false,
					data : formData,
					dataType : "json",
					method : "post",
					success : function(res){
						console.log(res);
					},
					error : function(err){
						console.log(err);
					}
				});
				alert("사진이 변경되었습니다.");
			}	
		});
	});
</script>
<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-12" style="text-align: center; margin: 5rem 0 ;">
				<h1>사진 변경</h1>
				
			</div>
		</div>
	</div>
</section>
<div class="card card-primary card-outline mb-5">
	<div class="card-body">
		<div class="thumbnailImg">
			<div class="row rowImg">
<!-- 				<div class="col-md-6"></div> -->
				<div class="col-md-6" style="text-align: center;align-self: center;">
					<form id ="thumb_upload_form" method="post" enctype="multipart/form-data">
						<a href="#" class="btn btn-primary" id="saveThumbnailImgBtn" style="padding: 3rem 5rem;font-size: 2rem;"><b>썸네일 저장</b></a>
						<input type="file" name="thumbUp" id="thumbUp" accept=".jpg, .jpeg, .png" style="padding-left: 1rem; display:inline-block;">
					</form>
				</div>
			</div>
		</div>
		<hr style="border-color: darkgrey;">
		<div class="imgList">
			<div class="row rowImg">
				<div class="col-md-12 botPadding" style="text-align: center; padding-bottom: 1rem;">
					<form id="upload_form" method="post" enctype="multipart/form-data">
						<a href="#" class="btn btn-primary" id="saveImgBtn" style="padding: 3rem 5rem;font-size: 2rem;"><b>사진 저장</b></a>
						<input type="file" name="imgUp" id="imgUp" accept=".jpg, .jpeg, .png" style="padding-left: 3rem;display:inline-block;"multiple>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../footer.jsp"%>