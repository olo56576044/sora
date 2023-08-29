<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.sideMenuList{
		box-shadow: 0px 15px 10px gray;
	}
</style>
<c:set var="mcode">${mcode }</c:set>
<c:set var="subMenuList2">${subMenuList[mcode] }</c:set>
<nav id="navSideBar"class="d-flex flex-column p-3 sideMenuList" style=" float:left ; width: 15%; height: 100%; display: inline; background: linear-gradient(to bottom, #7bc4b2, #00ff72);">
	<c:forEach items="${subMenuList[mcode]}" var="subMenu">
		<div class="mousePoint">
		<a class="p-2 a nav-link bold fw-bold " href="javascript:goPage('${subMenu.murl }', '${subMenu.mcode }', '${subMenu.micon }');" data-url="${subMenu.mcode }" aria-expanded="true" style="color: white; text-decoration-line: none;">${subMenu.mname }</a>
		<c:set var="mcode">${subMenu.mcode }</c:set>
			<ul style="list-style-type: none;">
			<c:forEach items="${smallMenuList[mcode] }" var="smallMenu">
				<li>	
					<a class="p-2 a nav-link " href="javascript:goPage('${smallMenu.murl }', '${smallMenu.mcode }', '${smallMenu.micon }');" data-url="${smallMenu.mcode }" aria-expanded="true" style="color: white; text-decoration-line: none;">&nbsp;&nbsp;&nbsp;&nbsp;${smallMenu.mname }</a>
				</li>
			</c:forEach>
			</ul>
		</div>
	</c:forEach>
</nav>


<div id="menutitle"></div><button>즐겨찾기 임시 버튼</button>

<script>
	$(function () {
		let micon = sessionStorage.getItem("micon")
		
		$('#menutitle').html(micon);
		
	})
	
	
	$('.mousePoint ul').hide();

	$('.mousePoint').on('mouseenter', function() {
		  $(this).find('ul').stop().slideDown(); // 아래로 내려오는 애니메이션 적용
		});

		$('.mousePoint').on('mouseleave', function() {
		  $(this).find('ul').stop().slideUp(); // 위로 올라가는 애니메이션 적용
		});

		$('.mousePoint ul').on('mouseenter', function() {
		  $(this).stop().slideDown(); // 아래로 내려오는 애니메이션 적용
		});

		$('.mousePoint ul').on('mouseleave', function() {
		  $(this).stop().slideUp(); // 위로 올라가는 애니메이션 적용
		});




</script>

