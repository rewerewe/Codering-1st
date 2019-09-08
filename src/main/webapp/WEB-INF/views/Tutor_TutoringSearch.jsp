<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>튜터 - 튜터링 찾기</title>
<!---------------------------------- Header ----------------------------------------->
<!-- Custom fonts for this template-->
<link href="${cp}/headerFiles/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">


<!-- Custom styles for this template-->
<link href="${cp}/headerFiles/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${cp}/headerFiles/css/header01.css" rel="stylesheet">

<!-- Bootstrap core JavaScript-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="${cp}/headerFiles/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!--  dropdown -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- Core plugin JavaScript-->
<!-- <script src="${cp}/headerFiles/vendor/jquery-easing/jquery.easing.min.js"></script> -->

<!-- Custom scripts for all pages-->
<script src="${cp}/headerFiles/js/sb-admin-2.min.js"></script>

<link rel="stylesheet" href="css/blog-post.css">
<link rel="stylesheet" href="css/myCss.css" />
<!----------------------------- End Header ----------------------------------------->
<link href="${cp}/css/ces/business-frontpage.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
<link href="${cp}/css/jquery-ui.css" rel="stylesheet">
<link href="${cp}/vendor/ces/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<%-- <script type="text/javascript" src="${cp}/vendor/ces/bootstrap/js/bootstrap.bundle.min.js"></script> --%>
<!-- 가격 슬라이드 -->
<link rel="stylesheet" href="${cp}/css/jih/jquery-ui.css">
<script type="text/javascript" src="${cp}/js/jih/jquery.js"></script>
<script type="text/javascript" src="${cp}/js/jih/jquery-ui.js"></script>

<style type="text/css">
body {
	margin-top: 20px;
	background: white;
}

.avatar.avatar-xl {
	width: 6rem;
	height: 6rem;
}

.avatar {
	width: 4rem;
	height: 4rem;
	line-height: 4rem;
	border-radius: 10%;
	display: inline-block;
	background: #ced4da no-repeat center/cover;
	position: relative;
	text-align: center;
	color: #868e96;
	font-weight: 600;
	vertical-align: bottom;
}

.card {
	background-color: #fff;
	border: 0 solid #eee;
	border-radius: 0;
}

.card {
	margin-bottom: 30px;
	-webkit-box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1), -1px 0 2px
		rgba(0, 0, 0, 0.05);
	box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1), -1px 0 2px
		rgba(0, 0, 0, 0.05);
}

.card-body {
	padding: 1.25rem;
}

.tile-link {
	position: absolute;
	cursor: pointer;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	z-index: 30;
}

/* paging css */
a {
	color: #555;
	text-decoration: none;
}

#paging {
	text-align: center;
	line-height: 1.3em;
	margin-top: 10px;
}

#paging a, #paging strong {
	padding: 2px 5px;
	border: 1px solid #CCC;
	display: inline-block;
	border-radius: 5px;
}

#paging a:hover, #paging strong {
	color: #000;
	border: 1px solid #666;
	background: #CDAFD1;
	text-decoration: none;
	border-radius: 5px;
}

.filterlist {
	list-style:none !important;
	text-align:left !important;
}

.filterlist li.first {
	padding:10px 0px 0px 0px !important;
}

