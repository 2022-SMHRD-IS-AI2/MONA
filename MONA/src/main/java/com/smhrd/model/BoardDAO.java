package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class BoardDAO {

	// DAO에서 호출했을 때 바로 DB와 연결할 수 있도록 SQLSessionManager사용
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	// 아래 메소드들에서 사용할 수 있는 sqlSession 생성
	// true 넣으면 outo commit
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	// select * from web_board;
	// insert into web_board values(num_board.nextval, title, writer, filename, content, sysdate);	
	public int upload2 (BoardVO vo) {
		int cnt = sqlSession.insert("upload2", vo);
		sqlSession.close();
		
		return cnt;
	}
	
	// 전체 게시글 조회
		public List<BoardVO> showBoard() {
			
			List<BoardVO> vo = sqlSession.selectList("com.smhrd.model.BoardDAO.showBoard");
			sqlSession.close();
		
			return vo;
		}
		
		// 세부 게시글 조회
		public BoardVO detailBoard(int b_num) {
			
			BoardVO vo = sqlSession.selectOne("com.smhrd.model.BoardDAO.detailBoard",b_num);
			sqlSession.close();
			
			return vo;
		}
		
	}

