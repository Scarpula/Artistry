package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.HTTP;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class GetArtistListService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Member> artistList = new MemberDAO().get_artist_list();
		HttpSession session = request.getSession();
		session.setAttribute("artistList", artistList);
		
		if(artistList!=null) {
			System.out.println(artistList);
		}
		response.sendRedirect("artist-portfolio/portfolio.jsp");
	}

}
