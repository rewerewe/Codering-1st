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
<title>mypage_Matching_message_done.jsp</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	
<!---------------------------------- Header ----------------------------------------->
<!-- Custom fonts for this template-->
<link href="<%=cp %>/headerFiles/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">


<!-- Custom styles for this template-->

<%-- <link href="<%=cp %>/headerFiles/css/sb-admin-2.min.css" rel="stylesheet"> --%>
<link href="<%=cp %>/headerFiles/css/header02.css" rel="stylesheet">
<%-- <link rel="stylesheet" type="text/css" href="<%=cp%>/css/lsh/prjMypage.css"> --%>



<!-- Bootstrap core JavaScript-->
<!-- <script src="headerFiles/vendor/jquery/jquery.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script src="headerFiles/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->


<!--  dropdown -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



<!-- Core plugin JavaScript-->
<!-- <script src="headerFiles/vendor/jquery-easing/jquery.easing.min.js"></script> -->

<!-- Custom scripts for all pages-->
<!-- <script src="headerFiles/js/sb-admin-2.min.js"></script> -->




<!----------------------------- End Header ----------------------------------------->


<script type="text/javascript" src="<%=cp %>/headerFiles/js/jquery.js"></script>
<!-- <script type="text/javascript" src="headerFiles/js/bootstrap.js"></script> -->


<!-- contents -->

<!-- <link href="contents/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
      integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!-- <link rel="stylesheet" type="text/css" href="contents/css/matching08.css"> -->
<link rel="stylesheet" href="<%=cp%>/css/lsh/myCss02.css"/>

<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>  -->



<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<link rel="stylesheet" href="<%=cp %>/css/lsh/matching07.css" />
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->


<!-- contents -->






<style type="text/css">
#container {
	width: 1200px;
	/* padding: 20px; */
	margin: 0 auto;
	height: 100%;
}

div {
	/* border: 1px solid #ccc; */
	
}

#contents {
	/* width: 930px; */
	float: left;
}


</style>


</head>
<body>
	<!-- 메뉴 영역 -->
	<c:import url="Header_Sidebar_done.jsp"></c:import>
	<!-- 헤더 -->
	<div>
		<c:import url="Header.jsp"></c:import>

		<div id="container">
		
			<!-- 사이드바 -->
			<div id="sidebar" class="col-md-2 col-sm-9 col-xs-12">
				<c:import url="LeftMenu.jsp"></c:import>
			</div>

			<!-- 내용 -->
			<div id="contents">
				<c:import url="Matching_message_done.jsp"></c:import>
			</div>
		</div>

	</div>
<!-- 
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	 -->
</body>
</html>