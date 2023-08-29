<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>생산입고</title>

<style>
	input {
		border: none;
		text-size: 100%;
	}
	
	html {
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 0.7em;
	}
	
	body {
		font-family: Arial, sans-serif;
		margin: 5em;
		align-items: center;
		justify-content: center;
	}
	
	h2 {
		color: #333;
		text-align: center;
		margin-bottom: 30px;
	}
	
	table {
		width: 100%;
		border-collapse: collapse;
		margin-bottom: 20px;
	}
	
	th, td {
		padding: 1em;
		border: 1px solid #ccc;
	}
	
	th {
		background-color: #f2f2f2;
		text-align: center;
	}
	
	td {
		vertical-align: middle;
	}
	
	.total, .files {
		font-weight: bold;
	}
	
	.note {
		font-style: italic;
	}
	
</style>
</head>


<body>
	<h2>생산입고 등록</h2>
	<!-- card footer End -->
	<form role="form" method="post" action="/erp4/wh/regist.do" enctype="multipart/form-data">
		<table>
			<tr>
				<td width="40%" align="center"><b>담당자</b></td>
				<td>
					<input type="hidden" name="emp_no" id="receiver" value="${empno }"> 
					<input type="text" style="width: 100%;" value="${c_name } / ${ename }" id="name" name="name" 
							readonly onclick="OpenWindow('/mymenu/findPeople.do', '사람찾기', 400, 600)">
				</td>
			</tr>
			<tr>
				<td width="40%" align="center"><b>작업지시서</b></td>
				<td>
					<input type="hidden" name="wo_no" id="wo_no" class="wo_no" value=""> 
					<input type="text" style="width: 100%;" value="" id="wo_name" name="wo_name"
							readonly onclick="OpenWindow('/erp4/findWorkOrder.do', '작업지시서 찾기', 400, 600)">
				</td>
			</tr>
			<tr>
            <td width="40%" align="center">
            	<b>상태</b>
            </td>
            <td>
            	<select name="progress" id="fc-select">
				    <option value="0">대기중</option>
				    <option value="1">진행중</option>
				    <option value="2">완료</option>
				</select>
			</td>
        </tr>
			<tr>
	            <td align="center"><b>첨부파일</b></td>
	            <td>
	            	<input type="file" style="width: 100%;"  name ="files" value="">
	            	<input type="hidden" id="fileName" name="fileName" value=""> 
	            </td>
        	</tr>
		</table>
		<button type="button" id="addPutBtn" style="margin-bottom: 10px;" class="btn btn-primary">추가</button>
		<table>
			<thead>
				<tr>
					<th align="center">품목</th>
					<th align="center">생산 공장</th>
					<th align="center">입고 창고</th>
					<th align="center">외주비 단가</th>
					<th align="center">수량</th>
					<th align="center">외주비 합계</th>
					<th align="center">삭제</th>
				</tr>
			</thead>
			<tbody id="prInput">
				<input type="hidden" value="" id="cnt">
				<input type="hidden" value="A" id="A">
				<tr>
					<td>								<!-- 아래 태그 name을 pr_no에서 pr_name으로 변경 -->
						<input type="text" id="0" class="pr_names" name="pr_name" style="width: 100%;" value=""><input type="hidden" name="pr_no">
					</td>
					<td>		<!-- 공장 번호를 가져간다면 hidden 태그 새로 만들어 그 태그에 value값 넣기, 
								아래 태그는 공장 이름을 표시하는거기 때문에 name을 fac_no에서 fac_name으로 변경함-->
						<input type="text" id="0" class="fac_names" name="fac_name" style="width: 100%;" value=""><input type="hidden" name="fac_no" id="fac_no0">
					</td>
					<td>		<!-- 위와 마찬가지로 창고 번호를 가져간다면 hidden 태그 새로 만들어 그 태그에 value값 넣기, 
								아래 태그는 창고 이름을 표시하는거기 때문에 name을 wh_no2에서 wh_name으로 변경함 -->
						<input type="text" id="0" class="wh_names" name="wh_name" style="width: 100%;" value=""><input type="hidden" name="wh_no">
					</td>
					<td>
						<input type="text" id="outprice" class="outprice" name="outprice" style="width: 100%;" value="">
					</td>
					<td>
						<input type="text" id="quantity" class="quantity" name="quantity" style="width: 100%;" value="">
					</td>
					<td>
						<input type="text" id="total_outprice" name="total_outprice" style="width: 100%;" value="">
					</td>
					<td style="text-align: center;">
						<button type="button" id="cancelBtn" class="btn btn-danger">삭제</button>
					</td>
				</tr>
			</tbody>
			<tr class="total">
				<td colspan="5" align="center">
					총계
				</td>
				<td colspan="2" align="center">
					<input type="text" style="width: 100%;" id="wh_total" name="wh_total" value="">
				</td>
			</tr>
		</table>
		<input type="submit" id="submitBtn" class="btn btn-primary" style="text-align: center;" value="등록">
		<input type="button" class="btn btn-warning" id="closeBtn" value="취 소">
	</form>
