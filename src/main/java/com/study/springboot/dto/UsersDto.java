package com.study.springboot.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


@Data
public class UsersDto {
	private int user_idx;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_address;
	private String user_email;
	private int user_email_receive;
	private String user_gender;
	private int user_phone;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date user_birth_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date user_join_date;
	//private int order_user_idx;
	//private int done2one_user;	

}
