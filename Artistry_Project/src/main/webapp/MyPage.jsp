<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.ArtistDAO"%>
<%@page import="com.smhrd.model.Artists"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="com.smhrd.model.ChatRoom"%>
<%@page import="com.smhrd.model.Likes"%>
<%@page import="com.smhrd.model.Payments"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Fri Apr 19 2024 07:52:53 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="65fd1577d3de0c8242fadcdd"
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
<link href="css/MyPage.css" type="text/css" rel="stylesheet">
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
<style>
.checkbox-label-준범 {
	display: inline-block; /* 인라인 블록 요소로 배치 */
	margin-right: 10px; /* 각 체크박스 사이의 간격 조정 */
	margin-bottom: 5px;
	height: 10px;
}

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
	List<Payments> paymentList = (List<Payments>) session.getAttribute("paymentList");
	List<Likes> likeList = (List<Likes>) session.getAttribute("likeList");
	List<ChatRoom> chatRoomList = (List<ChatRoom>) session.getAttribute("chatRoomList");
	List<Member> memberList = new MemberDAO().getMemberList();
	Artists artist = new ArtistDAO().getArtistInfo(loginMember.getMb_Email());
	/* System.out.print(artist.getCate()+artist.getMin_price()+artist.getMax_price()); */
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
									data-redirect="/research"
									action="artist-portfolio/portfolio.jsp?keyWord=" method="get"
									class="form-search" data-wf-page-id="65fd1577d3de0c8242fadcdd"
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
						if (loginMember != null) {
						%>
						<nav class="navbar-dropdown-list w-dropdown-list">
							<a href="MyPage.jsp"
								class="navbar-dropdown-link top w-dropdown-link">마이페이지</a> <a
								href="LogoutService"
								class="navbar-dropdown-link w-dropdown-link">로그아웃</a>
						</nav>
						<%
						}
						%>

					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="mypage-main">
		<div class="mypage-sidecontainer">
			<div class="mypage-side-profile-wrap">
				<!--프로필 사진-->
				<div class="mypage-side-profile-img-wrap">
					<img class="profile-img"
						src="<%=request.getContextPath()%><%=loginMember.getMb_Profile_Img()%>"
						width="450" height="155" alt=""
						sizes="(max-width: 479px) 100vw, (max-width: 1919px) 450px, 7vw"
						data-w-id="fa2d44e0-dd52-0cf6-3773-e1f7d8540d3b" loading="lazy">
				</div>
				<form action="profile_imgService" method="post"
					enctype="multipart/form-data">
					<div>
						<input type="text" hidden="" name="mb_Email"
							value="<%=loginMember.getMb_Email()%>">
						<%if(artist!=null){ %>
						<input type="text" hidden="" name="artist_Email"
							value="<%=loginMember.getMb_Email()%>">
						<%} %>
						<table>
							<tr>
								<td><input type="file" name="mb_profile_img"></td>
								<td><input type="submit" value="변경"></td>
							</tr>
						</table>

					</div>
				</form>
				<div class="mypage-side-profile-clasify-block">
					<%
					if (loginMember.getMb_Type().equals(0)) {
					%>
					<h1 class="profile-member-clasify">아티스트</h1>
					<%
					} else {
					%>
					<h1 class="profile-member-clasify">의뢰자</h1>
					<%
					}
					%>
				</div>
				<div class="profile-member-nick"><%=loginMember.getMb_Nick()%></div>
				<div class="profile-member-email"><%=loginMember.getMb_Email()%></div>
			</div>
			<%
			if (loginMember.getMb_Email().equals("admin")) {
			%>
			<ul role="list" class="mypage-side-profile-catelist w-list-unstyled">
				<li data-w-id="3f641a6c-3b4c-fd6d-20d3-f0dd35d2eeca"
					class="category-text-wrap">정보수정</li>
				<li data-w-id="74c3dd16-60ec-6e8f-c824-5d0e7908d266"
					class="category-text-wrap">거래내역</li>
				<li data-w-id="44949014-bf4f-bb3c-6159-e0fc071a6d27"
					class="category-text-wrap">채팅내역</li>
				<li data-w-id="13e59a0c-9989-cb9a-2092-6108e16f97b7"
					class="category-text-wrap">좋아요 작가 목록</li>
				<li data-w-id="f861915a-ac63-97aa-257a-d469c1980934"
					class="category-text-wrap">관리자 페이지</li>
			</ul>
			<%
			} else {
			%>
			<%
			if (loginMember.getMb_Type().equals(false)) {
			%>
			<ul role="list" class="mypage-side-profile-catelist w-list-unstyled">
				<li data-w-id="3f641a6c-3b4c-fd6d-20d3-f0dd35d2eeca"
					class="category-text-wrap">정보수정</li>
				<li data-w-id="74c3dd16-60ec-6e8f-c824-5d0e7908d266"
					class="category-text-wrap">거래내역</li>
				<li data-w-id="44949014-bf4f-bb3c-6159-e0fc071a6d27"
					class="category-text-wrap">채팅내역</li>
				<li data-w-id="13e59a0c-9989-cb9a-2092-6108e16f97b7"
					class="category-text-wrap">좋아요 작가 목록</li>
				<li data-w-id="e3a5911f-fd13-6056-ad64-9eb75db3f5dd"
					class="category-text-wrap">아티스트 페이지</li>
			</ul>

			<%
			} else {
			%>
			<ul role="list" class="mypage-side-profile-catelist w-list-unstyled">
				<li data-w-id="3f641a6c-3b4c-fd6d-20d3-f0dd35d2eeca"
					class="category-text-wrap">정보수정</li>
				<li data-w-id="74c3dd16-60ec-6e8f-c824-5d0e7908d266"
					class="category-text-wrap">거래내역</li>
				<li data-w-id="44949014-bf4f-bb3c-6159-e0fc071a6d27"
					class="category-text-wrap">채팅내역</li>
				<li data-w-id="13e59a0c-9989-cb9a-2092-6108e16f97b7"
					class="category-text-wrap">좋아요 작가 목록</li>
			</ul>
			<%
			}
			%>
			<%
			}
			%>
		</div>
		<div class="mypage-context-wrap">
			<div style="display: flex" class="mypage-modifyinfo">
				<div class="mypage-context-title-wrap">
					<h1>정보수정</h1>
				</div>
				<div class="myAccount">
					<form action="MyPage_EditInfo" method="post">
						<table id="myAccount">
							<tr>
								<td id="basic">이메일</td>
								<td id="inputAccount"><input type="text" name="email"
									value="<%=loginMember.getMb_Email()%>" readonly></td>
							</tr>

							<tr>
								<td id="basic">닉네임</td>
								<td id="inputAccount"><input type="text" name="nick"
									value="<%=loginMember.getMb_Nick()%>" required=""></td>
							</tr>
							<tr>
								<td id="basic">전화번호</td>
								<td id="inputAccount"><input type="text" name="phone"
									value="<%=loginMember.getMb_Phone()%>" required=""></td>
							</tr>
							<tr>
								<td id="basic">이름</td>
								<td id="inputAccount"><input type="text" name="name"
									value="<%=loginMember.getMb_Name()%>" required=""></td>
							</tr>
							<tr>
								<td id="basic">주소</td>
								<td id="inputAccount"><input name="mb_Addr" maxlength="256"
									data-name="addr" placeholder="" type="text" id="addr" value=""
									readonly="readonly" required="">
								<td id="postNum"><input type="button" value="우편번호확인"
									onclick="addrCheck()"></td>
								</td>
							</tr>
							<tr>
								<td></td>
								<td id="inputAccount"><input name="mb_Addr2" type="text"
									maxlength="256" placeholder="나머지 주소를 입력하세요." required="">
								</td>
							</tr>
							<tr>
								<td id="basic">비밀번호</td>
								<td id="inputAccount"><input type="password"
									value="<%=loginMember.getMb_Pw()%>" required=""></td>
							</tr>
							<tr>
								<td id="basic">비밀번호 확인</td>
								<td id="inputAccount"><input type="password" name="pw"
									value="<%=loginMember.getMb_Pw()%>" required=""></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;"><input
									type="submit" value="수정하기"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div style="display: none" class="mypage-trade">
				<div class="mypage-context-title-wrap" style="text-align: center;">
					<h1>거래내역</h1>
					<div class="myAccount">
						<table id="myAccount">
							<tr>
								<td colspan="2">결제 고유 번호</td>
								<td colspan="2">결제 수단</td>
								<td colspan="2">결제 금액</td>
								<td colspan="2">결제 일시</td>
								<td colspan="2">결제 메모</td>
							</tr>
							<%
							for (int i = 0; i < paymentList.size(); i++) {
							%>
							<tr>
								<td><%=paymentList.get(i).getPay_Idx()%>
								<td />
								<td><%=paymentList.get(i).getPay_Method()%>
								<td />
								<td><%=paymentList.get(i).getTotal_Amount()%>
								<td />
								<td><%=paymentList.get(i).getPayed_At()%>
								<td />
								<%
								if (paymentList.get(i).getPay_Memo().length() > 10) {
								%>
								<td><%=paymentList.get(i).getPay_Memo().substring(0, 15)%>...</td>
								<%
								} else {
								%>
								<td><%=paymentList.get(i).getPay_Memo()%></td>
								<%
								}
								%>
							</tr>
							<%
							}
							%>
						</table>
					</div>
				</div>
			</div>
			<div style="display: none" class="mypage-chat">
				<div class="mypage-context-title-wrap" style="text-align: center;">
					<h1>채팅내역</h1>
					<div class="myAccount">
						<%
						for (int i = 0; i < chatRoomList.size(); i++) {
						%>
						<a href="#"><h3><%=chatRoomList.get(i).getRoom_Title()%></h3></a><br>
						<%
						}
						%>
					</div>

				</div>
			</div>
			<div style="display: none" class="mypage-likeartist">
				<div class="mypage-context-title-wrap" style="text-align: center;">
					<h1>좋아요 작가 목록</h1>
					<div class="myAccount">
						<%
						for (int i = 0; i < likeList.size(); i++) {
						%>
						<a href="#"><h3><%=likeList.get(i).getArtist_Email()%></h3></a><br>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<div style="display: none" class="mypage-adminpage">
				<div class="mypage-context-title-wrap" style="text-align: center;">
					<h1>관리자 페이지</h1>
					<div class="myAccount">
						<%
						if (memberList != null) {
						%>
						<table id="myAccount" border="1" style="border-spacing: 10px;">
							<tr>
								<td colspan="2"><b>회원 아이디</b></td>
								<td colspan="2"><b>회원 이름</b></td>
								<td colspan="2"><b>회원 전화번호</b></td>
								<td colspan="2"><b>회원 닉네임</b></td>
								<td colspan="2"><b>회원 구분</b></td>
							</tr>

							<%
							for (int i = 0; i < memberList.size(); i++) {
							%>
							<tr>
								<td><%=memberList.get(i).getMb_Email()%>
								<td />
								<td><%=memberList.get(i).getMb_Name()%>
								<td />
								<td><%=memberList.get(i).getMb_Phone()%>
								<td />
								<td><%=memberList.get(i).getMb_Nick()%>
								<td />
								<%
								if (memberList.get(i).getMb_Type().equals(false)) {
								%>
								<td>아티스트
								<td />
								<%
								} else {
								%>
								<td>의뢰자
								<td />
								<%
								}
								%>
								<td><a
									href="MemberDeleteService?email=<%=memberList.get(i).getMb_Email()%>">delete</a></td>
							</tr>
							<%
							}
							%>
						</table>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<div style="display: none" class="mypage-artistpage">
				<div class="mypage-context-title-wrap" style="text-align: center;">
					<h1>아티스트 페이지</h1>
					<div class="MyAccount">
						<form
							action="MyPage_artistInfo?email=<%=loginMember.getMb_Email()%>"
							method="post">
							<%
							if (artist != null) {
							%>
							<table id="myAccount" border="1">
								<tr>
									<td>카테고리</td>
									<td align="center"><label class="checkbox-label-준범"><input
											id="chbox" type="checkbox" value="캐릭터" name="cate1">캐릭터</label>
										<label class="checkbox-label-준범"><input id="chbox"
											type="checkbox" value="일러스트" name="cate2">일러스트</label> <label
										class="checkbox-label-준범"><input id="chbox"
											type="checkbox" value="캐리커쳐" name="cate3">캐리커쳐</label> <label
										class="checkbox-label-준범"><input id="chbox"
											type="checkbox" value="이모티콘" name="cate4">이모티콘</label> <label
										class="checkbox-label-준범"><input id="chbox"
											type="checkbox" value="캘리그라피/로고" name="cate5">캘리그라피/로고</label>
									</td>
								</tr>
								<tr>
									<td>최소 의뢰 금액</td>
									<td><input type="text" name="min_price"
										value="<%=artist.getMin_price()%>"></td>
								</tr>
								<tr>
									<td>최대 의뢰 금액</td>
									<td><input type="text" name="max_price"
										value="<%=artist.getMax_price()%>"></td>
								</tr>
								<tr>
									<td colspan="2" align="center"><input type="submit"
										value="저장하기"></td>
								</tr>

							</table>
							<%
							}
							%>
						</form>
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

	<script type="text/javascript"
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function addrCheck() {

			new daum.Postcode({
				oncomplete : function(data) {

					let fullAddr = '';
					let extraAddr = '';

					if (data.userSelectedType == 'R') {
						fullAddr = data.roadAddress;
					} else {
						fullAddr = data.jibunAddress;
					}

					console.log(fullAddr);
					document.getElementById('addr').value = fullAddr;

				}
			}).open();
		}
	</script>
</body>
</html>