package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.OrderDetailDto;



@Mapper
public interface IOrderDetailDao {
	public List<OrderDetailDto> getOrderidx();
	public List<OrderDetailDto> orderProductVeiw(int idx);
}
