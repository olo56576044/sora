<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>생산입고 상세보기</title>
    
    <style>
    	input {
    		border: none;
    		text-size : 100%;
    	}
    	html {
    		display: flex;
    		align-items: center;
    		justify-content: center;
    		font-size: 0.7em;
    	}
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            align-items: center;
    		justify-content: center;
            width: 70%;
            height: 70%;
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

        th,
        td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        th {
            background-color: #f2f2f2;
            text-align: center;
        }

        td {
            vertical-align: middle;
        }

        .total,
        .files {
            font-weight: bold;
        }

        .note {
            font-style: italic;
        }
    </style>
</head>
	

<body>
    <h2>생산입고 상세보기</h2>
	<div class="card-footer">
		<button type="button" id="modifyBtn" class="btn btn-warning">수정</button>
		<button type="button" id="removeBtn" class="btn btn-danger">삭제</button>
		<button type="button" id="closeBtn" class="btn btn-primary">닫기</button>
	</div>
	<!-- card footer End -->
<form role="form" method="post" enctype="multipart/form-data">

		<input type="hidden" name="whNo" value="${wh.WH_NO }">
		<table>
	        <tr>
	            <td width="40%" align="center"><b>코드번호</b></td>
	            <td width="100%"><input type="text" style="width: 100%;" value="${wh.WH_NO }" readonly></td>
	        </tr>
	        <tr>
	            <td width="40%" align="center"><b>제목</b></td>
	            <td width="100%"><input type="text" style="width: 100%;" value="${wh.WO_NAME }"></td>
	        </tr>
	        <tr>
	            <td width="40%" align="center"><b>담당자</b></td>
	            <td width="100%">
		        	<input type="hidden" id="receiver" name="emp_no" value="${wh.EMP_NO }">
	            	<input type="text" style="width: 100%;" value="${wh.C_NAME } / ${wh.E_NAME }">
	            </td>
	        </tr>
	        <tr>
	        	<td width="40%" align="center"><b>등록일</b></td>
	        	<td width="40%" align="center">
					<input type="date" id="sys_regdate" name="sys_regdate" class="form-control mch7" value="${wh.SYS_REGDATE }" disabled>
	        	</td>
	        </tr>
	        <tr>
	            <td width="40%" align="center">
	            	<b>상태</b>
	            </td>
	            <td>
	            	<select name="progress" id="progress_select">
					    <option>선택</option>
					    <option value="" ${wh.PROGRESS eq '' ? 'selected' : '' }>선택</option>
					    <option value="0" ${wh.PROGRESS eq '0' ? 'selected' : '' }>대기중</option>
					    <option value="1" ${wh.PROGRESS eq '1' ? 'selected' : '' }>진행중</option>
					    <option value="2" ${wh.PROGRESS eq '2' ? 'selected' : '' }>완료</option>
					</select>
				</td>
	        </tr>
	        <tr>
	            <td align="center"><b>첨부파일</b></td>
	            <td>
	            <input type="file" name="files" style="width: 100%;" value="">
	            <c:if test="${!empty wh.FILES }">
					<div>
						<button type="button" onclick="location.href='<%=request.getContextPath()%>/erp4/getFile.do?files=${wh.FILES }';">
							파일 다운
						</button>
						&nbsp;&nbsp;${wh.FILES }
					</div>
				</c:if>
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
	       	<c:forEach items="${whDetail }" var="whDetail" varStatus="loop">
		        <tr id="trChk" >    	
					<input type="hidden" class="rownum" value="${whDetail.ROWNUM }">
					<input type="hidden" name="detail_no" id="dtail_no" value="${whDetail.DETAIL_NO }">
		<%-- 	       <input type="hidden" name="enabled" id="estenabled" value="${est.ENABLED }"> --%>
					<input type="hidden" name="pr_delete" value="o">
		        	<td>								
						<input type="text" id="${whDetail.ROWNUM }" class="pr_names" name="pr_name" style="width: 100%;" value="${whDetail.PR_NAME }">
						<input type="hidden" name="pr_no" value="${whDetail.PR_NO }">
					</td>
					<td>	
						<input type="text" id="fac_no${whDetail.ROWNUM }" class="fac_names" name="fac_name" style="width: 100%;" value="${whDetail.FAC_NAME }">
						<input type="hidden" name="fac_no" value="${whDetail.FAC_NO }">
					</td>
					<td>		
						<input type="text" id="wh_no${whDetail.ROWNUM }" class="wh_names" name="wh_name" style="width: 100%;" value="${whDetail.WH_NAME }">
						<input type="hidden" id="wh" name="wh_no" value="${whDetail.WH_NO2 }">
					</td>
					<td>
						<input type="text" id="outprice" class="outprice" name="outprice" style="width: 100%;" value="${whDetail.OUTPRICE }">
					</td>
					<td>
						<input type="text" id="quantity" class="quantity" name="quantity" style="width: 100%;" value="${whDetail.QUANTITY }">
					</td>
					<td>
						<input type="text" id="total_outprice" name="total_outprice" style="width: 100%;" value="${whDetail.TOTAL_OUTPRICE }">
					</td>
					<td style="text-align: center;">
						<button type="button" id="cancelBtn" class="btn btn-danger">삭제</button>
					</td>
		        </tr>
	        </c:forEach>
        </tbody>
        <tr class="total">
            <td colspan="5" align="center">총액</td>
            <td colspan="2" align="center"><input type="text" id="wh_total" name="wh_total" style="width: 100%;" value="${wh.WH_TOTAL }" readonly></td>
        </tr>
    </table>
