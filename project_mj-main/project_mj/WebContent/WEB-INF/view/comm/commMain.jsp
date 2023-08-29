<%@page import="java.util.Formatter"%>
<%@page import="kr.or.dw.comm.vo.LikeVO"%>
<%@page import="kr.or.dw.util.PaginationUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="kr.or.dw.comm.vo.CommVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%
	List<CommVO> commList = (List<CommVO>) request.getAttribute("commList");
%>
<style>

.wpahr1 {
	margin-bottom: 100px;
}

</style>




<!-- ------------------------------------------------------------------------------------------------------ -->
<!-- ------------------------------------------------------------------------------------------------------ -->
<!-- ------------------------------------------------------------------------------------------------------ -->

<div class=" bg-light">
	<div class="content" style="padding-top : 100px;">
		<div class="container ">
			<h2 class="mb-5 text-center wpahr">은행나무 커뮤니티 </h2>
			<div class="table-responsive custom-table-responsive wpahr1">
				<%
					if (userVO != null) {
				%>
				<a class="btn btn-primary btn-sm text-right"
					href="<%=request.getContextPath()%>/comm/commInsert.do">글작성</a>
				<%
					}
				%>
				<table class="table custom-table bg-light">
					<thead>
						<tr>
												
												<th class="sorting" tabindex="0" aria-controls="example1"
													rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending">순번  </th>
													
												<th class="sorting sorting_asc" tabindex="0"
													aria-controls="example1" rowspan="1" colspan="1"
													aria-sort="ascending"
													aria-label="Rendering engine: activate to sort column descending">
													제목  </th>	
													
													
												<th class="sorting" tabindex="0" aria-controls="example1"
													rowspan="1" colspan="1"
													aria-label="Platform(s): activate to sort column ascending">작성자  </th>
												<th class="sorting" tabindex="0" aria-controls="example1"
													rowspan="1" colspan="1"
													aria-label="Engine version: activate to sort column ascending">
													조회수 </th>
													
												<th class="sorting" tabindex="0" aria-controls="example1"
													rowspan="1" colspan="1"
													aria-label="Engine version: activate to sort column ascending">
													좋아요 </th>
												
											</tr>
					</thead>

					<tbody>
						<%
												for (CommVO comm : commList) {
													int bd_no = comm.getBd_no();
													String bd_title = comm.getBd_title();
													String bd_nick = comm.getUser_nick();
													String bd_picPath = "/profilePath/default/defaultProfile.jpg"; 
													if (comm.getUser_img() != null) {
														bd_picPath = "/profilePath/" + comm.getUser_img();
													}
													int bd_hit = comm.getBd_hit();
													int bd_like = comm.getBd_like();
											%>
											<tr>
												<td><%=bd_no%></td>
												<td><a
													href="<%=request.getContextPath()%>/comm/commView.do?bd_no=<%=bd_no%>"><%=bd_title%></a>
												</td>
												<td><img style="width: 2rem;"  alt="작성자 프로필사진" class="table-avatar"  src="<%= bd_picPath %>">
													<%=bd_nick%></td>
												<td><%=bd_hit%></td>
												<td><%=bd_like%></td>
											</tr>
											<% } %>
					</tbody>
				</table>
				<div class="row">
					<div class="container" style="margin-top: 20px;">
						<%
							PaginationUtil pagination = (PaginationUtil) request.getAttribute("pagingConfigMap");
						%>
						<%=pagination.getPaginationHtml(request, new String[] { "search" })%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




<%@ include file="../footer.jsp"%>