package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.frontcontroller.Command;
import com.smhrd.model.Portfolio;
import com.smhrd.model.PortfolioDAO;

public class PortfolioService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		// 게시물 등록 기능
		// 파일업로드를 위한 변수 설정
		// 1. request객체
		// 2. 파일을 저장할 경로(문자열)->상대경로
		// 요청에 관련된 정보기 때문에 request객체를 사용해서 상대경로 알아보기
		String path = request.getServletContext().getRealPath("./imgPortfolio");
		System.out.println(path);

		// 3. 파일 최대 크기(정수)
		int maxSize = 10 * 1024 * 1024; // 10MB

		// 4. 인코딩 타입(문자열)
		String encoding = "UTF-8";

		// 5. 파일 이름 중복제거
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();

		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			// 데이터 가져오기
			String pf_Path = multi.getParameter("pf_Path");
			String pf_Name = multi.getParameter("pf_Name");
			String pf_Info = multi.getFilesystemName("pf_Info");
			//String content = multi.getParameter("content");

			System.out.println(pf_Path + pf_Name + pf_Info);

			Portfolio portfolio = new Portfolio(pf_Path, pf_Path, pf_Info);

			int cnt = new BoardDAO().insertBoard(board);

			if (cnt > 0) {
				System.out.println("파일 업로드 성공!");
			} else {
				System.out.println("파일 업로드 실패..");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// response.sendRedirect("BoardMain.jsp");

		return "BoardMain.jsp";
	}

}
