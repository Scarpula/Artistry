<%@page import="com.smhrd.model.Artists"%>
<%@page import="com.smhrd.model.ArtistDAO"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="com.smhrd.model.PortDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE html>
<!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Wed Apr 17 2024 00:40:02 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="660a443f25f0805e11168024"
	data-wf-site="65fa46eb9d90d967c69e39b1">
<head>
<meta charset="utf-8">
<title>portFolio</title>
<meta content="portFolio" property="og:title">
<meta content="portFolio" property="twitter:title">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="Webflow" name="generator">
<link href="../css/normalize.css" rel="stylesheet" type="text/css">
<link href="../css/webflow.css" rel="stylesheet" type="text/css">
<link href="../css/scars-stupendous-site-9634ca.webflow.css"
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
<link href="../images/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<link href="../images/webclip.png" rel="apple-touch-icon">
<script
	src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=65fa46eb9d90d967c69e39b1"
	type="text/javascript"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<script src="../js/webflow.js" type="text/javascript"></script>
</head>
<body class="body">
	<%
	String keyWord = request.getParameter("Search-2");
	/* System.out.print(keyWord); */
	Member loginMember = (Member) session.getAttribute("member");
	List<Artists> artistList = new ArtistDAO().get_artist_list();
	List<Artists> searchList = null;
	if(keyWord != null){
		searchList = new ArtistDAO().get_search_list(keyWord);
	}
	System.out.print(searchList);
	%>
	<div class="main">
		<div class="navbar-logo-left-3">
			<div data-animation="default" data-collapse="none"
				data-duration="400" data-easing="ease" data-easing2="ease"
				role="banner" class="nevbar shadow-three w-nav">
				<a href="../index.jsp" class="navbar-brand-3 w-nav-brand"><img
					src="../images/Artistry-logo4.jpg" loading="lazy" width="240"
					height="100" alt="" class="image-2"></a>
				<div class="container-9">
					<div class="navbar-wrapper-3">
						<ul role="list" class="nav-list cate">
							<li class="nav-item hide">
								<div class="divider-vertical bg-dgray01"></div>
							</li>
						</ul>
						<div class="search-wrap">
							<div data-hover="false" data-delay="0"
								class="dropdown w-dropdown">
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
										data-redirect="/research" action="portfolio.jsp?keyWord=" method="get"
										class="form-search" data-wf-page-id="660a443f25f0805e11168024"
										data-wf-element-id="39529a09-50bd-5c07-ff29-0fe03328b2c5">
										<input class="search-field w-input" maxlength="256"
											name="Search-2" data-name="Search 2"
											placeholder="Search on Artistry.."
											data-w-id="39529a09-50bd-5c07-ff29-0fe03328b2c6" type="text"
											id="Search">
										<div class="search-icon-wrap">
											<a href="#" target="_blank" class="link-block w-inline-block"><img
												src="../images/search.svg" loading="lazy" alt=""></a>
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
								<a href="../log-in.jsp"
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
		<div class="catebar">
			<div class="catecontainer"></div>
		</div>
		<div class="banner-wrap">
			<div class="banner-container">
				<div class="banner-text">
					<div class="text-block-3">
						Hello Users I love you<br>Welcome to<em> Artistry</em><br>
					</div>
				</div>
				<div class="banner-image">
					<img src="../images/1.png" loading="lazy" width="75" height="75"
						alt=""
						srcset="../images/1-p-500.png 500w, ../images/1-p-800.png 800w, ../images/1.png 1024w"
						sizes="(max-width: 479px) 100vw, 75px" class="image-3">
				</div>
			</div>
		</div>
		<div class="main-wrap">
			<div class="floating-tab">
				<div class="w-layout-grid content-cate">
					<div id="w-node-e76bf4a4-df69-df35-8417-908a88aff6fa-11168024"
						class="filter-accordion-wrap">
						<a data-w-id="cd3495c7-a313-c4e7-ca25-d1c5ccffb9db" href="#"
							class="filter-accordion-head w-inline-block">
							<h1 class="heading-h3">commercial</h1> <img
							src="../images/arrow_up.svg" loading="lazy" alt=""
							class="cateonimage">
						</a>
						<div class="filter-accordion-body">
							<div class="filter-form-block w-form">
							<!-- 검색 체크박스 폼 시작 -->
								<form id="wf-form--4" name="email-form" data-name="Email Form"
									method="get" class="form" action="../SearchService"
									data-wf-page-id="660a443f25f0805e11168024"
									data-wf-element-id="99cf0d8e-01a3-ec36-b932-66d53bbf673d">
									<div class="filter-check-wrap">
										<div class="filter-check-field">
											<label class="w-checkbox filter-checkbox-field"><input
												type="checkbox" id="checkbox" name="cateBox1" 
												data-name="Checkbox" value="캐릭터"
												class="w-checkbox-input filter-checkbox"><span
												class="filter-checkbox-label w-form-label" for="checkbox">캐릭터</span></label><label
												class="w-checkbox filter-checkbox-field"><input
												type="checkbox" id="checkbox-2" name="cateBox2"
												data-name="Checkbox 2" value="일러스트"
												class="w-checkbox-input filter-checkbox"><span
												class="filter-checkbox-label w-form-label" for="checkbox-2">일러스트</span></label><label
												class="w-checkbox filter-checkbox-field"><input
												type="checkbox" id="checkbox-2" name="cateBox3"
												data-name="Checkbox 2" value="캐리커쳐"
												class="w-checkbox-input filter-checkbox"><span
												class="filter-checkbox-label w-form-label" for="checkbox-2">캐리커쳐</span></label><label
												class="w-checkbox filter-checkbox-field"><input
												type="checkbox" id="checkbox-2" name="cateBox4"
												data-name="Checkbox 2" value="이모티콘"
												class="w-checkbox-input filter-checkbox"><span
												class="filter-checkbox-label w-form-label" for="checkbox-2">이모티콘</span></label><label
												class="w-checkbox filter-checkbox-field"><input
												type="checkbox" id="checkbox-2" name="cateBox5"
												data-name="Checkbox 2" value="캘리그라피/로고"
												class="w-checkbox-input filter-checkbox"><span
												class="filter-checkbox-label w-form-label" for="checkbox-2">캘리그라피/로고</span></label>
												<input type="submit" value="검색하기">
										</div>
									</div>
								</form>
							<!-- 검색 체크박스 폼 끝 -->
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
					<div id="w-node-_6cd93f0b-7ce8-02a7-12b9-274e4bce371b-11168024"
						class="filter-accordion-wrap">
						<a data-w-id="6cd93f0b-7ce8-02a7-12b9-274e4bce371c" href="#"
							class="filter-accordion-head w-inline-block"> </a>
						<div class="filter-accordion-body">
							<div class="filter-form-block w-form">
								<form id="wf-form--4" name="email-form" data-name="Email Form"
									method="get" class="form"
									data-wf-page-id="660a443f25f0805e11168024"
									data-wf-element-id="6cd93f0b-7ce8-02a7-12b9-274e4bce3722">
									<div class="filter-check-wrap">
										<div class="filter-check-field"></div>
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
					<div class="divider bg-dgrey01"></div>
				</div>
			</div>
			<div class="main-view">
				<div
					style="opacity: 0; -webkit-transform: translate3d(0, 25px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 25px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 25px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 25px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
					class="list-content-wrap">
					<div data-hover="false" data-delay="0"
						class="art-view-dropdown w-dropdown"></div>
					<div data-hover="false" data-delay="0"
						class="art-view-dropdown w-dropdown"></div>
				</div>
				<div class="art-view-main">
					<div class="w-layout-grid art-grid">
						<!-- 작가 별 시작 -->
						<%
						if(searchList != null) {
						%>
						<%
						for (int i = 0; i < searchList.size(); i++) {
						%>
						<div id="w-node-_733c6bee-1a7f-f234-7502-c31924bd6773-11168024"
							class="art-item">
							<div data-w-id="51e1b636-57d6-a97a-d0c5-40ad8bfecd18"
								class="art-wrap">
								<a
									style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
									href="#" class="art-link-block w-inline-block"><img
									src="../images/1.png" loading="lazy" width="218" height="218"
									alt=""
									srcset="../images/1-p-500.png 500w, ../images/1-p-800.png 800w, ../images/1.png 1024w"
									sizes="(max-width: 479px) 100vw, 218px" class="image-5"></a>
							</div>
							<div class="text-wrap">
								<a
									href="artist-portfolio-page.jsp?artistEmail=<%=searchList.get(i).getArtist_nick()%>"
									class="title-link"> <%=searchList.get(i).getArtist_nick()%></a>
								<div class="divider bg-dgrey01 art-main"></div>
								<div class="artist-link-wrap">
									<a href="#" class="artist-link"><%=searchList.get(i).getArtist_nick()%></a><img
										src="../images/label-check.png" loading="lazy" width="30"
										height="30" alt="" class="image-4"><img
										src="../images/label-award.png" loading="lazy" width="30"
										height="30" alt="" class="image-6">
								</div>
								<div class="work-period">
									<div class="work-period-text-wrap">work Period : 2day</div>
								</div>
								<div class="divider bg-dgrey01 art-main"></div>
								<div class="price-tag">
									<h3><%=searchList.get(i).getMin_price()%>won ~ <%=searchList.get(i).getMax_price() %>won</h3>
								</div>
							</div>
						</div>
						<%} %>
						<%
						}else{
						%>
						<%
						for (int i = 0; i < artistList.size(); i++) {
						%>
						<div id="w-node-_733c6bee-1a7f-f234-7502-c31924bd6773-11168024"
							class="art-item">
							<div data-w-id="51e1b636-57d6-a97a-d0c5-40ad8bfecd18"
								class="art-wrap">
								<a
									style="-webkit-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
									href="#" class="art-link-block w-inline-block"><img
									src="../images/1.png" loading="lazy" width="218" height="218"
									alt=""
									srcset="../images/1-p-500.png 500w, ../images/1-p-800.png 800w, ../images/1.png 1024w"
									sizes="(max-width: 479px) 100vw, 218px" class="image-5"></a>
							</div>
							<div class="text-wrap">
								<a
									href="artist-portfolio-page.jsp?artistEmail=<%=artistList.get(i).getArtist_nick()%>"
									class="title-link"> <%=artistList.get(i).getArtist_nick() %></a>
								<div class="divider bg-dgrey01 art-main"></div>
								<div class="artist-link-wrap">
									<a href="#" class="artist-link"><%=artistList.get(i).getArtist_nick()%></a><img
										src="../images/label-check.png" loading="lazy" width="30"
										height="30" alt="" class="image-4"><img
										src="../images/label-award.png" loading="lazy" width="30"
										height="30" alt="" class="image-6">
								</div>
								<div class="work-period">
									<div class="work-period-text-wrap">work Period : 2day</div>
								</div>
								<div class="divider bg-dgrey01 art-main"></div>
								<div class="price-tag">
									<h3><%=artistList.get(i).getMin_price()%>won ~ <%=artistList.get(i).getMax_price() %>won</h3>
								</div>
							</div>
						</div>
							<%} %>
						<%} %>
						<!-- 작가 별 종료 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="footer-dark-4">
      <div class="footer-container">
        <a href="#" class="footer-brand-4 w-inline-block"><img src="../images/Artistry-logo3.jpg" loading="lazy" width="185" alt="" class="footer-icon-img"></a>
        <div class="footer-wrapper-4">
          <div class="footer-content-4">
            <div id="w-node-_988edab2-af3d-f4e1-d904-273e08cd073c-08cd0736" class="footer-block-4">
              <div class="title-small-4">team Artistry</div>
              <a href="#" class="footer-link-4">이성도</a>
              <a href="#" class="footer-link-4">조준범</a>
              <a href="#" class="footer-link-4">기현수</a>
              <a href="#" class="footer-link-4">윤명상</a>
            </div>
            <div id="w-node-_988edab2-af3d-f4e1-d904-273e08cd0745-08cd0736" class="footer-block-4">
              <div class="title-small-4">EMAIL</div>
              <a href="https://mail.naver.com/v2/folders/0/all" class="footer-link-4">dltjdeh7745@naver.com</a>
              <a href="https://mail.naver.com/v2/folders/0/all" class="footer-link-4">qoddkfdl@gmail.com</a>
              <a href="https://mail.naver.com/v2/folders/0/all" class="footer-link-4">hyunsoo1753@gmail.com</a>
              <a href="https://mail.naver.com/v2/folders/0/all" class="footer-link-4">See all resources &gt;</a>
            </div>
            <div id="w-node-_988edab2-af3d-f4e1-d904-273e08cd0750-08cd0736" class="footer-block-4">
              <div class="title-small-4">Address</div>
              <a href="#" class="footer-link-4">광주 동구 예술길 31-15 4층</a>
              <a href="#" class="footer-link-4">대의동 10-1</a>
              <a href="#" class="footer-link-4">61474</a>
              <div class="footer-social-block-4">
                <a href="https://map.naver.com/p/search/%EC%8A%A4%EB%A7%88%ED%8A%B8%EC%9D%B8%EC%9E%AC%EA%B0%9C%EB%B0%9C%EC%9B%90/place/1115170819?placePath=?entry=pll&amp;from=nx&amp;fromNxList=true&amp;searchType=place&amp;mapsvc=true&amp;maplocsvc=true&amp;agree=true&amp;c=18.01,0,0,0,dh" target="_blank" class="footer-social-link-4 w-inline-block"><img src="../images/home_pin_FILL0_wght400_GRAD0_opsz24.svg" loading="lazy" alt=""></a>
                <a href="#" class="footer-social-link-4 w-inline-block"></a>
                <a href="#" class="footer-social-link-4 w-inline-block"></a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="footer-divider-4"></div>
      <div class="footer-copyright-center-4">Copyright © 2024 Artistry</div>
    </section>
	<script
		src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=65fa46eb9d90d967c69e39b1"
		type="text/javascript"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script src="../js/webflow.js" type="text/javascript"></script>
	<script>
		$(document).ready(
				function() {
					var dropdownToggle = $("#draggableDropdownToggle");
					var dropdownList = dropdownToggle.next(".w-dropdown-list");
					var dropdown = $('.history-tab-dropdown');
					var lastScrollTop = 0;
					$(window).scroll(function() {
						var scrollTop = $(this).scrollTop();
						if (scrollTop > lastScrollTop) {
							dropdown.addClass('delayed');
						} else {
							dropdown.removeClass('delayed');
						}
						lastScrollTop = scrollTop;
					});
					dropdownToggle.css("cursor", "move");
					dropdownToggle.on("mousedown", function(e) {
						var offsetX = e.offsetX;
						var offsetY = e.offsetY;
						$(document).on(
								"mousemove",
								function(e) {
									dropdownToggle.css({
										"left" : e.pageX - offsetX + "px",
										"top" : e.pageY - offsetY + "px"
									});
									dropdownList.css({
										"left" : e.pageX - offsetX + "px",
										"top" : e.pageY - offsetY
												+ dropdownToggle.outerHeight()
												+ "px"
									});
								});
					});
					$(document).on("mouseup", function() {
						$(document).off("mousemove");
					});
				});
		$(document).on("mouseup", function() {
			$(document).off("mousemove");
		});
	</script>
</body>
</html>