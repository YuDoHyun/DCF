package com.study.springboot.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class One2OneDto {
	private int one2one_idx;
	private String one2one_title;
	private String one2one_content;
	private String one2one_image;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date one2one_date;
	private int one2one_User_idx;
	private String one2one_reply;
	private String user_id;
	private String user_name;
}
