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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QTBoard_detail.jsp</title>



<link type="text/css" rel="stylesheet" href="<%=cp%>/css/jih/bootstrap.css">
<link type="text/css" rel="stylesheet" href="<%=cp%>/css/jih/qtboard_detail.css">


<c:import url="Header_css.jsp"></c:import>

<!-- <script type="text/javascript" src="./js/jquery.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>
<script type="text/javascript" src="<%=cp %>/js/common.js"></script>
<script type="text/javascript">
	
	$(init);			
	
	function addCommentRep(event)
	{
		event.preventDefault();
		
		var target = $(event.target);
		
		var div = target.closest("#commentDiv");
		
		target.closest("#commentList").find("#addCommentForm").remove();
		
		var parId = div.find(".commId").val();
		
		var str = "";
		
		str+="	<div class='QT-divTableRow' id='addCommentForm'>";
		str+="		<div class='QT-marginCommForm'>";
		str+="			<div class='QT-divTableCell'>";
		str+="				<img src='${loginInfo.PROF_PATH }' class='QT-styleProfile'>";
		str+="			</div>";
		str+="			<div class='QT-divTableCell'>${loginInfo.NICKNAME }</div>";
		str+="			<div class='QT-marginCommTextArea QT-flex-end'>";
		str+="				<div class='QT-divTableCell'>";
		str+="					<textarea cols='100%' rows='4' class='QT-marginWidthRegiTextArea' placeholder='내용을 입력하세요.' id='repCon'></textarea>";
		str+="				</div>";
		str+="				<div class='QT-divTableCell QT-styleButton'>";
		str+="                        <button type='button' class='btn QT-styleCancle QT-inline' onclick='reCancel()'>취소</button>";
		str+="					<button type='button' class='btn QT-btn-purple QT-inline' onclick='reSubmit("+ parId+")'>등록</button>";
		str+="				</div>";
		str+="			</div>";
		str+="		</div>";
		str+="	</div>";
		
		div.after(str);
	}
	
	function reCancel()
	{
		getCommentList();
	}
	
	function reSubmit(parId)
	{
		var repCon = $("#repCon").val();
		var postNick = $("#POST_NICK").val();
		$.ajax({
			type : "post",
			url : "qtboard_addComment_ajax",
			data : {"MEMBER_ID" : ${loginInfo.MEMBER_ID}
				   ,"postNICKNAME" : postNick
				   ,"QT_ID" : ${post.QT_ID }
				   ,"COMM_DEPT" : "1"
				   ,"PAR_COMM_ID" : parId
				   ,"CONTENT" : repCon},
			success : function(data)
			{				
				getCommentList();
			}
		});	
	}
	
	// 화면 진입하자마자 jQuery로 지정한 init()가 로딩된다.
	function init()
	{
		// 댓글리스트 불러오기
		getCommentList();
		
		$("#commentInsert").on("click", function(e){
			
			var con = $("#commentContent").val();
			var postNick = $("#POST_NICK").val();
			
			$.ajax({
				type : "post",
				url : "qtboard_addComment_ajax",
				data : {"MEMBER_ID" : ${loginInfo.MEMBER_ID} 
			           ,"postNICKNAME" : postNick
					   ,"QT_ID" : ${post.QT_ID }
					   ,"COMM_DEPT" : "0"
					   ,"PAR_COMM_ID" : null
					   ,"CONTENT" : con},
				success : function(data)
				{
					$("#commentContent").val("");
					getCommentList();
				}
			});	
			
		});			
		
		
		// 파일 다운로드 눌렀을 때
		$("a[name='file']").on("click", function(e){
			e.preventDefault();
			downloadFile($(this));
		});		
		
		function downloadFile(obj)
		{
			$("#commonForm").empty();
			var id = obj.parent().find("#file_id").val();
			var comSubmit = new ComSubmit(); 		
			comSubmit.setUrl("<c:url value='/downloadFile' />");
			comSubmit.addParam("QT_FILE_ID", id); 
			comSubmit.submit();
		}	
		
		
		// 버튼 : 목록으로
		$('#anjdla').click(function() 
		{
			location.href = '<%=cp%>/qtboard_list?page=${page }&searchKey=${searchKey}&searchValue=${searchValue}';
		});
		
		
		
		// 글 삭제
		$("#delClick").unbind("click").click(function(e)
		{
			e.preventDefault();
			if(confirm("정말 삭제하시겠습니까?"))
			{
				location.href="<%=cp%>/qtboard_delete?QT_ID=" + ${post.QT_ID };
			}
		});
		
		// 수정 버튼 클릭
		$("#updateClick").unbind("click").click(function(e)
		{
			e.preventDefault();
			if(confirm("수정하시겠습니까?"))
			{
				location.href="<%=cp%>/qtboard_updateForm?QT_ID=${post.QT_ID }&page=${page}&searchKey=${searchKey}&searchValue=${searchValue}";
			}
		});
		
		// 추천하기 눌렀을 때
		$("#recommPost").click(function(e)
		{
			e.preventDefault();
			$.ajax({
				type : 'get',
				url : "<c:url value='/recomm_board'/>",
				data : { "QT_ID" : ${post.QT_ID }},
				success : function(data)
				{
					if(data==0)
					{
						alert("하루에 추천가능한 횟수는 최대 3회입니다.");
						return;
					}
					
					$("#recommCount").text(data);
				}
			});
			
		});		
	}	
	
	// 댓글 리스트 그리기
	function getCommentList()
	{
		$.ajax({
			type:'GET',
			url : "<c:url value='/qtboard_comment_ajax'/>",
			dataType : "json",
			data : {"QT_ID" : ${post.QT_ID }},
			success : function(data)
			{
				var html = "";
				var cCnt = data.length; 
				
				if(data.length > 0)
				{
					for(i=0; i<data.length; i++)
					{
						if(data[i].DELCHECK == 'Y')
						{
							html += "<div class='QT-divTableRow'>";
							html += "      <div id='commentDiv'>";
							html += "         <div class='QT-marginComm'>";
							html += "               <div class='QT-divTableCell del-decoline'>";
							html += " 					<div class='QT-divTableCell'>";
							html += "                          <img src='https://image.ibb.co/jw55Ex/def_face.jpg' class='QT-styleProfile'>";
							html += "                   </div>";
							html += "					<div class='QT-divTableCell del-decoline'>";
							html += "                   삭제된 댓글 ";
							html += "                  <footer class='blockquote-footer'>";
							html += "                     <cite title='Source Title' style=''>"+ data[i].WRITEDATE +"</cite>";
							html += "                  </footer>";
							html += "               </div>";
							html += "               <div class='QT-divTableCell QT-inlineImportant del-red'>";
							html += "                  <span class='QT-marginCommCont'>삭제된 댓글 입니다.</span>";
							html += "               </div>    ";
							html += "				<div class='QT-flex-end'></div>";
							html += "         </div>";
							html += "      </div>";
							html += "   </div>";	
							html += "</div>";
						}
						else
						{
							html += "<div id='commentDiv' class='QT-divTableRow";						
							
							if(data[i].RECOMM > 5)
							{
								html += " QT-styleBestCommYellow'>";
							}
							else if(data[i].NICKNAME == "${loginInfo.NICKNAME}")
							{
								html += " QT-styleMyCommGray'>";
							}
							else
							{
								html += "'>";							
							}				
							
							html += "<input type='hidden' class='commId' value='"+ data[i].COMM_ID + " '>"
							html += "<input type='hidden' class='parCheck' value='" + data[i].PARCHECK + "'>";
							html += "<input type='hidden' class='parCommId' value='" + data[i].PAR_COMM_ID + "'>";
							
							if(!data[i].PAR_COMM_ID)
							{
								html += "										<div class='QT-marginComm'>";							
							}
							else
							{
								html += "										<div class='QT-marginCommOneDepth'>";	
							}
							
							html += "											<div class='QT-divTableCell'>";
							html += "												<img src='https://image.ibb.co/jw55Ex/def_face.jpg' class='QT-styleProfile'>";
							html += "											</div>";
							html += "											<div class='QT-divTableCell'>" + data[i].NICKNAME;
							
							if(data[i].PAR_COMM_ID)
							{							
								html += 										" To. "	 +  data[i].PAR_NICKNAME;
							}
							
								html += "												<footer class='blockquote-footer'>";
								html += "													<cite title='Source Title'>" + data[i].WRITEDATE +"</cite>";
								html += "												</footer>";						
								html += "											</div>";
								html += "											<div class='QT-divTableCell QT-inlineImportant'>";
								html += "												<span class='QT-marginCommCont' id='innerContent'>"+ data[i].CONTENT +"</span>";
								html += "											</div>";						
								html += "											<div class='QT-flex-end'>";	
								
								if(data[i].NICKNAME == "${loginInfo.NICKNAME}")
								{
								html += "<!-- 수정 -->";
								html += "									<span class='QT-styleEditDel QT-marginEdit'> <!-- 수정 아이콘 -->";
								html += "										<a href='' class='del marginDel' name='updateComm'>";
								html += "												<svg xmlns='http://www.w3.org/2000/svg' width='13' height='13'";
								html += "												viewBox='0 0 24 24' fill='none' stroke='currentColor'";
								html += "												stroke-width='2' stroke-linecap='round'";
								html += "												stroke-linejoin='round' class='feather feather-edit'>";
								html += "												<path d='M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7'></path>";
								html += "												<path d='M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z'></path></svg>";
								html += "											수정";
								html += "										</a>";
								html += "									</span>";
								html += "";
								html += "									<!-- 삭제  -->";
								html += "									<span class='QT-styleEditDel QT-marginDel'> <!-- 삭제 아이콘  -->";
								html += "										<a href='' class='del marginDel' name='delComm'>";
								html += "											<svg xmlns='http://www.w3.org/2000/svg' width='13' height='13'";
								html += "												viewBox='0 0 24 24' fill='none' stroke='currentColor'";
								html += "												stroke-width='2' stroke-linecap='round'";
								html += "												stroke-linejoin='round' class='feather feather-trash-2'>";
								html += "												<polyline points='3 6 5 6 21 6'></polyline>";
								html += "												<path d='M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2'></path>";
								html += "												<line x1='10' y1='11' x2='10' y2='17'></line>";
								html += "												<line x1='14' y1='11' x2='14' y2='17'></line></svg>";
								html += "											삭제";
								html += "										</a>";
								html += "									</span>";
								
								html += "&nbsp;&nbsp;&nbsp;"
							}
							
							html += "												<div class='QT-marginCommButton'>";
							html += "													<div class='QT-divTableCell QT-styleCommentReport'>";
							
							html += "														<a href='' id='commentRep' name='commentRep'>댓글달기</a>";
							html += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|";
							html += "													</div>";
							html += "													<div class='QT-divTableCell QT-styleCommentReport'>";
							html += "														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ";
							html += "														신고";
							html += "&nbsp;<span>" + data[i].REP +"</span>";
							html += "													</div>";
							html += "													<div class='QT-divTableCell QT-styleCommentReport'>";
							html += "														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
							html += "														도움이 됐어요&nbsp;<span>"+ data[i].RECOMM +"</span>";
							html += "													</div>";
							html += "												</div>";
							html += "												<div class='QT-divTableCell'>";
							html += "													<button type='button' class='btn QT-btn-purple'>";
							html += "														<svg xmlns='http://www.w3.org/2000/svg' width='16'";
							html += "															height='16' viewBox='0 0 24 24' fill='none'";
							html += "															stroke='currentColor' stroke-width='2'";
							html += "															stroke-linecap='round' stroke-linejoin='round'";
							html += "															class='feather feather-thumbs-up'>";
							html += "															<path d='M14 9V5a3 3 0 0 0-3-3l-4 9v11h11.28a2 2 0 0 0 2-1.7l1.38-9a2 2 0 0 0-2-2.3zM7 22H4a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2h3'></path></svg>";
							html += "														추천";
							html += "													</button>";
							html += "												</div>";
							html += "											</div>";
							html += "										</div>";
							html += "									</div>";
						}
						
					}
				}
				
				$("#commentList").html(html);
				$("a[name='commentRep']" ).bind( "click",addCommentRep);
				$("a[name='updateComm']").bind("click",updateComm);
				$("a[name='delComm']").bind("click",deleteComm);
			}
		});
	}
	
	// 댓글 수정 폼
	function updateComm(event)
	{
		event.preventDefault();		
		
		// 이벤트 타겟 (수정버튼)
		var target = $(event.target);
		
		// 수정버튼에서 가장 가까운 commentDiv (div)
		var div = target.closest("#commentDiv");
		
		//commentDiv 에서 가장 가까운  innerContent 의 내부 텍스트 값
		var text = div.find("#innerContent").text();
		
		//commentDiv 안에 포함되어 있는 히든태그 commId (댓글기본키) 값 받아오기
		var commId = div.find(".commId").val();
		
		// 껍데기만 남기고 내부 비우기
		div.empty();
		
		var str = "";
		
		// 내부에 채울 tag string 구성
		str += "	<div class='QT-marginCommEditForm'>";
		str += "		<div class='QT-divTableCell'>";
		str += "			<img src='${loginInfo.PROF_PATH}' class='QT-styleProfile'>";
		str += "		</div>";
		str += "		<div class='QT-divTableCell'>${loginInfo.NICKNAME}</div>";
		str += "		<div class='QT-marginCommTextArea QT-flex-end'>";
		str += "			<div class='QT-divTableCell'>";
		str += "				<textarea cols='90%' rows='4' class='QT-marginWidthEditTextArea' id='updateText'>" + text +"</textarea>";
		str += "			</div>";
		str += "			<div class='QT-divTableCell QT-styleButton'>";
		str += "				<button type='button' class='btn QT-styleCancle' onclick='reCancel()'>취소</button>";
		str += "				<button type='button' class='btn QT-btn-purple QT-inline' onclick='reUpdate(" + commId +")'>등록</button>";
		str += "			</div>";
		str += "		</div>";
		str += "	</div>";
		
		// 껍데기만 남은 div 내부 채우기
		div.append(str);
	}
	
	// 댓글 수정
	function reUpdate(commId)
	{
		var text = $("#updateText").val();
		
		$.ajax({
			type : "post",
			url : "qtboard_updateComment_ajax",
			data : {"COMM_ID" : commId
				   ,"CONTENT" : text},
			success : function(data)
			{				
				getCommentList();
			}
		});	
	}
	
	
	// 댓글 삭제
	function deleteComm(event)
	{		
		event.preventDefault();
		
		var target = $(event.target);
		
		var div = target.closest("#commentDiv");
		
		var commId = div.find(".commId").val();
		var parCheck = div.find(".parCheck").val();
		var parCommId = div.find(".parCommId").val();
		
		if(confirm("정말로 댓글을 삭제하시겠습니까?"))
		{
			$.ajax({
				type : "post",
				url : "qtboard_deleteComment_ajax",
				data : {"COMM_ID" : commId,
					    "PARCHECK" : parCheck,
					    "PAR_COMM_ID" : parCommId},
				success : function(data)
				{				
					getCommentList();
				}
			});			
		}		
	}
	
	
	
	
	
