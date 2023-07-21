package com.study.springboot.dto;


import java.util.Date;

import lombok.Data;

@Data
public class DeliveryDto {
	private int order_idx;
	private Date order_date;
	private String user_name;
	private String product_name;
	private String order_status;
	private int order_price;
	private int order_quantity;
}
