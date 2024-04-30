package com.smhrd.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Port;
import com.smhrd.model.PortDAO;

public class PortService extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 실제 파일이 저장될 서버의 파일 시스템 경로
       String relativePath = "/portfolio_img";
        
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
        String pf_Path2 = multi.getFilesystemName("pf_Path");
        String pf_Name = multi.getParameter("pf_Name");

        // 상대 웹 경로로 변환 (웹 컨텍스트 내에서의 경로)
        String pf_Path = relativePath + "/" + pf_Path2;

        // 데이터베이스에 포트폴리오 정보 저장 (상대 웹 경로를 사용)
        Port port = new Port(mb_Email, pf_Path, pf_Name);
        PortDAO dao = new PortDAO();
        int cnt = dao.insertPort(port);

        // 파일 업로드 및 DB 삽입 결과 로그
        if (cnt > 0) {
           System.out.println(pf_Path);
            System.out.println("파일 업로드 및 DB 저장 성공!");
            response.sendRedirect("artist-portfolio/artist-portfolio-page.jsp?artistEmail="+mb_Email); // 성공 시 이동할 페이지
        } else {
            System.out.println("파일 업로드 또는 DB 저장 실패..");
            response.sendRedirect("error.jsp"); // 실패 시 이동할 페이지
        }
        System.out.println("저장 경로: " + savePath);
        System.out.println("저장 디렉토리: " + saveDir.getAbsolutePath());
    }
}