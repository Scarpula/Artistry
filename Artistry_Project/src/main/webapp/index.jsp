<%@page import="com.smhrd.model.KakaoUser"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page import="com.smhrd.controller.NaverLoginController" %>
<%@ page import="com.smhrd.controller.ApiExamMemberProfile" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%
    String code = request.getParameter("code");
    String state = request.getParameter("state"); 

    if (code != null && state != null) {
        try {
            String accessToken = NaverLoginController.getAccessToken(code, state);
            ApiExamMemberProfile.ACCESS_TOKEN = accessToken;
            ApiExamMemberProfile.getUserProfile();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
	
<!DOCTYPE html>
<!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Fri Apr 19 2024 05:34:53 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="65fa46eb9d90d967c69e39b8"
	data-wf-site="65fa46eb9d90d967c69e39b1">
<head>
<meta charset="utf-8">
<title>Scar&#x27;s Stupendous Site</title>
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
	  Member loginMember = (Member)session.getAttribute("member");
	  KakaoUser loginUser = (KakaoUser)session.getAttribute("kakaoUser");
	%>
	<div class="main">
		<div class="navbar-logo-left-3">
			<div data-animation="default" data-collapse="none"
				data-duration="400" data-easing="ease" data-easing2="ease"
				role="banner" class="nevbar shadow-three w-nav">
				<a href="index.jsp" aria-current="page"
					class="navbar-brand-3 w-nav-brand w--current"><img
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
										data-redirect="/research" action="artist-portfolio/portfolio.jsp?keyWord=" method="get"
										class="form-search" data-wf-page-id="65fa46eb9d90d967c69e39b8"
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
								<%if(loginMember!=null){ %>
								<%if(loginMember.getMb_Type().equals(true)){ %>
									<div>
										<h3><a href="MyPage.jsp"><%=loginMember.getMb_Nick() %>님</a></h3>
									</div>
								
								<%}else{%>
									<div>
										<h3><a href="artist-portfolio/artist-portfolio-page.jsp?artistEmail=<%=loginMember.getMb_Email()%>">
										<%=loginMember.getMb_Nick() %>님</a></h3>
									</div>
								<%} %>
								<%}else {%>
									<div>
										<h3><a href="log-in.jsp">로그인을 해주세요.</a></h3>
									</div> 
									<%}%>
									
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
							<%if(loginMember!=null || loginUser !=null){ %>
								<nav class="navbar-dropdown-list w-dropdown-list">
									<a href="MyPage.jsp" class="navbar-dropdown-link top w-dropdown-link">마이페이지</a>
									<a href="LogoutService" class="navbar-dropdown-link w-dropdown-link">로그아웃</a>
								</nav>
							<%}else{ %>
								<nav class="navbar-dropdown-list w-dropdown-list">
									<a href="log-in.jsp" class="navbar-dropdown-link top w-dropdown-link">마이페이지</a>
									<a href="log-in.jsp" class="navbar-dropdown-link w-dropdown-link">로그인</a>
									<a href="sign-up.jsp" class="navbar-dropdown-link w-dropdown-link">회원가입</a>
								</nav>
							<%} %>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="hero-container">
			<div class="container">
				<div class="hero-content">
					<div class="flex-center-text">
						<div class="text-hidden">
							<div
								style="-webkit-transform: translate3d(0, -20%, 0) scale3d(1, 1, 1) rotateX(-126deg) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, -20%, 0) scale3d(1, 1, 1) rotateX(-126deg) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, -20%, 0) scale3d(1, 1, 1) rotateX(-126deg) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, -20%, 0) scale3d(1, 1, 1) rotateX(-126deg) rotateY(0) rotateZ(0) skew(0, 0); transform-style: preserve-3d; opacity: 0"
								class="animation-on-load-1">
								<div class="hero-text-1">
									<h1 class="hero-text">Artistry</h1>
								</div>
							</div>
						</div>
						<div class="hero-description-holder">
							<div
								style="-webkit-transform: translate3d(0, 35%, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 35%, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 35%, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 35%, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); opacity: 0.04"
								class="animation-on-load-2">
								<div class="text-block">
								
							<% if(loginMember!=null){ %>
								<div class="text-span"><h1>&quot;<%=loginMember.getMb_Nick()%>님&quot;  의 예술, 세상과 연결되다 </h1></div><br>&quot;
							<%} else{ %>
									&quot; <span class="text-span">당신의 예술, 세상과 연결되다 </span>&quot;<br>&quot;
								<% }%>
									Connect Your Art to the World with Artistry &quot;
								</div>
								<div class="button-holder">
									<div data-w-id="d90ecd32-fcee-d920-ab75-b73cd84ef98a"
										class="slide-button-animation">
										<a style="-webkit-transform: translate3d(0, 0px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
											href="artist-portfolio/portfolio.jsp"
											class="button-2 _01 w-button">watch the picture</a>
										<link rel="prerender" href="/artist-portfolio/portfolio.jsp">
										<div
											style="-webkit-transform: translate3d(0, 0px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 0px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 0px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 0px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
											class="picture-button-wrap">
											<a href="artist-portfolio/portfolio.jsp"
												class="button-2 _02 w-button">watch the picture</a>
											<link rel="prerender" href="/artist-portfolio/portfolio">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="background-area">
			<div style="opacity: 0" class="picture-slap-area">
				<div class="feature-pictures-holder">
					<div class="features-hero-picture-wrapper">
						<div class="feature">
							<div
								style="-webkit-transform: translate3d(0%, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0%, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0%, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0%, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
								class="features-pictures _01">
								<div class="features-component-holder">
									<div class="feature-pictures">
										<div class="features-hero-pictures-holder">
											<div class="features-hero-pictures-container">
												<img src="images/1.png" loading="lazy" width="Auto"
													data-w-id="06b4e74d-212d-520f-5c38-8863d0c44b5a" alt=""
													srcset="images/1-p-500.png 500w, images/1-p-800.png 800w, images/1.png 1024w"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/2.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/2-p-500.png 500w, images/2-p-800.png 800w, images/2.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/9.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/9-p-500.png 500w, images/9-p-800.png 800w, images/9.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/1.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/1-p-500.png 500w, images/1-p-800.png 800w, images/1.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/2.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/2-p-500.png 500w, images/2-p-800.png 800w, images/2.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/3.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/3-p-500.png 500w, images/3-p-800.png 800w, images/3.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/4.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/4-p-500.png 500w, images/4-p-800.png 800w, images/4.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/5.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/5-p-500.png 500w, images/5-p-800.png 800w, images/5.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/6.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/6-p-500.png 500w, images/6-p-800.png 800w, images/6.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/7.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/7-p-500.png 500w, images/7-p-800.png 800w, images/7.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													data-w-id="48c8c233-d18a-576d-b207-af087a324f33"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													alt=""
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
										</div>
										<div class="features-hero-pictures-holder">
											<div class="features-hero-pictures-container">
												<img src="images/1.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/1-p-500.png 500w, images/1-p-800.png 800w, images/1.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/2.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/2-p-500.png 500w, images/2-p-800.png 800w, images/2.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/9.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/9-p-500.png 500w, images/9-p-800.png 800w, images/9.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/1.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/1-p-500.png 500w, images/1-p-800.png 800w, images/1.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/2.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/2-p-500.png 500w, images/2-p-800.png 800w, images/2.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/3.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/3-p-500.png 500w, images/3-p-800.png 800w, images/3.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/4.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/4-p-500.png 500w, images/4-p-800.png 800w, images/4.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/5.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/5-p-500.png 500w, images/5-p-800.png 800w, images/5.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/6.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/6-p-500.png 500w, images/6-p-800.png 800w, images/6.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/7.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/7-p-500.png 500w, images/7-p-800.png 800w, images/7.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div
								style="-webkit-transform: translate3d(0%, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0%, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0%, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0%, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
								class="features-pictures _02">
								<div class="features-component-holder">
									<div class="feature-pictures">
										<div class="features-hero-pictures-holder">
											<div class="features-hero-pictures-container">
												<img src="images/1.png" loading="lazy" width="Auto"
													data-w-id="06b4e74d-212d-520f-5c38-8863d0c44b5a" alt=""
													srcset="images/1-p-500.png 500w, images/1-p-800.png 800w, images/1.png 1024w"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/2.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/2-p-500.png 500w, images/2-p-800.png 800w, images/2.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/9.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/9-p-500.png 500w, images/9-p-800.png 800w, images/9.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/1.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/1-p-500.png 500w, images/1-p-800.png 800w, images/1.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/2.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/2-p-500.png 500w, images/2-p-800.png 800w, images/2.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/3.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/3-p-500.png 500w, images/3-p-800.png 800w, images/3.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/4.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/4-p-500.png 500w, images/4-p-800.png 800w, images/4.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/5.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/5-p-500.png 500w, images/5-p-800.png 800w, images/5.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/6.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/6-p-500.png 500w, images/6-p-800.png 800w, images/6.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/7.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/7-p-500.png 500w, images/7-p-800.png 800w, images/7.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													data-w-id="48c8c233-d18a-576d-b207-af087a324f33"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													alt=""
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
										</div>
										<div class="features-hero-pictures-holder">
											<div class="features-hero-pictures-container">
												<img src="images/1.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/1-p-500.png 500w, images/1-p-800.png 800w, images/1.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/2.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/2-p-500.png 500w, images/2-p-800.png 800w, images/2.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/9.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/9-p-500.png 500w, images/9-p-800.png 800w, images/9.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/1.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/1-p-500.png 500w, images/1-p-800.png 800w, images/1.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/2.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/2-p-500.png 500w, images/2-p-800.png 800w, images/2.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/3.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/3-p-500.png 500w, images/3-p-800.png 800w, images/3.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/4.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/4-p-500.png 500w, images/4-p-800.png 800w, images/4.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/5.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/5-p-500.png 500w, images/5-p-800.png 800w, images/5.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/6.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/6-p-500.png 500w, images/6-p-800.png 800w, images/6.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/7.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/7-p-500.png 500w, images/7-p-800.png 800w, images/7.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
											<div class="features-hero-pictures-container">
												<img src="images/8.png" loading="lazy"
													sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 300px"
													srcset="images/8-p-500.png 500w, images/8-p-800.png 800w, images/8.png 1024w"
													alt="" class="features-hero-pictures">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section">
				<div class="access-features">
					<div class="text-container">
						<div class="access-wrap">
							<div class="access-gird-holder _01">
								<div class="access-gird">
									<div class="access-card">
										<div
											style="-webkit-transform: translate3d(65px, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(-55deg) rotateZ(0) skew(0, 0); -moz-transform: translate3d(65px, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(-55deg) rotateZ(0) skew(0, 0); -ms-transform: translate3d(65px, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(-55deg) rotateZ(0) skew(0, 0); transform: translate3d(65px, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(-55deg) rotateZ(0) skew(0, 0); opacity: 0; transform-style: preserve-3d"
											class="access-small-image-holder">
											<img src="images/access-image.svg" loading="lazy" alt=""
												class="access-small-image">
										</div>
										<div class="access-image-holder">
											<div data-w-id="c8f5e3d4-3f18-52e5-5bd3-e2ea6f0ab967"
												class="access-image-container">
												<div
													style="opacity: 0; -webkit-transform: translate3d(177px, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(177px, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(177px, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(177px, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
													class="access-big-image-holder _01">
													<img src="images/Big-Image.jpg" loading="lazy"
														sizes="(max-width: 1254px) 100vw, (max-width: 1919px) 1254px, 497.79168701171875px"
														srcset="images/Big-Image-p-500.jpg 500w, images/Big-Image-p-800.jpg 800w, images/Big-Image-p-1080.jpg 1080w, images/Big-Image.jpg 1254w"
														alt="" class="access-big-image">
												</div>
											</div>
											<div class="access-background-holder _01">
												<img src="images/OrangeBG.jpg" loading="lazy"
													sizes="(max-width: 1102px) 100vw, (max-width: 1919px) 1102px, 497.79168701171875px"
													srcset="images/OrangeBG-p-500.jpg 500w, images/OrangeBG-p-800.jpg 800w, images/OrangeBG-p-1080.jpg 1080w, images/OrangeBG.jpg 1102w"
													alt="" class="access-background-image">
											</div>
										</div>
									</div>
									<div class="access-content">
										<div class="access-tag-holder">
											<div class="access-tag-container">
												<img src="images/Tag-Image1.svg" loading="lazy" alt="">
											</div>
											<div class="text-block-2">Explore</div>
										</div>
										<div class="access-title-holder">
											<h2 data-w-id="6bcb4aed-1e83-1c42-e678-bab822d5d265"
												style="opacity: 0; -webkit-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
												class="heading-2 _01">Speak Your Mind: Your Thoughts,
												Your Voice</h2>
										</div>
										<div class="access-paragraph-holder">
											<p
												style="opacity: 0; -webkit-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
												class="paragraph-3 _01">
												Lorem ipsum dolor sit amet, consectetur adipiscing elit.
												Mauris id nunc odio. Aliquam et tellus urna. Phasellus eget<br>
											</p>
										</div>
										<div class="access-button-holder">
											<a data-w-id="c68a7a06-dd29-7cbe-c812-70820b1c28aa"
												style="opacity: 0; -webkit-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
												href="#" class="button-3 _01 w-button">Get Early Access</a>
										</div>
									</div>
								</div>
							</div>
							<div class="access-gird-holder _02">
								<div class="access-gird">
									<div class="access-content">
										<div class="access-tag-holder">
											<div class="access-tag-container">
												<img src="images/Tag-Image2.svg" loading="lazy" alt="">
											</div>
											<div class="text-block-2">Boost</div>
										</div>
										<div class="access-title-holder">
											<h2 data-w-id="0194e8da-ca50-e8e0-f454-6670992dea8f"
												style="opacity: 0; -webkit-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
												class="heading-2 _02">Trending Now: Explore the Pulse
												of Swift</h2>
										</div>
										<div class="access-paragraph-holder">
											<p
												style="opacity: 0; -webkit-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
												class="paragraph-3 _02">
												Lorem ipsum dolor sit amet, consectetur adipiscing elit.
												Mauris id nunc odio. Aliquam et tellus urna. Phasellus eget<br>
											</p>
										</div>
										<div class="access-button-holder">
											<a
												style="opacity: 0; -webkit-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, 40px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
												href="#" class="button-3 _02 w-button">Get Early Access</a>
										</div>
									</div>
									<div class="access-card">
										<div class="access-image-holder">
											<div class="access-image-container _02">
												<div data-w-id="0194e8da-ca50-e8e0-f454-6670992dea84"
													style="-webkit-transform: translate3d(177px, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(177px, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(177px, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(177px, 0, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); opacity: 0"
													class="access-big-image-holder _02">
													<img src="images/Big-Image.jpg" loading="lazy"
														sizes="(max-width: 1254px) 100vw, (max-width: 1919px) 1254px, 409.79168701171875px"
														srcset="images/Big-Image-p-500.jpg 500w, images/Big-Image-p-800.jpg 800w, images/Big-Image-p-1080.jpg 1080w, images/Big-Image.jpg 1254w"
														alt="" class="access-big-image">
												</div>
											</div>
											<div class="access-background-holder _02">
												<img src="images/Hero-BG.webp" loading="lazy"
													sizes="(max-width: 1600px) 100vw, (max-width: 1919px) 1600px, 497.79168701171875px"
													srcset="images/Hero-BG-p-500.webp 500w, images/Hero-BG-p-800.webp 800w, images/Hero-BG-p-1080.webp 1080w, images/Hero-BG.webp 1600w"
													alt="" class="access-background-image">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section">
			<div class="visable-section-holder">
				<div class="visable-container">
					<div class="visable-gird-holder">
						<div class="w-layout-grid visable-gird">
							<div id="w-node-_6d2feb28-1bd7-bedd-eeae-9c6304ddfeb2-c69e39b8"
								class="visable-image-content-wrapper">
								<div class="visable-image-content-holder">
									<img src="images/Visable-Img.jpg" loading="lazy"
										sizes="(max-width: 1602px) 100vw, (max-width: 1919px) 1602px, 1144px"
										srcset="images/Visable-Img-p-500.jpg 500w, images/Visable-Img-p-800.jpg 800w, images/Visable-Img-p-1080.jpg 1080w, images/Visable-Img-p-1600.jpg 1600w, images/Visable-Img.jpg 1602w"
										alt="" class="visable-image">
								</div>
								<div class="visable-image-content-holder">
									<img src="images/visable-img2.jpg" loading="lazy"
										sizes="(max-width: 1602px) 100vw, (max-width: 1919px) 1602px, 1144px"
										srcset="images/visable-img2-p-500.jpg 500w, images/visable-img2-p-800.jpg 800w, images/visable-img2-p-1080.jpg 1080w, images/visable-img2-p-1600.jpg 1600w, images/visable-img2.jpg 1602w"
										alt="" class="visable-image">
								</div>
								<div class="visable-image-content-holder">
									<img src="images/VIsable-img3.jpg" loading="lazy"
										sizes="(max-width: 1602px) 100vw, (max-width: 1919px) 1602px, 1144px"
										srcset="images/VIsable-img3-p-500.jpg 500w, images/VIsable-img3-p-800.jpg 800w, images/VIsable-img3-p-1080.jpg 1080w, images/VIsable-img3-p-1600.jpg 1600w, images/VIsable-img3.jpg 1602w"
										alt="" class="visable-image">
								</div>  
							</div>
							<div id="w-node-d895e512-e60d-f2ab-0d94-d0e6e1a04169-c69e39b8"
								class="visable-content-wrapper">
								<div class="visable-content">
									<div>
										안녕 <br>‍
									</div>
									<div class="visable-heading-holder">
										<h2 class="heading-3">
											Our app is designed to be<br>visible
										</h2>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscing
											elit. Mauris id nunc odio. Aliquam et tellus urna. Phasellus
											eget</p>
									</div>
									<a href="#" class="button-4 w-button">Get early access</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<section class="footer-dark-4">
			<div class="container-13">
				<div class="footer-wrapper-4">
					<a href="#" class="footer-brand-4 w-inline-block"><img
						src="https://uploads-ssl.webflow.com/62434fa732124a0fb112aab4/62434fa732124a332512aaee_placeholder-1.svg"
						loading="lazy" alt=""></a>
					<div class="footer-content-4">
						<div id="w-node-_1e9011f8-b6b4-4a86-4c60-dca647754811-c69e39b8"
							class="footer-block-4">
							<div class="title-small-4">Company</div>
							<a href="#" class="footer-link-4">How it works</a> <a href="#"
								class="footer-link-4">Pricing</a> <a href="#"
								class="footer-link-4">Docs</a>
						</div>
						<div id="w-node-_1e9011f8-b6b4-4a86-4c60-dca64775481a-c69e39b8"
							class="footer-block-4">
							<div class="title-small-4">Resources</div>
							<a href="#" class="footer-link-4">Blog post name list goes
								here</a> <a href="#" class="footer-link-4">Blog post name list
								goes here</a> <a href="#" class="footer-link-4">Blog post name
								list goes here</a> <a href="#" class="footer-link-4">See all
								resources &gt;</a>
						</div>
						<div id="w-node-_1e9011f8-b6b4-4a86-4c60-dca647754825-c69e39b8"
							class="footer-block-4">
							<div class="title-small-4">About</div>
							<a href="#" class="footer-link-4">Terms &amp; Conditions</a> <a
								href="#" class="footer-link-4">Privacy policy</a>
							<div class="footer-social-block-4">
								<a href="#" class="footer-social-link-4 w-inline-block"><img
									src="https://uploads-ssl.webflow.com/62434fa732124a0fb112aab4/62434fa732124ac15112aad5_twitter%20small.svg"
									loading="lazy" alt=""></a> <a href="#"
									class="footer-social-link-4 w-inline-block"><img
									src="https://uploads-ssl.webflow.com/62434fa732124a0fb112aab4/62434fa732124a389912aad8_linkedin%20small.svg"
									loading="lazy" alt=""></a> <a href="#"
									class="footer-social-link-4 w-inline-block"><img
									src="https://uploads-ssl.webflow.com/62434fa732124a0fb112aab4/62434fa732124a51bf12aae9_facebook%20small.svg"
									loading="lazy" alt=""></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-divider-4"></div>
			<div class="footer-copyright-center-4">Copyright © 2021 Company
				name</div>
		</section>
	</div>
	<script
		src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=65fa46eb9d90d967c69e39b1"
		type="text/javascript"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script src="js/webflow.js" type="text/javascript"></script>
</body>
</html>