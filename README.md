<p>$\huge{\rm{\color{#FC4100}Artistry}}$</p>

<p>$\huge{\rm{\color{#FC4100}프로젝트 소개}}$</p>

Artistry는 미술 프리랜서와 의뢰자를 연결하는 플랫폼으로, 의뢰자와 프리랜서 간의 세분화된 역할을 생성하고, 그 역할에 맞게 코딩하여 아티스트가 의뢰를 수락하거나 거절할 수 있도록 합니다. 의뢰자는 아티스트의 작품을 보고 스타일이 맞다고 판단될 경우 의뢰를 할 수 있습니다. 이 플랫폼은 미술 프리랜서들의 경제적 자립을 지원하고자 시작되었습니다.




<p>$\huge{\rm{\color{#FC4100}목차}}$</p>

- [프로젝트 소개](#프로젝트-소개)
- [기술 스택](#기술-스택)
- [설치 방법](#설치-방법)
- [사용 방법](#사용-방법)
- [기능](#기능)
- [문제 해결 및 FAQ](#문제-해결-및-faq)
- [팀원 및 역할](#팀원-및-역할)
- [라이선스](#라이선스)
- [문의](#문의)



<p>$\huge{\rm{\color{#FC4100}기술 스택}}$</p>

- **HTML, CSS, JavaScript**: 웹 인터페이스 구현을 위한 기본 툴로 사용되었습니다.
- **Java, JSP/Servlet**: 서버 사이드 로직과 HTTP 요청 처리를 담당합니다.
- **기타 라이브러리**: gson, hamcrest-core, javax-servlet-api, json, jstl, lombok, ojdbc, mybatis 등이 사용되었습니다.

<p>$\huge{\rm{\color{#F6F5F2}설치 방법}}$</p>

Artistry는 이클립스와 톰캣 서버(버전 9.0.86)를 사용하여 실행됩니다.

```bash
git clone https://github.com/junbeom09/Artistry.git
# 이클립스에서 프로젝트를 임포트합니다.
# 톰캣 서버를 설치하고, 이클립스에 서버를 설정합니다.
```

<p>$\huge{\rm{\color{#FC4100}사용 방법}}$</p>




<p>$\huge{\rm{\color{#FC4100}주요 기능}}$</p>
1. **회원가입 및 로그인**: 사용자는 사이트에 접속하여 오른쪽 상단에서 회원가입을 할 수 있으며, 아티스트로 등록 가능합니다.
2. **포트폴리오 관리**: 아티스트는 자신의 포트폴리오를 개인 페이지에 게시할 수 있습니다.
3. **작품 의뢰**: 의뢰자는 카테고리 페이지에서 아티스트의 작품을 감상하고, 맘에 들면 1:1 채팅을 통해 작품을 의뢰할 수 있습니다.

<br>
<br>

<p>$\huge{\rm{\color{#FC4100}사용 주의 사항}}$</p>

- UI는 1920px 모니터에서 75% 확대로 최적화되어 있습니다. 반응형 웹 구현이 완벽하지 않기 때문에 다른 해상도에서는 UI가 의도한 대로 보이지 않을 수 있습니다.



<p>$\huge{\rm{\color{#FC4100}기능}}$</p>

<p>$\huge{\rm{\color{#F3D0D7}로그인}}$</p>


- 로그인 기능은 사용자의 이메일과 비밀번호를 확인하여 처리합니다.

````
 @WebServlet("/LoginService")
public class LoginService extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String mb_Email = request.getParameter("mb_Email");
        String mb_Pw = request.getParameter("mb_Pw");

        Member member = new Member(mb_Email, mb_Pw);
        Member loginMember = new MemberDAO().login(member);

        if (loginMember != null) {
            HttpSession session = request.getSession();
            session.setAttribute("member", loginMember);
        }
    }
}
````


<p>$\huge{\rm{\color{#F3D0D7}결제 API}}$</p>
- 사용자는 카카오페이를 통해 안전하게 결제할 수 있으며, `IMP.request_pay` 함수를 통해 결제 요청이 처리됩니다.

````
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript">
    var IMP = window.IMP;
    IMP.init("imp27513274");
    function checkOut(idx, price) {
        IMP.request_pay({
            pg: "kakaopay.TC0ONETIME",
            pay_method: "card",
            merchant_uid: idx, //주문번호
            name: "아티스트리 의뢰",
            amount: price,
        }, function(rsp) {
            if (rsp.success) {
                alert('결제가 성공적으로 완료되었습니다.');
            } else {
                alert('결제에 실패하였습니다.');
            }
        });
    }
</script>
````

<p>$\huge{\rm{\color{#F3D0D7}좋아요 기능}}$</p>
- 사용자는 각 포트폴리오 작품에 좋아요를 할 수 있으며, 클릭 수는 실시간으로 갱신됩니다.

````
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
````

<p>$\huge{\rm{\color{#F3D0D7}검색기능}}$</p>
- 카테고리

````
request.setCharacterEncoding("UTF-8");

String[] cateList = {request.getParameter("cateBox1"), request.getParameter("cateBox2"), request.getParameter("cateBox3"), request.getParameter("cateBox4"), request.getParameter("cateBox5")};
String cate = Arrays.stream(cateList).filter(Objects::nonNull).collect(Collectors.joining(", "));

String encodedCate = URLEncoder.encode(cate, "UTF-8");
response.sendRedirect("artist-portfolio/portfolio.jsp?Search-2=" + encodedCate);
````


에 따라 작품을 검색할 수 있으며, 사용자는 다양한 카테고리를 조합하여 검색할 수 있습니다.

<p>$\huge{\rm{\color{#FC4100}문제 해결 및 FAQ}}$</p>
<br>
<br>
<br>
<br><br>
<br>

<p>$\huge{\rm{\color{#FC4100}자주 발생하는 문제}}$</p>
- **UI 문제**: 다양한 해상도에서 UI가 제대로 보이지 않는 문제가 있습니다.
- **로그인 문제**: 로그인 실패 시 적절한 오류 메시지가 표시되지 않고 메인 화면으로 리다이렉트 됩니다.
<br>
<br>
<br>
<br>
<br>
<br>
<p>$\huge{\rm{\color{#FC4100}해결 방법}}$</p>
- UI 문제는 추가적인 반응형 디자인 적용으로 해결 가능합니다.
- 로그인 오류 처리는 보다 명확한 사용자 피드백을 제공하도록 코드를 수정할 필요가 있습니다.
<br>
<br>
<br>
<br>
<br>
<br>
<p>$\huge{\rm{\color{#FC4100}팀원 및 역할}}$</p>

- 이성도 (팀장): 프론트엔드 및 백엔드 개발, SNS 로그인 API, 웹소켓 통신, 통합 테스트
- 조준범: 백엔드 개발, 사용자 관리 및 통합 테스트
- 윤명상: 데이터베이스 설계, 비동기 처리, 좋아요 기능
- 기현수: 결제 API, 크롤링, 일정 관리 및 리뷰 페이지 개발
<br>
<br>
<br>
<br>
<br>
<br>
<p>$\huge{\rm{\color{#FC4100}라이센스}}$</p>

이 프로젝트는 [MIT 라이선스](LICENSE) 하에 제공됩니다.

<p>$\huge{\rm{\color{#FC4100}문의}}$</p>

프로젝트에 대한 문의사항은 [이메일](dltjdeh7745@naver.com)로 문의하시기 바랍니다.
