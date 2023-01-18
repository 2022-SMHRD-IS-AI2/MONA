package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class OrderDAO {
	 SqlSessionFactory sqlsessionFactory=SqlSessionManager.getSqlSession();
		
		//factory를 사용해서 sql세션(sql실행,close(),연결(connection)) 생성
		// true -> auto commit
		SqlSession sqlSession=sqlsessionFactory.openSession(true);
		
		//주문내역 업로드
		public int orderUpload(OrderVO vo) {
			
			int o_cnt = sqlSession.insert("orderUpload",vo);
			sqlSession.close();
			
			return o_cnt;
		}
		
		//결제할 주문내역 가져오기
		public List<OrderVO> pay() {
			
			List<OrderVO> vo = sqlSession.selectList("com.smhrd.model.OrderDAO.pay");
			sqlSession.close();
			
			return vo;
		}
		
		//결제완료시 주문상태 주문완료로 바꾸기 N->Y
		public int orderCheck (String loginUser) {

		int cnt=0;
			
			try {//만약 sql문이 잘못되었거나, url이 잘못되었다면 세션이 잘 생성이 안될수 있음
				
				//insert("실행할 sql 경로 정의",넘겨줄 값)
				cnt=sqlSession.update("com.smhrd.model.OrderDAO.orderCheck", loginUser);
				
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
