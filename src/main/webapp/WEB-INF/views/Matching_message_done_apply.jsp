<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<meta charset="UTF-8">
<title>Matching_message_done.jsp</title>

<script type="text/javascript">
	$(function()
	{
		$(window).on("load", function()
		{
			// 스크롤 아래로 내리기
			$("#scroll3").scrollTop($("#scroll3")[0].scrollHeight);

			$("#scroll3").mCustomScrollbar(
			{
				scrollButtons :
				{
					enable : true
				},
				theme : "dark-thin",
				scrollbarPosition : "outside",
				autoHideScrollbar : false,
				alwaysShowScrollbar : 2
			});
		});
	});
	

	// 탭
	$(function()
	{
		var $tabButtonItem = $('#tab-button li'), $tabSelect = $('#tab-select'), $tabContents = $('.tab-contents'), activeClass = 'is-active';

		$tabButtonItem.first().addClass(activeClass);
		$tabContents.not(':first').hide();

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
	
	
	
	$(document).ready(function() 
	{
		sentMsg();
		
		$("#msg").keydown(function(key)
		{
			if(key.keyCode == 13)
			{
				$("#sendit").click();
			}
		});
		
		// 메시지 등록
		$("#sendit").click(function() 
		{
			var APPLY_ID = $('input[name=applyId]').val();
			var NICKNAME = $('input[name=nickname]').val();
			var CONTENT = $("#msg").val();
			
			if(CONTENT == "")
			{
				alert("내용을 입력해주세요.");
				$("#msg").focus();
				return;
			}
			else
			{
				$.ajax({
		             
		           type : "POST",
		           url : "<c:url value = '/tutee_msg_apply_send_ajax' />",
		           data : {"CONTENT" : CONTENT,
		        	   	   "APPLY_ID" : APPLY_ID,
		        	   	   "NICKNAME" : NICKNAME},
		           success : function(data){
		               sentMsg();
		               $('#msg').val('');
		               
		           },
		           error : function(){
		               alert('send error');
		           }
				             
				});
			}
		});	
		
		
		$("#tutorList").click(function() 
		{
			
			var TUTORING_TUTEE_ID = $('input[name=tutoringId]').val();
			location.href = '<%=cp%>/tutee_tutorlist?TUTORING_TUTEE_ID=' + TUTORING_TUTEE_ID;
			
		});
		
		$("#confirm").click(function() 
		{
			var APPLY_ID = $('input[name=applyId]').val();
			location.href = '<%=cp%>/tutee_msg_confirm_apply?APPLY_ID=' + APPLY_ID;
			
		});
	});
	
	// 대화 조회
	function sentMsg()
	{
		var APPLY_ID = $('input[name=applyId]').val();
		var NICKNAME = $('input[name=nickname]').val();
		var TUTOR_NAME = $('input[name=writer]').val();
		TUTOR_NAME = TUTOR_NAME.trim();
		
		$.ajax({
			type : "POST",
			url : "<c:url value='/tutee_msg_apply_ajax' />",
			data : {"APPLY_ID" : APPLY_ID},
			dataType: "json",
			success : function(data)
			{
				var strMsg = "";
				
				// 대화 메시지 출력
				for (var i = 0; i < data.length; i++)
				{
					strMsg += "		<input type='hidden' name='tutoringId' value='" + data[i].TUTORING_TUTEE_ID + "'/>"
					
					if (TUTOR_NAME != data[i].WRITER)
					{
						strMsg += "					<div class='outgoing_msg'>"
						strMsg += "						<div class='sent_msg'>"
						strMsg += "							<p class='padding_msg '>" + data[i].CONTENT + "</p>"
						strMsg += "							<span class='time_date float-right'>" + data[i].WRITEDATE + "</span>"
						strMsg += "							<span class='time_date'>" + data[i].READCHECK + "</span>"
						strMsg += "						</div> "
						strMsg += "					</div>"
						strMsg += "					<br>"
					}
					else if (TUTOR_NAME == data[i].WRITER)
					{
						strMsg += "				<div class='incoming_msg'>"
						strMsg += "					<div class='incoming_msg_img'>"
						strMsg += "					<img src='" + data[i].PROF_PATH + "'"
						strMsg += "						alt='thumbnail' class='rounded-circle'>"
						strMsg += "					</div>"
						strMsg += "					<div class='received_msg'>"
						strMsg += "						<div class='received_withd_msg'>"
						strMsg += "							<p class='padding_msg'>" + data[i].CONTENT + "</p>"
						strMsg += "							<span class='time_date float-right'>" + data[i].WRITEDATE + "</span>"
						strMsg += "							<span class='time_date'>" + data[i].READCHECK + "</span>"
						strMsg += "						</div>"
						strMsg += "					</div>"
						strMsg += "				</div>"
						strMsg += "				<br>"
					}
				}
				
				if (data[0].MACH_LV_ID == 8)
				{
					$("#confirm").attr("disabled", "disabled"); // MACH_LV 에 따라 변화
					$("#confirmInfo").css("display", "inline");
				}
				else if (data[0].MACH_LV_ID == 12)
				{
					$("#confirm").attr("disabled", "disabled"); // MACH_LV 에 따라 변화
					$("#confirmDone").css("display", "inline");
				}
				
				$("#sent").html(strMsg);
				$("#scroll3").scrollTop($("#scroll3")[0].scrollHeight);
				
			}, 
			error : function(error)
			{
				alert("select error");
			}
		});
		
		
		
	}

	
	
	
</script>



<div class="container">
	<div class="row">
	<section class="content mx-auto">
	
		<div class="tabs">
			<div class="tab-button-outer"> 
				<ul id="tab-button">
					<li><a href="#tab01">튜터매칭</a></li>
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
				<div class="messaging">
					<div class="inbox_msg">
						<div id="msgInfo">
						
							<!-- 튜터 이름 가져오기 -->
							<h5 class='title title_name'>튜터 ${applyTutor.TUTOR_NAME } 님</h5>
							<input type='hidden' name='writer' value=' ${applyTutor.TUTOR_NAME }' />
						
						</div>
						
						<div class="mesgs">  
							<div class="msg_history mCustomScrollbar" id="scroll3">
								<!-- 보낸 메시지 -->	<!-- 받은 메시지 -->
								<input type='hidden' name='applyId' value='${APPLY_ID }' />
								<input type='hidden' name='nickname' value='${loginInfo.NICKNAME }' />
								<div id="sent"></div>
							</div>
							<br>
							<br>
							<br>
						</div><!-- close .mesgs -->
			
						<!-- 메시지 입력 -->
						<div class="type_msg">
							<div class="input_msg_write input-group md-form" align="center">
								<input type="text" id="msg" class="write_msg form-control"
									placeholder="메시지를 입력하세요." />
								<div class="input-group-btn">
									<%-- <input type="hidden" name="sendWriter" value="${loginInfo.NICKNAME }"/> --%>
									<button class="btn btn-default msg_send_btn" type="button" id="sendit">전송</button>
									<!-- <button class="btn msg_send_btn" type="button"><span class="fa fa-paper-plane-o" aria-hidden="true"></span></button> -->
								</div>
							</div>
						</div>
						<br>
						<br>
						<br>
						<br>
						<!-- 확정 버튼 -->
						<div align="center">
							<button class="btn btn-default msg_list_btn" id="tutorList" type="button">튜터목록</button>
							<button class="btn btn-primary msg_confirm_btn" id="confirm" type="button">확정</button>
							<br><br><span id="confirmInfo" style="color: blue; display: none; font-size: small;">튜터의 승인을 기다리는 중입니다. <br>튜터가 승인하면 매칭이 완료됩니다.</span>
							<span id="confirmDone" style="color: blue; display: none; font-size: small;">매칭이 완료되었습니다. <br>튜터가 튜터링을 개설하면 알림을 받을 수 있습니다.</span>
						</div>
		
						<br>
						<br>
			
						</div><!-- .inbox_msg close -->
					</div>
			</div><!-- Tab1 close  -->
			
			
			<!-- TAB2 -->
			<div id="tab02" class="tab-contents">
				<div class="panel panel-default">
					<!-- <div class="limiter"> -->
					<div class="panel-body">
						<!-- <div class="container-table"> -->
						<div class="wrap-table">
							<c:import url="Matching_qna_done.jsp"></c:import>
						</div>
					</div>
				</div>
			</div><!-- close TAB2 -->
		</div><!-- close TAB -->
	</section>
	</div>
</div>



