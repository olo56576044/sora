<%@page import="kr.or.dw.util.PaginationUtil"%>
<%@page import="kr.or.dw.store.vo.StoreVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%
	List<StoreVO> mainStoreVoList = (List<StoreVO>) request.getAttribute("mainStoreVoList");

	List<StoreVO> storeVoList = (List<StoreVO>) request.getAttribute("storeVoList");
	
// 	String mainStoreUrl_1 = mainStoreVoList.get(0).get();
// 	String mainStoreUrl_2 = mainStoreVoList.get(1).getStore_url();
// 	String mainStoreUrl_3 = mainStoreVoList.get(2).getStore_url();
%>
<style>
	.boxImg {
		display:block;
		margin-left : auto;
		margin-right : auto;
	}
</style>


<section class="content">
	<div class="container-fluid mt-3">
<div class=" mb-3 mt-3">
	<div class="card-body">

		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="true">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			
			<div class="carousel-inner">
					<%	
						String active = "active";
						for (StoreVO store : storeVoList) {
							
							String thumb_url = store.getThumb_url();
							String store_picPath = "/storePath/default/noImg.jpg";
							
							if (store.getThumb_url() != null ) {
								store_picPath = "/storePath/" + store.getThumb_url();
							}
					%>
			
				<div class="carousel-item <%=active%>">
				<a href="<%=request.getContextPath()%>/store/storeView.do?store_no=<%=store.getStore_no()%>">
					<img src="<%= store_picPath %>" class="d-block boxImg" style="width: 30rem; height: 30rem;"
						alt="..."></a>
				</div>
			<% active = "";} %>
			</div>
			
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" style="background-color: darkblue;"></span>
<!-- 				<span  style="color: black;">Previous</span> -->
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" style="background-color: darkblue;"></span>
<!-- 				<span style="color: black;">Next</span> -->
			</button>
		</div>
	</div>
</div>
	</div>
</section>



 <%
	PaginationUtil pagination = (PaginationUtil) request.getAttribute("pagingConfigMap");
	List<String> tagList = (List<String>)request.getAttribute("tagList");
	List<String> catList = (List<String>)request.getAttribute("catList");
	String catStore = (String) request.getAttribute("cat");
	String tagStore = (String) request.getAttribute("tag");
%>

<script>

</script>

<br><br>



<div class="container-fluid tm-container-content tm-mt-60">
	<div class="row mb-4 mx-3">
		<h5 class=" tm-text-primary mb-4" style="text-align: center;"></h5>
	</div>
	<div class="row tm-mb-90 tm-gallery">

			<% 
				for (StoreVO storeVo : mainStoreVoList ) {
			%>
		<div class="col-xl-3 col-lg-3 col-md-4 col-sm-4 col-12 mb-5" >
			<figure class="effect-ming tm-video-item">
				<img src="/storePath/<%=storeVo.getThumb_url() != null ? storeVo.getThumb_url() : "default/noImg.jpg" %>"
					alt="Image" class="img-fluid" style="width: 20rem; height: 15rem;">
				<figcaption class="d-flex align-items-center justify-content-center">
					<h2><a style="font-weight: bold; color: white;" href="<%=gcp%>/user/userLoginForm.do"><%=storeVo.getStore_name() %></a></h2>
					<a href="<%=request.getContextPath()%>/store/storeView.do?store_no=<%=storeVo.getStore_no()%>"></a>
				</figcaption>
			</figure>
			<div class="d-flex justify-content-between tm-text-gray">
				<span class="tm-text-gray-light">좋아요 <%=storeVo.getStore_like() %> </span> <span><%=storeVo.getStore_views() %>
					views</span>
					
			</div>
					 <div class="buttons">
						<span class="btn-hover color-1">#<%=storeVo.getStore_tagNm_1() %></span>
						<span class="btn-hover color-2">#<%=storeVo.getStore_tagNm_2() %></span>
						<span class="btn-hover color-3">#<%=storeVo.getStore_tagNm_3() %></span>
					</div> 
				    <p class="card-text"><%=storeVo.getStore_des_s() %> </p>
		</div>
			<%
				}
			%>	
	</div>
</div>
           
            
            
            
        </div> 
    </div> 

    









<%@ include file="footer.jsp"%>