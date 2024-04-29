package com.smhrd.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.ArtistDAO;
import com.smhrd.model.Artists;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class profile_imgService extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 파일이 저장될 서버의 상대 경로 (webapp 폴더 기준)
        String relativePath = "/profile_img";
        
        // 실제 파일이 저장될 서버의 물리적 경로
        String savePath = request.getServletContext().getRealPath(relativePath);
        File saveDir = new File(savePath);
        if (!saveDir.exists()) {
            saveDir.mkdirs();
        }

        int maxSize = 10 * 1024 * 1024; // 최대 업로드 파일 크기 (10MB)
        String encoding = "UTF-8"; // 인코딩 타입 설정
        DefaultFileRenamePolicy renamePolicy = new DefaultFileRenamePolicy(); // 중복 파일명 정책

        // MultipartRequest 인스턴스 생성 (파일 업로드 수행)
        MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, renamePolicy);

        // 요청 파라미터 및 파일 이름 받아오기
        String mb_Email = multi.getParameter("mb_Email");
        String profile_img_name = multi.getFilesystemName("mb_profile_img");
        String pw = " ";
        String artist_email = multi.getParameter("artist_Email");
        // 상대 웹 경로 설정 (웹 컨텍스트 내에서의 경로)
        String mb_profile_img = relativePath + "/" + profile_img_name;

        Member member = new Member(mb_Email, pw, mb_profile_img);
        int cnt = new MemberDAO().update_profile_img(member);
        
        if(artist_email!=null) {
        	Artists artist = new Artists(artist_email,mb_profile_img);
        	int cnt2 = new ArtistDAO().update_profile(artist);
        	
        	if(cnt2>0) {
        		System.out.println("아티스트 테이블 프사 성공");
        	}
        }
        
        
        if (cnt > 0) {
            System.out.print("업데이트 성공");
            
            // 세션에서 loginMember 객체 가져오기
            HttpSession session = request.getSession();
            Member loginMember = (Member) session.getAttribute("member");
            
            // loginMember 객체의 프로필 이미지 경로 업데이트
            if (loginMember != null && loginMember.getMb_Email().equals(mb_Email)) {
                loginMember.setMb_Profile_Img(mb_profile_img);
                session.setAttribute("member", loginMember);
            }
        } else {
            System.out.println("fail");
        }

        response.sendRedirect("MyPage.jsp");
    }
}