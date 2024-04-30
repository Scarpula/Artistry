<%@page import="com.smhrd.model.ReqDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="com.smhrd.model.Req"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Sat Apr 27 2024 07:25:43 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="662ca2f3252e40c57915c85d" data-wf-site="65fa46eb9d90d967c69e39b1">
<head>


  <meta charset="utf-8">
  <title>Payments Page</title>
  <meta content="Payments Page" property="og:title">
  <meta content="Payments Page" property="twitter:title">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="css/normalize.css" rel="stylesheet" type="text/css">
  <link href="css/webflow.css" rel="stylesheet" type="text/css">
  <link href="css/scars-stupendous-site-9634ca.webflow.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
  <script type="text/javascript">WebFont.load({  google: {    families: ["Exo:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic","Montserrat:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic","Oswald:200,300,400,500,600,700","Merriweather:300,300italic,400,400italic,700,700italic,900,900italic","PT Sans:400,400italic,700,700italic"]  }});</script>
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
  <link href="images/webclip.png" rel="apple-touch-icon">
    <style>
  a:-webkit-any-link {
    color: black;
    cursor: pointer;
    text-decoration: none;
}
  </style>
</head>
<body class="body">

   <% 
   Member loginMember = (Member) session.getAttribute("member");
   String mb_Email = loginMember.getMb_Email();
   List<Req> ReqInfo = new ReqDAO().ReqAll(mb_Email);
   System.out.print("의뢰내용 출력 : "+ mb_Email + ReqInfo);
   
   %>




  <div class="main">
    <div class="navbar-logo-left-3">
      <div data-animation="default" data-collapse="none" data-duration="400" data-easing="ease" data-easing2="ease" role="banner" class="nevbar shadow-three w-nav">
        <a href="index.jsp" class="navbar-brand-3 w-nav-brand"><img src="images/Artistry-logo4.jpg" loading="lazy" width="240" height="100" alt="" class="image-2"></a>
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
                  <form id="wf-form-Search-Form" name="wf-form-Search-Form" data-name="Search Form" redirect="/research" data-redirect="/research" action="artist-portfolio/portfolio.jsp?keyWord=" method="get" class="form-search" data-wf-page-id="662ca2f3252e40c57915c85d" data-wf-element-id="39529a09-50bd-5c07-ff29-0fe03328b2c5"><input class="search-field w-input" maxlength="256" name="Search-2" data-name="Search 2" placeholder="Search on Artistry.." data-w-id="39529a09-50bd-5c07-ff29-0fe03328b2c6" type="text" id="Search">
                    <div class="search-icon-wrap">
                      <a href="#" target="_blank" class="link-block w-inline-block"><img src="images/search.svg" loading="lazy" alt=""></a>
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
			<%
			if (loginMember.getMb_Type().equals(true)) {
			%>
			<div>
				<h3>
					<a href="MyPage.jsp"><%=loginMember.getMb_Nick()%>님</a>
				</h3>
			</div>

			<%
			} else {
			%>
			<div>
				<h3>
					<a
						href="artist-portfolio/artist-portfolio-page.jsp?artistEmail=<%=loginMember.getMb_Email()%>">
						<%=loginMember.getMb_Nick()%>님
					</a>
				</h3>
			</div>
			<%
			}
			%>
			<%
			}
			%>
        <ul role="list" class="nav-list right">
          <li class="nav-item hide">
            <div class="divider-vertical bg-dgray01"></div>
          </li>
          
          <li class="nav-item hide">
            <div class="divider-vertical bg-dgray01"></div>
          </li>
          <li class="nav-item">
            <div data-hover="false" data-delay="0" class="navbar-dropdown w-dropdown">
              <div class="navbar-dropdown-toggle w-dropdown-toggle"><img width="24" height="24" alt="" src="images/user.svg" loading="lazy"></div>
              <nav class="navbar-dropdown-list w-dropdown-list">
                <a href="myPage.jsp" class="navbar-dropdown-link top w-dropdown-link">마이페이지</a>
                <a href="LogoutService" class="navbar-dropdown-link w-dropdown-link">로그아웃</a>
              </nav>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="payments-container">
    <div class="payments-wrap">
      <div class="payments-head">
        <h1 class="heading-21">결제하기</h1>
      </div>
      <!-- 의뢰 테이블 시작 -->
            <div class="payments-wrapper">
        <div class="w-layout-grid grid-2">
          <div id="w-node-f1f41a82-2cfd-cebc-a113-48f8fde52482-7915c85d" class="paymentsblock"><h3>번호</h3></div>
          <div id="w-node-a2ead6d9-1da7-5d16-d2de-e2cb1f663ba1-7915c85d" class="paymentsblock"><h3>품목</h3></div>
          <div id="w-node-_5bf0eadf-30b1-5f9b-f2bb-a59f74093558-7915c85d" class="paymentsblock"><h3>아티스트</h3></div>
          <div id="w-node-af628076-ec46-90ed-e678-28c37ab249f8-7915c85d" class="paymentsblock"><h3>금액</h3></div>
          <div id="w-node-_8eb31830-814b-85ad-ef37-d10a558afce8-7915c85d" class="paymentsblock"><h3>결제</h3></div>
          <div id="w-node-_817ca628-9d85-b685-0136-d0d3ce72748d-7915c85d" class="paymentsblock"><h3>확인</h3></div>
       
       <!-- 일반회원 의뢰내역 for문 시작 -->  
        
          <%
           int num= 1;
          for(Req r: ReqInfo){%>
          <div id="w-node-eb818534-9416-27a2-b990-1e0372e850c8-7915c85d" class="paymentsblock"><%=r.getReq_idx()%></div>
          <div id="w-node-e7c6fdf9-c27a-15a9-785c-2962a4f75b8f-7915c85d" class="paymentsblock"><%= r.getReq_paper()%></div>
          <div id="w-node-_37805949-41a8-0794-995f-e59819ba866f-7915c85d" class="paymentsblock"><%=r.getReq_receiver()%></div>
          <div id="w-node-c33fe992-742b-72eb-d7a6-dcd2870af06e-7915c85d" class="paymentsblock"><%=r.getReq_price()%></div>
          <div id="w-node-_8b363230-c83d-14c2-56fa-c4d36536bc7c-7915c85d" class="paymentsblock">
            <button class="link-3" onclick="checkOut(<%=r.getReq_idx()%>,<%=r.getReq_price()%>)">결제하기</button>
          </div>
          <div id="w-node-c6f41e41-e3bc-d217-61a1-74edb6e000ec-7915c85d" class="paymentsblock">
            <p class="link-4" id="result">확인</p>
          </div>
          <%  num ++; }%>
          
        </div>
      </div>
    </div>
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=65fa46eb9d90d967c69e39b1" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow.js" type="text/javascript"></script>
  
  
  <!-- 결제API포트원서비스 SDK스크립트_기현수-->
   <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
     <!-- 포트원 결제API_기현수 -->
  <script type="text/javascript">
    
     var IMP = window.IMP;
     IMP.init("imp27513274");
     
     function checkOut(idx,price){
          IMP.request_pay({
              pg: "kakaopay.TC0ONETIME",
              pay_method: "card",
              merchant_uid: idx, //주문번호
              name: "아티스트리 의뢰",
              amount: price,
            //buyer_name: email,
              // buyer_tel: "010-1234-5678",
              // buyer_addr: "서울특별시 강남구 삼성동",
              // buyer_postcode: "123-456"
              },
              function(rsp){
                  //callback
                  //rsp.imp_udi값으로 결제 단건조회 API를 호출하여 결제결과 판단
                  if(rsp.success){
                      alert('결제가 성공적으로 완료되었습니다.');
                      console.log(rsp);
                      var result_success=$('#result').val();
                      console.log(result_success);
                      
                  }else{
                      alert('결제에 실패하였습니다:.' );
                      console.log(rsp);
                     }
                  }
          )
      }
   </script>
  
</body>
</html>