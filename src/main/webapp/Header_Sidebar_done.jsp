<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<%-- 
<c:import url="Header_css.jsp"></c:import>
 --%>

<!-- 전체 영역 : container -->
<div class="flex-container" id="wrapper">
   <!-- 헤더 영역 : flex-container-header -->
   <div class="flex-container-header d-flex flex-column content-wrapper">      

   <!-- 헤더 : header -->   
   <div id="content">
      <!-- Top bar -->
      <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top fixed-top">
           
         <!-- Sidebar Toggle (Topbar) -->
            <div id="sidebar">
            <c:import url="Header_Sidebar.jsp"></c:import>
            </div>
                
                
         <!-- Topbar Search -->
         <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
           <!--  <div class="input-group">
                 <input type="text" class="form-control bg-light border-0 small search-group" placeholder="검색어를 입력하세요." aria-label="Search" aria-describedby="basic-addon2">
               <div class="input-group-append">
                  <button class="btn btn-primary" type="button">
                    <i class="fas fa-search fa-sm"></i>
                  </button>
               </div>
            </div>                          -->                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
         </form>
      
         <ul class="navbar-nav">

         <li class="nav-item dropdown no-arrow d-sm-none">
            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
              <i class="fas fa-search fa-fw"></i>
            </a>
            <!-- Dropdown - Messages -->
            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
               <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                     <input type="text" class="form-control bg-light border-0 small" placeholder="검색어를 입력하세요." aria-label="Search" aria-describedby="basic-addon2">
                     <div class="input-group-append"><button class="btn btn-primary" type="button"><i class="fas fa-search fa-sm"></i></button></div>
                  </div>
               </form>
            </div>
         </li>
            
            
         <!-- Nav Item - User Information -->
         <li class="nav-item dropdown no-arrow">
         
            <!-- ① 로그인 전 (로그아웃 상태) 로그인 버튼 -->
            <c:if test="${empty loginInfo }">
            <a class="nav-link" href="user_loginForm" id="topbar-login" role="button" aria-haspopup="true" aria-expanded="false">
              <span class="mr-2 d-none d-lg-inline medium text-gray-600">로그인</span>
            </a>
            </c:if>
             <!--end 로그인 전 (로그아웃 상태) 로그인 버튼 -->
         
         
            <!-- ② 로그인 후 (로그인 상태) 프로필 -->
            <c:if test="${!empty loginInfo }">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="mr-2 d-none d-lg-inline medium text-gray-600" style="vertical-align: middle;">${loginInfo.NICKNAME }</span>
              <img class="img-profile rounded-circle" src="${loginInfo.PROF_PATH }" width="50px;">
            </a>
           
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
               <a class="dropdown-item" href="#">
                 <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                 마이페이지
               </a>
               <a class="dropdown-item" href="#">
                 <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                 개인정보수정
               </a>
               <!--  <a class="dropdown-item" href="#">
                 <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                 Activity Log
               </a> -->
               <div class="dropdown-divider"></div>
               <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                 <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                 로그아웃
               </a>
            </div>
            </c:if>
            <!-- end 로그인 후 (로그인 상태) 프로필 -->
         </li>
            
            <!-- 경계선 -->
            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - Alerts -->
           
        	 <li class="nav-item dropdown no-arrow mx-1">
            <!-- ① 로그인 전 (로그아웃 상태) 회원가입 -->
            <c:if test="${empty loginInfo }">
            <a class="nav-link" href="user_openSignUp" id="topbar-join" role="button" aria-haspopup="true" aria-expanded="false">
              <span class="mr-2 d-none d-lg-inline medium text-gray-600">회원가입</span>
            </a>
            </c:if>
            <!-- end 로그인 전 (로그아웃 상태) 회원가입 -->
         
         
            <!-- ② 로그인 후(로그인 상태) 알림 -->
            <c:if test="${!empty loginInfo }">
            <a class="nav-link dropdown-toggle" href="alarm" >
            <!-- id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" -->
              <i class="fas fa-bell fa-fw"></i>
              <!-- Counter - Alerts -->
              <span class="badge badge-danger badge-counter">${alarmCount }</span>
            </a>
            
            <!-- Dropdown - Alerts -->
            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
               <div class="dropdown-header">
                  알림 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  <!-- 죄송합니다... 별 방법을 다 써보았지만 이 방법 밖에는 없었습니다... -->
                  <input type="button" value="전체 읽음 표시" class="btn btn-primary btn-sm" style="font-size: 10px;">
               </div>
               
               <!-- 알림 목록 -->
               <a class="dropdown-item d-flex align-items-center" href="#">
                  <div>
                    <div class="small text-gray-500">2019-07-05</div>
                    <span class="font-weight-bold">[자바를 처음 시작하는 사람들에게...] 게시글에 새로운 댓글이 등록되었습니다.</span>
                  </div>
               </a>
               <a class="dropdown-item d-flex align-items-center" href="#">
                  <!--  <div class="mr-3"><div class="icon-circle bg-success"><i class="fas fa-donate text-white"></i></div></div> -->
                  <div>
                     <div class="small text-gray-500">2019-07-01</div>
                     [오라클 뿌시기] 예약한 튜터링이 개설되었습니다.
                  </div>
               </a>
               <a class="dropdown-item d-flex align-items-center" href="#">
                  <div>
                    <div class="small text-gray-500">2019-06-30</div>
                    [수영쌤과 함께 웹 프로그래밍 정복하기] 문의에 새로운 답변이 등록되었습니다.
                  </div>
               </a>
               <!-- 알림 더 보기 -->
               <a class="dropdown-item text-center small text-gray-500" href="alarm">알림 전체보기</a>
            </div>
            </c:if>
            <!-- end 로그인 후(로그인 상태) 알림 -->
         </li>
             
             </ul>
      </nav>
      <!-- End of Topbar -->

   </div>
   <!-- end Main Content -->

   </div>
   <!-- end 헤더 영역 : flex-container-header -->
      
   <!-- Logout Modal-->
   <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
              <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
              <div class="modal-body">로그아웃 버튼을 누르면 안전하게 로그아웃 됩니다.</div>
            <div class="modal-footer">
              <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
              <a class="btn btn-primary" href="logout">로그아웃</a>
            </div>
         </div>
      </div>
   </div>
</div>