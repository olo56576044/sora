<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
    body {
        background-color: #f2f2f2;
    }
    .card {
        border: none;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .card-header {
        background-color: #6c757d;
        text-align: center;
        padding: 20px;
        border-bottom: 1px solid #ddd;
        color: #fff;
    }
    .card-title {
        margin: 0;
        font-size: 20px;
        text-align: left;
    }
    .card-body {
        padding: 20px;
    }
    .form-group {
        margin-bottom: 20px;
    }
    label {
        font-weight: bold;
        color: #333;
    }
    .form-control {
        border: 1px solid #ddd;
        border-radius: 4px;
        padding: 10px;
        width: 100%;
    }
    .btn {
        background-color: #6c757d;
        color: #fff;
        border-radius: 4px;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        font-weight: bold;
    }
    .btn:hover {
        background-color: #d4b24d;
    }
    .col-sm-8 {
        margin: 0 auto;
    }
</style>


<div class="content-header">
	<div class="container">
		<div class="row mb-2">
			<div class="col-sm-6"></div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
				
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="content">
	<div class="container">
		<div class="row" style="padding-top : 150px;">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card card-info">
									<div class="card-header" style ="background-color: #6c757d">
						<h3 class="card-title">Login</h3>
					</div>
					<form class="form-horizontal" action="<%=request.getContextPath()%>/user/userLogin.do" method="post">
						<div class="card-body">							<div class="form-group row" >
								<label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="inputEmail3"
										placeholder="Email" name="user_email" required>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputPassword3"
										placeholder="Password" name = "user_pass" required>
								</div>
							</div>
							<div class="form-group row">
								<div class="offset-sm-2 col-sm-10">
								
								</div>
							</div>
						</div>
												<div class="card-footer" >
							<button type="submit" class="btn btn-block btn-secondary btn-sm" name = "Sign in">Log In</button>

						</div>

					</form>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
</div>
<%@ include file="../footer.jsp" %>