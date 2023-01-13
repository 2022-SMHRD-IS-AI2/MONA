package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class RequestDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	// 상품 댓글
	public int insertRequest(RequestVO vo) {
		
		int cnt = sqlSession.insert("com.smhrd.model.RequestDAO.insertRequest", vo);
		sqlSession.close();
		
		return cnt;
	}
	
	// 상품 댓글조회
	public List<RequestVO> showRequest(RequestVO vo){
		
		List<RequestVO> lvo = sqlSession.selectList("com.smhrd.model.RequestDAO.showRequest", vo);
		sqlSession.close();
		
		return lvo;
	}
	
	
	
}
