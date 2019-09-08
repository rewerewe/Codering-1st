<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<style type="text/css">
#contents {
	float: left;
	height: 100%;
	width: 80%;
}

.bold {
	font-size: 15pt;
	font-weight: bold;
}

.tab1 {
	text-align: left;
	font-size: 18pt;
	font-weight: bold;
}

.row-career
{
	margin-bottom: 20px;
}

.col-career
{
	margin-bottom: 10px;
}


.profilephoto {
	margin: 10px;
	width: 100%;
	/* float: left; */
	height: 100%;
}

.profilephoto1 {
	float: left;
}

.tutorprofile {
	float: left;
	margin-top: 20px;
	margin-left: 40px;
	width: 80%;
}

.tutorname {
	font-size: 18pt;
	font-weight: bold;
}

.tutorProfileReviseBox {
	float: left;
	width: 50%
}

.tutorProfileButtons1 {
	float: left;
	width: 130px;
	margin-right: 10px;
}

.tutorProfileButtons2 {
	float: left;
	width: 120px;
	margin-right: 10px;
}
</style>

<script type="text/javascript">
	$.datepicker.setDefaults(
	{

		dateFormat : 'yy-mm-dd',
		changeMonth : true,
		changeYear : true,
		dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
		prevText : "이전달",
		nextText : "다음달",
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],

	});

	$(function()
	{
		$("#datepicker1, #datepicker2, #datepicker3, #datepicker4, #datepicker5, #datepicker6").datepicker();
	});
	
	
	$(document).ready(function()
	{
		
		var list_category = new Array();
		
		// 카테고리 리스트 값 받아와서 해당되는 체크박스 체크하기
		<c:forEach var='category' items='${category}'> 
			list_category.push('${category.INTEREST_ID}') 
		</c:forEach>

		for(var i=0; i<list_category.length; i++)
		{
			$('input:checkbox[name="category-check"]').each(function()
			{
				if(this.value == list_category[i])
				{
					this.checked = true;
				}
					
			});
		
		}
		
		
		/* 체크박스 테스트
		$('input:checkbox[name="category-check"]').each(function()
		{
			if(this.value == 7)
			{
				this.checked = true;
			}
		});
		*/
		
		

		
		// 경력 목록 추가/삭제
		// 첫번째 추가하기 버튼
		$("#add-button01").click(function()
		{
			$("#add02").show();
			$("#add-button01").hide();
			$("#del-button01").show();
		});
		
		// 두번째 추가하기 버튼
		$("#add-button02").click(function()
		{
			$("#add03").show();
			$("#add-button02").hide();
			$("#del-button02").show();
		});
		
		// 첫번째 삭제하기 버튼 (내용 삭제)
		$("#del-button01").click(function()
		{
			var $dates = $("#datepicker1, #datepicker2").datepicker();
			$dates.datepicker("setDate", null);
			$("#career01").val("");
		});
				
		// 두번째 삭제하기 버튼 (내용 삭제)
		$("#del-button02").click(function()
		{
			var $dates = $("#datepicker3, #datepicker4").datepicker();
			$dates.datepicker("setDate", null);
			$("#career02").val("");
		});
				
		// 세번째 삭제하기 버튼 (내용 삭제)
		$("#del-button03").click(function()
		{
			var $dates = $("#datepicker5, #datepicker6").datepicker();
			$dates.datepicker("setDate", null);
			$("#career03").val("");
		});
				
		
		// 경력 불러오기
		var careerCount = $('input[name=careerCount]').val();
		
		// 경력 두 개 or 세 개일 때 
		// 두번째 목록까지 나올 수 있도록 첫번째 추가하기 버튼 자동 클릭
		if(careerCount == 2)
		{
			$("#add-button01").trigger("click");
		}
		else if(careerCount == 3)
		{
			$("#add-button02").trigger("click");
		}
		
		
		// 언어 및 레벨 불러오기
	 	var interestLength = $("input[name='interestId']").length;
	    var interestId = new Array(interestLength);
	    var levelId = new Array(interestLength);
	    
	    for(var i=0; i<interestLength; i++)
	    {                          
	    	interestId[i] = $("input[name='interestId']")[i].value;
	    	levelId[i] = $("input[name='interestId']")[i].value;
	    }

		for (var i = 0; i < interestLength; i++)
		{
			$('#lang-select option').eq(interestId[i]).prop('selected', true);
			$('#lvl-select option').eq(levelId[i]).prop('selected', true);
			
			$("#add-lang").trigger("click");	////
		}
		
		// 언어 및 레벨 추가하기 버튼 클릭 시, 입력창 생성
		$("#add-lang").click(function()
		{
			var lang = $("#lang-select option:selected").text();
			var lvl = $("#lvl-select option:selected").text();
			
			var tag = "	<div class='alert alert-dismissible alert-secondary tutorProfileButtons1'>"
					  + "<button type='button' class='close' data-dismiss='alert' >&times;</button>"
					  + lang + " " + lvl
					  + "</div>";
					  
			//text함수를 적용하여 html함수를 사용했던 같은 내용의 문자열을 표출해본다.
			$("#tag-lang").append(tag);	
		});
		
		
		
		
		// 링크 추가 버튼 클릭 시, 입력창 생성
		$("#add-link01").click(function()
		{
			$("#link02").show();
			$("#add-link01").hide();
			$("#del-link01").show();
		});
		
		$("#add-link02").click(function()
		{
			$("#link03").show();
			$("#add-link02").hide();
			$("#del-link02").show();
		});
		
		
		// 링크 삭제 버튼 클릭 시, 내용 삭제
		$("#del-link01").click(function()
		{
			$("#link-select01 option:eq(0)").attr("selected", "selected");
			$("#linkText01").val("");
		});
		
		$("#del-link02").click(function()
		{
			$("#link-select02 option:eq(0)").attr("selected", "selected");
			$("#linkText02").val("");
		});
		
		$("#del-link03").click(function()
		{
			$("#link-select03 option:eq(0)").attr("selected", "selected");
			$("#linkText03").val("");
		});
		
		
		// 링크 불러오기
		// 링크 개수에 따라 show/hide 결정 
		var linkCount = $('input[name=linkCount]').val();

		if(linkCount == 2)
		{
			$("#add-link01").trigger("click");
		}
		else if(linkCount == 3)
		{
			$("#add-link02").trigger("click");
		}
		
		
		
		
	});
	