.filterlist li ul {
	list-style:none !important;
}
</style>
<script type="text/javascript">
	var SCH_REG_ID_VAL = '';
	var SCH_INTEREST_ID_VAL = '';
	var SCH_TIME_VAL = '';
	var SCH_ENTRY_COST_VAL = '';
	
	$(document).ready(function() {
		// 기존 요청 값 유지
		var SCH_TIME_PREV = '${SCH_TIME}';
		$('#TIME_ID').val(SCH_TIME_PREV);
		
		var SCH_ENTRY_COST_PREV = parseInt('${SCH_ENTRY_COST}' == '' ? 0 : '${SCH_ENTRY_COST}');
		if(SCH_ENTRY_COST_PREV == '') {
			SCH_ENTRY_COST_PREV = 500000;
		}
		
		// 체크박스 클릭 이벤트 핸들러
		$('[id^=REG_ID]').on('click', function() {
			$(this).each(function() {
				SCH_REG_ID_VAL += ',' + $(this).val();
			});
			
			var target = $('#SCH_REG_ID');
			target.val(SCH_REG_ID_VAL);
		});
		
		$('[id^=INTEREST_ID]').on('click', function() {
			$(this).each(function() {
				SCH_INTEREST_ID_VAL += ',' + $(this).val();
			});
			
			var target = $('#SCH_INTEREST_ID');
			target.val(SCH_INTEREST_ID_VAL);
		});
		
		$('#TIME_ID').on('change', function() {
			SCH_TIME_VAL = $(this).val();
			
			var target = $('#SCH_TIME');
			target.val(SCH_TIME);
		});
		
		// 가격 슬라이드
		$("#slider-vertical").slider({
			orientation : "vertical",
			range : "min",
			min : 0,
			max : 1000000,
			value : SCH_ENTRY_COST_PREV,
			slide : function(event, ui) {
				$("#AMOUNT").val(ui.value);
			}
		});
		$("#AMOUNT").val($("#slider-vertical").slider("value"));
		
		// 시간 슬라이드
		/* $("#searchtime-slider-vertical").slider({
			orientation : "horizontal",
			range : "min",
			min : 0,
			max : 24,
			value : 12,
			slide : function(event, ui) {
				$("#SEARCHTIME").val(ui.value);
			}
		});
		$("#SEARCHTIME").val($("#searchtime-slider-vertical").slider("value")); */
		
		// 필터 검색 버튼 클릭 이벤트 핸들러
		$('#btnSearchFilter').on('click', function() {
			// 맨 앞의 , 제거 == Java에서 "1,2" -> ["1", "2"] 처리하기 위해.
			SCH_REG_ID_VAL = SCH_REG_ID_VAL.substring(1, SCH_REG_ID_VAL.length);
			SCH_INTEREST_ID_VAL = SCH_INTEREST_ID_VAL.substring(1, SCH_INTEREST_ID_VAL.length);
			SCH_ENTRY_COST_VAL = $('#AMOUNT').val();
			
			// 값 재설정
			$('#SCH_REG_ID').val(SCH_REG_ID_VAL);
			$('#SCH_INTEREST_ID').val(SCH_INTEREST_ID_VAL);
			$('#SCH_TIME').val(SCH_TIME_VAL);
			$('#SCH_ENTRY_COST').val(SCH_ENTRY_COST_VAL);
			
			$('#filterForm').submit();
		});
		
	});
	
	// 튜터링 상세페이지로 이동 
	function reqTutoringDetail() {
		$('#tutoringDetailForm').submit();
	}
	
	/* 클릭시 필터창 열리고 닫힘 */
	function filter() {
		var filter1 = document.getElementById("filterlist1");
		var filter2 = document.getElementById("filterlist2");
		var filter3 = document.getElementById("filterlist3");
		var filter4 = document.getElementById("filterlist4");

		if (filter1.style.display == 'none') {
			filter1.style.display = 'block';
		} else {
			filter1.style.display = 'none';
		}
		if (filter2.style.display == 'none') {
			filter2.style.display = 'block';
		} else {
			filter2.style.display = 'none';
		}
		if (filter3.style.display == 'none') {
			filter3.style.display = 'block';
		} else {
			filter3.style.display = 'none';
		}
		if (filter4.style.display == 'none') {
			filter4.style.display = 'block';
		} else {
			filter4.style.display = 'none';
		}
	}
	/* 클릭시 필터창 열리고 닫힘 End */
	
	function getPaging(curPageNo) {
		var param = '';
		param += '?curPageNo=' + curPageNo;
		
		var url = '${cp}/tutor_TutoringSearchList' + param;
		location.href = url;
	}
</script>
</head>

<body>

<c:import url="Header_Sidebar_done.jsp"></c:import>
<%-- 	
	<div id="test">
	${list}
	</div> 
