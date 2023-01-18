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
	  
	  public List<ReviewVO> showReview(int prod_num) {
	  
	  List<ReviewVO> vo = sqlSession.selectList("com.smhrd.model.ReviewDAO.showReview",prod_num);
	  sqlSession.close();
	  
	  return vo; 
	  }
	 

}
