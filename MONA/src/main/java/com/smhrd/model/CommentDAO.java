package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class CommentDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	// 게시판 댓글달기
	public int insertCmt(CommentVO vo) {

		int cnt = sqlSession.insert("com.smhrd.model.CommentDAO.insertCmt", vo);
		sqlSession.close();

		return cnt;
	}

	// 게시판 댓글조회
	public List<CommentVO> showCmt(CommentVO vo) {

		List<CommentVO> lvo = sqlSession.selectList("com.smhrd.model.CommentDAO.showCmt",vo);
		sqlSession.close();

		return lvo;
	}

}

