<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$.datepicker.regional['ko'] = {
			closeText: '닫기',
			prevText: '이전',
			nextText: '다음',
			currentText: '오늘',
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			dayNames: ['일','월','화','수','목','금','토'],
			dayNamesShort: ['일','월','화','수','목','금','토'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			weekHeader: 'Wk',
			dateFormat: 'yy-mm-dd',
			firstDay: 0,
			isRTL: false,
			showMonthAfterYear: true,
			yearSuffix: ''
		};
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		
		$( "#startDate" ).datepicker({
			showOn: "button",
			buttonImage: "images/sub/btn/ico_data.gif",
			buttonImageOnly: true
		});
		
		$( "#endDate" ).datepicker({
			showOn: "button",
			buttonImage: "images/sub/btn/ico_data.gif",
			buttonImageOnly: true
		});
	});
</script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">
					Research <small>설문조사</small>
				</h3>
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li class="active">Research</li>
				</ol>
			</div>
		</div>

		<div class="col-lg-9 col-md-offset-18">
			<div class="panel panel-default panel-table"
				style="padding-top: 50px;">
				<table width="91.5%" border="0" cellspacing="0" cellpadding="0" class="tbl_type01" summary="설문조사" style="margin-left: 36px;">
					<caption>설문조사</caption>
					<colgroup>
						<col width="15%" />
						<col width="20%" />
						<col width="15%" />
						<col width="20%" />
						<col width="15%" />
						<col width="%" />
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td colspan="5" class="tl">
								<input type="text" id="aa" name="aa" class="inp" style="-webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px;" />
							</td>
						</tr>
						<tr>
							<th>시작일</th>
							<td class="tl">
								<input type="text" id="startDate" style="width: 100px; -webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px;" readonly="readonly" />
							</td>
							<th>종료일</th>
							<td class="tl">
								<input type="text" id="endDate" style="width: 100px; -webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px;" readonly="readonly" />
							</td>
							<th>결과확인</th>
							<td class="tl">
								<a href="" id="result">
								<img src="images/sub/btn/btn_view.gif" alt="결과보기" />
								</a>
							</td>
						</tr>
						<tr>
							<th>문항수</th>
							<td colspan="5" class="tl">
								<select id="aa" name="aa" style="-webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; padding-right:15px; line-height:1;">
									<option>1개</option>
									<option>1개</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="6" class="tl">
								<div class="research">
										<input type="text" id="aa" name="aa" class="inp" title="1. 위생불량 납품단절 편함" style="-webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px;" />
									<ul>
										<li>
											<input type="text" id="aa" name="aa" class="inp" title="매우그렇다" style="-webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px;" /></li>
										<li>
											<input type="text" id="aa" name="aa" class="inp" title="매우그렇다" style="-webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px;" /></li>
										<li>
											<input type="text" id="aa" name="aa" class="inp" title="매우그렇다" style="-webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px;" /></li>
										<li>
											<input type="text" id="aa" name="aa" class="inp" title="매우그렇다" style="-webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px;" /></li>
										<li>
											<input type="text" id="aa" name="aa" class="inp" title="매우그렇다" style="-webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px;" /></li>
										<li>선택사유 <input type="text" id="aa" name="aa" class="inp" style=" width:610px; -webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px;" />
										</li>
									</ul>
								</div>
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="5" class="tl"><input type="file" id="aa" name="aa" /></td>
						</tr>
					</tbody>
				</table>
				<div class="panel-footer2 text-center"
					style="height: 150px; border-top: 0px; background-color: white; margin-bottom: 29px; line-height: 2.5;">
					<div class="row">
						<div class="panel-body2 text-right"
							style="height: 0px; background-color: white;">
							<span class="bbs_btn">
								<span class="wte_l"><a href="researchList.do" class="wte_r">목록</a></span>
								<a href="#" class="pre_r">확인</a>
								<span class="wte_l" style="padding-left: 1px;"><a href="#" class="wte_r" style="margin-right: 35px;">취소</a></span>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>