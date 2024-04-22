package com.smhrd.controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.Payments;
import com.smhrd.model.PaymentsDAO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String mb_Email = request.getParameter("mb_Email");
		String mb_Pw = request.getParameter("mb_Pw");

		System.out.println(mb_Email + mb_Pw);
//		System.out.println(id + pw);

		Member member = new Member(mb_Email, mb_Pw);

		Member loginMember = new MemberDAO().login(member);
		
		Payments payments = new Payments(mb_Email);
		
		List<Payments> paymentList = new PaymentsDAO().payment_info(payments);
		
		System.out.println(paymentList);
		
		if (loginMember != null) {
			// 로그인 성공
			// session에 저장
			HttpSession session = request.getSession();
			
			// session 에 로그인 정보 저장
			session.setAttribute("member", loginMember);
			
			// session 에 결제 정보 저장
			session.setAttribute("paymentList", paymentList);
			System.out.println("로그인 성공!");
		} else {
			System.out.println("로그인 실패!");
		}
		response.sendRedirect("index.jsp");

	}
}