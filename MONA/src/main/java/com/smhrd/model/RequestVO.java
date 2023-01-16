package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Getter

public class RequestVO {
	
	private BigDecimal REQ_NUM;
	@NonNull
	private int PROD_NUM;
	@NonNull
	private String REQ_CONTENT;
	private Timestamp REQ_REGDT;
	@NonNull
	private String U_Id;
	
	
	public RequestVO(int num) {
		this.PROD_NUM = num;
	}
	
}
