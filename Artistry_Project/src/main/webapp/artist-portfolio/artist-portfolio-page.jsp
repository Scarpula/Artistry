<%@page import="com.smhrd.model.Likes"%>
<%@page import="com.smhrd.model.PortDAO"%>
<%@page import="com.smhrd.model.Port"%>
<%@page import="com.smhrd.model.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Mon Apr 22 2024 03:26:40 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="660fa367cce1a421bb169fcb" data-wf-site="65fa46eb9d90d967c69e39b1">
<head>
  <meta charset="utf-8">
  <title>Artist PortFolio Page</title>
  <meta content="Artist PortFolio Page" property="og:title">
  <meta content="Artist PortFolio Page" property="twitter:title">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="../css/normalize.css" rel="stylesheet" type="text/css">
  <link href="../css/webflow.css" rel="stylesheet" type="text/css">
  <link href="../css/scars-stupendous-site-9634ca.webflow.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
  <script type="text/javascript">WebFont.load({  google: {    families: ["Exo:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic","Montserrat:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic","Oswald:200,300,400,500,600,700","Merriweather:300,300italic,400,400italic,700,700italic,900,900italic","PT Sans:400,400italic,700,700italic"]  }});</script>
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="../images/favicon.ico" rel="shortcut icon" type="image/x-icon">
  <link href="../images/webclip.png" rel="apple-touch-icon">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="body">



   <%   
      Member loginMember = (Member)session.getAttribute("member");
   	  Likes likeyes = (Likes)session.getAttribute("Likes");
      String artistEmail = request.getParameter("artistEmail");
      List<Review> reviewList = new ReviewDAO().showReview(artistEmail);
      List<Port> portList = new PortDAO().get_port_list(artistEmail);
      Member artist = new MemberDAO().get_artist(artistEmail);
   %>

  <div class="main">
    <div class="navbar-logo-left-3">
      <div data-animation="default" data-collapse="none" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="nevbar shadow-three w-nav">
        <a href="../index.jsp" class="navbar-brand-3 w-nav-brand"><img src="../images/Artistry-logo4.jpg" loading="lazy" width="240" height="100" alt="" class="image-2"></a>
        <div class="container-9">
          <div class="navbar-wrapper-3">
            <ul role="list" class="nav-list cate">
              <li class="nav-item hide">
                <div class="divider-vertical bg-dgray01"></div>
              </li>
            </ul>
            <div class="search-wrap">
              <div data-hover="false" data-delay="0" class="dropdown w-dropdown">
                <div class="dropdown-toggle w-dropdown-toggle"></div>
                <nav class="dropdown-list w-dropdown-list">
                  <a href="#" class="w-dropdown-link">Link 1</a>
                  <a href="#" class="w-dropdown-link">Link 2</a>
                  <a href="#" class="w-dropdown-link">Link 3</a>
                </nav>
              </div>
              <div class="form-search-wrap">
                <div class="form-search-container w-form">
                  <form id="wf-form-Search-Form" name="wf-form-Search-Form" data-name="Search Form" redirect="/research" 
                  data-redirect="/research" action="portfolio.jsp?keyWord=" method="get" class="form-search" data-wf-page-id="660fa367cce1a421bb169fcb" data-wf-element-id="39529a09-50bd-5c07-ff29-0fe03328b2c5"><input class="search-field w-input" maxlength="256" name="Search-2" data-name="Search 2" placeholder="Search on Artistry.." data-w-id="39529a09-50bd-5c07-ff29-0fe03328b2c6" type="text" id="Search">
                    <div class="search-icon-wrap">
                      <a href="#" target="_blank" class="link-block w-inline-block"><img src="../images/search.svg" loading="lazy" alt=""></a>
                    </div>
                  </form>
                  <div class="w-form-done">
                    <div>Thank you! Your submission has been received!</div>
                  </div>
                  <div class="w-form-fail">
                    <div>Oops! Something went wrong while submitting the form.</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
       <%
            if (loginMember != null) {
            %>
            <%if(loginMember.getMb_Type().equals(true)){ %>
									<div>
										<h3><a href="../MyPage.jsp"><%=loginMember.getMb_Nick() %>님</a></h3>
									</div>
								
								<%}else{%>
									<div>
										<h3><a href="artist-portfolio-page.jsp?artistEmail=<%=loginMember.getMb_Email()%>">
										<%=loginMember.getMb_Nick() %>님</a></h3>
									</div>
								<%} %>
            <%
            }
            %>
            <ul role="list" class="nav-list right">
               <li class="nav-item hide">
                  <div class="divider-vertical bg-dgray01"></div>
               </li>
               <li class="nav-item">
                  <div data-hover="false" data-delay="0"
                     class="navbar-dropdown w-dropdown">
                     <div class="navbar-dropdown-toggle w-dropdown-toggle">
                        <img width="24" height="24" alt="" src="../images/star.svg"
                           loading="lazy">
                     </div>
                     <nav class="navbar-dropdown-list w-dropdown-list">
                        <a href="#" class="navbar-dropdown-link top w-dropdown-link">Follow</a>
                        <a href="#" class="navbar-dropdown-link w-dropdown-link">Follow</a>
                        <a href="#" class="navbar-dropdown-link bottom w-dropdown-link">Follow</a>
                     </nav>
                  </div>
               </li>
               <li class="nav-item hide">
                  <div class="divider-vertical bg-dgray01"></div>
               </li>
               <li class="nav-item">
                  <div data-hover="false" data-delay="0"
                     class="navbar-dropdown w-dropdown">
                     <div class="navbar-dropdown-toggle w-dropdown-toggle">
                        <img width="24" height="24" alt="" src="../images/user.svg"
                           loading="lazy">
                     </div>
                     <%
                     if (loginMember != null) {
                     %>
                     <nav class="navbar-dropdown-list w-dropdown-list">
                        <a href="../MyPage.jsp"
                           class="navbar-dropdown-link top w-dropdown-link">마이페이지</a> <a
                           href="../LogoutService"
                           class="navbar-dropdown-link w-dropdown-link">로그아웃</a>
                     </nav>
                     <%
                     } else {
                     %>
                     <nav class="navbar-dropdown-list w-dropdown-list">
                        <a href="../MyPage.jsp"
                           class="navbar-dropdown-link top w-dropdown-link">마이페이지</a> <a
                           href="../log-in.jsp"
                           class="navbar-dropdown-link w-dropdown-link">로그인</a> <a
                           href="../sign-up.jsp"
                           class="navbar-dropdown-link w-dropdown-link">회원가입</a>
                     </nav>
                     <%
                     }
                     %>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <div class="portfolio-container">
      <div class="banner-image-wrap"><img src="../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac.jpg" loading="lazy" sizes="100vw" srcset="../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac-p-500.jpg 500w, ../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac-p-800.jpg 800w, ../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac-p-1080.jpg 1080w, ../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac-p-1600.jpg 1600w, ../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac-p-2000.jpg 2000w, ../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac-p-2600.jpg 2600w, ../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac-p-3200.jpg 3200w, ../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac.jpg 3840w" alt="" class="image-10"></div>
      <div class="main-container">
        <div style="-webkit-transform:translate3d(0, -900px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, -900px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, -900px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, -900px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)" class="portfolio-profile-tab">
          <div class="portfolio-profile-img-wrap"><img src="../images/11.png" loading="lazy" sizes="(max-width: 1279px) 100vw, (max-width: 1919px) 1024.0078125px, 4vw" srcset="../images/11-p-500.png 500w, ../images/11-p-800.png 800w, ../images/11.png 1024w" alt="" class="profiel-img-con">
            <h1 class="heading-11"><%=artist.getMb_Nick() %></h1>
            <div class="profile-insta-block">
              <h1 class="heading-12">INSTA@:</h1>
              <a href="#" class="insta-link-block w-inline-block"><img src="../images/insta_logo-removebg-preview.png" loading="lazy" sizes="(max-width: 666px) 100vw, (max-width: 1919px) 666px, 4vw" srcset="../images/insta_logo-removebg-preview-p-500.png 500w, ../images/insta_logo-removebg-preview.png 666w" alt="" class="insta-logo"></a>
            </div>
          </div>
          <%if(loginMember!=null){ %>
           <%if(artist.getMb_Email().equals(loginMember.getMb_Email())){ %>
         	 <div class="profile-button">
           	 	<a data-w-id="99207502-0852-453a-11ee-a5ad15b0abad" href="#" class="request-button w-button">의뢰확인하기</a>
           	 	<a href="artistry-portfolio-setting-page.jsp?artistEmail=<%=artistEmail %>" class="follow-button setting-button w-button">포트폴리오 작성하기</a>
          	</div>
          <%}else{ %>
          	<div class="profile-button">
          	  <a data-w-id="99207502-0852-453a-11ee-a5ad15b0abad" href="#" class="request-button w-button">의뢰하기</a>
          	  <a href="../WebSocket.jsp" class="follow-button w-button">1 : 1 채팅</a>
         	</div>
          <%} %>
          <%}else{ %>
          	<div class="profile-button">
            	<a data-w-id="99207502-0852-453a-11ee-a5ad15b0abad" href="#" class="request-button w-button" onclick="loginFirst()">의뢰하기</a>
            	<a href="#" class="follow-button w-button" onclick="loginFirst()">1 : 1 채팅</a>
         	</div>
          <%} %>
          <script type="text/javascript">
          	function loginFirst() {
				alert("먼저 로그인을 해주세요!")
			}
          </script>
          
          <!-- 좋아요 시작 -->
          <div class="like-container"><img src="../iconimg/Love2.png" alt="" id="Likebutton" onclick="checkFavorite()">
          <br>
            <div class="like-count" id="clickCount">100</div>
          </div>
          <!-- 좋아요 끝 -->
        </div>
        <div class="container-wrap">
          <div class="portfolio-tab">
            <div class="portfolio-tab-container">
              <a data-w-id="3c63d0a9-d188-a90e-6059-a31e3e83735e" href="#" class="portfolio-tab-link-block w-inline-block">
                <div>포트폴리오</div>
              </a>
              <a data-w-id="f8257c14-e0ef-be89-1a8b-5e65d4d9ad8d" href="#" class="portfolio-tab-link-block w-inline-block">
                <div>아티스트 정보</div>
              </a>
              <a data-w-id="07b1a153-89b1-8e59-80a4-bf6c4a05d952" href="#" class="portfolio-tab-link-block w-inline-block">
                <div>리뷰</div>
              </a>
            </div>
          </div>
          <div style="display:block;opacity:0;-webkit-transform:translate3d(0, 215px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-moz-transform:translate3d(0, 215px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);-ms-transform:translate3d(0, 215px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0);transform:translate3d(0, 215px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)" class="portfolio-artist-art">
            <div class="w-layout-grid artist-art-grid">
              <%   
                 if(portList!=null){ 
                    for(int i = 0; i < portList.size(); i++){
              %>
                 <div id="w-node-_550a96a2-a744-3681-3a62-95b4ca1c003a-bb169fcb" class="artist-art-form">
                   <div data-w-id="1cbd1ca6-35dd-5037-fb9c-405a15f6cf3f" class="artist-art">
                      <img src="<%=portList.get(i).getPf_Path() %>" loading="lazy" width="350" height="252" alt="" 
                      sizes="(max-width: 479px) 100vw, (max-width: 1919px) 349.9921875px, 242.8828125px" class="artist-art-img">
                     </div>
                   <h1 class="artist-art-title"><%=portList.get(i).getPf_Name() %></h1>
                 </div>
                 <%} %>
              <%} %>
            </div>
          </div>
          <div id="Artist-infomation" style="display:none" class="portfolio-artist-infomation">
            <h1 class="portfolio-artist-infomation-title"><strong class="bold-text">15년 이상의 브랜드 전문가와 함께 하세요~</strong></h1>
            <p class="portfolio-artist-infomation-text">디자이너 gutta 공모전 수상 경력 사항<br><br>‍<br>Hi 서울 웹포스터 공모전 [수상 : 대상]09년 수산물 브랜드 대전 [수상 : 은상]<br>‍<br>제8회대한민국비쥬얼트랜드대전 [수상 : 특선]<br>제3회 Blue Leage 포트폴리오 대전 [수상 : 입선]<br>07년 Edtool 표지디자인 공모전 [수상 : 입상]<br>08년 UNICORN증보시스템 캐릭터 공모전 [수상 : 2위]<br>제44회 대한민국 디자인 전람회 [수상 : 입선]<br>10년 춘천월드레져총회 및 경기대회 캐릭터 공모전 [수상 : 입선]<br>14년 순천만 정원포스터 공모전 [수상 : 동상]<br>16년 담양대나무축제 포스터 [수상:대상]<br>‍<br><br>(자격사항)웹디자인 기능사 취득그래픽운용기능사 취득교원(실기교사) 자격증 취득브랜드컨설턴트 수료</p>
            <div class="information-stats">
              <h1 class="heading-7">판매량</h1>
              <div class="sales-volume"><img src="../images/shopping_bag_FILL0_wght400_GRAD0_opsz24.svg" loading="lazy" width="48" height="48" alt="" class="image-9">
                <h1>73</h1>
              </div>
            </div>
            <div class="artist-request-field-wrap">
              <h1 class="heading-9">의뢰 가능한 분야</h1>
              <div class="request-field-form">
                <div class="request-field-wrap">
                  <h3 class="request-field-text">일러스트</h3>
                </div>
                <div class="request-field-wrap">
                  <h3 class="request-field-text">캐릭터</h3>
                </div>
                <div class="request-field-wrap">
                  <h3 class="request-field-text">캐리커쳐</h3>
                </div>
              </div>
            </div>
          </div>
          
           
          <!-- 리뷰수정_기현수 -->

          <div style="display:none" class="portfolio-artist-review">
            <div class="artist-review-head">
              <h1 class="heading-10">총 리뷰 0개</h1>
            </div>
            
            <!-- 리뷰작성란 div태그 -->
            <div class="review-writing-block w-form">
            
        <!-- List<Review> revie wList = (List<Review>)session.getAttribute("reviewList"); -->
             <% if(loginMember!=null){ %>
              <form action="../ReviewService?receiver=<%=artistEmail %>&email=<%=loginMember.getMb_Email() %>" 
              method="post" id="email-form" class="review-writing-form" data-wf-page-id="660fa367cce1a421bb169fcb" data-wf-element-id="de265365-044b-c91d-7432-08d6c918aa7e"><label for="field" class="field-label-4">리뷰 작성하기</label>
                
          <!-- <input type="hidden" name="mb_Email" value=" loginMember.get">  -->
            
                <div class="review-text-area-wrapp"><textarea name="content" placeholder="작품을 잘 받아보셨다면, 솔직한 후기를 남겨주세요^^" maxlength="5000" id="field" name="field" data-name="Field" class="review-text-area w-input"></textarea>
                  <div class="value-submit-wrap">
                    <h3>별점을 선택해주세요</h3>
                    <select name="ratings" id="field-2" data-name="Field 2" class="select-field-3 w-select">
                      <option value="0">0점</option>
                      <option value="1">1점</option>
                      <option value="2">2점</option>
                      <option value="3">3점</option>
                      <option value="4">4점</option>
                      <option value="5">5점</option>
                    </select>
                    <input type="submit" class="submit-button-3 w-button" value="리뷰작성 완료">
                  </div>
                </div>
              </form>
            <%}%>
            </div>
            <!-- 리뷰작성란 div태그끝-->
                
            
          <!--리뷰div for문 시작-->
            
         <!-- 리뷰for문 -->
            <%if(reviewList!=null){ %>
            <% for(int i=0; i<reviewList.size(); i++) {%>
               <div class="w-layout-grid review-container">
                 <div id="w-node-_8616ec42-16ad-8146-6b61-c251d1221daa-bb169fcb" class="review-block">
                      <!-- <div class="review-text-block"> -->
                      <!--   <div class="review-value-wrap"> -->
                      <!--     <div class="review-value-text"> -->
                         <div class="review-member-id">
                           <a href="#" class="link-2"><strong><%= reviewList.get(i).getMb_Email() %>님</strong></a>
                         </div>
                         
                            <div class="review-text-up">
                            <% for(int j =0; j<=reviewList.get(i).getReview_Ratings();j++){%>
                            <img src="../images/star.svg" loading="lazy" width="50" height="37" alt="" class="review-star"><% }%>
                              <div class="review-star-text"> 점 </div>
                            </div> 
                        <!--   </div> -->
                      <!--   </div> -->
                        <div class="review-text-wrapper">
                          <p class="paragraph-6"><%= reviewList.get(i).getReview_Content() %></p>
                        </div>
                     <!--  </div> -->
                     </div>
                 </div> <%} %>
                 <%}%> 
           <!-- 리뷰for문 끝 -->
           </div>
           <!--  리뷰수정 끝 -->
          
          
       </div>
         </div>
      </div>
      <%if(loginMember != null){ %>
      <%if(loginMember.getMb_Email().equals(artist.getMb_Email())){ %>
      <!-- 의뢰 확인 -->
       <%}else{ %>
      <!-- 요청서폼 시작_기현수_결제하기button 시작_0427 -->
      <form  action="../ReqService?receiver=<%=artistEmail%>&mb_email=<%=loginMember.getMb_Email()%>>" method="post" id="email-form-3" enctype="multipart/form-data"
            data-name="Email Form 3"  class="text-area-form"
            data-wf-page-id="660fa367cce1a421bb169fcb"
            data-wf-element-id="b4d1ec42-6ae0-b4d9-64f8-2ff74e9f71d7">
      <div id="Request-form"
         style="width: 1250px; height: 1550px; -webkit-transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); display: none; transform-style: preserve-3d"
         class="request-form-block">
         <section style="display: none" class="reqeust-form-head">
            <h1 class="heading-18">요청서 작성</h1>
            <img src="../images/cancel_FILL0_wght400_GRAD0_opsz24.svg"
               loading="lazy" data-w-id="1a8b61ae-1fcf-133d-30a7-2ac6cfce9216"
               alt="" class="cancel-button-img">
         </section>   
         <div style="display: none" class="request-form-container">
         <!-- 파일첨부div -->
            <div class="request-form-wrap">
               <h1 class="heading-19">[의뢰하기 파일(원본) 첨부]</h1>
               <div data-w-id="f1f0f9e6-8eea-6be6-da34-9748990e277c"
                  class="request-form-img-upload-wrap">
                  <div class="text-block-14">
                     업로드 할 파일 놓기<br> <span>또는</span>
                  </div>
                  <div class="file-upload preview-image">
                     <label for="input-image">파일 선택</label> 
                     <input type="file" name="ReqFile" id="input-image" class="upload-hidden">
                  </div>
               </div>
            </div>
            
            <!-- 가격div  -->
            <div class="request-form-wrap-2">
               <div class="text-block-15">[가격]</div>
               <div class="frame-price-form-block w-form">
                  <div id="email-form-2" data-name="Email Form 2">
                   <input name="ReqPrice" type="text" class="text-field w-input" maxlength="256" 
                   placeholder="'원'없이 숫자만 입력하세요. 예) 50000 " id=""> 
                     <label class="w-checkbox frame-choose">
                  </div>
               </div>
            <!-- 가격div끝 -->
               
               <!-- 라디오 div -->
               <div class="choose-modification w-form">
                  <div id="email-form-2" name=""
                     data-name="Email Form 2" 
                     data-wf-page-id="660fa367cce1a421bb169fcb"
                     data-wf-element-id="78b453ce-27ec-8332-0e88-c1cd34c8d37c">
                     <div class="text-block-15">[추가수정(30,000원/회)]</div>
                           <div class="radio-wrap">
                           <label class="frame-choose-radio w-radio">
                           <input name = "ReqFix" type="radio" data-name="frame price" id="30-000"
                           required="" class="w-form-formradioinput price-button w-radio-input"
                           value="30000"><span class="radio-button-label w-form-label" for="30-000">1회</span></label>
                           
                           <label class="frame-choose-radio w-radio">
                           <input name = "ReqFix" type="radio" data-name="frame price" id="50-000" 
                           required="" class="w-form-formradioinput price-button w-radio-input"
                           value="60000"><span class="radio-button-label-2 w-form-label" for="50-000">2회</span></label>
                           
                           <label class="frame-choose-radio w-radio">
                           <input name = "ReqFix" type="radio"   data-name="frame price" id="70-000" 
                           required="" class="w-form-formradioinput price-button w-radio-input"
                           value="90000"><span class="radio-button-label-3 w-form-label" for="70-000">3회</span></label>
                           
                           <label class="frame-choose-radio w-radio">
                           <input name = "ReqFix" type="radio" data-name="frame price" id="100-000" 
                           required="" class="w-form-formradioinput price-button w-radio-input"
                           value="120000"><span class="radio-button-label-4 w-form-label" for="100-000">4회</span></label>
                           
                           <label class="frame-choose-radio w-radio">
                           <input name = "ReqFix" type="radio" data-name="frame price" id="30-000" 
                           required="" class="w-form-formradioinput price-button w-radio-input"
                           value="150000"> <span class="radio-button-label w-form-label" for="30-000">5회</span></label>
                           </div>
                  </div>
                  
               </div>
                   <div class="request-form-wrap-3">
                     <div class="text-block-16">[요청서 작성]</div>
                     <div class="frame-price-form-block w-form">
                     <div id="email-form-2" data-name="Email Form 2"> <!-- 추가div -->
                     <div class="request-text-area w-form">
                        <textarea placeholder="판매자에게 요청사항을 자세히 기입하세요" maxlength="5000" id="Request-Text"
                           name="ReqText" data-name="Request Text"
                           class="textarea w-input2"></textarea>
                        <input type="submit" data-wait="Please wait..."
                           class="submit-button-4 w-button" value="의뢰하기"">
                     </div>
                     </div>
                     </div>
                  </div>
            </div>
         </div>
      </div> 
      </form>
       <!-- 기현수 _ 요청서 폼 끝 -->
       <%} %>
       <%} %>
   </div>
   <script
      src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=65fa46eb9d90d967c69e39b1"
      type="text/javascript"
      integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
      crossorigin="anonymous"></script>
   <script src="../js/webflow.js" type="text/javascript"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var image = document.getElementById('Likebutton');
    var countDisplay = document.getElementById('clickCount');
    var clickCount = 0;

    image.addEventListener('click', function() {
        clickCount++; // 클릭 카운트 증가
        countDisplay.textContent = clickCount; // 화면에 표시된 카운트 업데이트
    });
});
</script>
</body>
</html>