package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ProductDAO {
	
    SqlSessionFactory sqlsessionFactory=SqlSessionManager.getSqlSession();
	
	//factory를 사용해서 sql세션(sql실행,close(),연결(connection)) 생성
	// true -> auto commit
	SqlSession sqlSession=sqlsessionFactory.openSession(true);
	
	//상품등록 요청
	public int upload(ProductVO vo) {
		
		int cnt = sqlSession.insert("upload",vo);
		sqlSession.close();
		
		return cnt;
	}
	
	// 전체 상품등록 요청건 관리자 마이페이지에서조회
	public List<ProductVO> showProduct() {
		
		List<ProductVO> vo = sqlSession.selectList("com.smhrd.model.ProductDAO.showProduct");
		sqlSession.close();
		System.out.println("jsp" + vo);
	
		return vo;
	}
	
	
	//관리자 승인여부 업데이트(관리자가 승인 버튼 클릭시 승인여부 'N'->'Y'로 변경
	public int updateAdminCheck(int check) {

	int cnt=0;
		
		try {//만약 sql문이 잘못되었거나, url이 잘못되었다면 세션이 잘 생성이 안될수 있음
			
			//insert("실행할 sql 경로 정의",넘겨줄 값)
			cnt=sqlSession.update("com.smhrd.model.ProductDAO.updateAdminCheck", check);
			
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
	
	public int updateAdminCheck2(int check) {
		
		int cnt=0;
		
		try {//만약 sql문이 잘못되었거나, url이 잘못되었다면 세션이 잘 생성이 안될수 있음
			
			//insert("실행할 sql 경로 정의",넘겨줄 값)
			cnt=sqlSession.update("com.smhrd.model.ProductDAO.updateAdminCheck2", check);
			
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
	
	
	// 각 카테고리 별 상품 등록
	public List<ProductVO> showCate() {
		
		List<ProductVO> cate  = sqlSession.selectList("com.smhrd.model.ProductDAO.showCate");
		sqlSession.close();
	
		return cate;
	}
	
	// 각 가테고리 별 세부 상품정보 조회
	public ProductVO showProdDetail(int prod_num) {
		
		ProductVO vo = sqlSession.selectOne("com.smhrd.model.ProductDAO.showProdDetail",prod_num);
		sqlSession.close();
		
		return vo;
	}
	
	
     // 로그인한 사람의 장바구니 조회
	public List<ProductVO> showBk(String U_id) {

		List<ProductVO> Bvo = sqlSession.selectList("com.smhrd.model.ProductDAO.showBk", U_id);
		sqlSession.close();
		
		System.out.println("mmmmmmmmmmmmmmmmmm"+Bvo);

		return Bvo;
	}

	
 }
