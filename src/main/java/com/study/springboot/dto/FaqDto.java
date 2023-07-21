package com.study.springboot.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class FaqDto {
	private int faq_idx;
	private String faq_title;
	private String faq_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date faq_date;
}
