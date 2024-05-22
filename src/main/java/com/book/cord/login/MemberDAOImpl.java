package com.book.cord.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

    private final String NAMESPACE = "com.book.cord.login.MemberMapper";
    
    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private SqlSession sqlSession;

    @Override
    public void insertMember(MemberVO member) {
    	System.out.println("DAO 지나가기 : " +member);
        sqlSession.insert(NAMESPACE + ".insertMember", member);
    }

    @Override
    public MemberVO read(String id) {
    	System.out.println("DAO 지나가기 : " +id);
        return sqlSession.selectOne(NAMESPACE + ".read", id);
    }
}

