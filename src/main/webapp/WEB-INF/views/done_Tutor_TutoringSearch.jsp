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
<title>mypage.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="<%=cp%>/headerFiles/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="<%=cp%>/headerFiles/css/mypage.css">

<!---------------------------------- Header ----------------------------------------->
<!-- Custom fonts for this template-->
<link href="<%=cp%>/headerFiles/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">


<!-- Custom styles for this template-->
<link href="<%=cp%>/headerFiles/css/sb-admin-2.min.css" rel="stylesheet">
<link href="<%=cp%>/headerFiles/css/header01.css" rel="stylesheet">

<!-- Bootstrap core JavaScript-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="<%=cp%>/headerFiles/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!--  dropdown -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- Core plugin JavaScript-->
<!-- <script src="<%=cp%>/headerFiles/vendor/jquery-easing/jquery.easing.min.js"></script> -->

<!-- Custom scripts for all pages-->
<script src="<%=cp%>/headerFiles/js/sb-admin-2.min.js"></script>

<link rel="stylesheet" href="css/blog-post.css">
<link rel="stylesheet" href="css/myCss.css" />
<!----------------------------- End Header ----------------------------------------->

<style type="text/css">
html {
	font-size: 16px;
}
</style>

</head>
<body>
	<!-- 전체 영역 : container -->
	<div class="flex-container">
		<!-- 헤더 영역 : flex-container-header -->
		<div class="flex-container-header">

			<!-- 헤더 : header -->
			<c:import url="Header_Sidebar_done.jsp"></c:import>
		</div>



		<!-- 본문 영역 : flex-container-body -->
		<div class="flex-container-body">
			<div class="flex-item">




				<!-- 본문 상단 : top-content -->
				<div class="top-content">


					<c:import url="Tutor_TutoringSearch.jsp"></c:import>

					<!-- 	</div> end bottom-content -->

				</div>
			</div>
			<!-- 푸터 영역 : flex-container-footer -->
			<div class="flex-container-footer">
				<div class="footer">
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>