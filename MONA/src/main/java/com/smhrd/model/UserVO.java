package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;


//@Data // 기본생성자, getter/setter, toString, equals... 
@AllArgsConstructor //모든 파라미터를 받는 생성자
//final or @NonNUll 파라미터만 받는 생성자
@NoArgsConstructor //기본생성자
@Getter //getter메소드
public class UserVO{

	
	@NonNull
	private String id;
	
	@NonNull
	private String pw;
	private String name;
	private String nick;
	private String address;
	private String tel;
		

	public UserVO(String id, String pw) {
	      super();
	      this.id = id;
	      this.pw = pw;
	   }
}
