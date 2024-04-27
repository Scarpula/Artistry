package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class profile_imgService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 실제 파일이 저장될 서버의 파일 시스템 경로
        String path = "C:\\Users\\smhrd\\git\\Artistry\\Artistry_Project\\src\\main\\webapp\\profile_img";
        
        int maxSize = 10 * 1024 * 1024; // 최대 업로드 파일 크기 (10MB)
        String encoding = "UTF-8"; // 인코딩 타입 설정
        DefaultFileRenamePolicy renamePolicy = new DefaultFileRenamePolicy(); // 중복 파일명 정책
		
        // MultipartRequest 인스턴스 생성 (파일 업로드 수행)
        MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, renamePolicy);
        
        // 요청 파라미터 및 파일 이름 받아오기
        String mb_Email = multi.getParameter("mb_Email");
        String profile_img_name = multi.getFilesystemName("mb_profile_img");
        String pw = " ";
        // 상대 웹 경로로 변환 (웹 컨텍스트 내에서의 경로)
        String mb_profile_img = "C:/Users/smhrd/git/Artistry/Artistry_Project/src/main/webapp/profile_img/" + profile_img_name;
		Member member = new Member(mb_Email,mb_profile_img,pw);
        int cnt = new MemberDAO().update_profile_img(member);
        
        if(cnt>0) {
        	System.out.print("업데이트 성공");
        	
        }else {
        	System.out.println("fail");
        }
        response.sendRedirect("MyPage.jsp");
        
	}

}