</body>

<script>

	let cnt = 1;

	// 파일 추가 버튼
	$('#addPutBtn').on('click', function() {
		
		cnt++;

		$('#prInput').append(
			'<tr>'
 				+ '<td><input type="text" id="' + cnt + '" class="pr_names" name="pr_name" style="width: 100%;" value=""><input type="hidden" name="pr_no"></td>'
				+ '<td><input type="text" id="fac_no' + cnt + '" class="fac_names" name="fac_name" style="width: 100%;" value=""><input type="hidden" name="fac_no" id="fac_no' + cnt + '"></td>'
				+ '<td><input type="text" id="wh_no' + cnt + '" class="wh_names" name="wh_name" style="width: 100%;" value=""><input type="hidden" name="wh_no"></td>'
				+ '<td><input type="text" id="outprice' + cnt + '" class="outprice" name="outprice" style="width: 100%;" value=""></td>'
				+ '<td><input type="text" id="quantity' + cnt + '" class="quantity" name="quantity" style="width: 100%;" value=""></td>'
				+ '<td><input type="text" id="amount" name="total_outprice" style="width: 100%;" value=""></td>'
				+ '<td style="text-align : center;"><button type="button" id="cancelBtn" class="btn btn-danger">삭제</button></td>'
			+ '</tr>'
		);
	
	});
	
	// 제품코드 td 클릭 이벤트
	$(document).on('click', '.pr_names', function() {
		let idVal = $(this).attr('id');
		$('#cnt').val(idVal);
		let openWin = OpenWindow("/erp4/findProduct.do", "제품 찾기", 800, 600);
	});

	// 제품 삭제 버튼
	$('#prInput').on('click', '#cancelBtn', function() {
		$(this).parent('td').parent('tr').remove();
	});

	// 공장 클릭시 목록 열기 이벤트
	$(document).on('click', '.fac_names', function() {
		let whVal = $(this).attr('id');
		$('#cnt').val(whVal);
		let openWin = OpenWindow("/erp4/findFactory.do", "공장 찾기", 800, 600);
	})

	// 창고코드 이벤트
	$(document).on('click', '.wh_names', function() {
		let whVal = $(this).attr('id');
		$('#cnt').val(whVal);
		let openWin = OpenWindow("/erp4/findWareHouse.do", "창고 찾기", 800, 600);
	})


	// 가격 * 수량 = 합계
	$(document).on('keyup', '.quantity', function() {
		let quantity = $(this).parents("tr").find(".outprice").val()
		let unitPrice = $(this).val();

		let totalPrice = unitPrice * quantity;
		
		$(this).parent().next().children().val(totalPrice);
	})
	
	// 총합계
	$(document).on('change, keyup', '#prInput', function(){
		let sum = Number(0);
		let inputAmount = $('input[name="total_outprice"]').get();
		for(let i = 0; i < inputAmount.length; i++){
			sum += Number($('input[name="total_outprice"]').eq(i).val());
		}
		
		$('#wh_total').val(sum);
	})

	function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
		winleft = (screen.width - WinWidth) / 2;
		wintop = (screen.height - WinHeight) / 2;
		var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width="
				+ WinWidth + ", " + "height=" + WinHeight + ",top=" + wintop
				+ ",left=" + winleft + ",resizable=yes,status=yes");
		win.focus();
		return win;
	};
	
	// 취소버튼 클릭
	$('input#closeBtn').on('click', function() {
		window.close();							// 윈도우 창을 닫는다.
	});
	
</script>

<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

</html>
