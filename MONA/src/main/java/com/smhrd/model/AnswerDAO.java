package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class AnswerDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	// 문의 댓글
	public int insertAnswer(RequestVO vo) {

		int cnt = sqlSession.insert("com.smhrd.model.AnswerDAO.insertAnswer", vo);
		sqlSession.close();

		return cnt;
	}

	// 문의 댓글조회
	public List<AnswerVO> showAnswer(AnswerVO vo) {

		List<AnswerVO> lvo = sqlSession.selectList("com.smhrd.model.AnswerDAO.showAnswer", vo);
		sqlSession.close();

		return lvo;
	}

}
