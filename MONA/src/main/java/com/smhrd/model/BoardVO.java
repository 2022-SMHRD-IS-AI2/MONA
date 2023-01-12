package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor
public class BoardVO {
	
	
	
	private BigDecimal num;
	@NonNull
	private String title;
	@NonNull
	private String content;
	@NonNull
	private String file;
	private Timestamp regdt;
	@NonNull
	private String id;
	private BigDecimal view;
	
	
}
