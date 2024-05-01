package com.smhrd.controller;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.smhrd.model.NaverUser;
import com.smhrd.model.NaverUserDAO;

public class ApiExamMemberProfile {
    public static String ACCESS_TOKEN;

    public static NaverUser getUserProfile(HttpSession session) {
        String token = ACCESS_TOKEN;
        String header = "Bearer " + token;
        String apiURL = "https://openapi.naver.com/v1/nid/me";

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Authorization", header);

        String responseBody = get(apiURL, requestHeaders);

        JSONObject jsonObject = new JSONObject(responseBody);
        JSONObject responseObject = jsonObject.getJSONObject("response");

        String name = responseObject.getString("name");
        String email = responseObject.getString("email");
        String nickname = responseObject.getString("nickname");
        String profileImg = responseObject.getString("profile_image");
        String gender = responseObject.getString("gender");
        String birthday = responseObject.getString("birthday");
        String age = responseObject.getString("age");
        String birthyear = responseObject.getString("birthyear");
        String mobile = responseObject.getString("mobile");

        // 콘솔창에 회원 정보 출력
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Nickname: " + nickname);
        System.out.println("Profile Image: " + profileImg);
        System.out.println("Gender: " + gender);
        System.out.println("Birthday: " + birthday);
        System.out.println("Age Range: " + age);
        System.out.println("Birth Year: " + birthyear);
        System.out.println("Phone Number: " + mobile);

        NaverUser User = new NaverUser();
        User.setName(name);
        User.setEmail(email);
        User.setNickname(nickname);
        User.setProfileImg(profileImg);
        User.setGender(gender);
        User.setBirthday(birthday);
        User.setAge(age);
        User.setBirthyear(birthyear);
        User.setMobile(mobile);
        
        

        NaverUserDAO userDAO = new NaverUserDAO();    
        userDAO.insertNaverUser(User);
        
        session.setAttribute("naverUser", User);
        
        return User;
    }

    private static String get(String apiUrl, Map<String, String> requestHeaders) {
    	  HttpURLConnection con = connect(apiUrl);

    	    try {
    	        con.setRequestMethod("GET");
    	        for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
    	            con.setRequestProperty(header.getKey(), header.getValue());
    	        }

    	        int responseCode = con.getResponseCode();
    	        if (responseCode == HttpURLConnection.HTTP_OK) {
    	            return readBody(con.getInputStream());
    	        } else {
    	            return readBody(con.getErrorStream());
    	        }
    	    } catch (Exception e) {
    	        throw new RuntimeException("API 요청과 응답 실패", e);
    	    } finally {
    	        con.disconnect();
    	    }
    	}
    

    private static HttpURLConnection connect(String apiUrl) {
    	try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection) url.openConnection();
        } catch (Exception e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }
    

    private static String readBody(InputStream body) {
    	InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (Exception e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }

    public static void main(String[] args) throws UnsupportedEncodingException {
        String code = ""; // 네이버 로그인 인증 코드
        String state = ""; // 상태 토큰

        ACCESS_TOKEN = NaverLoginController.getAccessToken(code, state);
        getUserProfile(null);
        
    }
   
}