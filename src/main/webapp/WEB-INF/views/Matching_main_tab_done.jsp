<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
%>
<meta charset="UTF-8">
<!-- Bootstrap core CSS -->

<style>

/* 추가추가 */

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




<!-- Custom styles for this template -->

<!------ Include the above in your HEAD tag ---------->
<title>Matching_main_tab_done.jsp</title>

<script type="text/javascript">
	
	$(document).ready(function()
	{
		var TUTORING_TUTEE_ID = $('input[name=tutoringId]').val();
		
		
		// 수락/거절/대기/지원 상태 별로 볼 수 있게 하는 버튼 작동
		$('.btn-filter').on('click', function()
		{
			var $target = $(this).data('target');
			if ($target != 'all')
			{
				$('.table tr').css('display', 'none');
				$('.table tr[data-status="' + $target + '"]').fadeIn('slow');
			} else
			{
				$('.table tr').css('display', 'none').fadeIn('slow');
			}
		});
		
		
		// 매칭 상태 버튼 클릭 시 액션
		// 지원 수락 --> 대화 버튼으로 변경
		$('.applyAccept').click(function()
		{
			var id = $(this).attr('id');
			var APPLY_ID = $('input[name='+ id + ']').val();
			location.href = '<%=cp%>/tutee_update_applylv_accept?APPLY_ID=' + APPLY_ID + '&TUTORING_TUTEE_ID=' + TUTORING_TUTEE_ID;
		});
		
		// 지원 거절 --> 목록에서 사라짐
		$('.applyRefuse').click(function()
		{
			//var APPLY_ID = $(this).find('input[name=applyRefuse]').val();
			
			var id = $(this).attr('id');
			var APPLY_ID = $('input[name='+ id + ']').val();
			location.href = '<%=cp%>/tutee_update_applylv_refuse?APPLY_ID=' + APPLY_ID + '&TUTORING_TUTEE_ID=' + TUTORING_TUTEE_ID;
		});
		
		// 초대 거절 당한 삭제 버튼 --> 목록에서 삭제 
		$(".inviteDelete").click(function()
		{
			var id = $(this).attr('id');
			var INVITE_ID = $('input[name='+ id + ']').val();
			location.href = '<%=cp%>/tutee_delete_invitelv?INVITE_ID=' + INVITE_ID + '&TUTORING_TUTEE_ID=' + TUTORING_TUTEE_ID;
		});
		
		// 초대 취소 (대기 버튼 클릭시 모달창에서 선택) --> 목록에서 삭제
		$("#inviteCancel").click(function()
		{
			var id = $(".inviteCancel").attr('id');
			var INVITE_ID = $('input[name='+ id + ']').val();
			location.href = '<%=cp%>/tutee_delete_invitelv?INVITE_ID=' + INVITE_ID + '&TUTORING_TUTEE_ID=' + TUTORING_TUTEE_ID;
		});
		
		
		// 대화 버튼 클릭 시
		$(".msgBtn").click(function()
		{
			var id = $(this).attr('id');
			 
			var machLvId = $('input[name='+ id + ']').eq(0).val();

			
			if(machLvId == 5 || machLvId == 7 || machLvId == 9 || machLvId == 11 ) // 초대튜터와 대화 버튼 클릭 시 --> 대화창으로 이동
			{
				var INVITE_ID = $('input[name='+ id + ']').eq(1).val();
				location.href = '<%=cp%>/tutee_msg_invite?INVITE_ID=' + INVITE_ID+ '&TUTORING_TUTEE_ID=' + TUTORING_TUTEE_ID;
			}
			else if(machLvId == 6 || machLvId == 8 || machLvId == 10 || machLvId == 12) // 지원튜터와 대화 버튼 클릭 시 --> 대화창으로 이동
			{
				var APPLY_ID = $('input[name='+ id + ']').eq(1).val();
				location.href = '<%=cp%>/tutee_msg_apply?APPLY_ID=' + APPLY_ID+ '&TUTORING_TUTEE_ID=' + TUTORING_TUTEE_ID;
			}
			else
				alert("잘못된 접근입니다."); 
			
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
	
</script>







<div class="container">
	<div class="row">
		<section class="content mx-auto">


			<!-- -------------------------------- -->
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

					<!------------------------------- 내용 ---------------------------->
					<div class="">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="float-right">
									<div class="btn-group">
										<button type="button" class="btn btn-success btn-filter"
											data-target="accept">대화</button>
										<button type="button" class="btn btn-warning btn-filter"
											data-target="standby">대기</button>
										<button type="button" class="btn btn-danger btn-filter"
											data-target="refuse">거절</button>
										<button type="button" class="btn btn-primary btn-filter"
											data-target="apply">지원</button>
										<button type="button" class="btn btn-default btn-filter"
											data-target="all">전체보기</button>
									</div>
								</div>
								<div class="table-container">
									<table class="table table-filter">
										<tbody>
											<c:forEach var="tutorList" items="${tutorList }" varStatus="status">
												<input type="hidden" name="tutoringId" value="${tutorList.TUTORING_TUTEE_ID }" />
												<c:choose>
													<c:when test="${tutorList.MACH_LV_ID == 1 }">
														<tr data-status="standby">
															<td class="align-middle">
																<div>
																	<span class="fas fa-arrow-circle-right fa-3x"
																		style="color: #f0ad4e"></span>
																</div>
															</td>
															<td>
																<div class="media">
																	<a href="#" class="float-left"> <img alt="tutor pic"
																		src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg"
																		class="rounded-circle" id="profilePic">
																	</a>
																	<div class="media-body">
																		<span class="media-meta float-right">${tutorList.SUBDATE }</span>
																		<h4 class="title">
																			${tutorList.TUTOR_NAME } <span class="float-right standby">(대기)</span>
																		</h4>
																		<p class="summary">
																			${tutorList.INTRO } <br> |
																			<c:forEach var="tutorLang" items="${tutorLang}">
																				<c:if test="${tutorList.TUTOR_ID == tutorLang.TUTOR_ID }">
																					${tutorLang.INTEREST_CAT } ${tutorLang.LEVEL_NAME }	|															
																				</c:if>
																			</c:forEach>
																		</p>
																	</div>
																</div>
															</td>
																        
															<td class="align-middle">
																<input type="hidden" name="${status.count }" value="${tutorList.SUBID }"/>
																<button type="button" class="btn btn-success btn-warning inviteCancel" id="${status.count }" data-toggle="modal"  data-target="#myModal">대기</button><br/>
																<!-- The Modal -->
																<div class="modal" id="myModal">
																  <div class="modal-dialog">
																    <div class="modal-content">
																
																      <!-- Modal Header -->
																      <div class="modal-header">
																        <button type="button" class="close" data-dismiss="modal">&times;</button>
																      </div>
																
																      <!-- Modal body -->
																      <div class="modal-body">
																        초대한 튜터로부터 응답을 기다리고 있는 중입니다. <br>
																        초대를 취소하시겠습니까?<br>
																        ※ 초대를 취소하면 초대 기록이 삭제됩니다.
																      </div>
																
																      <!-- Modal footer -->
																      <div class="modal-footer">
																        <button type="button" class="btn btn-danger" data-dismiss="modal" id="inviteCancel">초대 취소</button>
																        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
																      </div>
																
																    </div>
																  </div>
																</div>
																<!-- 모달창 -->
															</td>
														</tr>
													</c:when>
													<c:when test="${tutorList.MACH_LV_ID == 2 }">
														<tr data-status="refuse">
															<td class="align-middle">
																<div>
																	<span class="fas fa-arrow-circle-right fa-3x" style="color: #d9534f"></span>
																</div>
															</td>
															<td>
																<div class="media">
																	<a href="#" class="float-left"> <img alt="tutor pic"
																		src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg"
																		class="rounded-circle" id="profilePic">
																	</a>
																	<div class="media-body">
																		<span class="media-meta float-right">${tutorList.SUBDATE }</span>
																		<h4 class="title">
																			${tutorList.TUTOR_NAME } <span class="float-right refuse">(거절)</span>
																		</h4>
																		<p class="summary">
																			${tutorList.INTRO } <br> |
																			<c:forEach var="tutorLang" items="${tutorLang}">
																				<c:if test="${tutorList.TUTOR_ID == tutorLang.TUTOR_ID }">
																					${tutorLang.INTEREST_CAT } ${tutorLang.LEVEL_NAME }	|															
																				</c:if>
																			</c:forEach>
																		</p>
																	</div>
																</div>
															</td>
															<td class="align-middle">
																<input type="hidden" name="${status.count }" value="${tutorList.SUBID }"/>
																<button type="button" class="btn btn-danger btn-answer inviteDelete" data-target="refuse" id="${status.count }">삭제</button>
															</td>
														</tr>
													</c:when>
													<c:when test="${tutorList.MACH_LV_ID == 3 }">
														<tr data-status="apply">
															<td class="align-middle">
																<div>
																	<span class="fas fas fa-arrow-circle-left fa-3x apply"
																		style="color: #2BBCDE"></span>
																</div>
															</td>
															<td>
																<div class="media">
																	<a href="#" class="float-left"> <img alt="tutor pic"
																		src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg"
																		class="rounded-circle" id="profilePic">
																	</a>
																	<div class="media-body">
																		<span class="media-meta float-right">${tutorList.SUBDATE }</span>
																		<h4 class="title">
																			${tutorList.TUTOR_NAME } <span class="float-right apply">(지원)</span>
																		</h4>
																		<p class="summary">
																			${tutorList.INTRO } <br> |
																			<c:forEach var="tutorLang" items="${tutorLang}">
																				<c:if test="${tutorList.TUTOR_ID == tutorLang.TUTOR_ID }">
																					${tutorLang.INTEREST_CAT } ${tutorLang.LEVEL_NAME }	|															
																				</c:if>
																			</c:forEach>
																		</p>
																	</div>
																</div>
															</td>
															<td class="align-middle">
																<input type="hidden" name="${status.count }" value="${tutorList.SUBID }"/>
																<button type="button" class="btn btn-success btn-answer applyAccept" data-target="accept" id="${status.count }">수락</button>
																<br><br>
																<input type="hidden" name="${status.count }" value="${tutorList.SUBID }" />
																<button type="button" class="btn btn-danger btn-answer applyRefuse" data-target="refuse" id="${status.count }">거절</button>
															</td>
														</tr>
													</c:when>
													<c:otherwise>
														<tr data-status="accept">
															<td class="align-middle">
																<div>
																	<span class="fas fa-arrow-circle-right fa-3x"
																		style="color: #5cb85c"></span>
																</div>
															</td>
															<td>
																<div class="media">
																	<a href="#" class="float-left"> <img alt="tutor pic"
																		src="https://s3.amazonaws.com/uifaces/faces/twitter/fffabs/128.jpg"
																		class="rounded-circle" id="profilePic">
																	</a>
																	<div class="media-body">
																		<span class="media-meta float-right">${tutorList.SUBDATE }</span>
																		<h4 class="title">
																			${tutorList.TUTOR_NAME } <span class="float-right accept">(수락)</span>
																		</h4>
																		<p class="summary">
																			${tutorList.INTRO } <br> |
																			<c:forEach var="tutorLang" items="${tutorLang}">
																				<c:if test="${tutorList.TUTOR_ID == tutorLang.TUTOR_ID }">
																					${tutorLang.INTEREST_CAT } ${tutorLang.LEVEL_NAME }	|															
																				</c:if>
																			</c:forEach>
																		</p>
																	</div>
																</div>
															</td>
															<td class="align-middle">
																<input type="hidden" name="${status.count }" value="${tutorList.MACH_LV_ID }">
																<input type="hidden" name="${status.count }" value="${tutorList.SUBID }"/>
																<button type="button" class="btn btn-success btn-answer msgBtn" data-target="accept" id="${status.count }">대화</button>

															</td>
														</tr>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
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
								<c:import url="Matching_qna_done.jsp"></c:import>
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