</script>
</head>
<body>
	<!-- 전체 영역 : flex-container -->
	<div class="QT-flex-container">

		<!-- 헤더 영역 -->
		<c:import url="Header_Sidebar_done.jsp"></c:import>
		<br><br><br><br><br>

		<!-- 본문 영역 : flex-container-body -->
		<div class="QT-flex-container-body">
			<div class="QT-flex-item">

				<!-- 본문 상단 : top-content -->
				<div class="QT-top-content">

					<div>
						<div class="QT-styleQTboardName">질문 / 답 게시판</div>
					</div>

					<!-- 게시글 시작 divTable -->
					<div class="QT-divTable QT-marginTable">
						<!-- tbody -->
						<div class="QT-divTableBody">

							<!-- 게시글 제목 영역 -->
							<div class="QT-divTableRow">
								<!-- 글번호, 말머리 -->
								<div class="QT-marginNT">
									<div class="QT-divTableCell QT-inline QT-styleNo">${post.QT_ID }</div>
									<div class="QT-divTableCell QT-inline QT-styleNo">${post.HEAD_NAME }</div>
									<input type="hidden" id="POST_NICK" value="${post.NICKNAME}">
								</div>

								<!-- 제목 -->
								<div class="QT-divTableCell QT-styleSub QT-marginSub QT-flexbetween">
									${post.TITLE }
									
									<!-- 작성자 -->
									<div class="QT-divTableCell QT-styleSub QT-flexProfile QT-marginProfile">
										<img src="${post.PROF_PATH }" class="QT-styleProfile">
										<span class="QT-marginWriter">${post.NICKNAME }</span> 
									</div>
								</div>


								<!-- 조회, 추천, 작성일자 -->
								<div class="QT-clear QT-marginDate ">
									조회<span> ${post.HITCOUNT } </span>&nbsp;·&nbsp; 추천<span> ${post.RECOMM } </span>&nbsp;·&nbsp;
									2019-07-07 19:01 &nbsp;
								</div>
							</div>

							<div class="QT-divTableRow">
								<!-- 게시물 본문 -->
								<div class="QT-divTableRow QT-white QT-clear">
									<div class="QT-marginTextarea">
										${post.CONTENT }
									</div>
								</div>
								<!-- end 게시글 본문 -->
								
								<!-- 첨부파일 유무 영역 -->
								<div style="margin: 30px 30px 30px 30px;">
									<c:forEach var="file" items="${fileList }" varStatus="vs">
										<div>
											<input type="hidden" id="file_id" value="${file.QT_FILE_ID }">
		                          			<a href="#" name="file" id="file_${vs.index }" > ${file.PATH_ORIGN } (${file.FILE_SIZE }kb)</a>	
		                          			<br>                          	
										</div>
									</c:forEach>
	                        	</div>
	                        	
								<!-- 게시글 내 버튼 영역 -->
								<div class="QT-inline QT-flex-end QT-marginContentbuttons">
								<c:if test="${loginInfo.NICKNAME eq post.NICKNAME }">
									<!-- 수정 -->
									<span class="QT-styleEditDel QT-marginEdit"> <!-- 수정 아이콘 -->
										<a href="#" class="del marginDel" id="updateClick">
												<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13"
												viewBox="0 0 24 24" fill="none" stroke="currentColor"
												stroke-width="2" stroke-linecap="round"
												stroke-linejoin="round" class="feather feather-edit">
												<path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
												<path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path></svg>
											수정
										</a>
									</span>

									<!-- 삭제  -->
									
									<span class="QT-styleEditDel QT-marginDel"> <!-- 삭제 아이콘  -->
										<a href="#" class="del marginDel" id="delClick">
											<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13"
												viewBox="0 0 24 24" fill="none" stroke="currentColor"
												stroke-width="2" stroke-linecap="round"
												stroke-linejoin="round" class="feather feather-trash-2">
												<polyline points="3 6 5 6 21 6"></polyline>
												<path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
												<line x1="10" y1="11" x2="10" y2="17"></line>
												<line x1="14" y1="11" x2="14" y2="17"></line></svg>
											삭제
										</a>
									</span>
									</c:if>
									<!-- 추천 버튼  -->
									<button type="button" class="btn QT-btn-purple QT-marginLike" id="recommPost">

										<!-- 추천 아이콘 -->
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-thumbs-up">
											<path d="M14 9V5a3 3 0 0 0-3-3l-4 9v11h11.28a2 2 0 0 0 2-1.7l1.38-9a2 2 0 0 0-2-2.3zM7 22H4a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2h3"></path></svg>
										추천&nbsp;<span id="recommCount">${post.RECOMM }</span>
									</button>

									<!-- 신고 버튼 -->
									<button type="button" class="btn QT-btn-white QT-marginReport">

										<!-- 신고 아이콘  -->
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											viewBox="0 0 24 24" fill="none" stroke="currentColor"
											stroke-width="2" stroke-linecap="round"
											stroke-linejoin="round" class="feather feather-radio">
											<circle cx="12" cy="12" r="2"></circle>
											<path d="M16.24 7.76a6 6 0 0 1 0 8.49m-8.48-.01a6 6 0 0 1 0-8.49m11.31-2.82a10 10 0 0 1 0 14.14m-14.14 0a10 10 0 0 1 0-14.14"></path></svg>
										신고&nbsp;${post.REP }
									</button>
								</div>
								<!-- end 게시글 내 버튼 영역 -->

							</div>
							<!-- 게시글 끝 End divTable -->

						</div>
						<!-- 본문 상단 끝 End top-content -->

						<!-- 본문 하단 : bottom-content -->
						<div class="QT-bottom-content">

							<!-- 댓글 시작 -->

							<!-- 댓글 테이블 divTable -->
							<div class="QT-divTable QT-marginTable">

								<!-- tbody -->
								<div class="QT-divTableBody" id="commentList"></div>
								<div class="QT-divTableRow">
										<div class="QT-marginCommForm">
											<div class="QT-divTableCell">
												<img src="${loginInfo.PROF_PATH }" class="QT-styleProfile">
											</div>
											<div class="QT-divTableCell">${loginInfo.NICKNAME }</div>
											<div class="QT-marginCommTextArea QT-flex-end">
												<div class="QT-divTableCell">
													<textarea cols="100%" rows="4" class="QT-marginWidthRegiTextArea" 
													placeholder="내용을 입력하세요." id="commentContent"></textarea>
												</div>
												<div class="QT-divTableCell QT-styleButton">
													<button type="button" class="btn QT-btn-purple QT-inline" id="commentInsert">등록</button>
												</div>
											</div>
										</div>
									</div>
								<!-- 댓글 테이블 본문 끝 End tbody -->

								<div style="margin: 10px 0 0 0;">
									<button type="button" class="btn btn-primary" id="anjdla">목록</button>
								</div>
							</div>
							<!-- 댓글 테이블 끝 End divTable -->
						</div>
						<!-- 본문 하단 끝 End bottom-content -->
					</div>
					<!-- End flex-item -->
				</div>
				<!-- 본문 컨테이너 끝 End flex-container -->
				
				



				푸터 영역
				<div class="QT-flex-container-footer">
					<!-- <div class="QT-footer">
						<h2>FOOTER</h2>
					</div> -->
				</div>
				<!-- End 푸터 영역 -->

			</div>
			<!-- End flex-container-body -->
		</div>
		<!-- 전체 영역 끝 End flex-container -->
	</div>
	<form id="commonForm" name="commonForm" action="downloadFile"></form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</html>
