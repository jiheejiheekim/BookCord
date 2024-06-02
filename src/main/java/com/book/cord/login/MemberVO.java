package com.book.cord.login;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	// Serializable 인터페이스를 구현하여 직렬화 가능
	private static final long serialVersionUID = 1L;
	
	private String id;          // 사용자 아이디
    private String pwd;    		// 비밀번호
    private String name;        // 이름(닉네임)
    	
    private Date reg_date;		// 가입일
    private int member_num;     // 사용자 번호
    
    private List<AuthVO> roleList; // 권한 (예: ROLE_USER, ROLE_ADMIN)
   
	private String email;       // 이메일
    private String provider;    // 로그인 제공자 (local, kakao, naver)
    private String provider_id; // 소셜 로그인 사용자 ID
    private String profile_img; // 프로필 이미지
    
    private boolean enabled; // 계정 정지 유무
    private Date update_date;
    
   
}
