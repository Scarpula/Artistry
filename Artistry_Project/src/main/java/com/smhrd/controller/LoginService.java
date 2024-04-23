package com.smhrd.controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.ChatRoom;
import com.smhrd.model.ChatRoomDAO;
import com.smhrd.model.Likes;
import com.smhrd.model.LikesDAO;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.Payments;
import com.smhrd.model.PaymentsDAO;
import com.smhrd.model.Review;
import com.smhrd.model.ReviewDAO;

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
		
		Likes like = new Likes(mb_Email);
		List<Likes> likeList = new LikesDAO().like_list(like);
		
		ChatRoom chatRoom = new ChatRoom(mb_Email);
		List<ChatRoom> chatRoomList = new ChatRoomDAO().chat_room_list(chatRoom);
		
		Review mb_Review = new Review(mb_Email);
		List<Review> reviewList = new ReviewDAO().showReview(mb_Review);
		
		System.out.println(chatRoomList);
		
		if (loginMember != null) {
			// 로그인 성공
			// session에 저장
			HttpSession session = request.getSession();
			
			// session 에 로그인 정보 저장
			session.setAttribute("member", loginMember);
			
			// session 에 결제 정보 저장
			session.setAttribute("paymentList", paymentList);
			
			// session 에 좋아요 정보 저장
			session.setAttribute("likeList", likeList);
			
			// session 에 좋아요 정보 저장
			session.setAttribute("chatRoomList", chatRoomList);
			
			//session에 리뷰리스트 정보 저장
			session.setAttribute("reviewList", reviewList);
			
			System.out.println("로그인 성공!");
			System.out.println(reviewList);
		} else {
			System.out.println("로그인 실패!");
		}
		response.sendRedirect("index.jsp");

	}
}