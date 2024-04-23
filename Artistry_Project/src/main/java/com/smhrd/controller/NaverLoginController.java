package com.smhrd.controller;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import org.json.JSONObject;
public class NaverLoginController {
public static String getAccessToken(String code, String state) throws UnsupportedEncodingException {
String clientId = "h9rK2bSi9jq7AfwqvdSJ";
String clientSecret = "hCBy5UVsd1";
String redirectURI = URLEncoder.encode("http://localhost:8081/Artistry_Project/index.jsp", "UTF-8");
String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
apiURL += "client_id=" + clientId;
apiURL += "&client_secret=" + clientSecret;
apiURL += "&redirect_uri=" + redirectURI;
apiURL += "&code=" + code;
apiURL += "&state=" + state;
String access_token = "";
String refresh_token = "";
try {
URL url = new URL(apiURL);
HttpURLConnection con = (HttpURLConnection)url.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader br;
if (responseCode == 200) {
br = new BufferedReader(new InputStreamReader(con.getInputStream()));
} else {
br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
}
String inputLine;
StringBuffer res = new StringBuffer();
while ((inputLine = br.readLine()) != null) {
res.append(inputLine);
}
br.close();
if (responseCode == 200) {
String response = res.toString();
JSONObject jsonObject = new JSONObject(response);
access_token = jsonObject.getString("access_token");
refresh_token = jsonObject.getString("refresh_token");
}
} catch (Exception e) {
System.out.println(e);
}
return access_token;
}
}