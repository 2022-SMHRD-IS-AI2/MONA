package com.smhrd.model;

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
		public OrderVO pay() {
			
			OrderVO vo = sqlSession.selectOne("com.smhrd.model.OrderDAO.pay");
			sqlSession.close();
			
			return vo;
		}
}
