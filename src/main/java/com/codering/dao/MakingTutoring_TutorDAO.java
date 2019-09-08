package com.codering.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.codering.common.AbstractDAO;


@Repository("MakingTutoring_TutorDAO")
public class MakingTutoring_TutorDAO extends AbstractDAO
{
	public void insertTutoringTutor(Map<String, Object> map)
	{
		insert("makingtutoring_tutor.insertTutoringTutor",map);
	}
	
	public void insertTutorFAQ(Map<String, Object> map)
	{
		insert("makingtutoring_tutor.insertTutorFAQ",map);
	}
	
	public void insertTutoringWeek(Map<String, Object> map)
	{
		insert("makingtutoring_tutor.insertTutoringWeek",map);
	}
	
	public void insertTutorNeedTech(Map<String,Object> map)
	{
		insert("makingtutoring_tutor.insertTutorNeedTech",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTutorQNA(Map<String,Object> map)
	{
		return selectList("makingtutoring_tutor.selectTutorQNA",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectRegion()
	{
		return selectList("makingtutoring_tutor.selectRegion");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectInterest()
	{
		return selectList("makingtutoring_tutor.selectInterest");
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectLevel()
	{
		return selectList("makingtutoring_tutor.selectLevel");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectRegionName(Map<String,Object> map)
	{
		return (Map<String, Object>) selectOne("makingtutoring_tutor.selectRegionName",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectTimeName(Map<String,Object> map)
	{
		return (Map<String, Object>) selectOne("makingtutoring_tutor.selectTimeName",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectInterestName(String string)
	{
		return (Map<String, Object>) selectOne("makingtutoring_tutor.selectInterestName",string);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectLevelName(String string)
	{
		return (Map<String, Object>) selectOne("makingtutoring_tutor.selectLevelName",string);
	}
	
	public int selectRegCount(Map<String,Object> map)
	{
		return (Integer) selectOne("makingtutoring_tutor.selectRegCount",map);
	}
	
	@SuppressWarnings("unchecked")
	public String selectWeekName(String string)
	{
		return (String) selectOne("makingtutoring_tutor.selectWeekName",string);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectTutorInfo(Map<String,Object> map)
	{
		return (Map<String, Object>) selectOne("makingtutoring_tutor.selectTutorInfo",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectTutorCareer(Map<String,Object> map)
	{
		return selectList("makingtutoring_tutor.selectTutorCareer",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectTutorReview(Map<String,Object> map)
	{
		return selectList("makingtutoring_tutor.selectTutorReview",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectTutorName(Map<String,Object> map)
	{
		return (Map<String, Object>) selectOne("makingtutoring_tutor.selectSearchTutor",map);
		
	}
	
}
