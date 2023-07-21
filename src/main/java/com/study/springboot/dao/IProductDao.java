package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ProductDto;

@Mapper
public interface IProductDao {
	public List<ProductDto> sample_list_dog();
	public List<ProductDto> sample_list_cat();
	public List<ProductDto> list(String startRowNum, String endRowNum);
	public List<ProductDto> product_list_snack();
	public List<ProductDto> product_list_food();
	public ProductDto product_action( int product_idx);
	public ProductDto update_view( int product_idx );
	public List<ProductDto> search( String keyword );
	public int product_delete( int product_idx );
	public int update( ProductDto dto );
	public int insertProduct( ProductDto dto );
	public List<ProductDto> newlist_dog();
	public List<ProductDto> newlist_cat();
	public List<ProductDto> product_list_dog(String startRowNum, String endRowNum);
	public List<ProductDto> product_list_dog_food(String startRowNum, String endRowNum);
	public List<ProductDto> product_list_dog_snack(String startRowNum, String endRowNum);
	public List<ProductDto> product_list_cat(String startRowNum, String endRowNum);
	public List<ProductDto> product_list_cat_food(String startRowNum, String endRowNum);
	public List<ProductDto> product_list_cat_snack(String startRowNum, String endRowNum);
	public List<ProductDto> product_list_best();
	public List<ProductDto> product_list_best_food();
	public List<ProductDto> product_list_best_snack();
	public List<ProductDto> product_condition( String str );
	public List<ProductDto> product_condition_food( String str );
	public List<ProductDto> product_condition_snack( String str );
}
