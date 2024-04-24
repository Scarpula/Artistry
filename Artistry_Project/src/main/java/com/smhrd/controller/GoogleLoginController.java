package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.GoogleUser;
import com.smhrd.model.GoogleUserDAO;

public class GoogleLoginController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 전송된 파라미터 값 추출
        String userId = request.getParameter("userId");
        String fullName = request.getParameter("fullName");
        String givenName = request.getParameter("givenName");
        String familyName = request.getParameter("familyName");
        String imageUrl = request.getParameter("imageUrl");
        String email = request.getParameter("email");

        // GoogleUser 객체 생성
        GoogleUser googleUser = new GoogleUser();
        googleUser.setUserId(userId);
        googleUser.setFullName(fullName);
        googleUser.setGivenName(givenName);
        googleUser.setFamilyName(familyName);
        googleUser.setImageUrl(imageUrl);
        googleUser.setEmail(email);

        // GoogleUserDAO를 사용하여 데이터베이스에 저장
        GoogleUserDAO googleUserDAO = new GoogleUserDAO();
        googleUserDAO.insertGoogleUser(googleUser);

        // 세션에 사용자 정보 저장
        HttpSession session = request.getSession();
        session.setAttribute("googleUser", googleUser);

        // 로그인 완료 후 리다이렉트할 페이지로 이동
        response.sendRedirect("index.jsp");
    }
}