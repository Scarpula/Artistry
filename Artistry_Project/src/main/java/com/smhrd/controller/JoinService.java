package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ArtistDAO;
import com.smhrd.model.Artists;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.Port2;
import com.smhrd.model.PortDAO2;

public class JoinService extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // post 방식 인코딩
        request.setCharacterEncoding("UTF-8");

        // 파라미터 가져오기
        String mb_Email = request.getParameter("mb_Email");
        String mb_Pw = request.getParameter("mb_Pw");
        String mb_Name = request.getParameter("mb_Name");
        String mb_Birthdate = request.getParameter("mb_Birthdate");
        String mb_Phone = request.getParameter("mb_Phone");
        String mb_Nick = request.getParameter("mb_Nick");
        String mb_Addr = request.getParameter("mb_Addr");
        String mb_Addr2 = request.getParameter("mb_Addr2");
        Boolean mb_Type = Boolean.parseBoolean(request.getParameter("mb_Type"));
        String add = mb_Addr + " " + mb_Addr2;

        // Member 객체 생성
        Member member = new Member(mb_Email, mb_Pw, mb_Phone, mb_Birthdate, mb_Name, mb_Nick, add, mb_Type);
        // Artists 객체 생성
        Artists artist = new Artists(mb_Email, mb_Nick);
        // Port2 객체 생성
        Port2 port2 = new Port2(mb_Email);

        // DAO 객체 생성
        MemberDAO memberDAO = new MemberDAO();
        ArtistDAO artistDAO = new ArtistDAO();
        PortDAO2 portDAO2 = new PortDAO2();

        // 데이터베이스에 데이터 삽입
        int cnt = memberDAO.join(member);
        int art = 0;
        int port = 0;

        if (mb_Type == false) { // 아티스트인 경우
            art = artistDAO.addArtist(artist);
            port = portDAO2.insertPortInfo(port2);
        }

        // 결과에 따라 리다이렉트
        if (art > 0 || cnt > 0) {
            response.sendRedirect("index.jsp?result=success");
        } else {
            response.sendRedirect("index.jsp?result=fail");
        }
    }
}
