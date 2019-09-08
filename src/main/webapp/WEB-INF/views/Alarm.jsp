<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Bootdey.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">

/* .col-8 {
	border-top : 1px solid #ccc;
	border-bottom : 1px solid #ccc;
}
 */
label {
	font-size: 12pt;
}

div>.custom-control {
	margin: 20px;
}

.btn-primary {
	width: 150px;
	height: 50px;
}

.line {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}



</style>
</head>
<body>
	<div class="container">
		<div class="card">
			<div class="card-body">
			
				<div class="row" style="margin-bottom: 100px; margin-top: 80px;">
					<div class="col-1"></div>
					<div class="col-2">
						<div class="text-center">
							<hr>
							<h1 class="h1">알림</h1>
							<hr>
						</div>
					</div>
				</div>
				<!-- message가 있을때 띄어줄 세션  -->
				<div id="yesMessage">
				
					<c:forEach var="alarm" items="${alarmList}">					
					
					<div class="row">
						<div class="col-1"></div>
						<div class="col-8 line">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="jb-checkbox1" class="custom-control-input"> 
								<label class="custom-control-label" for="jb-checkbox1"> 
								
								<c:if test="${empty alarm }">
								
								</c:if>
								
								<c:if test="${alarm.ALARMTYPE_ID eq 1}">
									<a href="튜터링신청매핑주소?튜터링아이디=${alarm.ALARM_LINK }">등록하신 [${alarm.ALARM_CONTENT }] 튜터링에 튜티가 신청하였습니다.</a>
								</c:if>
								
								<c:if test="${alarm.ALARMTYPE_ID eq 2}">
									<a href="튜터링(튜터)문의확인할수있는매핑주소?튜터링아이디=${alarm.ALARM_LINK }">등록하신 [${alarm.ALARM_CONTENT }] 튜터링에 문의가 들어왔습니다.</a>
								</c:if>
								
								<c:if test="${alarm.ALARMTYPE_ID eq 9}">
									<a href="튜터링(튜티)문의확인할수있는매핑주소?튜터링아이디=${alarm.ALARM_LINK }">등록하신 [${alarm.ALARM_CONTENT }] 튜터링에 문의가 들어왔습니다.</a>
								</c:if>
								
								<c:if test="${alarm.ALARMTYPE_ID eq 3}">
									<a href="튜터가초대온것을확인할수있는페이지?튜터링(튜티)아이디=${alarm.ALARM_LINK }">[${alarm.ALARM_CONTENT }] 튜터링에서 튜터님을 초빙하였습니다.</a>
								</c:if>
								
								<c:if test="${alarm.ALARMTYPE_ID eq 4}">
									<a href="alarmReadCheck?ALARM_ID=${alarm.ALARM_ID }&location=qtboard_detail&value=${alarm.ALARM_LINK }">작성하신 [${alarm.ALARM_CONTENT }] 의 게시물에 댓글이 등록되었습니다.</a>
								</c:if>
								
								<c:if test="${alarm.ALARMTYPE_ID eq 10}">
									<a href="alarmReadCheck?ALARM_ID=${alarm.ALARM_ID }&location=qtboard_detail&valueCat=QT_ID&value=${alarm.ALARM_LINK }">작성하신 [${alarm.ALARM_CONTENT }] 의 댓글에 대댓글이 등록되었습니다.</a>
								</c:if>
								
								</label>
							</div>
						</div>
						<div class="col-2 line">
							<label style="margin: 20px;">${alarm.ALRAMDATE }</label>
						</div>
					</div>
					
					</c:forEach>
					
					<!-- 페이징 -->
					<!-- <div class="text-center">
						<button type="button" class="btn">1</button>
						<button type="button" class="btn">2</button>
						<button type="button" class="btn">3</button>
						<button type="button" class="btn">4</button>
						<button type="button" class="btn">5</button>
					</div> -->
				</div>
				
				<!-- 메세지가 없을때 띄어줄 세션 -->
				<c:if test="${empty alarmList }">
				<div id="noMessage">
					<div class="text-center">
						<div class="row line">
							<div class="col">
								<img src="<%=cp%>/images/Noalram.png"> 
								<p>새로운 알람이 없습니다.</p>
							</div>
						</div>

					</div>
				</div>
				</c:if>
				<!-- 버튼 -->
				<div class="row" style="margin-top: 50px;">
					<div class="col-2"></div>
					<div class="col-2">
						<button type="button" class="btn btn-primary">전체선택</button>
					</div>
					<div class="col-2">
						<button type="button" class="btn btn-primary">전체읽음</button>
					</div>
					<div class="col-2"></div>
					<div class="col-2">
						<button type="button" class="btn btn-primary">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>