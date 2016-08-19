<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>research</title>
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
			<div class="panel panel-default panel-table" style="padding-top: 50px;">
				<table width="91.5%" border="0" cellspacing="0" cellpadding="0" class="tbl_type01" summary="설문조사" style="margin-left: 36px;">
					<caption>설문조사</caption>
					<colgroup>
						<col width="8%" />
						<col width="*%" />
						<col width="15%" />
						<col width="15%" />
						<col width="10%" />
						<col width="8%" />
						<col width="10%" />
					</colgroup>
					<tbody>
						<tr>
							<th>NO</th>
							<th>제목</th>
							<th>시작일</th>
							<th>마감일</th>
							<th>완료여부</th>
							<th>첨부</th>
							<th>결과확인</th>
						</tr>
						<tr>
							<td>10</td>
							<td class="tl"><a href="researchView.do" class="on">내용입니다.</a></td>
							<td>2013-01-02</td>
							<td>2013-01-02</td>
							<td>완료</td>
							<td><img src="images/sub/btn/btn_pdf.gif" alt="pdf" /></td>
							<td><a href="#"><img src="images/sub/btn/btn_view.gif" alt="결과보기" /></a></td>
						</tr>
					</tbody>
				</table>
				<div class="panel-footer2 text-center" style="height: 0px; border-top:0px; background-color: white; margin-bottom: 29px; line-height: 1.8;">
					<div class="row">
						<div class="panel-body2 text-right" style="height: 0px; background-color: white;">
							<span class="bbs_btn">
								<a href="researchEdit.do" class="pre_r" style="margin-right: 35px;">글쓰기</a>
							</span>
						</div>
						<div class="col">
							<!-- paging-->
							<ul class="paging">
								<%-- <c:if test="${pb.startPage > pb.pagePerBlock}"> --%>
								<li>
									<a href="javascript:locate(1)" title="맨 처음 페이지로 가기">
										<img src="images/sub/btn/pre_01.gif" alt="맨 처음 페이지로 가기" />
									</a>
								</li>
								<li>
									<a href="javascript:locate(${pb.nowPage-1})" title="이전 페이지로 가기">
										<img src="images/sub/btn/pre.gif" alt="이전 페이지로 가기" />
									</a>
								</li>
								<%-- </c:if> --%>
								<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
								<c:if test="${i eq pb.nowPage}">
									<li><span title="현재페이지"><a href="#" class="on">${i}</a></span></li>
								</c:if>
								<c:if test="${i ne pb.nowPage}">
									<li><a href="javascript:locate(${i})" title="${i}페이지">${i}</a></li>
								</c:if>
								</c:forEach>
								<%-- <c:if test="${pb.totalPage > pb.endPage}"> --%>
								<li>
									<a href="javascript:locate(${pb.nowPage+1})" title="다음 페이지로 가기">
										<img src="images/sub/btn/next.gif" alt="다음 페이지" />
									</a>
								</li>
								<li>
									<a href="javascript:locate(${pb.totalPage})" title="마지막 페이지로 가기">
										<img src="images/sub/btn/next_01.gif" alt="마지막 페이지" />
									</a>
								</li>
								<%-- </c:if> --%>
							</ul>
							<!-- //paging-->
						</div>
					</div>
				</div>
				<div class="panel-footer2 text-center" style="height: 150px; border-top:0px; background-color: white; margin-left: 22px;">
					<div class="search_box">
						<select id="searchType" style="-webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; padding-right:15px; line-height:1;">
							<c:if test="${searchType eq 'brd_subject'}">
								<option value="subject" selected="selected">제목</option>
							</c:if>
							<c:if test="${searchType ne 'brd_subject'}">
								<option value="subject">제목</option>
							</c:if>
						</select>
						<input type="text" id="searchTxt" name="searchTxt" value="${searchTxt}" style="-webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; width:205px; border:solid 1px #c6c6c6; color:#666; padding:3px;" />
						<a href="#">
							<img src="images/sub/btn/btn_serch.gif" alt="검색" />
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>