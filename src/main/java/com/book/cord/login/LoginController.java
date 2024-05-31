package com.book.cord.login;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class LoginController {

    @Autowired
    @Qualifier("memberService")
    MemberService memberService;

    @Autowired
    @Qualifier("kakaoService")
    KakaoService kakaoService;

    @GetMapping("/vip")
    @Secured("ROLE_USER")
    public String vip(Model model) {
        return "vip";
    }

    @GetMapping("/admin")
    @Secured("ROLE_ADMIN")
    public String admin(Model model) {
        return "admin";
    }

    @GetMapping("/index")
    public String index(Model model) {
        System.out.println("Index page accessed");
        return "index";
    }

    @GetMapping("/loginP")
    public String loginP(Model model) {
        return "login/loginP";
    }
    
    
	@GetMapping("/kakaoLogin")
	public @ResponseBody String kakaoLogin(String code) {
		String client_secret = "xl1MIPC7TDOMHmMUXzTk2LAREqzGOCaC";
		String client_id = "7602202d7ab3fef830a0c7ae34debe13";
		String redirect_uri = "http://localhost:9089/bc/kakaoLogin";
		
		// POST 방식으로 key=value 데이터를 요청 (카카오쪽으로)
		// 이 때 필요한 라이브러리가 RestTemplate, 얘를 쓰면 http 요청을 편하게 할 수 있다.
		RestTemplate rt = new RestTemplate();
	
		// HTTP POST를 요청할 때 보내는 데이터(body)를 설명해주는 헤더도 만들어 같이 보내줘야 한다.
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
	
		// body 데이터를 담을 오브젝트인 MultiValueMap를 만들어보자
		// body는 보통 key, value의 쌍으로 이루어지기 때문에 자바에서 제공해주는 MultiValueMap 타입을 사용한다.
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", client_id);
		params.add("client_secret", client_secret); // 클라이언트 시크릿 추가
		params.add("redirect_uri", redirect_uri);
		params.add("code", code);
	
		// 요청하기 위해 헤더(Header)와 데이터(Body)를 합친다.
		// kakaoTokenRequest는 데이터(Body)와 헤더(Header)를 Entity가 된다.
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
	
		// POST 방식으로 Http 요청한다. 그리고 response 변수의 응답 받는다.
		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token", // https://{요청할 서버 주소}
				HttpMethod.POST, // 요청할 방식
				kakaoTokenRequest, // 요청할 때 보낼 데이터
				String.class // 요청 시 반환되는 데이터 타입
		);
		
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken=null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		}catch(JsonMappingException e) {
			e.printStackTrace();
		}catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("카카오 액세스 토큰: "+ oauthToken.getAccess_token());
		
		///////////////////////////////////////////////////////////////////////
		/* 추가 기능 */
		RestTemplate rt2 = new RestTemplate();
		
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer "+ oauthToken.getAccess_token());
		headers2.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
			
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);
			
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest2,
				String.class 
		);
		System.out.println("카카오 user me : "+response2.getBody());
		
		
		/////////////////////////
		HashMap<String, Object> userInfo = new HashMap<>();
				
		JsonElement element = JsonParser.parseString(response2.getBody());
        
        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
        
        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
        String email = kakao_account.getAsJsonObject().get("email").getAsString();
        String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
        
        userInfo.put("nickname", nickname);
        userInfo.put("email", email);
        userInfo.put("profile_image", profile_image);
        
        System.out.println("login Controller : " + userInfo);
		
		
		//return response1.getBody();
		return response2.getBody();
	}

	
    @GetMapping("/kakao")
    public String login() {
        return "login/kakao";
    }

    
    
}
