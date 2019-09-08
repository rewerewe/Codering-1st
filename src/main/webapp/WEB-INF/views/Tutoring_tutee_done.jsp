<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Tutoring_tutee_done.jsp</title>
<!-- Bootstrap core CSS -->



<!-- Header 관련 링크 -->
<!-- HEADER -->
<link type="text/css" rel="stylesheet" href="<%=cp%>/headerFiles/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="<%=cp%>/headerFiles/css/mypage.css">

<!---------------------------------- Header ----------------------------------------->
<!-- Custom fonts for this template-->
<link href="<%=cp%>/headerFiles/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">


<!-- Custom styles for this template-->
<link href="<%=cp%>/headerFiles/css/sb-admin-2.min.css" rel="stylesheet">
<link href="<%=cp%>/headerFiles/css/header02.css" rel="stylesheet">


<!-- Bootstrap core JavaScript-->
<script src="<%=cp%>/headerFiles/vendor/jquery/jquery.min.js"></script>
<script src="<%=cp%>/headerFiles/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<!--  dropdown -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



<!-- Core plugin JavaScript-->
<!-- <script src="headerFiles/vendor/jquery-easing/jquery.easing.min.js"></script> -->

<!-- Custom scripts for all pages-->
<script src="<%=cp%>/headerFiles/js/sb-admin-2.min.js"></script>

<!-- HEADER -->




<!-- 상세페이지 관련 링크 -->
<link href="<%=cp%>/vendor/cbr/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
      integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!-- Custom styles for this template -->
<link rel="stylesheet" href="<%=cp%>/css/cbr/css/blog-post.css">
<link rel="stylesheet" href="<%=cp%>/css/cbr/css/myCss.css" />






