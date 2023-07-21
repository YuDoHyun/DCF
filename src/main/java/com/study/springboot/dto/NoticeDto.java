package com.study.springboot.dto;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class NoticeDto {
	private int notice_idx;
	private String notice_title;
	private String notice_content;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date notice_date;
}
