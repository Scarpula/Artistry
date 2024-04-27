<%@page import="com.smhrd.model.Member"%>
<%@page import="com.smhrd.model.ReqDAO"%>
<%@page import="com.smhrd.model.Req"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Sat Apr 27 2024 04:53:56 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="662c80866e0e4feedf74700c"
	data-wf-site="65fa46eb9d90d967c69e39b1">
<head>
<meta charset="utf-8">
<title>Request detail Page</title>
<meta content="Request detail Page" property="og:title">
<meta content="Request detail Page" property="twitter:title">
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
		int req_idx = Integer.parseInt(request.getParameter("idx"));
		Req req = new ReqDAO().get_req_detail(req_idx);
	%>
	<div class="main">
		<div class="navbar-logo-left-3">
			<div data-animation="default" data-collapse="none"
				data-duration="400" data-easing="ease" data-easing2="ease"
				role="banner" class="nevbar shadow-three w-nav">
				<a href="index.html" class="navbar-brand-3 w-nav-brand"><img
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
										data-redirect="/research"
										action="artist-portfolio/portfolio.jsp?keyWord=" method="get"
										class="form-search" data-wf-page-id="662c80866e0e4feedf74700c"
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
				<%
				if (loginMember != null) {
				%>
				<%
				if (loginMember.getMb_Type().equals(true)) {
				%>
				<div>
					<h3>
						<a href="MyPage.jsp" style="margin-right: 45px;"><%=loginMember.getMb_Nick()%>님</a>
					</h3>
				</div>
				<%
				} else {
				%>
				<div>
					<h3>
						<a
							href="artist-portfolio/artist-portfolio-page.jsp?artistEmail=<%=loginMember.getMb_Email()%>"
							style="margin-right: 45px;"> <%=loginMember.getMb_Nick()%>님
						</a>
					</h3>
				</div>
				<%
				}
				%>
				<%} %>
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
							<%
							if (loginMember != null) {
							%>
							<nav class="navbar-dropdown-list w-dropdown-list">
								<a href="MyPage.jsp"
									class="navbar-dropdown-link top w-dropdown-link">마이페이지</a> <a
									href="LogoutService"
									class="navbar-dropdown-link w-dropdown-link">로그아웃</a>
							</nav>
							<%
							} else {
							%>
							<nav class="navbar-dropdown-list w-dropdown-list">
								<a href="log-in.jsp"
									class="navbar-dropdown-link top w-dropdown-link">마이페이지</a> <a
									href="log-in.jsp" class="navbar-dropdown-link w-dropdown-link">로그인</a>
								<a href="sign-up.jsp"
									class="navbar-dropdown-link w-dropdown-link">회원가입</a>
							</nav>
							<%
							}
							%>
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
		<div class="request-detail-container">
			<div class="request-detail-block">
				<div class="detail-text-wrap">
					<h1>상세 요청서</h1>
				</div>
				<div class="detail-section">
					<div class="picture-area">
						<a href="<%=req.getReq_img_path() %>" download><img
							src="<%=req.getReq_img_path() %>" loading="lazy" alt=""
							class="image-area"></a>
					</div>
					<div class="detail-text">
						<p><%=req.getReq_paper() %></p>
					</div>
					<div class="request-detail-requester">
						<div class="requester">
							<h1>의뢰자 :</h1>
						</div>
						<h1 id="Requester" class="requester-id"><%=req.getMb_Email() %></h1>
						<div class="infotext">
							<h6 class="heading-20">이미지를 클릭하면 다운로드 됩니다</h6>
						</div>
					</div>
				</div>
				<a
					href="artist-portfolio/artist-portfolio-page.jsp?artistEmail=<%=req.getReq_receiver() %>"
					class="backpage-button w-button">돌아가기</a>
			</div>
		</div>
	</div>
	<script
		src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=65fa46eb9d90d967c69e39b1"
		type="text/javascript"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script src="js/webflow.js" type="text/javascript"></script>
</body>
</html>