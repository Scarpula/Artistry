package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Member;
import com.smhrd.model.Req;
import com.smhrd.model.ReqDAO;

public class ReqService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String path = "C:\\Users\\smhrd\\git\\Artistry\\Artistry_Project\\src\\main\\webapp\\req_img";
		 int maxSize = 10 * 1024 * 1024; // 최대 업로드 파일 크기 (10MB)
	     String encoding = "UTF-8"; // 인코딩 타입 설정
	     DefaultFileRenamePolicy renamePolicy = new DefaultFileRenamePolicy(); // 중복 파일명 정책
		
		MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, renamePolicy);
	
		
		//멤버이메일
		String mb_email = request.getParameter("mb_email");
		
		//req_papaer
		String ReqPaper = multi.getParameter("ReqText");
		
		//req_img_path
		String ReqFile = multi.getFilesystemName("ReqFile");
		String ReqFile2 = request.getContextPath() + "/portfolio_img/" + ReqFile;
				
		//req_receiver
		String ReqReceiver = request.getParameter("receiver");
		
		//req_price
		int ReqPrice = Integer.parseInt(multi.getParameter("ReqPrice"));
        int ReqFix = Integer.parseInt(multi.getParameter("ReqFix"));
        int ReqPrice2= ReqPrice+ReqFix;
        
		//created_at
        
        Req ReqInfo = new Req(mb_email , ReqPaper , ReqFile2 , ReqReceiver , ReqPrice2);

        int cnt = new ReqDAO().insertReq(ReqInfo);
        if (cnt>0) {
        	//데이터추가완료
        	System.out.print("의뢰요청서 추가완료");
        }else {
        	//데이터추가실패
        	System.out.print("의뢰요청서 추가실패");
        }
        
//        <a href="./Ex04앵커태그2.html#top">앵커태그 내 제일위로</a>
        response.sendRedirect("artist-portfolio/artist-portfolio-page.jsp?artistEmail="+ReqReceiver);
//        System.out.print(ReqFile2 + ReqPrice + ReqFix + artistEmail);
	
	}

}
