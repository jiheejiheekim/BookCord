package com.book.cord.login;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Service
public class KakaoService {

    public String getAccessToken(String authorizeCode) {
        String tokenUrl = "https://kauth.kakao.com/oauth/token";
        String redirectUri = "https://localhost:9089/bc/kakaoLogin";
        String clientId = "7602202d7ab3fef830a0c7ae34debe13";

        RestTemplate restTemplate = new RestTemplate();
        Map<String, String> requestBody = new HashMap<>();
        requestBody.put("grant_type", "authorization_code");
        requestBody.put("client_id", clientId);
        requestBody.put("redirect_uri", redirectUri);
        requestBody.put("code", authorizeCode);

        Map<String, String> tokenResponse = restTemplate.postForObject(tokenUrl, requestBody, Map.class);
        return tokenResponse != null ? tokenResponse.get("access_token") : null;
    }

    public Map<String, Object> getUserInfo(String accessToken) {
        String userInfoUrl = "https://kapi.kakao.com/v2/user/me";

        RestTemplate restTemplate = new RestTemplate();
        Map<String, String> headers = new HashMap<>();
        headers.put("Authorization", "Bearer " + accessToken);

        Map<String, Object> userInfoResponse = restTemplate.getForObject(userInfoUrl, Map.class, headers);
        return userInfoResponse != null ? (Map<String, Object>) userInfoResponse.get("kakao_account") : null;
    }
}