</form>
</body>


	

<script>
window.onload = function(){
	
// 	let fc_no = "${est.FC_NO}";
// 	$('#fc-select').val(fc_no);
// 	$('select#fc-select').find('option[value="' + fc_no + '"]').attr('selected', 'selected');
// 	console.log(fc_no);
	
	let formObj = $('form[role="form"]');

	$('button#modifyBtn').on('click', function(){
		formObj.attr({
			'action' : 'modify.do',
			'method' : 'post'
// 			'enctype' : 'multipart/form-ata'
		});
		console.log($('form[role="form"]').serializeArray());
		
		alert("tr은 총 " + $('tr[id="trChk"]').get().length) + "개 입니다.";
		
		let trCnt = 0;
		for(let i = 0; i < $('tr[id="trChk"]').get().length; i++){
			if($('tr[id="trChk"]').eq(i).css("display") != "none") {
				for(let j = 0; j < $('tr[id="trChk"]').eq(i).find('input[type="text"]').get().length; j++) {
					if($('tr[id="trChk"]').eq(i).find('input[type="text"]').eq(j).val() == "" || $('tr[id="trChk"]').eq(i).find('input[type="text"]').eq(j).val() == null) {
						alert("값을 입력해 주세요.");
						return;
					}
				}				
			} else {
				trCnt += 1;
			}
		}
		
		if($('tr[id="trChk"]').get().length == trCnt) {
			alert("제품을 추가하세요.");
			return;
		}
		
		formObj.submit();
	});
	
	
	$('button#removeBtn').on('click', function(){
		if(confirm("정말 삭제하시겠습니까?")){
			formObj.attr({
				'action' : 'remove',
				'method' : 'post' 
			});
			formObj.submit();
		};
	});
	
	$('button#closeBtn').on('click', function(){
		window.close();
	});
	
}

</script>

<script>
let rownumList = $('.rownum');
let cnt = rownumList.length; 
console.log(cnt);
let dtail_no = $('#dtail_no').val();

// 제품 추가 버튼
$('#addPutBtn').on('click', function(){
	cnt++;
	$('#prInput').append(
			'<tr id="trChk"><input type="hidden" class="rownum" value="'+ cnt + '">'
				+ '<input type="hidden" name="detail_no" id="" value="0">'
				+ '<input type="hidden" name="pr_delete" value="n">'
 				+ '<td><input type="text" id="' + cnt + '" class="pr_names" name="pr_name" style="width: 100%;" value=""><input type="hidden" name="pr_no"></td>'
				+ '<td><input type="text" id="fac_no' + cnt + '" class="fac_names" name="fac_name" style="width: 100%;" value=""><input type="hidden" name="fac_no"id="fac_no' + cnt + '"></td>'
				+ '<td><input type="text" id="wh_no' + cnt +'" class="wh_names" name="wh_name" style="width: 100%;" value=""><input type="hidden" id="wh" name="wh_no"></td>'
				+ '<td><input type="text" id="outprice' + cnt + '" class="outprice" name="outprice" style="width: 100%;" value=""></td>'
				+ '<td><input type="text" id="quantity' + cnt + '" class="quantity" name="quantity" style="width: 100%;" value=""></td>'
				+ '<td><input type="text" id="amount" name="total_outprice" style="width: 100%;" value=""></td>'
				+ '<td style="text-align : center;"><button type="button" id="cancelBtn" class="btn btn-danger">삭제</button></td>'
			+ '</tr>'
		);
	
});


function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth+", "
							+ "height=" + WinHeight + ",top="+ wintop + ",left="
							+ winleft + ",resizable=yes,status=yes");
	win.focus();
	return win;
};

	// 제품코드 td 클릭 이벤트
	$(document).on('click', '.pr_names', function(){
		let idVal = $(this).parents("tr").find(".rownum").val();
		console.log(idVal);
		$('#cnt').val(idVal);
		let openWin = OpenWindow("/erp4/findProduct.do", "제품 찾기", 500, 500);
		
	});
	
	//제품 삭제 버튼
	$('#prInput').on('click', '#cancelBtn', function(){
		if($(this).parent('td').parent('tr').find("input[name='pr_delete']").val() == "n") {
	        $(this).parent('td').parent('tr').remove();
	    }else{
			$(this).parents('tr').css('display', 'none');
			$(this).parents('tr').find("input[name='pr_delete']").val("d")
	    }
	   });
	
	
	//창고코드 이벤트
	$(document).on('click', '.wh_names', function(){
		let whVal = $(this).attr('id');
		$('#cnt').val(whVal);
		let openWin = OpenWindow("/erp4/findWareHouse.do","창고 찾기", 500,500);
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
	
	// 공장 클릭시 목록 열기 이벤트
	$(document).on('click', '.fac_names', function() {
		let whVal = $(this).attr('id');
		$('#cnt').val(whVal);
		let openWin = OpenWindow("/erp4/findFactory.do", "공장 찾기", 800, 600);
	})
	
</script>


</html>
