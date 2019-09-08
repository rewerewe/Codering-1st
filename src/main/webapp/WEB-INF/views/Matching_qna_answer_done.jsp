<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<meta charset="UTF-8">
<title>Matching_qna_answer_done.jsp</title>


<style>

.wrap-table {
  width: 100%;
  border-radius: 10px;
  overflow: hidden;
}

.table {
  width: 100%;
  display: table;
  margin: 5px;;
}

@media screen and (max-width: 768px) {
  .table {
    display: block;
  }
}

.row1 {
  display: table-row;
  background: #fff;
}

.row1.header {
  color: #ffffff;
  background: #bb68db;
}


@media screen and (max-width: 768px) {
  .row1 {
    display: block;
  }

  .row.header {
    padding: 0;
    height: 0px;
  }

  .row1.header .cell {
    display: none;
  }

  .row1 .cell:before {
    font-family: Poppins-Bold;
    font-size: 12px;
    color: #808080;
    line-height: 1.2;
    text-transform: uppercase;
    font-weight: unset !important;

    margin-bottom: 13px;
	content: attr(data-title);
    min-width: 98px;
    display: block;
  }
}





.cell {
  display: table-cell;
}

@media screen and (max-width: 768px) {
  .cell {
    display: block;
  }
}

.row1 .cell {
  font-family: Poppins-Regular;
  font-size: 15px;
  color: #666666;
  line-height: 1.2;
  font-weight: unset !important;

  padding-top: 20px;
  padding-bottom: 20px;
  border-bottom: 1px solid #f2f2f2;
}

.row1.header .cell {
  font-family: Poppins-Regular;
  font-size: 18px;
  color: #fff;
  line-height: 1.2;
  font-weight: unset !important;

  padding-top: 19px;
  padding-bottom: 19px;
}

.row1 .cell:nth-child(1) {
  width: 15%;
}

.row1 .cell:nth-child(2) {
  width: 36%;
}

.row1 .cell:nth-child(3) {
  width: 15%;
}

.row1 .cell:nth-child(4) {
  width: 17%;
}

.row1 .cell:nth-child(5) {
  width: 17%;
}


.row1 .cell
{
	align-content: center;
	text-align: center;
	padding: 10px;
}

.table, .row1 {
  width: 100% !important;
}

.row-body:hover {
  background-color: #fdf5fe;
  cursor: pointer;
}

@media (max-width: 768px) {
  .row1 {
    border-bottom: 1px solid #f2f2f2;
    padding-bottom: 18px;
    padding-top: 30px;
    padding-right: 15px;
    margin: 0;
  }
  
  .row1 .cell {
    border: none;
    padding-left: 30px;
    padding-top: 16px;
    padding-bottom: 16px;
  }
  .row1 .cell:nth-child(1) {
    padding-left: 30px;
  }
  
  .row1 .cell {
    font-family: Poppins-Regular;
    font-size: 18px;
    color: #555555;
    line-height: 1.2;
    font-weight: unset !important;
  }

  .table, .row1, .cell {
    width: 100% !important;
  }
}


 
</style>

<script type="text/javascript">
	
	$(document).ready(function() 
	{
		var PROCESS = $("input[name=process]").val();
		var TUTORING_TUTEE_ID = $("input[name=tutoringId]").val();

		$("#qnaList").click(function()
		{
			$("#aTag").click();
		});
		
		
		
		$("#aTag").click(function()
		{
			location.href = "<%=cp%>/tutee_tutorlist?TUTORING_TUTEE_ID=" + TUTORING_TUTEE_ID;
		});
		
		 
		
		if(PROCESS == '답변완료')
		{
			$("#ansbox").css("display", "none");
			sentAnswer();
		}
		else
		{
			// 답변 등록
			$("#button-addon2").click(function() 
			{
				var MEMBER_ID = $("input[name=memberId]").val();
				var TUTORING_TUTEE_ID = $("input[name=tutoringId]").val();
				var FAQ_CONTENT = $("#answer").val();
				var FAQ_ID = $("input[name=faqId]").val();
				
				if (FAQ_CONTENT == "") 
				{
					alert("내용을 입력해주세요.");
					$("#msg").focus();
					return;
				}
				else
				{
					$.ajax({
			             
			           type : "POST",
			           url : "<c:url value = '/tutee_qnapage_answer_insert_ajax' />",
			           data : {"MEMBER_ID" : MEMBER_ID,
			        	   	   "TUTORING_TUTEE_ID" : TUTORING_TUTEE_ID,
			        	   	   "FAQ_CONTENT" : FAQ_CONTENT,
			        	   	   "FAQ_ID" : FAQ_ID},
			           success : function(data){
			        	   sentAnswer();
			        	   $("#ansbox").css("display", "none");
			           },
			           error : function(){
			               alert('error');
			           }
					             
					});
				}
				
			
			});
		}
	});
	
	
	
	// 답변 조회
	function sentAnswer() 
	{
		var FAQ_ID = $("input[name=faqId]").val();
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/tutee_qnapage_answer_ajax' />",
			data : {"FAQ_ID" : FAQ_ID},
			dataType: "json",
			success : function(data)
			{
				var strDone = "";
				
				console.log(data);
				
				for (var i = 0; i < data.length; i++)
				{
					strDone += "<div class='input-group mb-3'>";
					strDone += "	<div class='media mt-4 tutor-reply' style='width: 632px; background-color: #fdf5fe;'>";
					strDone += "			<input type='hidden' name='faqId' value='"+ data[i].FAQ_ID +"'>";
					strDone += "			<input type='hidden' name='tutoringId' value='"+ data[i].TUTORING_TUTEE_ID +"' >";
					strDone += "			<img class='d-flex mr-3 rounded-circle' src='" + data[i].PROF_PATH + "' alt='프로필사진' style='width: 50px; height: 50px;'>";
					strDone += "			<div class='media-body subcontent'>";
					strDone += "				<div class='mt-0'> 내가 쓴 답변 </div>";
					strDone += "				<footer class='blockquote-footer'>";
					strDone += "				<cite title='Source Title'>"+ data[i].FAQ_DATE +" 작성</cite>";
					strDone += "				<span class='btn-user float-right'><a>신고</a></span>";
					strDone += "				</footer>";
					strDone += "				<br>"+ data[i].FAQ_CONTENT +"";
					strDone += "			</div>";
					strDone += "	</div>";
					strDone += "</div>";
				}
				
				alert(strDone);
			
				$("#askAns").html(strDone);
				
			},
			error : function(data) 
			{
				alert("error");
			}
				
		}); 
	
		
	}
	
	

	

	// 탭
	$(function()
	{
		var $tabButtonItem = $('#tab-button li'), $tabSelect = $('#tab-select'), $tabContents = $('.tab-contents'), activeClass = 'is-active';

		$tabButtonItem.last().addClass(activeClass);
		$tabContents.not(':last').hide();

		$tabButtonItem.find('a').on('click', function(e)
		{
			var target = $(this).attr('href');

			$tabButtonItem.removeClass(activeClass);
			$(this).parent().addClass(activeClass);
			$tabSelect.val(target);
			$tabContents.hide();
			$(target).show();
			e.preventDefault();
		});

		$tabSelect.on('change', function()
		{
			var target = $(this).val(), targetSelectNum = $(this).prop(
					'selectedIndex');

			$tabButtonItem.removeClass(activeClass);
			$tabButtonItem.eq(targetSelectNum).addClass(activeClass);
			$tabContents.hide();
			$(target).show();
		});
	});

