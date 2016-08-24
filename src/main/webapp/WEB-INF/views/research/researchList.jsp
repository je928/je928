<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../module/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>research</title>
<script type="text/javascript">
	function locate(pageNum){
		var searchType = document.getElementById("searchType");
		var searchTxt = document.getElementById("searchTxt");
		location.href="researchList.do?pageNum="+pageNum+"&searchType="+searchType.value+"&searchTxt="+searchTxt.value;
	}
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
			<div class="panel panel-default panel-table" style="padding-top: 50px;">
				<table class="tbl_type01" summary="설문조사" style="width:91.5%; margin-left: 36px;">
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
						<c:set var="no" value="${pb.no}" />
						<c:forEach var="research" items="${list}">
						<tr>
							<td>${no}</td>
							<td class="tl"><a href="researchView.do?rs_no=1&pageNum=${pb.nowPage}&searchType=${searchType}&searchTxt=${searchTxt}" class="on">${research.rs_subject}</a></td>
							<td>${research.rs_start_date}</td>
							<td>${research.rs_end_date}</td>
							<c:set var="day" value="${bs.newday()}"></c:set>
							<td>
							<c:if test="${day > research.rs_end_date}">
								완료
							</c:if>
							<c:if test="${day <= research.rs_end_date}">
								진행중
							</c:if>
							</td>
							<td><img src="images/sub/btn/btn_pdf.gif" alt="pdf" /></td>
							<td><a href="#"><img src="images/sub/btn/btn_view.gif" alt="결과보기" /></a></td>
						</tr>
						<c:set var="no" value="${no-1}"></c:set>
						</c:forEach>
						<c:if test="${empty list}">
						<tr>
							<td colspan="7">데이터가 없습니다.</td>
						</tr>
						</c:if>
					</tbody>
				</table>
				<div class="panel-footer2 text-center" style="height: 0px; border-top:0px; background-color: white; margin-bottom: 29px; line-height: 1.8;">
					<div class="row">
						<div class="panel-body2 text-right" style="height: 0px; background-color: white;">
							<span class="bbs_btn">
								<a href="researchEditForm.do?pageNum=${pb.nowPage}" class="pre_r" style="margin-right: 35px;">글쓰기</a>
							</span>
						</div>
						<div class="col">
							<!-- paging-->
							<ul class="paging">
								<c:if test="${pb.startPage > pb.pagePerBlock}">
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
								</c:if>
								<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
								<c:if test="${i eq pb.nowPage}">
									<li><span title="현재페이지"><a href="#" class="on">${i}</a></span></li>
								</c:if>
								<c:if test="${i ne pb.nowPage}">
									<li><a href="javascript:locate(${i})" title="${i}페이지">${i}</a></li>
								</c:if>
								</c:forEach>
								<c:if test="${pb.totalPage > pb.endPage}">
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
								</c:if>
							</ul>
							<!-- //paging-->
						</div>
					</div>
				</div>
				<div class="panel-footer2 text-center" style="height: 150px; border-top:0px; background-color: white; margin-left: 22px;">
					<div class="search_box">
						<select id="searchType" style="-webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; border:solid 1px #c6c6c6; color:#666; padding:3px; padding-right:15px; line-height:1;">
							<c:if test="${searchType eq 'rs_subject'}">
								<option value="rs_subject" selected="selected">제목</option>
							</c:if>
							<c:if test="${searchType ne 'rs_subject'}">
								<option value="rs_subject">제목</option>
							</c:if>
						</select>
						<input type="text" id="searchTxt" name="searchTxt" value="${searchTxt}" style="-webkit-box-shadow:none; height:21px; box-shadow:none; font-size: 12px; width:205px; border:solid 1px #c6c6c6; color:#666; padding:3px;" />
						<a href="javascript:locate(1);">
							<img src="images/sub/btn/btn_serch.gif" alt="검색" />
						</a>
						<c:if test="${searchTxt != ''}">
						<p>
						<div> <a href="researchList.do" style="text-decoration: underline;">목록</a> </div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>