</script>


<div id="contents">

	<div class="tab1">
		| 프로필수정 |
		<hr>
	</div>


	<!-- 사진 / 사진수정 -->
	<div class="row">
		<div class="col-3">
			<img width="100px" height="100px"
				src="${info.PROF_PATH }"
				alt="프로필 이미지">
		</div>
		<div class="col-7">

			<div class="form-group" style="width: 70%; margin-top: 20px;">
				<div class="input-group mb-3">
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="inputGroupFile02">
						<label class="custom-file-label" for="inputGroupFile02"></label>
					</div>
					<div class="input-group-append">
						<span class="input-group-text" id="">등록하기</span>
					</div>
				</div>
			</div>
			<p>5MB 이하, jpg / png
		</div>
	</div>

	<!-- 상세정보 -->

	<!-- 이름 -->
	<div class="row">
		<div class="col-3">
			<span class="bold">이름</span>
		</div>
		<div class="col-8">
			<input type="text" class="form-control" value="${info.TUTOR_NAME }" id="tutorname"
				style="width: 41%">
		</div>
	</div>
	<br>

	<!-- 전화번호 -->
	<div class="row">
		<div class="col-3">
			<span class="bold">전화번호</span>
		</div>
		<div class="col-8">
			<div class="row row-career">
				<div class="tutorProfileReviseBox col-8">
					<input type="text" class="form-control" value="${info.PHONENUM }" id="tutorphone">
				</div>
				<div class="col-4">
					<button type="button" class="btn btn-primary">인증하기</button>
				</div>
			</div>
		</div>
	</div>
	<br>

	<!-- 레벨설정 -->
	<div class="row">
		<div class="col-3">
			<span class="bold">레벨설정</span>
		</div>
		<div class="col-8">
			<div class="row row-career">
				<div class="col-8">
					<select class="custom-select" id="lang-select" style="width: 45%">
						<option value="1" selected="selected">Java</option>
						<option value="2">Oracle</option>
						<option value="3">MySQL</option>
						<option value="4">JavaScript</option>
						<option value="5">PYTHON</option>
					</select> <select id="lvl-select" class="custom-select" style="width: 45%">
						<option value="1" selected="selected">초급</option>
						<option value="2">중급</option>
						<option value="3">고급</option>
					</select>
				</div>
				<div class="col-4">
					<button type="button" class="btn btn-primary" id="add-lang">추가하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 레벨 설정 프린트 -->
	<div class="row">
		<div class="col-3"></div>
		<div class="col-7" id="tag-lang">
			
			<c:forEach var="interest" items="${interest }">
				<input type="hidden" name="interestId" value="${interest.INTEREST_ID }" >
				<input type="hidden" name="levelId" value="${interest.LEVEL_ID }">
			</c:forEach>
