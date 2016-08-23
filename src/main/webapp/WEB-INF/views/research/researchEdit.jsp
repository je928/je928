<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<%@ include file="../session/sessionChk.jsp"%>
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
		
		$("#startDate").datepicker({
			showOn: "button",
			buttonImage: "images/sub/btn/ico_data.gif",
			buttonImageOnly: true
		});
		
		$("#endDate").datepicker({
			showOn: "button",
			buttonImage: "images/sub/btn/ico_data.gif",
			buttonImageOnly: true
		});
	});
	
	$(document).ready(function() {
		var cntIndex = $('#questionview div').length;
		alert(cntIndex);
		$('#rs_que_cnt').change(function() {
			var a = $(this).val();
			$(".researchdiv").remove();
			for(var i=1; i<a; i++) {
				$('#questionview').append(
					'<div id="question" class="researchdiv">'+
					'문항'+(i+1)+'. <input type="text" id="q_subject" name="q_subject_list['+ i +']" class="inp" style="width:600px; -webkit-box-shadow:none; height:21px; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px;" placeholder="질문을 입력해주세요."/><br><br>'+
					'① &nbsp;<input type="text" id="i_title1" name="i_title1_list['+ i +']" class="inp" style="width:300px; -webkit-box-shadow:none; height:21px; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; margin-bottom: 5px;" /><br>'+
					'②  &nbsp;<input type="text" id="i_title2" name="i_title2_list['+ i +']" class="inp" style="width:300px; -webkit-box-shadow:none; height:21px; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; margin-bottom: 5px;" /><br>'+
					'③ &nbsp;<input type="text" id="i_title3" name="i_title3_list['+ i +']" class="inp" style="width:300px; -webkit-box-shadow:none; height:21px; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; margin-bottom: 5px;" /><br>'+
					'④  &nbsp;<input type="text" id="i_title4" name="i_title4_list['+ i +']" class="inp" style="width:300px; -webkit-box-shadow:none; height:21px; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; margin-bottom: 5px;" /><br>'+
					'⑤  &nbsp;<input type="text" id="i_title5" name="i_title5_list['+ i +']" class="inp" style="width:300px; -webkit-box-shadow:none; height:21px; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; margin-bottom: 5px;" /><br>'+
					'선택사유: <input type="text" id="r_description" name="r_description" class="inp" style="width:400px; -webkit-box-shadow:none; height:21px; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; background-color: #EAEAEA;" readonly="readonly"/>'+
					'</div>'
				);
			};
		});
		/* $('#addFile').click(function() {
			var fileIndex = $('#fileview tr').length;
			var totalcount = 5 - fileCount + count;

			if(fileIndex < totalcount) {
				$('#fileview').append(
					'<tr><td>'+
					'<input type="file" name="files['+ fileIndex +']" style="margin-bottom: 3px;"/></td>'+
					'<td><button type="button" style="font-size: 5px; padding: 1px 2px 2px 2px; id="fileremove['+ fileIndex +']" class="btn btn-sm btn-default fileremove">'+
					'<i class="glyphicon glyphicon-remove"></i></button>'+
					'</td></tr>'
				);
			}else {
				alert("파일 첨부는 총 5개까지 할 수 있습니다.");
			}
		}); */
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
		
		<form action="researchEdit.do" name="frm" method="post">
		<input type="hidden" name="rs_writer" value="${no}">
		<input type="hidden" name="rs_no" value="${research.rs_no}">
		<input type="hidden" name="q_no" value="${question.q_no}">		
		<input type="hidden" name="pageNum" value="${pageNum}">
		<div class="col-lg-9 col-md-offset-18">
			<div class="panel panel-default panel-table" style="padding-top: 50px;">
				<table class="tbl_type01" summary="설문조사" style="width:91.5%; margin-left: 36px;">
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
								<input type="text" id="rs_subject" name="rs_subject" class="inp" style="-webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px;" />
							</td>
						</tr>
						<tr>
							<th>시작일</th>
							<td class="tl">
								<input type="text" id="startDate" name="rs_start_date" style="width: 100px; -webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px;" readonly="readonly" />
							</td>
							<th>종료일</th>
							<td class="tl">
								<input type="text" id="endDate" name="rs_end_date" style="width: 100px; -webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px;" readonly="readonly" />
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
								<select id="rs_que_cnt" name="rs_que_cnt" style="-webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; padding-right:15px; line-height:1;">
									<option value="1">1개</option>
									<option value="2">2개</option>
									<option value="3">3개</option>
									<option value="4">4개</option>
									<option value="5">5개</option>
								</select>
							</td>
						</tr>
						<tr>
							<td colspan="6" id="questionview" class="tl">
								<div id="question" class="research">
									문항1. <input type="text" id="q_subject" name="q_subject_list[0]" class="inp" style="width:600px; -webkit-box-shadow:none; height:21px; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px;" placeholder="질문을 입력해주세요."/><br><br>
									① &nbsp;<input type="text" id="i_title1" name="i_title1_list[0]" class="inp" style="width:300px; -webkit-box-shadow:none; height:21px; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; margin-bottom: 5px;" /><br>
									②  &nbsp;<input type="text" id="i_title2" name="i_title2_list[0]" class="inp" style="width:300px; -webkit-box-shadow:none; height:21px; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; margin-bottom: 5px;" /><br>
									③ &nbsp;<input type="text" id="i_title3" name="i_title3_list[0]" class="inp" style="width:300px; -webkit-box-shadow:none; height:21px; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; margin-bottom: 5px;" /><br>
									④  &nbsp;<input type="text" id="i_title4" name="i_title4_list[0]" class="inp" style="width:300px; -webkit-box-shadow:none; height:21px; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; margin-bottom: 5px;" /><br>
									⑤  &nbsp;<input type="text" id="i_title5" name="i_title5_list[0]" class="inp" style="width:300px; -webkit-box-shadow:none; height:21px; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; margin-bottom: 5px;" /><br>
									선택사유: <input type="text" id="r_description" name="r_description" class="inp" style="width:400px; -webkit-box-shadow:none; height:21px; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; background-color: #EAEAEA;" readonly="readonly"/>
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
								<span class="wte_l">
									<a href="researchList.do" class="wte_r">목록</a>
								</span>
								<a href="javascript:document.frm.submit();" class="pre_r">확인</a>
								<span class="wte_l" style="padding-left: 1px;">
									<a href="javascript:history.go(-1);" class="wte_r" style="margin-right: 35px;">취소</a>
								</span>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>

</body>
</html>