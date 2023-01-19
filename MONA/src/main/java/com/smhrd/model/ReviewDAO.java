package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ReviewDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	
	  // 리뷰업로드 
	  public int reviewUpload(ReviewVO vo) {
	 int cnt =sqlSession.insert("reviewUpload", vo); 
	 sqlSession.close();
	  
	  return cnt; 
	  }
	  
	  // 리뷰조회 
	  
	  public List<ReviewVO> showReview(ReviewVO vo) {
	  
	  List<ReviewVO> r_vo = sqlSession.selectList("com.smhrd.model.ReviewDAO.showReview",vo);
	  sqlSession.close();
	  
	  return r_vo; 
	  }
	  
 // 카테고리에서 특정상품 전체 리뷰 평점 조회
	  
	  public List<ReviewVO> showReview1(ReviewVO vo) {
	  
	  List<ReviewVO> r_vo = sqlSession.selectList("com.smhrd.model.ReviewDAO.showReview1",vo);
	  sqlSession.close();
	  
	  return r_vo; 
	  }
	 

}
