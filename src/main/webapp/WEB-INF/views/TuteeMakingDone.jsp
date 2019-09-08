<%@ page contentType="text/html; charset=UTF-8"%>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from https://bootdey.com  -->
<!--  All snippets are MIT license https://bootdey.com/license -->
<title>Bootdey.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">

.row {margin-bottom: 50px;}

#circle{border-radius: 50px;
		width:200px;
		height:60px;
}

.btn{font-size: large; color:white;}


.h1{text-align: center;}


</style>
</head>
<body>
<!-- 튜티장이 만든 튜터링 완료 페이지 -->
	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
		rel="stylesheet">
	<div class="container">
		<div class="row flex-lg-nowrap">

			<div class="col mb-3">
				<div class="card" style="padding:100px;">
					<div class="card-body">
						<div class="row">
							<div class="col-2"></div>
							<div class="col-2">
								<div class="text-right">
									<img src="<%=cp%>/images/check.png" style="width:150px">
								</div>
							</div>
							<div class="col-6">
								<h1 class="h1" style="padding-top:10%">
									정규짱짱맨님의 튜터링 개설이 완료되었습니다.
								</h1>
							</div>
						</div>
						<div class="row">
							<div class="col-4"></div>
							<div class="col-8">
								<h2 class="h3">
									개설된 튜터링의 정보는<br>
									[ 튜터페이지 ] > [ 모집중인 튜터링 목록 ]<br>
									에서 확인 가능합니다.
								</h2>
							</div>						
						</div>
						<div class="row">
							<div class="col-4"></div>
							<div class="col-7">
								<h4 class="h4">○○님을 기다리고 있는 많은 튜티들을 만나보세요!</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-4"></div>
							<div class="col-6">
								<img src="<%=cp%>/images/done.png">
							</div>						
						</div>
						<div class="row">
							<div class="col-2">
							</div>
							<div class="col-4">
								<h4 class="h4" style="padding-top:10px;">튜터링의 상세 정보를 확인 해보고 싶으세요?</h4>
							</div>
							<div class="col-2">
								<img src="<%=cp%>/images/directer.png">
							</div>
							<div class="col">
								<button type="button" class="btn btn-primary" style="width:200px; height: 80px; font-size:large;">튜터링 확인하기</button>
							</div>
						</div>
						<div class="text-center">
							<button class="btn btn-primary" id="circle" onclick="location.href=''">메인으로</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	



	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>