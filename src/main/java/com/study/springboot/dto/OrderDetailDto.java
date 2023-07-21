package com.study.springboot.dto;

import lombok.Data;

@Data
public class OrderDetailDto {
	private int order_detail_idx;
	private int order_idx;
	private int order_pd_idx;
	private int order_quantity;
	private int order_price;
	private String product_name;
	private String product_image;
	private int product_price;
	private int product_idx;
}