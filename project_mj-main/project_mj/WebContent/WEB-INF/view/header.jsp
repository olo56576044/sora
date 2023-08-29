<%@page import="kr.or.dw.user.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>은행 먹거리 | Home</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome Icons -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/plugins/fontawesome-free/css/all.min.css">


<!-- 	부트스트랩아이콘 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<!-- Theme style -->
<%-- 	<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/dist/css/adminlte.min.css"> --%>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/plugins/fontawesome-free/css/templatemo-style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/dist/css/templatemo-style.css">
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/dist/css/templatemo-style.css"> --%>
<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<%
		UserVO userVO = (UserVO)session.getAttribute("UserVO");
		if((UserVO)session.getAttribute("UserVO") != null){
			
	%>
<script>
	 
  	$(function(){
		$('#loginCheck').text('로그아웃');  				
		$('#loginCheck').attr('href', '<%= request.getContextPath()%>/user/userLogout.do');
		
		if (<%=userVO.getAuth_cd().equals("A101")%>) {
			$('#signUp').text('관리자페이지');
			$('#signUp').attr('href', '<%= request.getContextPath()%>/admin/adminMain.do');
		} else if (<%=userVO.getAuth_cd().equals("B101")%>) {
			$('#signUp').text('마이페이지');
			$('#signUp').attr('href', '<%= request.getContextPath()%>/user/userMyPage.do'); 
		}
  	});
  </script>
<%	}	%>
</head>
<body class="layout-top-nav" style="height: auto;">
	<%
	String gcp = request.getContextPath();
%>

	<div class="tm-bg-gray pt-2 pb-3 tm-text-gray tm-footer">
		<div class="container-fluid tm-container-small" style="height: auto;">
			<div class="row">
				<nav class="navbar navbar-expand-lg">
					<div class="container-fluid">
						<a class="navbar-brand" href="<%=gcp%>/cs/main.do"
							style="font-weight: bold;"> <img src="/logoPath/logo.jpg"
							alt="Logo" class="brand-image img-circle elevation-3"
							style="opacity: .8; float: left; width: 2rem; color: white; margin-right: 0.5rem; padding-bottom:0.5rem;">
							은행나무 Maple tree
						</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<i class="fas fa-bars"></i>
						</button>

						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav ml-auto mb-2 mb-lg-0">
								<li class="nav-item"><a href="<%=gcp%>/cs/main.do"
									class="nav-link nav-link-1 " aria-current="page"
									style="color: #555;">Home</a></li>
								<li class="nav-item"><a href="<%=gcp%>/store/storeMain.do"
									class="nav-link nav-link-2 " aria-current="page"
									style="color: #555;">맛집소개</a></li>
								<li class="nav-item"><a href="<%=gcp%>/comm/commMain.do"
									class="nav-link nav-link-3 " aria-current="page"
									style="color: #555;">커뮤니티</a></li>
								<li class="nav-item"><a href="<%=gcp%>/cs/announceForm.do"
									class="nav-link nav-link-4 " aria-current="page"
									style="color: #555;">공지사항</a></li>
								<li class="nav-item"><a
									href="<%= request.getContextPath() %>/user/userLoginForm.do"
									class="nav-link nav-link-4"
									style="color: #808080; font-size: 12px; margin: 5px 0px 0;"
									id="loginCheck">로그인</a></li>
								<li class="nav-item"><a
									href="<%= request.getContextPath() %>/user/userSignupForm.do"
									class="nav-link nav-link-4"
									style="color: #808080; font-size: 12px; margin: 5px 0px 0;"
									id="signUp">회원가입</a></li>

							</ul>
						</div>
					</div>
				</nav>


			</div>
		</div>
	</div>
	<div class="content-wrapper" style="min-height: 822px; background-color:white;">
		<div class="container">