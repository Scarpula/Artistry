<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Artistry 채팅방</title>
<link rel="stylesheet" href="./css/style.css">
<meta charset="utf-8" />
<script>
	<%Member loginMember = (Member) session.getAttribute("member");%>
	window.loginMemberNick = <%=(loginMember != null) ? "'" + loginMember.getMb_Nick() + "'" : "''"%>;
	window.loginMemberProfileUrl = <%=(loginMember != null) ? "'" + loginMember.getMb_ProfileImg() + "'" : "''"%>;
</script>

<%
String userEmail = request.getParameter("userEmail");
String artistEmail = request.getParameter("artistEmail");
%>
<script>
var userEmail = '<%=userEmail%>';
var artistEmail = '<%=artistEmail%>
	';
</script>
<script src="./js/index.js"></script>

</script>
</head>
<div class="wrap">
	<section class="menu-section">
		<h1>
			<a href="index.jsp" target="_blank"> <img
				src="./images/Artistry-logo4.jpg" alt="logo" width="188px"
				height="72px" />
			</a>
		</h1>
		<div class="user-box">
			<img class="user-img" src="<%=loginMember.getMb_ProfileImg()%>"
				alt="user image" />
			<div class="name">
				<input type="text" value="<%=loginMember.getMb_Nick()%>" />
			</div>
			<a href="javascript:void(0);" class="btn-alter"></a>
		</div>
		<nav class="menu">
			<ul>
				<li class="active"><a href="javascript:void(0);">소셜채팅</a></li>
				<!-- <li><a href="javascript:void(0);">게임/방송채팅</a></li> -->
			</ul>
		</nav>
		<!-- resource btns
		<ul class="resource-box">
			<li><a href="javascript:void(0);" class="btn" /><img src="./images/icon_resource1.png" />Resource</a></li>
			<li><a href="javascript:void(0);" class="btn" /><img src="./images/icon_resource2.png" />Resource</a></li>
		</ul>
		-->
	</section>


	<main class="chat-wrap">
		<div class="chat-wrap-inner">
			<div class="chat-container">
				<h2 class="chat-title">Artistry</h2>
				<!-- chat-area -->
				<div class="chat-area" id="chatView">
					<div class="date"></div>
					<div class="notibox">
						<span>의뢰할 것을 물어보세요!</span>
					</div>
					<!-- message-area -->
					<div class="message-area">
						<!--<div class="message-list avatar">
							<div class="avatar-image"><img src="./images/user_1.png" /></div>
							<div class="message-box">
								<div class="avatar-name">톡플러스</div>
								<div class="message-time">
									<div class="message-text">발송메시지 영역</div>
									<div class="timestamps">오후 00:00</div>
								</div>
							</div>
						</div>
						<div class="message-list wirter">
							<div class="message-box">
								<div class="message-time">
									<div class="timestamps">오후 00:00</div>
									<div class="message-text">발송메시지 영역</div>
								</div>
							</div>
						</div>
						-->
						<!--<div class="message-list avatar">
							<div class="avatar-image"><img src="./images/user_1.png" /></div>
							<div class="message-box">
								<div class="avatar-name">톡플러스</div>
								<div class="message-time">
									<div class="file-area file">
										<a href="javascript:void(0);">
											<sapn class="fileName">톡플러스 샘플파일.txt</sapn>
											<sapn class="fileSize">용량 : 15MB</sapn>
											<sapn class="filedown"></sapn>
										</a>
									</div>
									<div class="timestamps">오후 00:00</div>
								</div>
							</div>
						</div>-->
						<!--<div class="message-list wirter">
							<div class="message-box">
								<div class="message-time">
									<div class="timestamps">오후 00:00</div>
									<div class="file-area picture">
										<a href="https://www.w3schools.com/tags/img_girl.jpg"><img src="https://www.w3schools.com/tags/img_girl.jpg" /></a>
										</div>
									</div>
								</div>
							</div>
						</div>-->
						<!--<div class="message-list wirter">
							<div class="message-box">
								<div class="message-time">
									<div class="timestamps">오후 00:00</div>
									<div class="file-area video">
										<video width="384" controls>
											<source src="https://www.w3schools.com/html/mov_bbb.mp4" type="video/mp4">
										</video>
									</div>
								</div>
							</div>
						</div>-->
						<!--<div class="message-list wirter">
							<div class="message-box">
								<div class="message-time">
									<div class="timestamps">오후 00:00</div>
									<div class="file-area file">
										<a href="javascript:void(0);">
											<sapn class="fileName">톡플러스 샘플파일.txt</sapn>
											<sapn class="fileSize">용량 : 15MB</sapn>
											<sapn class="filedown"></sapn>
										</a>
									</div>
								</div>
							</div>
						</div>-->
					</div>
					<!-- //message-area -->
				</div>
				<!-- //chat-area -->
				<!-- message-write-area -->
				<div class="message-write-area">
					<div class="message-write-inner">
						<div class="btn-attach">
							<a href="javascript:void(0);"></a>
						</div>
						<div class="attach-box">
							<ul>
								<li><a class="attach pic" href="javascript:void(0);">사진첨부</a>
								</li>
								<li><a class="attach video" href="javascript:void(0);">동영상
										첨부</a></li>
								<li><a class="attach file" href="javascript:void(0);">파일첨부</a>
								</li>
							</ul>
						</div>
						<div class="write-box">
							<input type="text" class="enterMessage"
								placeholder="메시지를 입력해주세요.">
						</div>
						<a class="btn-send" id="btnEnterMessage"
							href="javascript:void(0);">전송</a>
					</div>
				</div>
				<!-- //message-write-area -->
			</div>
		</div>
	</main>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>
<script src="https://asset.talkplus.io/npm/talkplus-0.4.10"></script>

<script src="./js/index.js" type="module"></script>
<body>

</body>
</html>
