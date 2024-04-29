package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Likes;
import com.smhrd.model.LikesDAO;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.Payments;
import com.smhrd.model.PaymentsDAO;
import com.smhrd.model.Port;
import com.smhrd.model.Port2;
import com.smhrd.model.PortDAO;
import com.smhrd.model.PortDAO2;


public class PortinfoService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String pf_Info = request.getParameter("mb_Info2");
		String pf_Title = request.getParameter("mb_Title2");
		String pf_Sale = request.getParameter("mb_Sale2");
		String mb_Email = request.getParameter("mb_Email");
		System.out.println(pf_Info + pf_Title + pf_Sale + mb_Email); //확인용
		
		Port2 port1 = new Port2(pf_Info, pf_Title, pf_Sale, mb_Email);
		List<Port2> infoList = new PortDAO2().selectinfo(port1);

		Port2 port2 = new Port2(pf_Info, pf_Title, pf_Sale);
		int cnt = new PortDAO2().portinfo(port2);
		
		if(cnt > 0) {
			System.out.println("DB 저장 완료");
		}
		else {
			System.out.println("DB 저장 실패");
		}
		response.sendRedirect("artist-portfolio/artist-portfolio-page.jsp");
}
}
