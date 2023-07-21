package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.UsersDto;

@Mapper
public interface IUsersDao {
	public List<UsersDto> list_member();
	public UsersDto login ( String user_id, String user_pw );
	public List<UsersDto> user_list();
	public UsersDto list( int user_idx );
	public int update(UsersDto dto);
	public UsersDto usersdto (int user_idx);
	public int admin_member_update_form(UsersDto dto);
	public int adminMemberDeleteAction (int user_idx);
	public int idfindAction(String user_name, String user_email, int user_phone);
	public UsersDto userId (String user_name, String user_email, int user_phone);
	public int pwfindAction (String user_id, String user_name, String user_email, int user_phone);
	public UsersDto userPw (String user_id, String user_name, String user_email, int user_phone);
	public int signUp(UsersDto dto);
	public List<UsersDto> search( String str );
	public List<UsersDto> mypage( int user_idx );
}
