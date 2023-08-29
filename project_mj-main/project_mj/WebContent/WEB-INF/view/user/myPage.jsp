<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<%
/* 		userVO = (UserVO) request.getAttribute("userVO"); */
		String src = "";		

		if (userVO.getUser_img() != null) {
			src = " /profilePath/" + userVO.getUser_img();
		}else{
			src = "/profilePath/default/defaultProfile.jpg";
			
		}
%>


<div class="content">
		<div class="container-fluid">
			<div class="row" style="padding-top:150px">
				<div class="col-md-4"></div>
				<div class="col-md-4 mb-5">
					<div class="card card-primary card-outline">
						<div class="card-body box-profile">
							<form id="upload_form" method="post" enctype="multipart/form-data">
								<div class="text-center">
								<a  id="changeSelfie">
										<img class="profile-user-img img-fluid img-circle" id="profile_picture" src="<%= src %>" alt="User profile picture" style="width:10rem;">
									</a>
								</div>
							</form> 
							<p class="text-muted text-center"><br></p>
							<h3 class="profile-username text-center"><%=userVO.getUser_nick()%></h3>
							<ul class="list-group list-group-unbordered mb-3">
								<li class="list-group-item">
									<b>Email</b>
									<a class="float-right"><%=userVO.getUser_email() %></a>
								</li>
								<li class="list-group-item">
									<b>이름</b>
									<a class="float-right"><%=userVO.getUser_name() %></a>
								</li>
							</ul>
							<form action ="<%=request.getContextPath()%>/user/userChange.do" id ="change" method="post" style="text-align: center; margin-bottom:0.5rem;">
							<button type= "submit"
						class="btn btn-block btn-outline-secondary btn-xs"  >
							개인정보수정 </button></form>
						</div>
						<div class="card-footer" style="text-align:center;">
							<div class="btn-group btn-group-toggle" role="group" aria-label="Basic mixed styles example">
								<a href="<%=request.getContextPath() %>/store/storeMain.do?like=on" class="btn btn-secondary " role="button">&nbsp;좋아요&nbsp;</a>
								<a href="<%=request.getContextPath() %>/store/storeMain.do?fav=on" class="btn btn-secondary" role="button">즐겨찾기</a>
							</div>
						</div>	
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
		</div>
	</div>

<%@ include file="../footer.jsp" %>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<%
/* 		userVO = (UserVO) request.getAttribute("userVO"); */
		String src = "";		

		if (userVO.getUser_img() != null) {
			src = " /profilePath/" + userVO.getUser_img();
		}else{
			src = "/profilePath/default/defaultProfile.jpg";
			
		}
%>


<div class="content">
		<div class="container-fluid">
			<div class="row" style="padding-top:150px">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<div class="card card-primary card-outline">
						<div class="card-body box-profile">
							<form id="upload_form" method="post" enctype="multipart/form-data">
								<div class="text-center">
								<a  id="changeSelfie">
										<img class="profile-user-img img-fluid img-circle" id="profile_picture" src="<%= src %>" alt="User profile picture" style="width:10rem;">
									</a>
								</div>
							</form> 
							<p class="text-muted text-center"><br></p>
							<h3 class="profile-username text-center"><%=userVO.getUser_nick()%></h3>
							<ul class="list-group list-group-unbordered mb-3">
								<li class="list-group-item">
									<b>Email</b>
									<a class="float-right"><%=userVO.getUser_email() %></a>
								</li>
								<li class="list-group-item">
									<b>이름</b>
									<a class="float-right"><%=userVO.getUser_name() %></a>
								</li>
							</ul>
							<form action ="<%=request.getContextPath()%>/user/userChange.do" id ="change" method="post" style="text-align: center; margin-bottom:0.5rem;">
							<button type= "submit"
						class="btn btn-block btn-outline-primary btn-sm"  >
							개인정보수정 </button></form>
							<form style="text-align: center;"><button type="button" class="btn btn-block btn-primary btn-xs" id="sudmit">저장</button></form>
							
						</div>
						<div class="card-footer" style="text-align:center;">
							<div class="btn-group" role="group" aria-label="Basic mixed styles example">
								<a href="<%=request.getContextPath() %>/store/storeMain.do?like=on" class="btn btn-danger" role="button">&nbsp;좋아요&nbsp;</a>
								<a href="<%=request.getContextPath() %>/store/storeMain.do?fav=on" class="btn btn-primary" role="button">즐겨찾기</a>
							</div>
						</div>	
					</div>
				</div>
				<div class="col-md-4"></div>
			</div>
		</div>
	</div>

<%@ include file="../footer.jsp" %> --%>