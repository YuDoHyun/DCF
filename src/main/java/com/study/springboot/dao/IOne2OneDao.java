package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.One2OneDto;

@Mapper
public interface IOne2OneDao {
	public List<One2OneDto> list();
	public One2OneDto content_detail( int one2one_idx );
	public int reply( String one2one_reply, int one2one_idx );
	public List<One2OneDto> search( String keyword );
	public List<One2OneDto> mylist( int user_idx );
	public int insert( One2OneDto dto );
	public int delete( int one2one_idx );
}
