package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.BasketDto;

@Mapper
public interface IBasketDao {
	public List<BasketDto> list( int user_idx );
	public int sum( int user_idx );
	public int insert( int count, int product_idx, int user_idx );
	public int delete( int basket_idx );
	public int delete_rowNum( int user_idx, int status_idx );
	public int update_plus( int user_idx, int status_idx );
	public int update_minus( int user_idx, int status_idx );
}
