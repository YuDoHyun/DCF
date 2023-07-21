package com.study.springboot.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDto {
	private int order_idx;
	private String order_status;
	private Date order_date;
	private int order_detail_idx;
	private int order_quantity;
	private int order_pd_idx;
	private int order_user_idx;
	private int user_idx;
	private String user_name;
	private String user_id;
	private int user_phone;
	private String user_email;
	private String user_address;
	private Date user_join_date;
	private int user_gender;
	private Date user_birth_date;
	private String product_name;
	private String product_image;
	private int product_price;
	private int order_price;
	private int basket_idx;
	private int basket_count;
	private int basket_pd_idx;
	private String order_user_name;
	private int order_user_phone;
	private String order_user_address;
	
}