</script>




<div class="container">
	<div class="row">
		<section class="content mx-auto">


			<!-- -------------------------------- -->
<!-- 			<br />
			<br /> -->
			<div class="tabs">
			<!-- 선택한 튜터링	 -->		

				<div class="tab-button-outer">
					<ul id="tab-button">
						<li><a href="" id="aTag">튜터매칭</a></li>
						<li><a href="#tab02">문의관리</a></li>
					</ul>
				</div>
				<div class="tab-select-outer">
					<select id="tab-select">
						<option value="#tab01">튜터매칭</option>
						<option value="#tab02">문의관리</option>
					</select>
				</div>


				<!-- TAB1 -->
				<div id="tab01" class="tab-contents">

					<!------------------------------- 내용 ---------------------------->
					<div class="panel panel-default">
						<div class="panel-body">
							목록
						</div>
					</div>
					<!-- close 내용 -->


				</div>
				<!-- close TAB1 -->

				<!-- TAB2 -->
				<div id="tab02" class="tab-contents">
					<div class="panel panel-default">
						<!-- <div class="limiter"> -->
						<div class="panel-body">
							<!-- <div class="container-table"> -->
							<div class="wrap-table">
							  	<div class="media mb-4 ">
						          <div class="media-body subcontent">
						           
						              <div class="media mt-4 tutor-reply" style="width: 632px; background-color: #fff;">
						              <input type="hidden" name="memberId" value="${loginInfo.MEMBER_ID }" >
						              <!--  <input type="hidden" name="memberId" value="3" /> -->
						              <!-- 문의 상세보기 -->
						              <c:forEach var="qnaPage" items="${qnaPage }">
						              	  <input type="hidden" name="process" value="${qnaPage.PROCESS }">
						              	  <input type="hidden" name="faqId" value="${qnaPage.FAQ_ID }">
						              	  <input type="hidden" name="tutoringId" value="${qnaPage.TUTORING_TUTEE_ID }" >
						              	  <img class="d-flex mr-3 rounded-circle" src="${qnaPage.PROF_PATH }" alt="프로필사진" style="width: 50px; height: 50px;"> <!-- 댓글 프로필사진 -->
							              <div class="media-body subcontent">
											<div class="mt-0">${qnaPage.NICKNAME }</div>
											<footer class="blockquote-footer">
												<cite title="Source Title">${qnaPage.FAQ_DATE } 작성</cite>
												<!-- 신고 --> 
												<span class="btn-user float-right"><a>신고</a></span>
											</footer>
											<br>${qnaPage.FAQ_CONTENT }
							              </div>
						              </c:forEach>
						          	</div>
						          	
						          	<!-- 답변요청 (답변 입력 텍스트박스) -->
									<div id="askAns"></div>
									<div id="ansbox">
									<br><br><br><br>
										<div class='input-group mb-3' >
										
												<textarea class='form-control' rows='5' placeholder='답변을 입력하세요.' id='answer' style='resize: none;'></textarea>
											<div class='input-group-append'>
												<button class='btn btn-outline-secondary' type='button' id='button-addon2'>등록</button>
											</div>
										</div>
										</div>
									<!-- 답변완료 (답변 조회) -->
								  
								  
								  <br><br><br>
								  <div align="center">
					             	 <button class="btn btn-outline-secondary" type="button" id="qnaList">문의목록</button>
					        	  </div>
								  
						         </div>
						       	</div>

								</div>
							</div>
						</div>
					</div>
				<!-- close TAB2 -->

			</div>

			<!-- -------------------------------- -->
		</section>
	</div>
</div>



























