<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

<script>

	function goPage(murl, mcode, micon){

		sessionStorage.setItem("mcode", mcode);
		sessionStorage.setItem("murl", murl);
		sessionStorage.setItem("micon", micon);
		
		let modMcode = mcode.substring(0,3) + "0000";


		location.href = murl + "?mcode=" + modMcode;
	};
	
</script>

