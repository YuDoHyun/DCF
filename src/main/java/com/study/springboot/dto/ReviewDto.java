package com.study.springboot.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReviewDto {
	private int review_idx;
	private String review_content;
	private String review_image;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date review_date;
	private int review_score;
	private int review_item_idx;
	private int review_user_idx;
	private String user_name;
	private int product_idx;
    private String product_name;
    private int product_price;
    private String product_image;
    private int review_pd_idx;
    
}
