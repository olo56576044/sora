<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script>
<%
/* 		userVO = (UserVO) request.getAttribute("userVO"); */
		String src = "";		
		if (userVO.getUser_img() != null) {
			src = " /profilePath/" + userVO.getUser_img();
		}else{
			src = "/profilePath/default/defaultProfile.jpg";
			
		}
%>
$(function(){
			
		$('#changeSelfie').on('click', function(){
			$('input[name=selfie]').click();
		
		function imgFilePreview(e){
			let reader = new FileReader();
			
			reader.onload = function(e){
				$('#profile_picture').attr('src', e.target.result);
			};
			
			reader.readAsDataURL(e.target.files[0]);
			
			$('#saveProfileBtn').toggle();
		};
		
		$('#selfie').on('change', imgFilePreview);
		
		$('#saveProfileBtn').on('click', function(){
			let formData = new FormData($('#upload_form')[0]);
			$.ajax({
				url : "<%=request.getContextPath()%>/file/profilePicture.do?user_no=<%=userVO.getUser_no()%>",
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
			
		});
		});
	
	n_check = false;
	$("#userChange").on("submit", function (e) {
		console.log($("#joinForm").find(".is-invalid").length)
		if (!n_check) {
			alert("닉네임 중복확인 체크를 해주세요."); 
			$("input[name=user_nick]").focus();
			e.preventDefault();
			return;
		};
			
		if ($("#userChange").find(".is-invalid").length > 0) {
			alert("형식에 맞게 입력해주세요.");
			$("#userChange").find(".is-invalid").focus();
			e.preventDefault();
		};
	
	});
	
	// password 정규식 체크 - 영문 소문자, 대문자, 특수문자, 숫자가 반드시 하나 이상씩 입력
	let pass = $("input[name=user_pass]");
	pass.on("keyup",  function () {
		passVal = pass.val().trim();
		
		regPass =  /^(?=.*[a-z])(?=.*[A-Z])(?=.*[`~!@$%&?*])[A-Za-z\d`~!@$%&?*]{8,15}/;
		
		if ( !(regPass.test(passVal)) ) {
			pass.attr("class", "form-control is-invalid");
		} else {
			pass.attr("class", "form-control is-valid");
		}
	});
	
	// pass2 pass일치 비교
	let passCheck = $("input[name=passCheck]");
	passCheck.on("keyup", function () {
		let passCheckVal = passCheck.val().trim();
		
		if (passVal != passCheckVal) {
			passCheck.attr("class", "form-control is-invalid");
		} else {
			passCheck.attr("class", "form-control is-valid");
		}
	});
	
	let nickCheck = false;
	
	// 닉네임 정규식 체크
	let nick = $("input[name=user_nick]");
	nick.on("keyup", function () {
		nickVal = nick.val().trim();
		
		regNick = /^[가-힣a-zA-Z0-9]{3,13}$/;
		
		if ( !(regNick.test(nickVal)) ) {
			nick.attr("class", "form-control is-invalid");
			nickCheck = false;
		} else {
			nick.attr("class", "form-control is-valid");
			nickCheck = true;
		}
	});
	
	// 닉네임 중복체크
	$("#nickCheckBtn").on("click", function () {
		if (nickCheck) {
			$.ajax({
				url : "<%=request.getContextPath()%>/user/nickCheck.do",
				method : "post",
				data : {"user_nick" : nickVal},
				dataType : "json",
				success : function (res) {
					if(res == "사용가능한 닉네임입니다.") {
						alert(res);
						n_check = true;
					} else {
						alert(res);
						n_check = false;
					}
				},
				error : function (req) {
					alert("상태 : " + req.status);
				}
			});
		} else {
			alert("닉네임을 확인해주세요.");
		}
	});
	
	
});


</script>

<style>
	.content-header {
		background-color: #f8f9fa;
		padding: 20px 0;
	}

	.card-info {
		border: 1px solid #6c757d;
		border-radius: 5px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}

	.card-header {
		background-color: #6c757d;
		color: #fff;
		padding: 10px;
	}

	.card-title {
		margin-bottom: 0;
	}

	.card-footer {
		background-color: #f8f9fa;
		border-top: 1px solid #dee2e6;
		padding: 10px;
		text-align: right;
	}

	.form-group {
		margin-bottom: 15px;
	}

	.offset-sm-2 {
		margin-left: 16.666667%;
	}

	.btn-secondary {
		background-color: #c1c4c7;
		border-color: #c1c4c7;
		color: #fff;
		font-weight: bold;
	}

	.btn-secondary:hover {
		background-color: #c1c4c7;
		border-color: #c1c4c7;
	}
	


</style>

<div class="content">
	<div class="container-fluid">
		<div class="row" style="padding-top: 150px">
			<div class="col-md-2"></div>
			<div class="col-md-8 mb-5">
				<div class="card card-info">
					<div class="card-header">
						<h3 class="card-title">회원정보수정</h3>
					</div>
					<!-- 사진변경 -->
					<form id="upload_form" method="post" enctype="multipart/form-data">
						<div class="text-center mt-3">
							<a href="#" id="changeSelfie">
								<img class="profile-user-img img-fluid img-circle" id="profile_picture" src="<%=src%>" alt="User profile picture" style="width:10rem;">
							</a>
							<input type="file" style="display: none;" name="selfie" id="selfie" accept=".jpg, .jpeg, .png">
							<a href="#" class="btn btn-primary btn-block" id="saveProfileBtn" style="display: none;"><b>프로필 사진 저장</b></a>
						</div>
					</form>
					<!-- 이메일 -->
					<form method="post" id="userChange" action="<%=request.getContextPath() %>/user/userUpdate.do">
						<div class="input-group mb-3" style="display: block;">
							<p class="text-muted text-center"><%=userVO.getUser_name() %></p>
								<p class="text-center"><%=userVO.getUser_email() %></p>
								<input type="hidden" name="user_no" value="<%=userVO.getUser_no()%>">
						</div>
						<!-- 비밀번호 -->
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" style="height: 3rem;"><i class="fas fa-solid fa-key"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="비밀번호" name="user_pass" required>
							<span class="error invalid-feedback">비밀번호는 영문 소문자, 대문자, 숫자, 특수문자가 최소 1개씩 입력되어야 합니다.</span>
						</div>
						<!-- 비밀번호 확인 -->
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" style="height: 3rem;"><i class="fas fa-solid fa-check"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="비밀번호 확인" name="passCheck" required>
							<span class="error invalid-feedback">입력하신 비밀번호와 일치하지 않습니다.</span>
						</div>
						<!-- 닉네임 -->
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" style="height: 3rem; width:42px;"><i class="fab fa-brands fa-kickstarter-k"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="닉네임" name="user_nick" required>
							<span class="error invalid-feedback">닉네임은 특수문자를 제외한 3-13자리로 입력해주세요.</span>
							<span class="input-group-append" >
							<span class="input-group-append" style="background-color: ##c1c4c7">
							<button type="button" class="btn btn-block btn-outline-dark btn-flat"
								id="nickCheckBtn" >중복확인</button>
							</span>
						</div>
						<div class="input-group input-group-sm">
							<span class="btn-group">
								<button type="submit" class="btn btn-default">수정완료</button>
					<form method="post" id="userDelete" action="<%=request.getContextPath() %>/user/userDelete.do">
						<input type="hidden" name="user_no" value="<%=userVO.getUser_no()%>">
						<button type="submit" class="btn btn-default">회원탈퇴</button>
					</form>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="col-md-4"></div>
	</div>
</div>





<%@ include file="../footer.jsp"%>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script>

<%
/* 		userVO = (UserVO) request.getAttribute("userVO"); */
		String src = "";		

		if (userVO.getUser_img() != null) {
			src = " /profilePath/" + userVO.getUser_img();
		}else{
			src = "/profilePath/default/defaultProfile.jpg";
			
		}
%>

$(function(){
			
		$('#changeSelfie').on('click', function(){
			$('input[name=selfie]').click();
		

		function imgFilePreview(e){
			let reader = new FileReader();
			
			reader.onload = function(e){
				$('#profile_picture').attr('src', e.target.result);
			};
			
			reader.readAsDataURL(e.target.files[0]);
			
// 			$('#saveProfileBtn').css("display", "block");
			$('#saveProfileBtn').toggle();
		};
		
		$('#selfie').on('change', imgFilePreview);
		
		$('#saveProfileBtn').on('click', function(){
			let formData = new FormData($('#upload_form')[0]);
			$.ajax({
				url : "<%=request.getContextPath()%>/file/profilePicture.do?user_no=<%=userVO.getUser_no()%>",
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
			
		});
		});
	
	n_check = false;
	$("#userChange").on("submit", function (e) {
		console.log($("#joinForm").find(".is-invalid").length)
		if (!n_check) {
			alert("닉네임 중복확인 체크를 해주세요."); 
			$("input[name=user_nick]").focus();
			e.preventDefault();
			return;
		};
			
		if ($("#userChange").find(".is-invalid").length > 0) {
			alert("형식에 맞게 입력해주세요.");
			$("#userChange").find(".is-invalid").focus();
			e.preventDefault();
		};
		
	});
	
	// password 정규식 체크 - 영문 소문자, 대문자, 특수문자, 숫자가 반드시 하나 이상씩 입력
	let pass = $("input[name=user_pass]");
	pass.on("keyup",  function () {
		passVal = pass.val().trim();
		
		regPass =  /^(?=.*[a-z])(?=.*[A-Z])(?=.*[`~!@$%&?*])[A-Za-z\d`~!@$%&?*]{8,15}/;
		
		if ( !(regPass.test(passVal)) ) {
			pass.attr("class", "form-control is-invalid");
		} else {
			pass.attr("class", "form-control is-valid");
		}
	});
	
	// pass2 pass일치 비교
	let passCheck = $("input[name=passCheck]");
	passCheck.on("keyup", function () {
		let passCheckVal = passCheck.val().trim();
		
		if (passVal != passCheckVal) {
			passCheck.attr("class", "form-control is-invalid");
		} else {
			passCheck.attr("class", "form-control is-valid");
		}
	});
	
	let nickCheck = false;
	
	// 닉네임 정규식 체크
	let nick = $("input[name=user_nick]");
	nick.on("keyup", function () {
		nickVal = nick.val().trim();
		
		regNick = /^[가-힣a-zA-Z0-9]{3,13}$/;
		
		if ( !(regNick.test(nickVal)) ) {
			nick.attr("class", "form-control is-invalid");
			nickCheck = false;
		} else {
			nick.attr("class", "form-control is-valid");
			nickCheck = true;
		}
	});
	
	// 닉네임 중복체크
	$("#nickCheckBtn").on("click", function () {
		if (nickCheck) {
			$.ajax({
				url : "<%=request.getContextPath()%>/user/nickCheck.do",
				method : "post",
				data : {"user_nick" : nickVal},
				dataType : "json",
				success : function (res) {
					if(res == "사용가능한 닉네임입니다.") {
						alert(res);
						n_check = true;
					} else {
						alert(res);
						n_check = false;
					}
				},
				error : function (req) {
					alert("상태 : " + req.status);
				}
			});
		} else {
			alert("닉네임을 확인해주세요.");
		}
	});
	
	
});


</script>

<div class="content">
	<div class="container-fluid">
		<div class="row" style="padding-top: 150px">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="card card-info">
					<div class="card-header">
						<h3 class="card-title">회원정보수정</h3>
					</div>
					<!-- 사진변경 -->
						<form id="upload_form" method="post" enctype="multipart/form-data">
								<div class="text-center">
									<a href="#" id="changeSelfie">
								
										<img class="profile-user-img img-fluid img-circle" id="profile_picture" src=<%=src%> alt="User profile picture">
									</a>
									<input type="file" style="display: none;" name="selfie"
									id="selfie" accept=".jpg, .jpeg, .png"> <a href="#"
									class="btn btn-primary btn-block" id="saveProfileBtn"
									style="display: none;"><b>프로필 사진 저장</b></a>
								</div>
							</form>
					<!-- 이메일 -->
					<br>
					<form method= "post"  id = "userChange"action = "<%=request.getContextPath() %>/user/userUpdate.do">					
					<p class="text-muted text-center"><%=userVO.getUser_name() %></p>
					<P class="text-center"  ><%=userVO.getUser_email() %></P>
					<div class="input-group mb-3">
					</div>
					<input type = "hidden" name = "user_no" value="<%=userVO.getUser_no()%>">
					<!-- 비밀번호  -->
					<div class="tinput-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-solid fa-key"></i> </span>
						</div>
						<input type="password" class="form-control" placeholder="password"
							name="user_pass" required> <span
							class="error invalid-feedback"> 비밀번호는 영문 소문자, 대문자, 숫자,
							특수문자가 최소 1개씩 입력되어야 합니다. </span>
					</div>
					<!-- 비밀번호  확인-->
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i
								class="fas fa-solid fa-check"></i>
							</span>
						</div>
						<input type="password" class="form-control"
							placeholder="check password" name="passCheck" required> <span
							class="error invalid-feedback"> 입력하신 비밀번호와 일치하지 않습니다. </span>
					</div>
					<!--  닉네임 -->
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i
								class="fab fa-brands fa-kickstarter-k"></i>
							</span>
						</div>
						<input type="text" class="form-control" placeholder="nickname"
							name="user_nick" required> <span
							class="error invalid-feedback"> 닉네임은 특수문자를 제외한 3-13 자리로
							입력해주세요. </span> <span class="input-group-append">
							<button type="button" class="btn btn-info btn-flat"
								id="nickCheckBtn">중복확인</button>
						</span>
					</div>
					<div class="input-group input-group-sm">
						<span class="input-group-append">
							<button type="submit" class="btn btn-info btn-flat text-right"  >수정완료</button>
						
						</form>
						<form method= "post"  id = "userDelete"action = "<%=request.getContextPath() %>/user/userDelete.do">
							<input type = "hidden" name = "user_no" value="<%=userVO.getUser_no()%>">
							<button type="submit" class="btn btn-info btn-flat text-left"  >회원탈퇴</button>
						</form></span>
					</div>
				</div>
<%=request.getContextPath()%>/cs/main.do"
"<%=request.getContextPath()%>/user/userMyPage.do"
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
	<!-- /.row -->
</div>
<!-- /.container-fluid -->
</div>
<!-- /.content -->

<%@ include file="../footer.jsp"%> --%>