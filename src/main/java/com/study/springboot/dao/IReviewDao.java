package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ReviewDto;

@Mapper
public interface IReviewDao {
	public List<ReviewDto> review( int product_idx );
	public List<ReviewDto> viewproductinfo(int prodcut_idx);
	public int reviewInsert(ReviewDto dto);
}
