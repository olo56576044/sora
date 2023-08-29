<%@page import="kr.or.dw.util.PaginationUtil"%>
<%@page import="kr.or.dw.store.vo.StoreVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- content -->
<style>
	.boxImg {
		display:block;
		width:100%;
		height:auto;
	}
	.tag-cloud a:hover {
		color: #ffc107;
	}
</style>
<%

	PaginationUtil pagination = (PaginationUtil) request.getAttribute("pagingConfigMap");

	List<StoreVO> storeVoList = (List<StoreVO>) request.getAttribute("storeVoList");
	List<String> tagList = (List<String>)request.getAttribute("tagList");
	List<String> catList = (List<String>)request.getAttribute("catList");
	String catStore = (String) request.getAttribute("cat");
	String tagStore = (String) request.getAttribute("tag");

%>

<script>

</script>

<br><br>

<section id="aa-blog-archive">
	<div class="container">
		<div class="row" style="margin:0;">
			<div class="col-md-12">
				<div class="aa-blog-archive-area aa-blog-archive-2">
					<div class="row" style="margin:0;">
						<div class="col-md-9 border rounded-3 pt-3 mb-5">
							<div class="aa-blog-content">
								<div class="row" style="margin:0;">
								<% 
									for (StoreVO storeVo : storeVoList ) {
								%>

									<div class="col-md-4 col-sm-4 mb-3">
									<a href="<%=request.getContextPath()%>/store/storeView.do?store_no=<%=storeVo.getStore_no()%>" style="text-decoration:none; color:black;">
										<div class="card h-100">
											<img alt="img" src="/storePath/<%=storeVo.getThumb_url() != null ? storeVo.getThumb_url() : "default/noImg.jpg" %>" class="card-img-top" style="height: 200px; padding:0.5rem;">
										  <div class="card-body" style="text-align: center;">
										 	 <h4 class="card-title"><%=storeVo.getStore_name() %></h4>
										  		<span><i class="fa fa-eye"></i>  <%=storeVo.getStore_views() %></span> 
												<span><i class="bi bi-heart-fill" style="color:#FF32B1"></i>  <%=storeVo.getStore_like() %></span>
												<span><i class="bi bi-bookmark-plus-fill" style="color:#28288C"></i>  <%=storeVo.getStore_fav() %></span> 
												<span class=""><i class="bi bi-info-square-fill" style="color:#FF8C0A"></i>  <%=storeVo.getCat_name() %></span>
												<div style="color:#0d6efd">
													<span>#<%=storeVo.getStore_tagNm_1() %></span>
													<span>#<%=storeVo.getStore_tagNm_2() %></span>
													<span>#<%=storeVo.getStore_tagNm_3() %></span>
												</div>
											<hr>	
										    <h6 class="card-text"><%=storeVo.getStore_des_s() %> </h6>
										  </div>
										</div>
										</a>
									</div>
								<%
									}
								%>	
							</div>
							</div>
							<!-- Blog Pagination -->
							<div class="aa-blog-archive-pagination" id="pagingDiv">
							<%= pagination.getPaginationHtml(request, new String[] {"cat"}) %>
<!-- 								<nav> -->
<!-- 									<ul class="pagination"> -->
<!-- 										<li><a aria-label="Previous" href="#"> <span -->
<!-- 												aria-hidden="true">«</span> -->
<!-- 										</a></li> -->
<!-- 										<li class="active"><a href="#">1</a></li> -->
<!-- 										<li><a href="#">2</a></li> -->
<!-- 										<li><a href="#">3</a></li> -->
<!-- 										<li><a href="#">4</a></li> -->
<!-- 										<li><a href="#">5</a></li> -->
<!-- 										<li><a aria-label="Next" href="#"> <span -->
<!-- 												aria-hidden="true">»</span> -->
<!-- 										</a></li> -->
<!-- 									</ul> -->
<!-- 								</nav> -->
							</div>
						</div>
						<div class="col-md-3">
							<aside class="aa-blog-sidebar border rounded-3 p-3">
								<div class="aa-sidebar-widget">
									<h4>카테고리 </h4>
									<hr>
									<ul class="aa-catg-nav" style="list-style: none; padding-left:0;">
									<%
									for (String cat : catList) {
									%>
										<li class="mb-2"><a href="<%=request.getContextPath() %>/store/storeMain.do?page=1&cat=<%= cat %>" class="btn btn-warning bg-warning text-white rounded-3 p-1" style="text-decoration:none;"><%= cat %> </a></li>
									<%	
									}
									%>
									</ul>
								</div>
								<div class="aa-sidebar-widget">
									<h4>태그 </h4>
									<hr>
									<div class="tag-cloud">
									<%
									for (String tag : tagList) {
									%>
										<a href="<%=request.getContextPath() %>/store/storeMain.do?page=1&tag=<%= tag %>" style="text-decoration:none;">#<%=tag %></a> 
									<%
									}
									%>
									</div>
								</div><br>
								<div class="aa-sidebar-widget">
<!-- 									<h3>정렬 </h3> -->
<!-- 									<div class="aa-recently-views"> -->
<!-- 										<ul> -->
<!-- 											<li> -->
<!-- 												<div class="aa-cartbox-info"> -->
<!-- 													<h6> -->
<!-- 														<a href="#">이름순 </a> -->
<!-- 													</h6> -->
<!-- 												</div></li> -->
<!-- 											<li> -->
<!-- 												<div class="aa-cartbox-info"> -->
<!-- 													<h6> -->
<!-- 														<a href="#">좋아요순 </a> -->
<!-- 													</h6> -->
<!-- 												</div></li> -->
												
<!-- 												<li> -->
<!-- 												<div class="aa-cartbox-info"> -->
<!-- 													<h6> -->
<!-- 														<a href="#">조회수순  </a> -->
<!-- 													</h6> -->
<!-- 												</div></li> -->
												
<!-- 												<li> -->
<!-- 												<div class="aa-cartbox-info"> -->
<!-- 													<h6> -->
<!-- 														<a href="#">좋아요순 </a> -->
<!-- 													</h6> -->
<!-- 												</div></li> -->
											
<!-- 										</ul> -->
<!-- 									</div> -->
								</div>
							</aside>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- /content -->

<%@ include file="../footer.jsp" %>