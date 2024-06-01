package com.book.cord.login;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface MemberService {
    void registerMember(MemberVO member);
    //MemberVO getMemberById(String id);
    int idCheck(String id);
    int nameCheck(String name);
    
    public String getKakaoAccessToken(String code);
    public HashMap<String, Object> getKakaoUserInfo(String accessToken);
    public String kakaoRegisterMember(String code, HttpServletRequest request);
}
