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

public class AnswerVO {

	public BigDecimal ANS_NUM;
	public int REQ_NUM;
	@NonNull
	public String ANS_CONTENT;
	public Timestamp AND_REGDT;
	@NonNull
	public String SELER_ID;
	
	public AnswerVO(int num) {
		this.REQ_NUM = num;
	}
	
}