--%>

	<!-- 제목부터 필터까지 -->
	<div class="container">
		<br>
		<br>
		<br>
	
		<!-- 튜터링 찾기 제목 -->
		<div style="padding: 200px 0px 50px 0px;">
			<span style="font-family: Noto Sans KR; font-weight: bold; font-size: 25px; border-top: 1px solid gray; border-bottom: 1px solid gray; padding: 10px;">
				튜터링 찾기 - 튜티 모집
			</span>
		</div>
	
		<!-- 튜터링 3개 출력 -->
			<div class="row">
		<c:forEach var="item" items="${list}" varStatus="vs">
				<div class="col-md-4 mb-5">
					<div class="card h-100">
						<img class="card-img-top" src="images/sample.jpg" alt=""> 
						<img style="padding: 0px 0px -30px 0px; position: absolute; top: 180px; left: 120px; width: 100px; height: 100px; border: 3px solid white; border-radius: 50%;" src="images/tutor.png" />
						<div class="card-body" style="margin-top: 15%;">
							<h4 class="card-title" style="text-align: center;">
								${item.TITLE}
							</h4>
							<p class="card-text" style="text-align: center; font-size: 17px;">${item.REG_NAME}<br>자바스크립트 초급<br>
							<span style="color: #FE642E; font-weight: bold;">${item.ENTRY_COST}원</span> 
							<span style="color: gray; font-weight: bold; font-size: 13px;">/ ${item.WEEK}주 </span>
							</p>
						</div>
						<%-- <form onclick="TutoringDetail" method="post" >
							<input type="hidden" id=TUTORING_TUTOR_ID name=TUTORING_TUTOR_ID value="${item.TUTORING_TUTOR_ID }">
							<div class="card-footer" style="text-align: center;">
								<a href="#" class="btn btn-primary">튜터링 상세보기</a>
							</div>
						</form> --%>
						
						<form id="tutoringDetailForm" method="post" action="${cp}/TutoringDetail">
							<a href="#" onclick="reqTutoringDetail()" class="btn btn-primary">튜터링 상세보기</a>
						</form>



					</div>
				</div>
		</c:forEach>
			<div style="display: flex; flex-direction: column; align-items: center; padding: 10px;">
				<!-- 개설하기 버튼 -->       
			    <div>
			       <button class="btn btn-primary btn-lg btn-block" style="font-weight:bold; width: 1050px !important; height:60px; background-color:#8D44AD; border-color: #8D44AD; padding: 5px; margin: 20px 20px 30px 20px;">개설하기</button>
			    </div>
			                  
			    <!-- Filter 영역 --> 
				<div style="border-top:1px solid gray; border-bottom:1px solid gray; padding:10px; width: 1100px;">
				   <span style="font-family:Noto Sans KR; font-weight:bold; font-size:20px;">Filter</span>
				</div>   
				
				<!-- 4칸 영역 -->
				<div class="row text-center" style="font-family:Noto Sans KR;  padding:20px;">
				
					<div>
						<div style="display:inline; float:left;">
							<div style="display:inline; float:left; padding:0px 15px;">
								<button id="region" style="font-weight:bold; background-color:gray; color:white; width:180px; height:80px; border:0; outline:0;" onclick="filter()">
								 지역<br><span>전체</span>
								</button>
							</div>       
							<div style="display:inline; float:left; padding:0px 15px;">
							  	<button style="font-weight:bold; background-color:gray; color:white; width:180px; height:80px; border:0; outline:0;" onclick="filter()">
							  	언어<br>전체
							  	</button>
							</div>       
							<div style="display:inline; float:left; padding:0px 15px;">
							   	<button style="font-weight:bold; background-color:gray; color:white; width:180px; height:80px; border:0; outline:0;" onclick="filter()">
							   	희망시간<br>전체
							   	</button>
							</div>       
							<div style="display:inline; float:left; padding:0px 15px;">
							   	<button style="font-weight:bold; background-color:gray; color:white; width:180px; height:80px; border:0; outline:0;" onclick="filter()">
							   	예상가격<br>전체
							   	</button>
							</div>       
						</div>
						<div style="display:inline; float:left; padding:0px 0px 0px 10px;">
							<button id="btnSearchFilter" style="font-weight:bold; background-color:#8D44AD; color:white; width:220px; height:80px; font-size:30px;">
							필터 검색
							</button>
						</div>       
						<div style="border-bottom:1px solid gray; padding:50px; width: 1100px;"></div>
					</div>

					<ul id="filterlist1" class="filterlist" style="display:none;">
<c:forEach var="item" items="${filterList1}" varStatus="vs">
						<li <c:if test="${vs.index == 0}"> class="first" </c:if>>
							<ul>
								<li>
									<label>
										<input type="checkbox" id="REG_ID${vs.index}" name="REG_ID" value="${item.REG_ID}">
										<span>${item.REG_NAME}</span>
									</label>
								</li>
							</ul>
						</li>
</c:forEach>
					</ul>
				         
					<ul id="filterlist2" class="filterlist" style="position:relative; left:20px; display:none;">
<c:forEach var="item" items="${filterList2}" varStatus="vs">
						<li <c:if test="${vs.index == 0}"> class="first" </c:if>>
							<ul>
								<li>
									<label>
										<input type="checkbox" id="INTEREST_ID${vs.index}" name="INTEREST_ID" value="${item.INTEREST_ID}">
										<span>${item.INTEREST_CAT}</span>
									</label>
								</li>
							</ul>
						</li>
</c:forEach>
					</ul>
				
					<ul id="filterlist3" class="filterlist" style="position:relative; left:30px; display:none;">
						<li class="first">
							<ul>
								<li>
									<label>
										<select id="TIME_ID" name="TIME_ID">
											<option value="">선택</option>
