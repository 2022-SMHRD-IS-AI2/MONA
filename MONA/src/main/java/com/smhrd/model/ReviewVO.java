package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;


  @Getter
  @AllArgsConstructor
  @RequiredArgsConstructor public class ReviewVO {
  
  private BigDecimal REVIEW_NUM;
  @NonNull private int PROD_NUM;
  @NonNull private String REVIEW_CONTENT; 
  private Timestamp REVIEW_DT;
  @NonNull private String U_ID;
  @NonNull private int REVIEW_RATINGS;
  
  }