</head>
<body>
  
  <!-- Header Import -->
  <div class="header-style">
		<c:import url="Header_Sidebar_done.jsp"></c:import>
  </div>

  <!-- Page Content -->
  <div class="container">
    <div class="row" style="margin-top: 50px;">

      <!-- Post Content Column -->
      <div class="col-lg-8">

        <!-- Title -->
        <h1 class="mt-4">${selectTutoringTutee.TUTORING_TITLE }</h1>

        <!-- Author -->
        <p class="lead">
          by
          <a href="#">Code-ring</a>
        </p>

        <hr>

        <!-- Date/Time -->
        <p style="font-size: small;">${selectTutoringTutee.UPLOAD_DATE } 작성</p>

        <hr>


        <!-- Post Content -->
        
        <div class="row">
	        <div class="col-xs-12 col-sm-3">
	        	<p class="lead" style="font-weight: bold;">튜터링 소개</p>
	        </div>
			<div class="col-xs-12 col-sm-9">
		        <p class="subcontent">${selectTutoringTutee.INTRO }</p>
					
				
					<ul class="subcontent">
						<li><span class="fas fa-check"></span>&nbsp;&nbsp;&nbsp;&nbsp;<c:forEach var="langLv" items="${selectTuteeNeedTech }">${langLv.INTEREST_CAT }-${langLv.LEVEL_NAME }</c:forEach> 권장</li>
					</ul> 
			</div>
		</div>
		
		<hr>
		
		<div class="row">
	        <div class="col-xs-12 col-sm-3">
	        	<p class="lead" style="font-weight: bold;">상세 정보</p>
	        </div>
			<div class="col-xs-12 col-sm-9 subcontent list-unstyled">
				<ul>
					<li><span class="fa fa-map-pin"></span>&nbsp;&nbsp;&nbsp;&nbsp;  ${selectTutoringTutee.REG_NAME } 희망</li>
					<li><span class="far fa-calendar-alt"></span>&nbsp;&nbsp;&nbsp;&nbsp;  ${selectTutoringTutee.ENTIRE_PERIOD }회 희망</li>
					<li><span class="far fa-clock"></span>&nbsp;&nbsp;&nbsp;&nbsp;  
					<c:forEach var="time" items="${selectTutoringTime}">
					${time.WEEDAY_END }-${AM_PM }</c:forEach>희망</li>
					<li><span class="fa fa-user"></span>&nbsp;&nbsp;&nbsp;&nbsp;  ${selectTutoringTutee.MIN_NUM }명 ~ ${selectTutoringTutee.MAX_NUM }명 희망</li>
					<li><span class="fa fa-tag"></span>&nbsp;&nbsp;&nbsp;&nbsp;  ${selectTutoringTutee.ENTRY_COST } 원 희망</li>
				</ul>
				<br>
				<!-- 지도 api 넣을 부분 (임시 img) -->
				<input type="hidden" name="REG_LONG" value="${selectTutoringTutee.REG_LONG }">
				<input type="hidden" name="REG_LAT" value="${selectTutoringTutee.REG_LAT }">
				<img alt="map" src="css/img/img02.jpg" id="mapImg">
			</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-12 col-sm-3">
	        	<p class="lead" style="font-weight: bold;">튜터링 코멘터리</p>
	        </div>
			<div class="col-xs-12 col-sm-9">
				<div id="wrapper cell" style="font-weight: bold;">
					<img alt="tutor pic" src="${selectTutoringTutee.PROF_PATH }" class="rounded-circle" id="profilePic01"> &nbsp;&nbsp; 튜티장 ${selectTutoringTutee.NICKNAME }
				<br>
				<br>
				</div>
		        ${selectTutoringTutee.TCOMMENT }
			</div>
		</div> <!-- Post Content.row -->
        


        <hr>

        <!-- Comments Form -->
        <!-- 문의하기 -->
        <div class="card my-4">
          <h5 class="card-header" style="font-weight: bold;">튜티장에게 물어보세요.</h5>
          <div class="card-body">
            <form>
              <div class="form-group">
                <textarea class="form-control subcontent" rows="3" placeholder="문의 내용을 입력하세요."></textarea>
              </div>
              <button type="submit" class="btn btn-primary float-right">등록</button>
            </form>
          </div>
        </div>
		
		<hr />
		
        <!-- Single Comment -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt=""> <!-- 댓글 프로필사진 -->
          <div class="media-body subcontent">
            <div class="mt-0 nick">자바를자바</div>
            <footer class="blockquote-footer">
            <cite title="Source Title">2019-06-10 18:25 작성</cite>
            <!-- 수정 / 삭제 --> 
	        <span class="btn-user float-right"><a>수정</a>&nbsp;&nbsp;<a>삭제</a></span>
         	</footer>
            <br>노트북 필수 지참인가요?
          </div>
        </div>
		
        <!-- Comment with nested comments -->
        <div class="media mb-4 ">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt=""> <!-- 댓글 프로필사진 -->
          <div class="media-body subcontent">
            <div class="mt-0 nick">뚜비</div>
            <footer class="blockquote-footer">
            <cite title="Source Title">2019-06-11 15:03 작성</cite>
            <!-- 신고 --> 
	        <span class="btn-user float-right"><a>신고</a></span>
         	</footer>
         	<br>html과 css를 한 번도 해본 적이 없는데 수업을 들을 수 있을까요?

            <div class="media mt-4 tutor-reply">
              <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt=""> <!-- 댓글 프로필사진 -->
              <div class="media-body subcontent">
				<div class="mt-0 nick">아기천사 튜티장</div>
				<footer class="blockquote-footer">
					<cite title="Source Title">2019-06-11 17:33 작성</cite>
					<!-- 신고 --> 
					<span class="btn-user float-right"><a>신고</a></span>
				</footer>
				<br>네 저도 초급입니다!
              </div>
            </div>
          </div>
        </div>

      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">

        <!-- Search Widget -->
		<div class="card my-4" id="fixed">
			<h5 class="card-header" style="font-weight: bold;">${selectTutoringTutee.TUTORING_TITLE }</h5>
			<div class="card-body">
				<div class="row">
					<div class="list-unstyled mb-0" id="table">
						<div class="row-div">
							<span class="cell col1 subcontent">예약 인원</span>
							<span class="cell col2" style="font-weight: bold;"><h5>${selectTotReservationCount }명</h5></span>
						</div>
						<div class="row-div">
							<span class="cell col1 subcontent">희망 참가비</span>
							<span class="cell col2" style="font-weight: bold;"><h5>${selectTutoringTutee.ENTRY_COST } 원</h5></span>
						</div>
						<div class="row-div">
							<span class="cell col1 subcontent">희망 일정</span>
							<span class="cell col2" style="font-weight: bold;"><h5>최대 ${selectTutoringTutee.ENTIRE_PERIOD }회<c:forEach var="time" items="${selectTutoringTime}">
					${time.WEEDAY_END }-${time.AM_PM }</c:forEach> </h5></span>
						</div>
					</div>
				</div>
				<c:choose>
					<c:when test="${selectReservationCount == 1 }">
						<input type="button" value="예약취소" class="btn btn-primary btn-block" onclick="deleteReservation?TUTORING_TUTEE_ID=${selectTutoringTutee.TUTORING_TUTEE_ID}">
					</c:when>
					<c:otherwise>
						<input type="button" value="예약하기" class="btn btn-primary btn-block" onclick="insertReservation?TUTORING_TUTEE_ID=${selectTutoringTutee.TUTORING_TUTEE_ID}">
					</c:otherwise>
				</c:choose>
				<br>
				<c:choose>
					<c:when test="${selectApplyCount == 1 }">
						<input type="button" value="튜터 지원취소" class="btn btn-primary btn-block" onclick="deleteApply?TUTORING_TUTEE_ID=${selectTutoringTutee.TUTORING_TUTEE_ID}">
					</c:when>
					<c:otherwise>
						<input type="button" value="튜터 지원하기" class="btn btn-primary btn-block" onclick="insertApply?TUTORING_TUTEE_ID=${selectTutoringTutee.TUTORING_TUTEE_ID}">
					</c:otherwise>
				</c:choose>
			</div>
		 </div>
	   </div><!-- Sidebar Widgets Column -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
<!--   <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    /.container
  </footer> -->

  <!-- Bootstrap core JavaScript -->
  <script src="<%=cp%>/vendor/cbr/vendor/jquery/jquery.min.js"></script>
  <script src="<%=cp%>/vendor/cbr/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>