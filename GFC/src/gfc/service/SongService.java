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
import gfc.dto.Song;

@Service
@Transactional
public class SongService {
	@Autowired
	private SongsMapper songmapper;
	
	public int addSong(Song song) {
		try {
			Map<String, Object> imap = new HashMap<String, Object>();
			Map<String, Object> smap = new HashMap<String, Object>();
			
			imap.put("img", song.getSimage().getBytes());
			smap.put("song", song);
			
			return songMapper.addSong(smap, imap);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public Song getSong(int scode) {
		return songmapper.getSong(scode);
	}

	public List<Song> getSongList() {
		List<Song> song = songMapper.getSongList();
//		for (int i=0;i<song.size(); i++) {
//			System.out.println(song.get(i).getSimage());
//			MultipartFile imageContent = (MultipartFile) song.get(i).getSimage();
//			byte[] imageContent = (byte[]) map.get("img");
//		       final HttpHeaders headers = new HttpHeaders();
//		       headers.setContentType(MediaType.IMAGE_PNG);
//		}
		return song;
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
        String postParams = "source=ko&target=en&text=" + text; //원본언어: 한국어 (ko) -> 목적언어: 영어 (en)
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
