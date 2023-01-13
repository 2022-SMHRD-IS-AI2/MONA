package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class BucketDAO {

	// DAO에서 호출했을 때 바로 DB와 연결할 수 있도록 SQLSessionManager사용
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 아래 메소드들에서 사용할 수 있는 sqlSession 생성
	// true 넣으면 outo commit
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	

	// 세부 장바구니 조회
	public BucketVO detailBucket(int B_num) {
		
		BucketVO vo2 = sqlSession.selectOne("com.smhrd.model.BucketDAO.detailBucket",B_num);
		sqlSession.close();
		
		return vo2;
	}
		// 전체 장바구니 조회
	public List<BucketVO> showBk(BucketVO vo) {

		List<BucketVO> Bvo = sqlSession.selectList("com.smhrd.model.BucketDAO.showBk", vo);
		sqlSession.close();

		return Bvo;
	}

}
