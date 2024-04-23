package com.smhrd.frontcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.controller.EmailCheck;
import com.smhrd.controller.PortService;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;


@WebServlet("*.do")
public class frontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("[frontController]");
	
		// url mapping값 : *.do
		
		request.setCharacterEncoding("UTF-8");
		
		// 어디서 요청이 들어왔는지 확인
		String requestURI = request.getRequestURI();
		System.out.println("요청 들어온 주소 : " + requestURI);
		
		// 프로젝트 이름 확인
		String contextPath = request.getContextPath();
		System.out.println("ContextPath : " + contextPath);
		
		// 문자열 자르기 -> substring()
		// substring(start) : start 위치부터 끝까지 문자열 자르기
		// substring(start, end) : start 위치부터 end 전까지 문자열 자르기
		String resultURL = requestURI.substring(contextPath.length() + 1);
		
		System.out.println("요청 URL : " + resultURL);
		
		Command service = null;
		

		if(resultURL.equals("EmailCheck.do")) {
			service = new EmailCheck();
		}
		
		
		if(service != null) {
            String moveURL = service.execute(request, response);
		
	
		if(moveURL != null) {
			response.sendRedirect(moveURL);
		}else {
            // 처리되지 않은 URL에 대한 예외 처리
            PrintWriter out = response.getWriter();
            out.println("해당 URL에 대한 서비스를 찾을 수 없습니다.");
        }
    }
}
		
		
		
		
	
	}


