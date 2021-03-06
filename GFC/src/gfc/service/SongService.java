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
import org.springframework.transaction.annotation.Transactional;

import gfc.config.Dev;
import gfc.dao.SongsMapper;
import gfc.dao.UsersMapper;
import gfc.dto.Song;

@Service
@Transactional
public class SongService {
	@Autowired
	private SongsMapper songmapper;
	@Autowired
	private UsersMapper usersMapper;
	
	public int addSong(Song song) {
		try {
			return songmapper.addSong(song);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public void updateViewCnt(int scode) {
		songmapper.updateViewCnt(scode);
	}

	public Song getSong(int scode) {
		return songmapper.getSong(scode);
	}

	public List<Song> getSongList(int page) {
		System.out.println("page : "+page);
		return songmapper.getSongList(page);
	}
	
	public List<Song> mainList(int rownum){
		return songmapper.mainList(rownum);
	}
	
	public int getSongCnt() {
		return songmapper.getSongCnt();
	}
	public int getSearchSongCnt(String keyword, String condition) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("condition", (String)condition);
		map.put("keyword", (String)keyword);
		return songmapper.getSearchSongCnt(map);
	}
	
	public Song recommendSong(int songCnt) {
		return songmapper.recommendSong(songCnt);
	}
	
	public List<Song> favoriteList(int acode){
		return songmapper.favoriteList(acode);
	}
	
	public Song favoriteSong(int acode) {
		return songmapper.favoriteSong(acode);
	}
	
	public int getAcode(int ucode) {
		return usersMapper.getAcode(ucode);
	}
	
	public List<Song> searchSong(String keyword, String condition, String page){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("condition", (String)condition);
		map.put("keyword", (String)keyword);
		map.put("page", Integer.parseInt(page));
		return songmapper.searchSong(map);
	}
	
	
	
	public String convertToData(String text) throws ParseException {
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
	
	public String translate(String lyric){
		Dev dev = new Dev();
		
        String clientId = dev.getPapagoAPIid();//애플리케이션 클라이언트 아이디값";
        String clientSecret = dev.getPapagoAPIpw();//애플리케이션 클라이언트 시크릿값";

        String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
        String text;
        try {
            text = URLEncoder.encode(lyric, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("인코딩 실패", e);
        }

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);

        String responseBody = post(apiURL, requestHeaders, text);

        return responseBody;
    }

    private String post(String apiUrl, Map<String, String> requestHeaders, String text){	
        HttpURLConnection con = connect(apiUrl);
        String postParams = "source=ko&target=en&text=" + text; // slang : 원본언어, tlang : 목적언어
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

    
//    같음
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
