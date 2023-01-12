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

public class CommentVO {

	private BigDecimal CMT_NUM;
	@NonNull
	private int B_NUM;
	@NonNull
	private String CMT_CONTENT;
	private Timestamp CMT_REGDT;
	@NonNull
	private String U_Id;
	private int SUPER_CMT_NUM;

	
	public CommentVO(int num) {
		this.B_NUM = num;
	}

}

