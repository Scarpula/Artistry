<%@page import="com.smhrd.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Sat Apr 20 2024 05:52:46 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="66222a812cd3c91311cdf709"
	data-wf-site="65fa46eb9d90d967c69e39b1">
<head>
<meta charset="utf-8">
<title>Artistry Portfolio Setting Page</title>
<meta content="Artistry Portfolio Setting Page" property="og:title">
<meta content="Artistry Portfolio Setting Page" property="twitter:title">
<meta content="width=device-width, initial-scale=1" name="viewport">
<meta content="Webflow" name="generator">
<link href="../css/normalize.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="../css/Portfolio-setting.css">
<link href="../css/webflow.css" rel="stylesheet" type="text/css">
<link href="../css/scars-stupendous-site-9634ca.webflow.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"
	type="text/javascript"></script>
<script type="text/javascript">WebFont.load({  google: {    families: ["Exo:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic","Montserrat:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic","Oswald:200,300,400,500,600,700","Merriweather:300,300italic,400,400italic,700,700italic,900,900italic","PT Sans:400,400italic,700,700italic"]  }});</script>
<script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
<link href="../images/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<link href="../images/webclip.png" rel="apple-touch-icon">
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
	%>
	<div class="navbar-logo-left-3">
		<div data-animation="default" data-collapse="none" data-duration="400"
			data-easing="ease" data-easing2="ease" role="banner"
			class="nevbar shadow-three w-nav">
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
									data-redirect="/research" action="portfolio.jsp?keyWord="
									method="get" class="form-search"
									data-wf-page-id="66222a812cd3c91311cdf709"
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
			<%
			if (loginMember.getMb_Type().equals(true)) {
			%>
			<div>
				<h3>
					<a href="../MyPage.jsp"><%=loginMember.getMb_Nick()%>님</a>
				</h3>
			</div>

			<%
			} else {
			%>
			<div>
				<h3>
					<a
						href="artist-portfolio-page.jsp?artistEmail=<%=loginMember.getMb_Email()%>">
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
	<div class="portfolio-container setting-page">
		<div class="banner-image-wrap setting-page">
			<img src="../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac.jpg"
				loading="lazy" sizes="100vw"
				srcset="../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac-p-500.jpg 500w, ../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac-p-800.jpg 800w, ../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac-p-1080.jpg 1080w, ../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac-p-1600.jpg 1600w, ../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac-p-2000.jpg 2000w, ../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac-p-2600.jpg 2600w, ../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac-p-3200.jpg 3200w, ../images/dd8d72e3-c412-4e9e-94c1-3e9fe23ccdac.jpg 3840w"
				alt="" class="image-10">
		</div>
		<div class="main-container setting-page">
			<div
				style="-webkit-transform: translate3d(0, -900px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -moz-transform: translate3d(0, -900px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); -ms-transform: translate3d(0, -900px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0); transform: translate3d(0, -900px, 0) scale3d(1, 1, 1) rotateX(0) rotateY(0) rotateZ(0) skew(0, 0)"
				class="portfolio-profile-tab setting-page">
				<div class="portfolio-profile-img-wrap">
					<img src="../images/11.png" loading="lazy"
						sizes="(max-width: 1024px) 100vw, (max-width: 1919px) 1024px, 4vw"
						srcset="../images/11-p-500.png 500w, ../images/11-p-800.png 800w, ../images/11.png 1024w"
						alt="" class="profiel-img-con">
					<h1 class="heading-11"><%=loginMember.getMb_Nick()%></h1>
					<div class="profile-insta-block">
						<h1 class="heading-12">INSTA@:</h1>
						<a href="#" class="insta-link-block w-inline-block"><img
							src="../images/insta_logo-removebg-preview.png" loading="lazy"
							sizes="(max-width: 666px) 100vw, (max-width: 1919px) 666px, 4vw"
							srcset="../images/insta_logo-removebg-preview-p-500.png 500w, ../images/insta_logo-removebg-preview.png 666w"
							alt="" class="insta-logo"></a>
					</div>
				</div>
				<div class="profile-button"></div>
				<div class="like-container">
					<img src="../images/Like_lofo-removebg.png" loading="lazy"
						width="512" height="512" alt=""
						srcset="../images/Like_lofo-removebg-p-500.png 500w, ../images/Like_lofo-removebg-p-800.png 800w, ../images/Like_lofo-removebg.png 1024w"
						sizes="(max-width: 767px) 100vw, (max-width: 1919px) 512px, 128px"
						class="like-img">
					<div class="like-count">0</div>
				</div>
			</div>
			<div class="container-wrap setting-page">
				<div class="portfolio-tab setting-page">
					<div class="portfolio-tab-container setting-page">
						<a data-w-id="88f0583a-46d0-dbb2-7b75-0e498dab87aa" href="#"
							class="portfolio-tab-link-block setting-page w-inline-block">
							<div>포트폴리오</div>
						</a> <a data-w-id="88f0583a-46d0-dbb2-7b75-0e498dab87ad" href="#"
							class="portfolio-tab-link-block setting-page w-inline-block">
							<div>아티스트 정보</div>
						</a>
					</div>
				</div>
				<div class="portfolio-artist-art setting-page">
					<div class="artist-art-setting">
						<h1 class="heading-16">포트폴리오 작성하기</h1>
					</div>
					<form id="email-form" action="PortService" method="post"
						enctype="multipart/form-data" class="art-modify-block">
						<!-- 이미지 업로드 입력 필드 -->
						<div class="form-group">
							<label for="input-image" class="form-label">이미지 업로드:</label> <input
								type="file" id="input-image" name="pf_Path"
								class="form-control upload-input">
						</div>
						<!-- 제목 입력 필드 -->
						<div class="form-group">
							<label for="email-2" class="form-label">제목:</label> <input
								class="form-control title-input" maxlength="256" name="pf_Name"
								placeholder="제목을 입력해주세요" type="text" id="email-2" required>
						</div>
						<!-- 제출 버튼 -->
						<div class="form-group">
							<input type="button" value="저장"
								style="padding: 10px 30px; font-size: 20px; width: 100%;"
								class="submit-button w-button" onclick="submitForms()">
						</div>
					</form>
				</div>

				<!-- 아티스트 정보 입력 폼 (제출 버튼 제거) -->
				<form id="email-form" method="post" enctype="multipart/form-data"
					class="art-modify-block">
					<div id="Artist-infomation"
						class="portfolio-artist-infomation setting-page">
						<div class="artist-infomation-setting">
							<h1 class="heading-16">아티스트 정보 수정하기</h1>
						</div>
						<div class="information-modify-block">
							<label for="Information-Modify" class="field-label-3">아티스트
								정보</label>
							<textarea id="Information-Modify" name="pf_Info" maxlength="5000"
								data-name="Information-Modify" placeholder=""
								class="artist-infor-area w-input"></textarea>
							<h1 class="heading-17">의뢰 가능 분야 작성</h1>
							<input class="text-field-2 w-input" autofocus="true"
								maxlength="256" name="pf_Cate" data-name="Field 2"
								placeholder="" type="text" id="field-2" required="">
						</div>
						<div class="form-group">
							<input type="button" value="저장"
								style="padding: 10px 30px; font-size: 20px; width: 100%;"
								class="submit-button w-button" >
						</div>
					</div>
				</form>
				<script>
function submitForms() {
    // 세션에서 Member 객체를 가져옵니다.
    var member = '<%=session.getAttribute("member")%>';
    if (!member) {
        alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');
        window.location.href = 'login.jsp'; // 로그인 페이지로 리다이렉션
        return; // 함수 실행을 여기서 중단합니다.
    }
   
    // 세션에서 이메일을 안전하게 가져옵니다.
    var email = '<%=(session.getAttribute("member") != null) ? ((Member) session.getAttribute("member")).getMb_Email() : ""%>';
    console.log(email);

    if (email === "") {
        alert('이메일 정보를 확인할 수 없습니다. 로그인 정보가 유효하지 않습니다.');
        return; // 이메일 정보가 없으면 함수 실행을 중단합니다.
    }

    // FormData 객체를 생성하여 폼 데이터를 담습니다.
    var formData = new FormData();
    var inputImage = document.getElementById('input-image').files[0];
    formData.append('pf_Path', inputImage);
    var pfName = document.getElementById('email-2').value;
    formData.append('pf_Name', pfName);
    formData.append('mb_Email', email);
    var pfInfo = document.getElementById('Information-Modify').value;
    formData.append('pf_Info', pfInfo);
    var pfCate = document.getElementById('field-2').value;
    formData.append('pf_Cate', pfCate);

    // fetch 메서드를 사용하여 서버로 FormData를 전송합니다.
    fetch('PortService', {
        method: 'POST',
        body: formData
    }).then(response => {
        if (response.ok) {
            alert('저장이 완료됐습니다.');
            window.location.href = 'artist-portfolio-page.jsp'; // 성공 시 페이지 리다이렉션
        } else {
        	alert('저장이 완료됐습니다.');
        	 window.location.href = 'artist-portfolio-page.jsp?artistEmail=<%=((Member) session.getAttribute("member")).getMb_Email()%>'
        }
    }).catch(error => {
        console.error('Error:', error);
        alert('제출 중 오류가 발생했습니다.');
    });
}
</script>
			</div>
		</div>
		<script
			src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=65fa46eb9d90d967c69e39b1"
			type="text/javascript"
			integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
			crossorigin="anonymous"></script>
		<script src="../js/webflow.js" type="text/javascript"></script>
		<script>
    $(document).ready(function(){
    
    //$('#ex_filename').change(function() {
    //	var filename = $(this).val();
    //	$('.upload-name').val(filename);
    //});
    
    var fileTarget = $('.file-upload .upload-hidden');
    
    fileTarget.on('change', function(){  // 값이 변경되면
         if(window.FileReader){  // modern browser
              var filename = $(this)[0].files[0].name;
         } 
         else {  // old IE
              var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
         }
    
         // 추출한 파일명 삽입
         $(this).siblings('.upload-name').val(filename);
    });
    }); 
    
    //preview image 
    var imgTarget = $('.preview-image .upload-hidden');
    
    imgTarget.on('change', function(){
    var parent = $(this).parent();
    parent.children('.upload-display').remove();
    
    if(window.FileReader){
         //image 파일만
         if (!$(this)[0].files[0].type.match(/image\//)) return;
    
         var reader = new FileReader();
         reader.onload = function(e){
              var src = e.target.result;
              parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
         }
         reader.readAsDataURL($(this)[0].files[0]);
    }
    
    else {
         $(this)[0].select();
         $(this)[0].blur();
         var imgSrc = document.selection.createRange().text;
         parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
    
         var img = $(this).siblings('.upload-display').find('img');
         img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
    }
    });
    
      </script>
</body>
</html>