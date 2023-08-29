<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.dw.store.vo.ImgReviewStoreVO"%>
<%@page import="kr.or.dw.store.vo.ReviewStoreVO"%>
<%@page import="kr.or.dw.store.vo.ImgStoreVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.dw.store.vo.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<%
	StoreVO storeVo = (StoreVO) request.getAttribute("storeVo");
	String store_name = storeVo.getStore_name();
	float store_rate = storeVo.getStore_rate();
	String store_tagNm_1 = storeVo.getStore_tagNm_1();
	String store_tagNm_2 = storeVo.getStore_tagNm_2();
	String store_tagNm_3 = storeVo.getStore_tagNm_3();
	int store_like = storeVo.getStore_like();
	int store_fav = storeVo.getStore_fav();
	int store_views = storeVo.getStore_views();
	String store_catName = storeVo.getCat_name();
	String store_des_s = storeVo.getStore_des_s();
	String store_des_d = storeVo.getStore_des_d();
	String store_tel = storeVo.getStore_tel();
	String store_addr = storeVo.getStore_addr();
	String store_hour = storeVo.getStore_hour();
	String store_break = storeVo.getStore_break();
	String store_url = storeVo.getStore_url();
	
	List<ImgStoreVO> imgStoreVoList = (List<ImgStoreVO>) request.getAttribute("imgStoreVoList");
	List<ReviewStoreVO> reviewStoreVoList = (List<ReviewStoreVO>) request.getAttribute("reviewStoreVoList");
	List<ImgReviewStoreVO> imgReviewStoreVoList = (List<ImgReviewStoreVO>) request.getAttribute("imgReviewStoreVoList");
	
	int userLike = 0;
	if (request.getAttribute("userLike") != null) {
		userLike = Integer.parseInt(request.getAttribute("userLike").toString());
	}
	int userFav = 0;
	if (request.getAttribute("userFav") != null) {
		userFav = Integer.parseInt(request.getAttribute("userFav").toString());
	}
%>
<style>
	.boxImg {
		display:block;
		width:100%;
		height:auto;
	}
	.likeFavUl {
		list-style: none;
		padding-left : 0;
		width : 80%;
	}
	.likeFavUl li {
		font-size : 25px;
		text-align : center;
		color : white;
	}
</style>

