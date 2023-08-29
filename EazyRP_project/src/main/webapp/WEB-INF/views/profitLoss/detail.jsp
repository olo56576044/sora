<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table style="font-size: 0.9em; text-align: center;" border= 1px;>
	<tr>
		<td></td>
		<td>올해 발생 비용</td>
		<td>전년 발생 비용</td>
		<td>전년 대비</td>
		<td></td>
		<td>올해 발생 비용</td>
		<td>전년 발생 비용</td>
		<td>전년 대비</td>
	</tr>
	<tr>
		<td>쇼핑몰 판매</td>
		<td>${s }원</td>
		<td></td>
		<td></td>
		<td>창고 이동</td>
		<td>${w }원</td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>제품 구매</td>
		<td>${pb }원</td>
		<td></td>
		<td></td>
		<td>기타 구매</td>
		<td>${b }원</td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>발주 요청</td>
		<td>${o }원</td>
		<td></td>
		<td></td>
		<td>불량 처리</td>
		<td>${e }원</td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>급여 제공</td>
		<td>${p }원</td>
		<td></td>
		<td></td>
		<td>AS 비용</td>
		<td>${a }원</td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="2">총 손익</td>
		<td colspan="2">${amount }원</td>
		<td colspan="2">전년 대비</td>
		<td colspan="2">원</td>
	</tr>
</table>
<button type="button" id="detailBtn">해당 월 내역 조회</button>
</body>
</html>