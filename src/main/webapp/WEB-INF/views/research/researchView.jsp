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
							<td colspan="5" class="tl"><strong>${research.rs_subject}</strong></td>
						</tr>
						<tr>
							<th>시작일</th>
							<td class="tl">${research.rs_start_date}</td>
							<th>종료일</th>
							<td class="tl">${research.rs_end_date}</td>
							<th>결과확인</th>
							<td class="tl"><img src="images/sub/btn/btn_view.gif" alt="결과보기" /></td>
						</tr>
						<tr>
							<th>문항수</th>
							<td colspan="5" class="tl">${research.rs_que_cnt}개</td>
						</tr>
						<tr>
							<td colspan="6" class="tl">
							<c:set var="no" value="${itemListTotal-(itemListTotal-1)}" />
							<c:forEach var="item" items="${itemList}">
								<div class="research">
									<p>문항${no}. ${item.q_subject}</p>
									①&nbsp;${item.i_title1} <br>
									②&nbsp;${item.i_title2} <br>
									③&nbsp;${item.i_title3} <br>
									④&nbsp;${item.i_title4} <br>
									⑤&nbsp;${item.i_title5} <br>
									<p>
								</div>
							<c:set var="no" value="${no+1}"></c:set>
							</c:forEach>
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