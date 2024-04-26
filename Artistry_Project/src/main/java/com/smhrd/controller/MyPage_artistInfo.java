package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ArtistDAO;
import com.smhrd.model.Artists;

public class MyPage_artistInfo extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String cate1 = request.getParameter("cate1");
		String cate2 = request.getParameter("cate2");
		String cate3 = request.getParameter("cate3");
		String cate4 = request.getParameter("cate4");
		String cate5 = request.getParameter("cate5");
		String[] cateList = new String[5];
		cateList[0] = cate1;
		cateList[1] = cate2;
		cateList[2] = cate3;
		cateList[3] = cate4;
		cateList[4] = cate5;
		int countNotNull = 0;
		for (String value : cateList) {
		    if (value != null) {
		        countNotNull++;
		    }
		}
		String[] cateList2 = new String[countNotNull];
		
		int index = 0;
		for (String value : cateList) {
		    if (value != null) {
		        cateList2[index] = value;
		        index++;
		    }
		}
		String cate = "";

		for (String value : cateList2) {
		    if (value != null) {
		        cate += value + ", ";
		    }
		}

		// 마지막 콤마와 공백 제거
		if (!cate.isEmpty()) {
		    cate = cate.substring(0, cate.length() - 2);
		}
		
		System.out.println(cate);
		
		int min_price = Integer.parseInt(request.getParameter("min_price"));
		int max_price = Integer.parseInt(request.getParameter("max_price"));
	
		
		Artists artist = new Artists(email, cate, min_price, max_price);
		int cnt = new ArtistDAO().editArtistInfo(artist);
		
		if(cnt>0) {
			System.out.println("success");
		}
		response.sendRedirect("MyPage.jsp");
	}

}
