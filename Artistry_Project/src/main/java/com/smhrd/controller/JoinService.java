package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class JoinService extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      // post 방식 인코딩

      request.setCharacterEncoding("UTF-8");

      String mb_Email = request.getParameter("mb_Email");
      String mb_Pw = request.getParameter("mb_Pw");
      String mb_Name = request.getParameter("mb_Name");
      String mb_Birthdate = request.getParameter("mb_Birthdate");
      String mb_Phone = request.getParameter("mb_Phone");
      String mb_Nick = request.getParameter("mb_Nick");
      String mb_Addr = request.getParameter("mb_Addr");

      //System.out.print(email + pw + name + birthDate + phone + nick + addr);

      
        Member member = new Member(mb_Email, mb_Pw, mb_Name, mb_Addr, mb_Phone, mb_Birthdate, mb_Nick);
        
        int cnt = new MemberDAO().join(member);
        
        System.out.println("cnt : " + cnt);
       
        if(cnt>0) {  System.out.println("회원가입성공");
       //response.sendRedirect("Main.jsp?result=success"); 
        }else {
        System.out.println("회원가입실패");
        //response.sendRedirect("Main.jsp?result=fail"); 
        }
       

   }

}