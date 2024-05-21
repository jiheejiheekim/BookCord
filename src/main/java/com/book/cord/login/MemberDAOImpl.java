package com.book.cord.login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public void insertMember(MemberVO member) {
        sqlSession.insert("com.book.cord.login.MemberMapper.insertMember", member);
    }
    
    @Override
    public MemberVO read(String id) {
        return sqlSession.selectOne("com.book.cord.login.MemberMapper.read", id);
    }
    
}