<script>
	$(function(){
		
		// 좋아요 색상 변경 함수
		function changeLikeColor(){
			let l = $('#likeBtn');	// 좋아요 'a' 태그 요소 가져오기
			let flag = l.data('like');	// 가져온 'a' 태그의 data-like 속성값 확인
			if(flag){	// data-like 값으로 분개
				// 좋아요 눌려있을 때
				l.data('like', false);
				l.css('color', 'yellow');
			}else{
				// 좋아요를 안눌려있을 때
				l.data('like', true);
				l.css('color', 'white');
			};
			return flag;
		}
		
		changeLikeColor();
		
		$('#likeBtn').on('click', function(){
			if(<%=userVO == null%>){
				alert("로그인이 필요합니다.");
				return; // 로그인을 했을 때만 이벤트 로직 수행
			}	
				
			let flag = changeLikeColor();
			
			// 좋아요 상태 저장
			
			$.ajax({
				url : "<%=request.getContextPath()%>/store/like.do",
				dataType : "json",
				type : "post",
				data : {
					store_no : "<%=storeVo.getStore_no()%>",
					likeFlag : flag
				},
				success : function(res){
					console.log(res);
					$('#likeCnt').text(res.count);
				},
				error : function(err){
					alert(err.status);
				}
			});
		});
		
		// 즐겨찾기 색상 변경 함수
		function changeFavColor(){
			let l = $('#favBtn');	// 좋아요 'a' 태그 요소 가져오기
			let flag = l.data('like');	// 가져온 'a' 태그의 data-like 속성값 확인
			if(flag){	// data-like 값으로 분개
				// 좋아요 눌려있을 때
				l.data('like', false);
				l.css('color', 'yellow');
			}else{
				// 좋아요를 안눌려있을 때
				l.data('like', true);
				l.css('color', 'white');
			};
			return flag;
		}
		
		let flagf = changeFavColor();
		
		$('#favBtn').on('click', function(){
			if(<%=userVO == null%>)	{ 
				alert("로그인이 필요합니다.");
				return; // 로그인을 했을 때만 이벤트 로직 수행
			}	
			
			// 즐겨찾기 상태 저장
			
			$.ajax({
				url : "<%=request.getContextPath()%>/store/fav.do",
				dataType : "json",
				type : "post",
				data : {
					store_no : "<%=storeVo.getStore_no()%>",
					favFlag : flagf
				},
				success : function(res){
					console.log(res);
					$('#favCnt').text(res.count);
				},
				error : function(err){
					alert(err.status);
				}
			});
		});
		
		function rateAvgTemplate(rateAvg) {
			$("#rateAvg").text(rateAvg);
		}
		
		function reviewTemplate(review) {
			let reviewSrc = "/profilePath/default/defaultProfile.jpg"; 
			if (review.user_img != null || review.user_img != "") {
				reviewSrc = "/profilePath/" + review.user_img;
			}

			$("#re_container").prepend(
// 				 '	<div class="row">'
// 				+'		<div class="col-md-4">'
// 				+'			<div class="user-block">'
// 				+'				<img class="img-circle img-bordered-sm" src="' + reviewSrc + '" alt="user image" style="width:2rem;">'
// 				+'				<span class="username">'
// 				+'					<a href="#">' + review.user_nick + '</a>'
// 				+'					<a href="#" class="float-right btn-tool">'
// 				+'						<i class="fas fa-times"></i>'
// 				+'					</a>'
// 				+'				</span>'
// 				+'				<span class="description">' + review.re_wdt + '</span>'
// 				+'			</div>'
// 				+'		</div>'
// 				+'		<div class="col-md-8">'	+ review.re_content + '</div>'
// 				+'	</div><hr style="margin: 0">'	
				'<div class="row" style="padding:0.5rem;">'
				+'<div class="col-md-2 d-flex align-self-center">'
				+'<div class="user-block col-md-9">'
				+'<img class="img-circle img-bordered-sm" src="' + reviewSrc + '" alt="user image" style="width:2rem;">'
				+'<span class="username">' + review.user_nick + '</span>'
				+'</div>'
				+'<div class="icon-block col-md-3 align-self-center">'
				+'<a href="#" class="float-right btn-tool reply-delete-btn">'
				+'</a>'
				+'<a href="#" class="float-right btn-tool align-self-center reply-update-btn">'
				+'</a>'
				+'</div>'
				+'</div>'
				+'<div class="col-md-1 align-self-center">'
				+'<span class="text-warning" style="font-family: fantasy; font-style: normal;"><i class="bi bi-star-fill"></i>&nbsp;&nbsp;' + review.rate + '</span>'
				+'</div>'
				+'<div class="col-md-8 align-self-center">'
					+'<div class="reply-update col-md-10">' + review.re_content + '</div>'
				+'</div>'
				+'<div class="col-md-1">'
				+'</div>'
				+'</div><hr style="margin: 0;">'
				
				
				
			);
		}
		
		
		// 댓글 등록
		$("#re_form").on("submit", function(e){
			e.preventDefault();
			let rate = $("#re_form").find("input[type=range]").val();
			console.log("rate : " + rate);
			let re_content = $("#re_form").find("input[type=text]").val();
			console.log("re_content : " + rate);
			let store_no = <%=storeVo.getStore_no()%>;
			$.ajax({
				url : "<%=request.getContextPath()%>/store/insertReview.do",
				dataType : "json",
				method : "post",
				data : {
					cmd : "insert",
					rate : rate,
					store_no : store_no,
					re_content : re_content
				},
				success : function(res){
					console.log(res);
					console.log(res.rateAvg);
					rateAvgTemplate(res.rateAvg);
					reviewTemplate(res.review);
					$("#re_form").find("input[type=text]").val("");
				},
				error : function(err){
					console.log(err);
				}
			});
		});
		
		// 댓글 삭제
		$(document).on('click', '.reply-delete-btn', function(e){
			if(confirm("삭제하시겠습니까?")){
				let deleteReplyNo = $(this).parents('.icon-block').find('input[type=hidden]').val();
				let target = $(this).closest('div .row');
				$.ajax({
					url : "<%=request.getContextPath()%>/store/insertReview.do",
					type : "post",
					dataType : "json",
					data : {
						cmd : "delete",
						re_no : deleteReplyNo,
						store_no : "<%=storeVo.getStore_no()%>"
					},
					success : function(res){
						if(res.result == 1){
							$(target).remove();
							rateAvgTemplate(res.rateAvg);
						} else {
							console.log("fail!")
						}
					},
					error : function(err){
						console.log(err);
					}
				});
			}
		});
		
		$("#customRange2").on("change", function(){
			$("#rateSpan").text(this.value);
		});

	});
