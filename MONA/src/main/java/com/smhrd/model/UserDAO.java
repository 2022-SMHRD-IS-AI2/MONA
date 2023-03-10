package com.smhrd.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class UserDAO {

      // DAO에서 호출했을 때 바로 DB와 연결할 수 있도록 SQLSessionManager사용
      SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
      // 아래 메소드들에서 사용할 수 있는 sqlSession 생성
      SqlSession sqlSession = sqlSessionFactory.openSession();
      
      
     // 회원가입
      public int insertUser(UserVO vo) {
         int cnt = 0;
            
            try { 
              
            	cnt = sqlSession.insert("com.smhrd.model.UserDAO.insertUser", vo);
               
               if(cnt > 0) {
                  sqlSession.commit();
               }else {
                  sqlSession.rollback();
               }
               
            }catch(Exception e) {
               e.printStackTrace();
            }finally {
               sqlSession.close();
            }
            return cnt;
      
   }
      
	  	//로그인
	  	public Map<String, Object> selectUser(UserVO vo) {
	  		//UserVO loginUser=null;
	  		Map<String, Object> map = new HashMap();
	  		
	  		try {
	  		
	  			map=sqlSession.selectOne("com.smhrd.model.UserDAO.selectOne",vo);
	  			
	  			System.out.println(map);
	  			  			
	  		}catch(Exception e) {
	  			e.printStackTrace();
	  		}finally {
	  			sqlSession.close();
	  		}
	  		
	  		return map;
	  	}
	  	
	  	//id 중복체크
	  	 public boolean idCheck(String inputE) {

	  	     boolean checkE = false;

	  	      try {
	  	         checkE = sqlSession.selectOne("com.smhrd.model.UserDAO.idCheck", inputE);
	  	         // select - commit / rollback 생략가능

	  	         System.out.println(checkE);
	  	         
	  	      } catch (Exception e) {
	  	         e.printStackTrace();
	  	      } finally {
	  	         sqlSession.close();
	  	      }
	  	      return checkE;
	  	   }
      

}
