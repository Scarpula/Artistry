<%@ page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Wed Apr 17 2024 02:25:43 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="661cc68163939fbbd3cc6973"
   data-wf-site="65fa46eb9d90d967c69e39b1">
<head>
<meta charset="utf-8">
<title>SignUp Second Form</title>
<meta content="SignUp Second Form" property="og:title">
<meta content="SignUp Second Form" property="twitter:title">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="Webflow" name="generator">
<link href="css/normalize.css" rel="stylesheet" type="text/css">
<link href="css/webflow.css" rel="stylesheet" type="text/css">
<link href="css/scars-stupendous-site-9634ca.webflow.css"
   rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect"
   crossorigin="anonymous">
<script
   src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"
   type="text/javascript"></script>
<script type="text/javascript">
   WebFont
         .load({
            google : {
               families : [
                     "Exo:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic",
                     "Montserrat:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic",
                     "Oswald:200,300,400,500,600,700",
                     "Merriweather:300,300italic,400,400italic,700,700italic,900,900italic",
                     "PT Sans:400,400italic,700,700italic" ]
            }
         });
</script>
<script type="text/javascript">
   !function(o, c) {
      var n = c.documentElement, t = " w-mod-";
      n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch
            && c instanceof DocumentTouch)
            && (n.className += t + "touch")
   }(window, document);