</script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35e6d1bccbd666fa1a2827012cbc4203"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=35e6d1bccbd666fa1a2827012cbc4203&libraries=services,clusterer,drawing"></script>
<div class="card card-primary mt-3 mb-3">
	<div class="p-4 p-md-5 mb-4 rounded text-bg-white card-header">
		<div class="row">
			<div class="col-md-6">
				<img src="/storePath/<%=storeVo.getThumb_url()%>" class="boxImg" style="width: 26rem; height:18rem; padding:0.3rem; border: 1px solid #6c757d;">
			</div>
			<div class="col-md-6 align-self-center">
				<h1 class="display-4 fst-italic"><%=store_name%> <span class="text-warning" style="float: right;font-family: fantasy; font-style: normal;" id="rateAvg"><%=store_rate%></span></h1>
				<hr>
				<div>
					<span class="mr-1" style="float: right; margin: 0 0.5rem;"><i class="bi bi-info-square-fill" style="color:#FF8C0A"></i>  <%=storeVo.getCat_name() %></span>
					<span class="mr-1" style="float: right; margin: 0 0.5rem;"><i class="bi bi-bookmark-plus-fill" style="color:#28288C"></i><span id="favCnt" style="margin-left:0.5rem;"><%=storeVo.getStore_fav() %></span></span> 
					<span class="mr-1" style="float: right; margin: 0 0.5rem;"><i class="bi bi-heart-fill" style="color:#FF32B1"></i>  <span id="likeCnt" style="margin-left:0.5rem;"><%=storeVo.getStore_like() %></span></span>
				</div>
				<p class="lead my-3"><%=store_des_s%></p>
			</div>
		</div>
	</div>

	<div class="card-body">
		<div class="row" style="flex-flow: wrap;">
			<%
				for (ImgStoreVO imgStoreVo : imgStoreVoList) {
			%>
			<div class="col-md-4 mb-3">

				<img src="/storePath/<%=imgStoreVo.getImg_url()%>" class="boxImg" style="width: 20rem; height: 15rem; padding:0.3rem; border: 1px solid #6c757d; margin:auto;">
			</div>
			<%
				}
			%>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-9" style="text-align: center;">

				<h5 class="fw-semibold mt-5">업종</h5>
				<h6 class="mb-3"><%=store_catName%></h6>

				<h5 class="fw-semibold">전화번호</h5>
				<h6 class="mb-3"><%=store_tel%></h6>

				<h5 class="fw-semibold">주소</h5>
				<h6 class="mb-3"><%=store_addr%></h6>

				<h5 class="fw-semibold">영업시간</h5>
				<h6 class="mb-3"><%=store_hour%></h6>
				<h5 class="fw-semibold">휴식시간</h5>
				<h6 class="mb-3"><%=store_break%></h6>
				<h5 class="fw-semibold">홈페이지</h5>
				<h6 class="mb-5"><%=store_url != null ? store_url : ""%></h6>
				<hr>
				<h5 class="fw-semibold mt-4">매장소개</h5>
				<h6 class="mb-5"><%=store_des_d%></h6>
				<hr>
				<div id="map" style="width:600px;height:500px; border:1px solid #6c757d; margin-inline: auto;" class="mb-5 mt-5"></div>	
			</div>
			
			<div class="col-md-3 bg-light">
				<div class="position-sticky" style="top: 2rem; align-self: center;">
					<div class="p-4 mb-3 bg-light rounded" style="text-align: center;">
						<button type="button" class="btn btn-danger mb-3" id="likeBtn" data-like=<%= userLike == 1 ? true:false %>><i class="bi bi-heart"></i>&nbsp;좋아요</button>
						<button type="button" class="btn btn-primary mb-3" id="favBtn" data-like=<%= userFav == 1 ? true:false %>><i class="bi bi-clipboard-plus"></i>&nbsp;즐겨찾기</button>
					</div>

					<div class="p-4 bg-light rounded" style="text-align: center;">
						<h4 class="fst-italic mb-3">#관련 태그</h4>
						<ol class="list-unstyled list-group-horizontal">
							<li class="list-group-item mb-1 "><a href="<%=request.getContextPath() %>/store/storeMain.do?page=1&tag=<%= store_tagNm_1 %>"><button type="button" class="btn btn-warning text-white"><%=store_tagNm_1 %></button></a></li>
							<li class="list-group-item mb-1 "><a href="<%=request.getContextPath() %>/store/storeMain.do?page=1&tag=<%= store_tagNm_2 %>"><button type="button" class="btn btn-warning text-white"><%=store_tagNm_2 %></button></a></li>
							<li class="list-group-item mb-1 "><a href="<%=request.getContextPath() %>/store/storeMain.do?page=1&tag=<%= store_tagNm_3 %>"><button type="button" class="btn btn-warning text-white"><%=store_tagNm_3 %></button></a></li>
						</ol>
					</div>
				</div>
			</div>
		</div>