<c:forEach var="item" items="${filterList3}" varStatus="vs">
											<option value="${item.TIME_VAL}">${item.TIME_VAL}</option>

</c:forEach>
										</select>
										<span>이후</span>
									</label>
								</li>
							</ul>
						</li>
					</ul>            
					
					<!-- 필터링 가격대 슬라이드바 -->
					<ul id="filterlist4" class="filterlist" style="position:relative; left:60px; display:none;">
						<li class="first">
							<ul>
								<li>
									<div>
										<div id="slider-vertical" style="position: relative; left: 75px; height: 100px;"></div>
										<br>
										<div>
											<label for="amount">가격&nbsp;:&nbsp;</label>
											<input type="text" id="AMOUNT" readonly style="border: 0; width: 70px; background: #eee; color: #f6931f; font-weight: bold; text-align: right;">
											<label for="amount">원</label>
										</div>
									</div>
								</li>
							</ul>
						</li>         
					</ul>
				</div>
			</div>
		</div>

		<br>
		<br>
	
		<!-- 튜터링 리스트 출력 -->
		<div class="container">
		<c:if test="${list2Cnt > 0}">
			<c:forEach var="item" items="${list2}" varStatus="vs">
				<div class="card">
					<div class="card-body" style="position: relative; left: 30px;">
						<div class="row">
							<div class="col">
								<div class="media align-items-center">
									<span style="background-image: url( 'images/banner5.jpg' );" class="avatar avatar-xl mr-3"></span>
									<div class="media-body overflow-hidden">
										<h5 class="card-text mb-0">${item.TITLE}</h5>
										<p class="card-text text-uppercase text-muted">${item.MIN_NUM} ~ ${item.MAX_NUM}명</p>
										<p class="card-text">
											${item.START_DATE} <br> ${item.WEEK}주 과정
										</p>
									</div>
								</div>
								<a href="#" class="tile-link"></a>
							</div>
							<div class="col-2">
								<br> <br> 
								<span style="font-size: 20px; position: relative; right: 20px;">${item.ENTRY_COST}원</span>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${list2Cnt <= 0}">
				<div class="card">
					<div class="card-body" style="position: relative; left: 30px;">
						<div class="row">
							<div class="col">
								<div class="media align-items-center">
									<span style="background-image: url( 'images/banner5.jpg' );" class="avatar avatar-xl mr-3"></span>
									<div class="media-body overflow-hidden">
										<h5 class="card-text mb-0">조회 결과가 없습니다.</h5>
										<p class="card-text text-uppercase text-muted"></p>
										<p class="card-text"></p>
									</div>
								</div>
								<a href="#" class="tile-link"></a>
							</div>
							<div class="col-2">
								<br><br> 
								<span style="font-size: 20px; position: relative; right: 20px;"></span>
							</div>
						</div>
					</div>
				</div>
		</c:if>
		</div>
	
		<br>
		<br>
	
		<!-- 튜터링 리스트 페이징 -->
		<div id="paging" style="padding: 0px 0px 100px; text-decoration: none;">
			${pagingHTML}
		<!-- <a href="#">Prev</a> <a href="#">1</a> <strong>2</strong> <a href="#">3</a><a href="#">4</a> <a href="#">5</a> <a href="#">Next</a> -->
		</div>
	
		<!-- 코드링 앱에서도 만나요 Footer -->
		<footer class="py-5" style="background-color: #9B59B6; height: 400px;">
			<div class="container">
				<p class="m-0 text-white" style="font-size: 40px; font-weight: bold; padding: 60px 0px 0px 230px;">코드링,</p>
				<p class="m-0 text-white" style="font-size: 40px; font-weight: bold; padding: 20px 0px 0px 230px;">곧 앱에서도 만나요!</p>
			</div>
	
			<div style="position: relative; top: -210px; padding: 0px 0px 0px 850px;">
				<img src="images/cellphone.png">
			</div>
		</footer>
	</div>
	
	<form id="filterForm" name="filterForm" action="${cp}/tutor_TutoringSearchList" method="post">
		<input type="hidden" id="SCH_REG_ID" name="SCH_REG_ID" value="">
		<input type="hidden" id="SCH_INTEREST_ID" name="SCH_INTEREST_ID" value="">
		<input type="hidden" id="SCH_TIME" name="SCH_TIME" value="">
		<input type="hidden" id="SCH_ENTRY_COST" name="SCH_ENTRY_COST" value="">
	</form>

</body>

</html>