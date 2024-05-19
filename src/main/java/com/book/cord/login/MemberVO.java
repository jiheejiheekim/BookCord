package com.book.cord.login;


import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String id;          // 사용자 아이디
    private String pwd;    		// 비밀번호
    private String name;        // 이름(닉네임)
    
    /*
    private int member_num;     // 사용자 번호
    
    private Date reg_date;		// 가입일
    
    private String email;       // 이메일
    private String role;        // 권한 (예: ROLE_USER, ROLE_ADMIN)
    private String provider;    // 로그인 제공자 (local, kakao, naver)
    private String provider_id; // 소셜 로그인 사용자 ID
    private String profile_img; // 프로필 이미지
    	
    private boolean enabled;
    private List<AuthVO> authList;
    */
}
