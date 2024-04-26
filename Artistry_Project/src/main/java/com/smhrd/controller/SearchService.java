package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String cate1 = request.getParameter("cateBox1");
		String cate2 = request.getParameter("cateBox2");
		String cate3 = request.getParameter("cateBox3");
		String cate4 = request.getParameter("cateBox4");
		String cate5 = request.getParameter("cateBox5");

		String[] cateList = {cate1, cate2, cate3, cate4, cate5};

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
		
		String encodedCate = URLEncoder.encode(cate, "UTF-8");
		response.sendRedirect("artist-portfolio/portfolio.jsp?Search-2=" + encodedCate);
		
		
	}

}
