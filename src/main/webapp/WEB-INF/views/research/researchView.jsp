<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
							<td colspan="5" class="tl"><strong>제목입니다.</strong></td>
						</tr>
						<tr>
							<th>시작일</th>
							<td class="tl">2013-12-12</td>
							<th>종료일</th>
							<td class="tl">2013-12-12</td>
							<th>결과확인</th>
							<td class="tl"><img src="images/sub/btn/btn_view.gif" alt="결과보기" /></td>
						</tr>
						<tr>
							<th>문항수</th>
							<td colspan="5" class="tl">5개</td>
						</tr>
						<tr>
							<td colspan="6" class="tl">
								<div class="research">
									<p>1. 위생불량 납품단절 편함</p>
									<ul>
										<li>① 매우그렇다</li>
										<li>② 조금그렇다</li>
										<li>③ 그렇다</li>
										<li>④ 조금 아니다</li>
										<li>⑤ 매우 아니다</li>
										<li>선택사유 <input type="text" id="aa" name="aa" class="inp" style="width: 200px; -webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; width:205px; border:solid 1px #c6c6c6; color:#666; padding:3px;"" />
										</li>
									</ul>
								</div>
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="5" class="tl">내용입력 <img
								src="images/sub/btn/btn_pdf.gif" alt="pdf" />
							</td>
						</tr>
					</tbody>
				</table>
				<div class="panel-footer2 text-center" style="height: 150px; border-top:0px; background-color: white; margin-bottom: 29px; line-height: 2.5;">
					<div class="row">
						<div class="panel-body2 text-right" style="height: 0px; background-color: white;">
							<span class="bbs_btn"> 
								<span class="wte_l"><a href="researchList.do" class="wte_r">목록</a></span>
								<span class="wte_l"><a href="#" class="wte_r">수정</a></span>
								<span class="wte_l"><a href="#" class="wte_r">삭제</a></span>
								<a href="#" class="pre_r">결과보기</a>
								<span class="wte_l" style="padding-left:1px;"><a href="#" class="wte_r" style="margin-right: 35px;">사유전체보기</a></span>
				          	</span> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>