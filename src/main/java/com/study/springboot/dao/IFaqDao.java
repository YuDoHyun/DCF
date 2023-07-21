package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.FaqDto;

@Mapper
public interface IFaqDao {
	public List<FaqDto> list();
	public FaqDto faq_detail( int faq_idx );
	public int faq_write(String faq_title, String faq_content);
	public int adminWritefaqformAction(String faq_title, String faq_content);
	public int adminfaqUpdateAction (int faq_idx, String faq_title, String faq_content);
	public int adminfaqDeleteAction(int faq_idx);
	public List<FaqDto> search(String keyword);
	public FaqDto faqdto(int faq_idx);
}
