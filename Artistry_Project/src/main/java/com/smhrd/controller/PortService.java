package com.smhrd.controller;

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

@WebServlet("/artist-portfolio/PortService")
public class PortService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 
        // 파일 업로드를 위한 경로, 최대 크기, 인코딩, 파일 이름 중복 정책 설정
        String path = getServletContext().getRealPath("./portfolio_img"); // 파일 저장 경로
        int maxSize = 10 * 1024 * 1024; // 최대 업로드 파일 크기 (10MB)
        String encoding = "UTF-8"; // 인코딩 타입 설정
        DefaultFileRenamePolicy renamePolicy = new DefaultFileRenamePolicy(); // 중복 파일명 정책

        // MultipartRequest 인스턴스 생성 (파일 업로드 수행)
        MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, renamePolicy);

        // 요청 파라미터 받아오기
        String mb_Email = multi.getParameter("mb_Email");
        String pf_Name = multi.getParameter("pf_Name");
        String pf_Path = multi.getFilesystemName("pf_Path");
        String pf_Cate = multi.getParameter("pf_Cate");
        String pf_Info = multi.getParameter("pf_Info");

        // 파일 업로드 결과 로그
        System.out.println(mb_Email + ", " + pf_Name + ", " + pf_Path + ", " + pf_Cate + ", " + pf_Info);

        // 데이터베이스에 포트폴리오 정보 저장
        Port port = new Port(mb_Email, pf_Name, pf_Path, pf_Cate, pf_Info);
        PortDAO dao = new PortDAO();
        int cnt = dao.insertPort(port);

        if (cnt > 0) {
            System.out.println("파일 업로드 성공!");
            response.sendRedirect("BoardMain.jsp"); // 성공 시 이동할 페이지
        } else {
            System.out.println("파일 업로드 실패..");
            response.sendRedirect("error.jsp"); // 실패 시 이동할 페이지
        }
    }
}