<%-- 			<c:forEach var="interest" items="${interest }">
				<div class="alert alert-dismissible alert-secondary tutorProfileButtons1">
					<button type="button" class="close" data-dismiss="alert" id="${interest.TUTOR_INTEREST_ID }">&times;</button>
					${interest.INTEREST_CAT } ${interest.LEVEL_NAME }
				</div>
				<input type="hidden" name="interestCat" value="${interest.INTEREST_CAT }" >
				<input type="hidden" name="levelName">
			</c:forEach> --%>
					
		</div>
	</div>
	
	<br>

	<!-- 경력 -->
	<div class="row">
		<div class="col-3">
			<span class="bold">경력</span>
		</div>
		<div class="col-8">
		<span style="color: red; font-weight: bold;"> &nbsp;&nbsp;&nbsp; ※ 경력은 최대 3개까지 입력 가능합니다.</span>
		<input type="hidden" name="careerCount" value="${careerCount }" >	
			<div class="row row-career" id="add01">
				<div class="col-12 col-career">
					<input type="text" id="datepicker1" value="${career[0].CAREER_START }" 
						readonly="readonly" placeholder="시작 날짜"
						style="width: 38%"> ~ <input type="text" id="datepicker2" value="${career[0].CAREER_END }"
						readonly="readonly" placeholder="종료 날짜" style="width: 38%">
				</div>
				<div class="tutorProfileReviseBox col-8 col-career">
					<input type="text" class="form-control" value="${career[0].CAREER_CONTENT }"
						id="career01" placeholder="경력사항을 입력하세요.">
				</div>
				<div class="tutorProfileReviseBox col-4 col-career">
					<button type="button" class="btn btn-primary" id="add-button01">추가하기</button>
					<button type="button" class="btn btn-primary" id="del-button01" style="display: none;">삭제하기</button>
				</div>
			</div>
			<div class="row row-career" id="add02" style="display: none;">
				<div class="col-12 col-career">
					<input type="text" id="datepicker3" value="${career[1].CAREER_START }"
						readonly="readonly" placeholder="시작 날짜"
						style="width: 38%"> ~ <input type="text" id="datepicker4" value="${career[1].CAREER_END }"
						readonly="readonly" placeholder="종료 날짜" style="width: 38%">
				</div>
				<div class="tutorProfileReviseBox col-8 col-career">
					<input type="text" class="form-control" value="${career[1].CAREER_CONTENT }"
						id="career02" placeholder="경력사항을 입력하세요.">
				</div>
				<div class="tutorProfileReviseBox col-4 col-career">
					<button type="button" class="btn btn-primary" id="add-button02">추가하기</button>
					<button type="button" class="btn btn-primary" id="del-button02" style="display: none;">삭제하기</button>
				</div>
			</div>
			<div class="row row-career" id="add03" style="display: none;" >
				<div class="col-12 col-career">
					<input type="text" id="datepicker5" value="${career[2].CAREER_START }"
						readonly="readonly" placeholder="시작 날짜"
						style="width: 38%"> ~ <input type="text" id="datepicker6" value="${career[2].CAREER_END }"
						readonly="readonly" placeholder="종료 날짜" style="width: 38%" >
				</div>
				<div class="tutorProfileReviseBox col-8 col-career">
					<input type="text" class="form-control" value="${career[2].CAREER_CONTENT }"
						id="career03" placeholder="경력사항을 입력하세요.">
				</div>
				<div class="tutorProfileReviseBox col-4 col-career">
					<button type="button" class="btn btn-primary" id="del-button03">삭제하기</button>
				</div>
			</div>
		</div>
	</div>
	
	<br>



	<!-- 카테고리 -->
	<div class="row">
		<div class="col-3">
			<span class="bold">카테고리</span>
		</div>
		<div class="col-2">
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" name="category-check"
					id="interestCheck1" value="6"> <label
					class="custom-control-label" for="interestCheck1">웹</label>
			</div>
		</div>
		<div class="col-2">
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" name="category-check"
					id="interestCheck2" value="7"> <label
					class="custom-control-label" for="interestCheck2">모바일</label>
			</div>
		</div>
		<div class="col-2">
			<div class="custom-control custom-checkbox"> 
				<input type="checkbox" class="custom-control-input" name="category-check"
					id="interestCheck3" value="8"> <label
					class="custom-control-label" for="interestCheck3">블록체인</label>
			</div>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-3"></div>
		<div class="col-2">
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" name="category-check"
					id="interestCheck4" value="9"> <label
					class="custom-control-label" for="interestCheck4">자료구조</label>
			</div>
		</div>
		<div class="col-2">
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" name="category-check"
					id="interestCheck5" value="10"> <label
					class="custom-control-label" for="interestCheck5">알고리즘</label>
			</div>
		</div>
		<div class="col-2">
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" name="category-check"
					id="interestCheck6" value="11"> <label
					class="custom-control-label" for="interestCheck6">게임개발</label>
			</div>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-3"></div>
		<div class="col-2">
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" name="category-check"
					id="interestCheck7" value="12"> <label
					class="custom-control-label" for="interestCheck7">언어기초</label>
			</div>
		</div>
		<div class="col-2">
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" name="category-check"
					id="interestCheck8" value="13"> <label
					class="custom-control-label" for="interestCheck8">최신기술</label>
			</div>
		</div>
		<div class="col-2">
			<div class="custom-control custom-checkbox">
				<input type="checkbox" class="custom-control-input" name="category-check"
					id="interestCheck9" value="14"> <label
					class="custom-control-label" for="interestCheck9">디자인</label>
			</div>
		</div>
	</div>
	<br>

	<!-- 자기소개 -->
	<div class="row">
		<div class="col-3">
			<span class="bold">자기소개</span>
		</div>
	
		<div class="col-8">
				<div class="row row-career">
					<div class="col-12 col-career">
						<textarea class="form-control" rows="5">${info.INTRO }</textarea>
					</div>
				</div>
		</div>
	</div>



	<!-- 링크등록 -->
	<div class="row">
		<div class="col-3">
			<span class="bold">링크등록</span>
		</div>
		
		<div class="col-8">
			<span style="color: red; font-weight: bold;"> &nbsp;&nbsp;&nbsp; ※ 링크는 최대 3개까지 입력 가능합니다.</span>
			<input type="hidden" name="linkCount" value="${linkCount }" >
				<div class="row row-career" id="link01">
						<div class="col-3">
							<select class="form-control" id="link-select01">
				 				<option  ${link[0].LINK_CAT_ID == 1 ? "selected = 'selected'" : '' }>블로그</option>
								<option  ${link[0].LINK_CAT_ID == 2 ? "selected = 'selected'" : '' }>영상</option>
								<option  ${link[0].LINK_CAT_ID == 3 ? "selected = 'selected'" : '' }>기타</option>
							</select>
						</div>
						<div class="col-7">
							<input type="text" class="form-control" id="linkText01" value="${link[0].LINK_ADDR }" placeholder="링크를 입력하세요.">
						</div>
						<div class="col-2">
							<button type="button" class="btn btn-primary" id="add-link01">추가</button>
							<button type="button" class="btn btn-primary" id="del-link01" style="display: none;">삭제</button>
						</div>
						<br>
				</div>
				<div class="row row-career" id="link02" style="display: none;">
						<div class="col-3">
							<select class="form-control" id="link-select02">
				 				<option  ${link[1].LINK_CAT_ID == 1 ? "selected = 'selected'" : '' }>블로그</option>
								<option  ${link[1].LINK_CAT_ID == 2 ? "selected = 'selected'" : '' }>영상</option>
								<option  ${link[1].LINK_CAT_ID == 3 ? "selected = 'selected'" : '' }>기타</option>
							</select>
						</div>
						<div class="col-7">
							<input type="text" class="form-control" id="linkText02" value="${link[1].LINK_ADDR }"  placeholder="링크를 입력하세요.">
						</div>
						<div class="col-2">
							<button type="button" class="btn btn-primary" id="add-link02">추가</button>
							<button type="button" class="btn btn-primary" id="del-link02" style="display: none;">삭제</button>
						</div>
						<br>
				</div>
				<div class="row row-career" id="link03" style="display: none;">
						<div class="col-3">
							<select class="form-control" id="link-select03">
				 				<option  ${link[2].LINK_CAT_ID == 1 ? "selected = 'selected'" : '' }>블로그</option>
								<option  ${link[2].LINK_CAT_ID == 2 ? "selected = 'selected'" : '' }>영상</option>
								<option  ${link[2].LINK_CAT_ID == 3 ? "selected = 'selected'" : '' }>기타</option>
							</select>
						</div>
						<div class="col-7">
							<input type="text" class="form-control" id="linkText03" value="${link[2].LINK_ADDR }" placeholder="링크를 입력하세요.">
						</div>
						<div class="col-2">
							<button type="button" class="btn btn-primary" id="del-link03">삭제</button>
						</div>
						<br><br>
				</div>
		</div>
		<br> <br> <br> <br> <br> <br> <br> <br>
		<button type="button" class="btn btn-primary btn-lg"
			style="width: 200px; height: 50px; margin-left: 40%;" id="updateBtn">수정하기</button>
		<br> <br> <br> <br> <br> <br> <br> <br>
	</div>
</div>




