package com.codering.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.codering.common.AbstractDAO;

@Repository("UserDAO")
public class UserDAO extends AbstractDAO
{
	public int selectIdOverlap(Map<String, Object> map)
	{
		return (Integer) selectOne("user.idOverlap", map);
	}
	
	public int selectNickOverlap(Map<String, Object> map)
	{
		return (Integer) selectOne("user.nickOverlap", map);
	}
	
	public void insertData(Map<String, Object> map)
	{
		insert("user.insertData", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> loginInfo(Map<String, Object> map)
	{
		return (Map<String, Object>) selectOne("user.loginInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> userProf(Map<String, Object> map)
	{
		return (Map<String, Object>) selectOne("user.userProf", map);
	}
}
