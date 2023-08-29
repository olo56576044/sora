<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script>
$(function(){
		
		n_check = false;
		
		$("#joinForm").on("submit", function (e) {
			console.log($("#joinForm").find(".is-invalid").length)
			if (!n_check) {
				alert("닉네임 중복확인 체크를 해주세요.");
				$("input[name=user_nick]").focus();
				e.preventDefault();
				return;
			};
				
			if ($("#joinForm").find(".is-invalid").length > 0) {
				alert("형식에 맞게 입력해주세요.");
				$("#joinForm").find(".is-invalid").focus();
				e.preventDefault();
			};
			
		});
		
	// email 정규식 체크
	let email = $("input[name=user_email]");
	email.on("keyup", function() {
		let emailVal = email.val().trim();
		
		regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		
		console.log(regEmail.test(emailVal));
		
		if( !(regEmail.test(emailVal)) ) {
			email.attr("class", "form-control is-invalid");
		} else {
			email.attr("class", "form-control is-valid");
		}
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
		.container-fluid {
			display: flex;
			justify-content: center;
			align-items: center;
/* 			height: 100vh; */
		}

		.card {
			width: 400px;
		}

		.card-header {
			color: #fff;
			background-color: #6c757d;
		}

		.card-body {
			padding: 20px;
		}

		.input-group {
			margin-bottom: 20px;
		}

		.input-group-prepend .input-group-text {
			border: none;
			background-color: transparent;
		}

		.input-group input.form-control {
			border-top-left-radius: 0;
			border-bottom-left-radius: 0;
		}

		.input-group-append button.btn {
			border-top-right-radius: 0;
			border-bottom-right-radius: 0;
		}

		.error.invalid-feedback {
			color: red;
			font-size: 12px;
		}

		button.btn-secondary {
			width: 100%;
		}
	</style>



<div class="content">
	<div class="container-fluid">
		<div class="row" >
			<div class="col-md-3">
			<div class="col-md-6">
				<div class="card card-info" style="margin-top:10rem;">
					<div class="card-header" style="background-color: #6c757d">
						<h3 class="card-title">Sign Up</h3>
					</div>
					<form method="post"
						action="<%=request.getContextPath()%>/user/insertUser.do"
						id="joinForm">
						<div class="card-body">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="fas fa-envelope"></i>
									</span>
								</div>
								<input type="email" class="form-control" placeholder="email"
									name="user_email" required> <span
									class="error invalid-feedback"> 이메일 형식을 맞춰서 작성해주세요. </span>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="fas fa-solid fa-key"></i>
									</span>
								</div>
								<input type="password" class="form-control"
									placeholder="password" name="user_pass" required> <span class="error invalid-feedback"> 비밀번호는 영문 소문자, 대문자, 숫자, 특수문자가 최소 1개씩 입력되어야 합니다. </span>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="fas fa-solid fa-check"></i>
									</span>
								</div>
								<input type="password" class="form-control"
									placeholder="check password" name="passCheck" required>
								<span class="error invalid-feedback"> 입력하신 비밀번호와 일치하지 않습니다. </span>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="fab fa-brands fa-kickstarter-k"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="nickname"
									name="user_nick" required> <span
									class="input-group-append">
									<span class="error invalid-feedback"> 닉네임은 특수문자를 제외한 3-13 자리로 입력해주세요. </span>
									<button type="button" class="btn btn-block btn-secondary btn-sm" id="nickCheckBtn" style="height: 100%; border-radius: 3px;">중복확인</button>
								</span>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i
										class="fas fa-solid fa-user"></i></span>
								</div>
								<input type="text" class="form-control" placeholder="name"
									name="user_name" required>
							</div>
														<div class="input-group input-group-sm" >
								<span class="input-group-append">
								<button type="submit" class="btn btn-block btn-secondary btn-sm"  name="Sign in" style="border-radius: 3px;">Sign in</button>
								</span>
							</div>
						</div>
					</form>
				</div>
			</div>
			</div>
			<div class="col-md-3"></div>
		</div>
			</div>
			</div>
			

<%@ include file="../footer.jsp" %>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script>
$(function(){
	
	n_check = false;
	
	$("#joinForm").on("submit", function (e) {
		console.log($("#joinForm").find(".is-invalid").length)
		if (!n_check) {
			alert("닉네임 중복확인 체크를 해주세요.");
			$("input[name=user_nick]").focus();
			e.preventDefault();
			return;
		};
			
		if ($("#joinForm").find(".is-invalid").length > 0) {
			alert("형식에 맞게 입력해주세요.");
			$("#joinForm").find(".is-invalid").focus();
			e.preventDefault();
		};
		
	});
	
	// email 정규식 체크
	let email = $("input[name=user_email]");
	email.on("keyup", function() {
		let emailVal = email.val().trim();
		
		regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		
		console.log(regEmail.test(emailVal));
		
		if( !(regEmail.test(emailVal)) ) {
			email.attr("class", "form-control is-invalid");
		} else {
			email.attr("class", "form-control is-valid");
		}
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
				url : "<%=request.getContextPath() %>/user/nickCheck.do",
					method : "post",
					data : {
						"user_nick" : nickVal
					},
					dataType : "json",
					success : function(res) {
						if (res == "사용가능한 닉네임입니다.") {
							alert(res);
							n_check = true;
						} else {
							alert(res);
							n_check = false;
						}
					},
					error : function(req) {
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
		.container-fluid {
			display: flex;
			justify-content: center;
			align-items: center;

/* 			height: 100vh; */
		}

		.card {
 			width: 400px;
		}

		.card-header {
			color: #fff;
			background-color: #6c757d;
		}

		.card-body {
			padding: 20px;
		}

		.input-group {
			margin-bottom: 20px;
		}

		.input-group-prepend .input-group-text {
			border: none;
			background-color: transparent;
		}

		.input-group input.form-control {
			border-top-left-radius: 0;
			border-bottom-left-radius: 0;
		}

		.input-group-append button.btn {
			border-top-right-radius: 0;
			border-bottom-right-radius: 0;
		}

		.error.invalid-feedback {
			color: red;
			font-size: 12px;
		}

		button.btn-secondary {
			width: 100%;
		}
</style>



<div class="content">
	<div class="container-fluid">
		<div class="row" >
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="card card-info">
					<div class="card-header" style="background-color: #6c757d">
						<h3 class="card-title">Sign Up</h3>
					</div>
					<form method="post"
						action="<%=request.getContextPath()%>/user/insertUser.do"
						id="joinForm">
						<div class="card-body">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="fas fa-envelope"></i>
									</span>
								</div>
								<input type="email" class="form-control" placeholder="email"
									name="user_email" required> <span
									class="error invalid-feedback"> 이메일 형식을 맞춰서 작성해주세요. </span>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="fas fa-solid fa-key"></i>
									</span>
								</div>
								<input type="password" class="form-control"
									placeholder="password" name="user_pass" required> <span
									class="error invalid-feedback"> 비밀번호는 영문 소문자, 대문자, 숫자,
									특수문자가 최소 1개씩 입력되어야 합니다. </span>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="fas fa-solid fa-check"></i>
									</span>
								</div>
								<input type="password" class="form-control"
									placeholder="check password" name="passCheck" required>
								<span class="error invalid-feedback"> 입력하신 비밀번호와 일치하지
									않습니다. </span>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"> <i
										class="fab fa-brands fa-kickstarter-k"></i>
									</span>
								</div>
								<input type="text" class="form-control" placeholder="nickname"
									name="user_nick" required> <span
									class="input-group-append"><span
									class="error invalid-feedback"> 닉네임은 특수문자를 제외한 3-13 자리로
										입력해주세요. </span>
									<button type="button" class="btn btn-block btn-secondary btn-sm" id="nickCheckBtn" style="height: 100%;">중복확인</button>
								</span>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text"><i
										class="fas fa-solid fa-user"></i></span>
								</div>
								<input type="text" class="form-control" placeholder="name"
									name="user_name" required>
							</div>
														<div class="input-group input-group-sm" >
								<span class="input-group-append">
								<button type="submit" class="btn btn-block btn-secondary btn-sm">로그인</button>
								</span>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
			</div>
			</div>
			

<%@ include file="../footer.jsp" %> --%>