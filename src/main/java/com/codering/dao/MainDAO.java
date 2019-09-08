package com.codering.dao;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.codering.common.AbstractDAO;

@Repository("MainDAO")
public class MainDAO extends AbstractDAO
{
	
	//로그인한 회원의 조건(언어 및 권장레벨,지역과 맞고 정원이 얼마남지않은 튜터링 3개 조회
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectPopularTutoring(Map<String,Object> map)
	{
		return selectList("mainpage.popularTutoring",map);
	}
	
	//로그인한 회원의 조건(언어 및 권장레벨,지역과 맞고 최신 튜터링으로 4개 조회
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectNewTutoring(Map<String,Object> map)
	{
		return selectList("mainpage.newTutoring",map);
	}
	
	public int selectTutorCount()
	{
		return (Integer) selectOne("mainpage.selectTutorCount");
	}
	
	public int selectTuteeCount()
	{
		return (Integer) selectOne("mainpage.selectTuteeCount");
	}
	
	@SuppressWarnings("unchecked")
	public String selectInterestName(String string)
	{
		return  (String) selectOne("mainpage.selectInterestName",string);
	}
	
	@SuppressWarnings("unchecked")
	public String selectLevelName(String string)
	{
		return  (String) selectOne("mainpage.selectLevelName",string);
	}
	
	
}