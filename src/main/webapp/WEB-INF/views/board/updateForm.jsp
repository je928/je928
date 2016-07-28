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
function chkword(obj, maxByte) {
    var strValue = obj.value;
    var strLen = strValue.length;
    var totalByte = 0;
    var len = 0;
    var oneChar = "";
    var str2 = "";

    for (var i = 0; i < strLen; i++) {
        oneChar = strValue.charAt(i);
        if (escape(oneChar).length > 4) {
            totalByte += 3;
        }else if(escape(oneChar) == '%0A') {
        	totalByte += 2;
        }else {
            totalByte++;
        }

        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
        if (totalByte <= maxByte) {
            len = i + 1;
        }
    }
	
    var counter = document.getElementById("counter");
	counter.innerHTML = totalByte;
    
    // 넘어가는 글자는 자른다.
    if (totalByte > maxByte) {
        alert("내용은 " + maxByte + " byte 까지만 쓸 수 있습니다.");
        str2 = strValue.substr(0, len);
        obj.value = str2;
        chkword(obj, 3000);
    }
}

function chkword2(obj, maxByte) {
    var strValue = obj.value;
    var strLen = strValue.length;
    var totalByte = 0;
    var len = 0;
    var oneChar = "";
    var str2 = "";

    for (var i = 0; i < strLen; i++) {
        oneChar = strValue.charAt(i);
        if (escape(oneChar).length > 4) {
            totalByte += 3;
        }else if(escape(oneChar) == '%0A') {
        	totalByte += 2;
        }else {
            totalByte++;
        }

        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
        if (totalByte <= maxByte) {
            len = i + 1;
        }
    }
	
    // 넘어가는 글자는 자른다.
    if (totalByte > maxByte) {
    	alert("제목은 한글 기준 100자 까지만 쓸 수 있습니다.");
        str2 = strValue.substr(0, len);
        obj.value = str2;
        chkword2(obj, 300);
    }
}
</script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-offset-17">
				<h3 class="page-header">Board
					<small>게시판</small>
				</h3>
				<ol class="breadcrumb">
					<li>
						<a href="main.do">Home</a>
					</li>
					<li class="active">
						Board
					</li>
				</ol>
			</div>
		</div>

		<c:if test="">
			<font color="red"> ${msg} </font>
		</c:if>

		<div class="container">
			<div class="col-lg-9 col-md-offset-20">
				<div class="panel panel-default panel-table">
					<form action="update.do" name="frm" method="post" role="form">
						<input type="hidden" name="brd_no" value="${board.brd_no}">
						<input type="hidden" name="pageNum" value="${pageNum}">
						<br style="clear: both">
						<h3 style="margin-bottom: 25px; text-align: center;">
							<em class="fa fa-edit"></em>
						</h3>
						<div class="form-group">
							<input type="text" class="form-control-95" name="brd_subject"
								id="subject" onkeyup="chkword2(this, 300)" placeholder="제목을 입력해 주세요."
								autofocus="autofocus" value="${board.brd_subject}" required>
						</div>
						<div class="form-group">
							<textarea class="form-control-95" name="brd_content"
								id="content" rows="20" onkeyup="chkword(this, 3000)" required>${board.brd_content}</textarea>
							<div class="text-right" style="margin-right: 27px;"><span id="counter">${board.byteSize}</span>/3000 byte</div>
						</div>
						<div class="panel-footer text-center">
							<span>
								<button type="submit" class="btn btn-sm btn-primary">
									확인<i class="glyphicon glyphicon-ok"></i>
								</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>