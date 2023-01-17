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
	
	//이용자가 장바구니 담기 클릭 시 장바구니 테이블 업로드
	public int Bupload(BucketVO vo) {
		
		int cnt = sqlSession.insert("Bupload",vo);
		sqlSession.close();
		
		return cnt;
	}
	
	//이용자가 결제완료시 장바구니에 담은 상품 삭제
	public int Bdelete(String loginUser) {
		
		int cnt=0;
			
			try {//만약 sql문이 잘못되었거나, url이 잘못되었다면 세션이 잘 생성이 안될수 있음
				
				//insert("실행할 sql 경로 정의",넘겨줄 값)
				cnt=sqlSession.delete("com.smhrd.model.BucketDAO.Bdelete",loginUser);
				
				if(cnt>0) {
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
	


}