</div>
		<%
			if (userVO != null) {
		%>
		<div class="card-footer">
			<form id="re_form">
			<label for="customRange2" class="form-label" style="font-family: fantasy; font-style: normal;">평점 ></label>
				<input type="range" class="form-range" name="rate" min="1" max="5" id="customRange2" style="width:10%; padding: 0.8rem 1rem 0 1rem;">
				<span id="rateSpan" class="text-warning" style="margin-left:1rem; font-family: fantasy; font-style: normal;">3</span>
				<input class="form-control form-control-sm" type="text"
					placeholder="Type a comment" name="re_content">
				<button type="submit" style="display: none;"></button>
			</form>
		</div>
		<%		
			}
		%>
</div>
<div class="card" id="re_container" style="margin-bottom: 50px;">
				
				<%
					SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
					SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");

					
					String hidden = "hidden"; 
					for (ReviewStoreVO reviewVo : reviewStoreVoList) {
					// String 타입을 Date 타입으로 변환
					Date formatDate = dtFormat.parse(reviewVo.getRe_wdt());
					// Date타입의 변수를 새롭게 지정한 포맷으로 변환
					String strNewDtFormat = newDtFormat.format(formatDate);
						if (userVO != null && userVO.getUser_no()==(reviewVo.getUser_no())) {
							hidden = "";
						}
				%>
					<div class="row" style="padding:0.5rem;">
						<div class="col-md-2 d-flex align-self-center">
							<div class="user-block col-md-9">
								<img class="img-circle img-bordered-sm" src="<%= reviewVo.getUser_img() != null ? "/profilePath/" + reviewVo.getUser_img() : "/profilePath/default/defaultProfile.jpg" %>" alt="user image" style="width:2rem;">
								<span class="username"><%= reviewVo.getUser_nick() %></span>
							</div>
							<div class="icon-block col-md-3 align-self-center">
								<input type="hidden" value="<%=reviewVo.getRe_no()%>">
								<a href="#" class="float-right btn-tool reply-delete-btn">
									<i class="fas fa-times" <%= hidden %>></i>
								</a>
<!-- 								<a href="#" class="float-right btn-tool align-self-center reply-update-btn"> -->
<%-- 									<i class="fas fa-pen" <%= hidden %>></i> --%>
<!-- 								</a> -->
							</div>
						</div>
						<div class="col-md-1 align-self-center">
							<span class="text-warning" style="font-family: fantasy; font-style: normal;"><i class="bi bi-star-fill"></i>&nbsp;&nbsp;<%=reviewVo.getRate() %></span>
						</div>
						<div class="col-md-8 align-self-center">
							<div class="reply-update col-md-10"><%=reviewVo.getRe_content() %></div>
						</div>
						<div class="col-md-1">
								<div class="description"><%=strNewDtFormat %></div>
						</div>
					</div><hr style="margin: 0;">
				<% } %>	
				</div>
<script>

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	//주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					'<%=store_addr%>',
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;"><%=store_name%></div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						} else {
							console.log("err");
						}
					});
</script>	
<%@ include file="../footer.jsp" %>