</script>
<link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link href="images/webclip.png" rel="apple-touch-icon">
</head>
<body class="body">


   <%
   request.setCharacterEncoding("UTF-8");
   String mb_Email = request.getParameter("mb_Email");
   String mb_Pw = request.getParameter("mb_Pw");
   String mb_Name = request.getParameter("mb_Name");
   String mb_Birthdate = request.getParameter("mb_Birthdate");
   String mb_Phone = request.getParameter("mb_Phone");
   String mb_Nick = request.getParameter("mb_Nick");
   String mb_Addr = request.getParameter("mb_Addr");
   String mb_Addr2 = request.getParameter("mb_Addr2");
   %>




   <div class="navbar-logo-left-3">
      <div data-animation="default" data-collapse="none" data-duration="400"
         data-easing="ease" data-easing2="ease" role="banner"
         class="nevbar shadow-three w-nav">
         <a href="index.jsp" class="navbar-brand-3 w-nav-brand"><img
            src="images/Artistry-logo4.jpg" loading="lazy" width="240"
            height="100" alt="" class="image-2"></a>
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
                        <a href="#" class="w-dropdown-link">Link 1</a> <a href="#"
                           class="w-dropdown-link">Link 2</a> <a href="#"
                           class="w-dropdown-link">Link 3</a>
                     </nav>
                  </div>
                  <div class="form-search-wrap">
                     <div class="form-search-container w-form">
                        <form id="wf-form-Search-Form" name="wf-form-Search-Form"
                           data-name="Search Form" redirect="/research"
                           data-redirect="/research" action="/research" method="get"
                           class="form-search" data-wf-page-id="661cc68163939fbbd3cc6973"
                           data-wf-element-id="39529a09-50bd-5c07-ff29-0fe03328b2c5">
                           <input class="search-field w-input" maxlength="256"
                              name="Search-2" data-name="Search 2"
                              placeholder="Search on Artistry.."
                              data-w-id="39529a09-50bd-5c07-ff29-0fe03328b2c6" type="text"
                              id="Search">
                           <div class="search-icon-wrap">
                              <a href="#" target="_blank" class="link-block w-inline-block"><img
                                 src="images/search.svg" loading="lazy" alt=""></a>
                           </div>
                        </form>
                        <div class="w-form-done">
                           <div>Thank you! Your submission has been received!</div>
                        </div>
                        <div class="w-form-fail">
                           <div>Oops! Something went wrong while submitting the
                              form.</div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <ul role="list" class="nav-list right">
            <li class="nav-item hide">
               <div class="divider-vertical bg-dgray01"></div>
            </li>
            <li class="nav-item">
               <div data-hover="false" data-delay="0"
                  class="navbar-dropdown w-dropdown">
                  <div class="navbar-dropdown-toggle w-dropdown-toggle">
                     <img width="24" height="24" alt="" src="images/star.svg"
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
                     <img width="24" height="24" alt="" src="images/user.svg"
                        loading="lazy">
                  </div>
                  <nav class="navbar-dropdown-list w-dropdown-list">
                     <a href="user-account.html"
                        class="navbar-dropdown-link top w-dropdown-link">마이페이지</a> <a
                        href="log-in.html" class="navbar-dropdown-link w-dropdown-link">로그인</a>
                     <a href="sign-up.html"
                        class="navbar-dropdown-link w-dropdown-link">회원가입</a>
                     
                  </nav>
               </div>
            </li>
         </ul>
      </div>
   </div>
   <div class="signupsecondform">
      <div class="signup-form-block signupsecond">
         <div class="signup-form-wrapper signupscond2">
            <div class="artistry-banner">
               <a href="index.jsp" class="home-link-block w-inline-block">
                  <h1
                     style="-webkit-transform: translate3d(0, -800px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, -800px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, -800px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, -800px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
                     class="artistry-head-text signupsecondhead">Artistry</h1>
               </a>
            </div>
            <div class="signupsecondtextwrap">
               <div class="text-block-10">마지막 정보 입력 단계예요!</div>
            </div>
            <div class="member-type-select-form">
               <div class="member-type-text-wrap">
                  <h1 class="heading-5">회원타입 선택</h1>
                  <br>
                  <h3 class="heading-5">아티스트로 가입 시 마이 페이지에서 정보 추가를 완료해주세요!</h3>
               </div>
               <div class="boundary"></div>



               <!-- 회원관리 2_ form -->
               <form action="JoinService" method="post" >
               
               <% String result = request.getParameter("result");
               
                  if(result!=null){
                     if(result.equals("success")){
                     // 비동기 alert 창 발동
                     System.out.print("이건success");%>
                     <script type="text/javascript">alert("회원가입에에 성공하였습니다.")</script>
                   <%}else{//비동기 alert창 발동
                     System.out.print("이건fail");%>
                     
                     <script type="text/javascript">alert("회원가입에 실패하였습니다.")</script>
                   
                  <% }
                  }%>
                  
               
               
               
                  <div class="member-type-select-wrap">
                     <div class="member-type w-form">
                        <div class="member-type-selector"
                           data-wf-page-id="661cc68163939fbbd3cc6973"
                           data-wf-element-id="a0d52b46-df2d-9f2c-c665-37d9e5a5932f">
                           <label data-w-id="617b85d8-e73f-9070-9be6-a2bb31ce50da"
                              class="w-checkbox checkbox-field"> <input type="radio"
                              id="checkbox" name="mb_Type" value="true" data-name="Checkbox"
                              required="" data-w-id="617b85d8-e73f-9070-9be6-a2bb31ce50db"
                              class="w-checkbox-input checkbox"> <span
                              class="checkbox-label w-form-label" for="checkbox">의뢰자<br>‍<br>그림을
                                 의뢰하거나 / 좋아하는 작가의 포트폴리오를 감상할 수 있습니다
                           </span></label>
                        </div>
                        <div class="w-form-done">
                           <div>Thank you! Your submission has been received!</div>
                        </div>
                        <div class="w-form-fail">
                           <div>Oops! Something went wrong while submitting the
                              form.</div>
                        </div>
                     </div>
                     <div class="member-type w-form">

                        <div class="member-type-selector"
                           data-wf-page-id="661cc68163939fbbd3cc6973"
                           data-wf-element-id="a1686655-5388-a9b8-f960-8e1c6c863caf">
                           <label data-w-id="a1686655-5388-a9b8-f960-8e1c6c863cb0"
                              class="w-checkbox checkbox-field"> <input type="radio"
                              id="checkbox   " name="mb_Type" value="false"
                              data-name="Checkbox 2"
                              data-w-id="a1686655-5388-a9b8-f960-8e1c6c863cb1"
                              class="w-checkbox-input checkbox _02"> <span
                              class="checkbox-label w-form-label" for="checkbox-2">아티스트<br>‍<br>디자인을
                                 의뢰받아서 <br>사용자에 맞춰 그려주고,<br>실물 작품을 팔거나 업로드 할 수 있습니다
                           </span></label>
                        </div>
                        <input type="hidden" name="mb_Email" value="<%=mb_Email%>">
                        <input type="hidden" name="mb_Pw" value="<%=mb_Pw%>"> <input
                           type="hidden" name="mb_Name" value="<%=mb_Name%>"> <input
                           type="hidden" name="mb_Birthdate" value="<%=mb_Birthdate%>">
                        <input type="hidden" name="mb_Phone" value="<%=mb_Phone%>">
                        <input type="hidden" name="mb_Nick" value="<%=mb_Nick%>">
                        <input type="hidden" name="mb_Addr" value="<%=mb_Addr%>">
                        <input type="hidden" name="mb_Addr2" value="<%=mb_Addr2%>">

                        <div class="w-form-done">

                           <div>Thank you! Your submission has been received!</div>
                        </div>
                        <div class="w-form-fail">
                           <div>Oops! Something went wrong while submitting the
                              form.</div>
                        </div>
                     </div>
                  </div>
            </div>

            <div class="boundary _01"></div>

            <div class="signup-complete">
            
               <button type="submit" class="phone-identification-button w-button">가입
                  완료</button>
               
            
            </div>

            <!--    signup-complete-button -->
            </form>
         
               
            <!-- 회원관리 2_ form 종료 -->



         </div>
      </div>
   </div>
   <script
      src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=65fa46eb9d90d967c69e39b1"
      type="text/javascript"
      integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
      crossorigin="anonymous"></script>
   <script src="js/webflow.js" type="text/javascript"></script>
   
   <script type="text/javascript">
      function Check(){
            alert('가입에 성공하였습니다. 메인으로 돌아가서 로그인 해 주세요.')
         }
      function fail({
            alert('회원가입에 실패..')
         
      })
   </script>



</body>
</html>