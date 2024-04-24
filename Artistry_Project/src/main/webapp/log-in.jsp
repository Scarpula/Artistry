<%@page import="com.smhrd.model.KakaoUser"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Wed Apr 17 2024 00:40:02 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="65fd1577d3de0c8242fadc8c"
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
	Member loginMember = (Member) session.getAttribute("member");
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
									class="form-search" data-wf-page-id="65fd1577d3de0c8242fadc8c"
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
						<%
						// 세션에서 사용자 정보 가져오기
						KakaoUser loginUser = (KakaoUser) session.getAttribute("kakaoUser");
						%>
						<%
						if (loginUser != null) {
						%>
						<!-- 로그인 된 경우 -->
						<nav class="navbar-dropdown-list w-dropdown-list">
							<a href="#" class="navbar-dropdown-link top w-dropdown-link">마이페이지</a>
							<a href="#" onclick="kakaoLogout(event)"
								class="navbar-dropdown-link w-dropdown-link">로그아웃</a>
						</nav>

						<%
						} else {
						%>
						<!-- 로그인 되지 않은 경우 -->
						<nav class="navbar-dropdown-list w-dropdown-list">
							<a href="#" aria-current="page"
								class="navbar-dropdown-link w-dropdown-link w--current">로그인</a>
							<a href="sign-up.jsp"
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
	<div
		style="opacity: 0; -webkit-transform: translate3d(0, -20px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, -20px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, -20px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, -20px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
		class="loginform-wrapper">
		<div class="login-form-block">
			<div class="loginform">
				<div class="artistry-banner">
					<h1 class="artistry-head-text">Artistry</h1>
				</div>
				<div class="basic-login-form">
					<div class="artistry-login-form w-form">
						<form id="wf-form-" name="LoginForm" action="LoginService"
							method="post" class="artistry-form-block">
							<div class="logintextform">E-mail</div>
							<input class="text-field login-form w-input" maxlength="256"
								name="mb_Email" data-name="email" placeholder="E-mail"
								type="text" id="email">
							<div class="logintextform">PW</div>
							<input class="text-field-2 w-input" maxlength="256" name="mb_Pw"
								data-name="pw" placeholder="PW" type="password" id="pw">
							<input type="submit" data-wait="Please wait..."
								class="login-button w-button" value="로그인"> <a
								href="sign-up.jsp" target="_blank"
								class="sign-up-button loginpage w-button">회원가입</a>
						</form>
					</div>
					<%
					String clientId = "h9rK2bSi9jq7AfwqvdSJ";//애플리케이션 클라이언트 아이디값";
					String redirectURI = URLEncoder.encode("http://localhost:8081/Artistry_Project/index.jsp", "UTF-8");
					SecureRandom random = new SecureRandom();
					String state = new BigInteger(130, random).toString();
					String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
					apiURL += "&client_id=" + clientId;
					apiURL += "&redirect_uri=" + redirectURI;
					apiURL += "&state=" + state;
					session.setAttribute("state", state);
					%>
					<div class="sns-login-button">
						<div class="sns-logo naver">
							<a href="<%=apiURL%>" class="w-inline-block"> <img
								src="images/naver_icon.png" loading="lazy" width="80"
								height="80" alt="" class="logo-image">
							</a>
						</div>
						<div class="sns-logo kakao">
							<a href="javascript:kakaoLogin()" class="w-inline-block"> <img
								src="images/kakao-logo.png" loading="lazy" width="80"
								height="80" alt="" class="logo-image">
							</a>
						</div>
						<!-- 구글 연동 스크립트 -->
						<script src="https://accounts.google.com/gsi/client" async defer></script>


						<div class="sns-logo google">
							<a href="#" onclick="handleGoogleLogin()" class="w-inline-block">
								<img src="images/google-real-logo.png" loading="lazy" width="80"
								height="80" alt="" class="logo-image">
							</a>
						</div>

						<script type="text/javascript"
							src="https://developers.kakao.com/sdk/js/kakao.js"></script>
						<script type="text/javascript">
							Kakao.init('02c23cde395efa25162c48a90df59fc2');
							function kakaoLogin() {
								Kakao.Auth
										.login({
											success : function(response) {
												Kakao.API
														.request({
															url : '/v2/user/me',
															success : function(
																	response) {
																var email = response.kakao_account.email;
																var nickname = response.properties.nickname;
																var profileImageUrl = response.properties.profile_image;

																// 사용자 정보를 컨트롤러로 전달
																window.location.href = "KakaoLoginController?email="
																		+ email
																		+ "&nickname="
																		+ encodeURIComponent(nickname)
																		+ "&profileImageUrl="
																		+ encodeURIComponent(profileImageUrl);
															},
															fail : function(
																	error) {
																alert(JSON
																		.stringify(error))
															},
														})
											},
											fail : function(error) {
												alert(JSON.stringify(error))
											},
										})
							}
						</script>
					</div>
				</div>
			</div>
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
		function kakaoLogout(event) {
			Kakao.Auth.logout(function() {
				// 로그아웃 성공 시 처리할 코드
				alert('카카오 로그아웃 완료');
				// 세션 삭제를 위해 서버로 요청 보내기
				window.location.href = "KakaoLogoutController";
			});
		}
	</script>
	<script type="text/javascript">
		function handleGoogleLogin() {
			// Google 로그인 페이지로 리다이렉트
			window.location.href = "https://accounts.google.com/o/oauth2/auth?client_id=755402645796-in2nk95j3efnuigdt6ua21m165os6fr3.apps.googleusercontent.com&redirect_uri=http://localhost:8081/Artistry_Project/index.jsp&response_type=code&scope=profile email openid";
		}
	</script>
	<script type="text/javascript">
		function handleCredentialResponse(response) {
			const responsePayload = parseJwt(response.credential);

			// 필요한 정보 추출
			const userId = responsePayload.sub;
			const fullName = responsePayload.name;
			const givenName = responsePayload.given_name;
			const familyName = responsePayload.family_name;
			const imageUrl = responsePayload.picture;
			const email = responsePayload.email;

			// 추출한 정보를 컨트롤러로 전송
			const form = document.createElement('form');
			form.method = 'POST';
			form.action = 'GoogleLoginController';

			const params = {
				userId : userId,
				fullName : fullName,
				givenName : givenName,
				familyName : familyName,
				imageUrl : imageUrl,
				email : email
			};

			for ( const key in params) {
				const hiddenField = document.createElement('input');
				hiddenField.type = 'hidden';
				hiddenField.name = key;
				hiddenField.value = params[key];
				form.appendChild(hiddenField);
			}

			document.body.appendChild(form);
			form.submit();
		}

		function parseJwt(token) {
			const base64Url = token.split('.')[1];
			const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
			const jsonPayload = decodeURIComponent(atob(base64).split('').map(
					function(c) {
						return '%'
								+ ('00' + c.charCodeAt(0).toString(16))
										.slice(-2);
					}).join(''));
			return JSON.parse(jsonPayload);
		}
	</script>
</body>

</html>