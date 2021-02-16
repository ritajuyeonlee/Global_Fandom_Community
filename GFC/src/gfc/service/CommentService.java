package gfc.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gfc.config.Dev;
import gfc.dao.CommentMapper;
import gfc.dto.Comment;

@Service
public class CommentService {
	
	@Autowired
	CommentMapper commentMapper;

	public int addComment(Comment comment) {
		return commentMapper.addComment(comment);
	}
	
	public List<Comment> getCommentList(int scode){
		return commentMapper.getCommentList(scode);
	}
	
	public String getComment(int ccode) {
		return commentMapper.getComment(ccode);
	}
	
//	****************** 번역 ************************** //
	public String convertToData2(String text) throws ParseException {	// 언어추출
//		String temp = songService.translate(kolyric);
//	System.out.println(temp);

		JSONParser jsonParse = new JSONParser();
	    JSONObject obj =  (JSONObject)jsonParse.parse(text);
	    String langcode = obj.get("langCode").toString();
		
		System.out.println(langcode);
		
		return langcode;
	}
	
	public String convertToData(String text) throws ParseException {	// 번역된거 추출
//		String temp = songService.translate(kolyric);
//	System.out.println(temp);

		JSONParser jsonParse = new JSONParser();
	    JSONObject obj =  (JSONObject)jsonParse.parse(text);
	    String enlyric = obj.get("message").toString();
	//    System.out.println(obj.get("message"));
	
	    JSONObject obj1 =  (JSONObject)jsonParse.parse(enlyric);
		String enlyric1 = obj1.get("result").toString();
//		System.out.println("3");
		
		JSONObject obj2 =  (JSONObject)jsonParse.parse(enlyric1);
		String enlyric2 = obj2.get("translatedText").toString();
//		System.out.println("4");
		
//		System.out.println(enlyric2);
		
		return enlyric2;
	}
	
	public String translate(String ccom,String slang, String tlang){
		Dev dev = new Dev();
		
        String clientId = dev.getPapagoAPIid();//애플리케이션 클라이언트 아이디값";
        String clientSecret = dev.getPapagoAPIpw();//애플리케이션 클라이언트 시크릿값";

        String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
        String text;
        try {
            text = URLEncoder.encode(ccom, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("인코딩 실패", e);
        }

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);

        String responseBody = post(apiURL, requestHeaders, text, slang, tlang);

        return responseBody;
    }

    private String post(String apiUrl, Map<String, String> requestHeaders, String text,String slang, String tlang){	
        HttpURLConnection con = connect(apiUrl);
        String postParams = "source="+ slang +"&target="+ tlang +"&text=" + text; // slang : 원본언어, tlang : 목적언어
        try {
            con.setRequestMethod("POST");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            con.setDoOutput(true);
            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(postParams.getBytes());
                wr.flush();
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
                return readBody(con.getInputStream());
            } else {  // 에러 응답
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }
	
//	언어감지
	public String langDetection(String ccom) throws ParseException {
		Dev dev = new Dev();
		
        String clientId = dev.getPapagoAPIid(); //애플리케이션 클라이언트 아이디값";
        String clientSecret = dev.getPapagoAPIpw(); //애플리케이션 클라이언트 시크릿값";

        String query;
        try {
            query = URLEncoder.encode(ccom, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("인코딩 실패", e);
        }
        String apiURL = "https://openapi.naver.com/v1/papago/detectLangs";

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);

        String responseBody = Detectpost(apiURL, requestHeaders, query);

//        System.out.println(convertToData2(responseBody));
        
        return convertToData2(responseBody);
    }

    private String Detectpost(String apiUrl, Map<String, String> requestHeaders, String text){
        HttpURLConnection con = connect(apiUrl);
        String postParams =  "query="  + text; //원본언어: 한국어 (ko) -> 목적언어: 영어 (en)
        try {
            con.setRequestMethod("POST");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            con.setDoOutput(true);
            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(postParams.getBytes());
                wr.flush();
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
                return readBody(con.getInputStream());
            } else {  // 에러 응답
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }
    
    private HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}
