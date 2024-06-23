package com.book.cord.login;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService {
	
	APIKey api = new APIKey();

    @Autowired
	@Qualifier("memberDAOImpl") 
    private MemberDAO memberDAO;
    
    @Autowired
    private MemberMapper memberMapper;
    
    @Autowired
    private CustomPasswordEncoder passwordEncoder; //암호화를 위한 PasswordEncoder 빈 주입
    
    @Autowired
    private CustomUserDetailsService customUDService;
    
    @Autowired
    private CustomLoginsuccessHandler customLoginHandler;
    
    @Autowired
    private KakaoAuthenticationProvider kakaoAuthenticationProvider;

    String client_secret = api.getClient_secret();
	String client_id = api.getClient_id();
	String redirect_uri = api.getRedirect_uri();
    
    @Override
    public void registerMember(MemberVO member) {
        try {
            log.debug("Service: {}~~ ~~", member);
            if (member.getProvider() == null || member.getProvider().isEmpty()) {
                member.setProvider("local");
            }
            String encodedPassword = passwordEncoder.encode(member.getPwd());
            member.setPwd(encodedPassword);
            member.setEnabled(true);
            memberDAO.insertMember(member); // MemberDAO를 통해 회원 추가
            
        } catch (Exception e) {
            log.error("Exception in registerMember", e);
        }
    }
    
    @Override
    public int idCheck(String id) {
    	System.out.println("id 중복체크 서비스");
    	int result=memberDAO.searchId(id);
    	System.out.println("ID 중복체크 결과 : "+result);
    	return result;
    }
    
    @Override
    public int nameCheck(String name) {
    	System.out.println("name 중복체크 서비스");
    	int result=memberDAO.searchName(name);
    	System.out.println("NAME 중복체크 결과 : "+result);
    	return result;
    }
    
    //////////////////////////////////////////////////////////////////////카카오 로그인 서비스
	@Override
	public String kakaoRegisterMember(String code, HttpServletRequest request) {
		//카카오 로그인 처리
	    String accessToken = getKakaoAccessToken(code);
	
	    //카카오 사용자 정보 가져오기
	    HashMap<String, Object> userInfo = getKakaoUserInfo(accessToken);
	    
	    System.out.println("서비스>> 카카오로그인 요청 아이디 : "+userInfo.get("email").toString());
	
	    //이메일로 이미 가입된 회원인지 확인
	    if (!isMemberExist(userInfo.get("email").toString())) {
	        //이미 가입되지 않은 경우, 회원 등록
	    	System.out.println("첫 로그인 회원입니다 - 회원가입 처리 진행");
	    	registerNewMember(userInfo);
	    	
	    	//가입 후 사용자의 인증 처리
	        authenticateExistingMember(userInfo, request);
	    	customUDService.loadUserByUsername(userInfo.get("email").toString());  
	    	
	    } else {
	    	System.out.println("이미 가입한 회원입니다 - 로그인 처리 진행");
	    	//이미 가입된 사용자의 인증 처리
	        authenticateExistingMember(userInfo, request);
	                    
	    	customUDService.loadUserByUsername(userInfo.get("email").toString());         				
	    }
	
	    //로그인 처리 결과 반환
	    return "카카오 로그인 처리 완료";
	}
    
    //카카오 토큰 받기
	@Override
	public String getKakaoAccessToken(String code) {
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
		
		System.out.println("서비스>> response.getBody() : "+response.getBody());
		
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
		
		System.out.println("서비스>> oauthToken.getAccess_token() : "+oauthToken.getAccess_token());
		System.out.println("-----------------------");
		
		return oauthToken.getAccess_token();
	}
    
	//카카오 사용자 정보 가져오기
	@Override
	public HashMap<String, Object> getKakaoUserInfo(String accessToken) {
		
		RestTemplate rt2 = new RestTemplate();
		
		HttpHeaders headers2 = new HttpHeaders();
		//headers2.add("Authorization", "Bearer "+ oauthToken.getAccess_token());
		headers2.add("Authorization", "Bearer "+ accessToken);
		headers2.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
			
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);
			
		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest2,
				String.class 
		);
		System.out.println("서비스>> user me : "+response2.getBody());
		
		
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
		
		System.out.println("서비스>> UserInfo : " + userInfo);
		System.out.println("서비스>> UserInfo.get(nickname) : " + userInfo.get("nickname"));
		
		return userInfo;
	  }
	
		
	private boolean isMemberExist(String email) {
	    int count = memberDAO.searchId(email);
	    return count > 0;
	}
	
	// 새로운 회원으로 등록하는 메서드
	private void registerNewMember(HashMap<String, Object> userInfo) {
	    MemberVO newMember = new MemberVO();
	    newMember.setId(userInfo.get("email").toString());// 카카오 이메일을 아이디로 사용
	    newMember.setProvider("kakao"); // 카카오 회원 가입을 구분하기 위해 provider를 설정
	    String encodedPasswordKakao = passwordEncoder.encode("asdfas");//카카오 로그인 시 비밀번호를 asdfas로 설정 후 암호화
	    newMember.setPwd(encodedPasswordKakao);
	    newMember.setName(userInfo.get("nickname").toString());
	    newMember.setProfile_img(userInfo.get("profile_image").toString());
	    newMember.setEnabled(true);
	    memberDAO.insertMember(newMember);// 새로운 회원으로 등록
	}

	// 이미 가입된 사용자의 인증 처리 메서드
	private void authenticateExistingMember(HashMap<String, Object> userInfo, HttpServletRequest request) {
	    // KakaoAuthenticationProvider를 사용하여 사용자를 인증
	    try {
	        Authentication authentication = kakaoAuthenticationProvider.authenticate(new UsernamePasswordAuthenticationToken(userInfo.get("email").toString(), ""));
	        // 사용자 인증이 성공한 경우, SecurityContext에 인증 정보를 설정
	        SecurityContextHolder.getContext().setAuthentication(authentication);
	/*
	        // 세션에 사용자 아이디 저장
	        HttpSession session = request.getSession();
	        session.setAttribute("userid", userInfo.get("email").toString());
	*/
	    } catch (AuthenticationException e) {
	        // 사용자 인증이 실패한 경우에 대한 처리
	        e.printStackTrace();
	    }
	}
    
}
