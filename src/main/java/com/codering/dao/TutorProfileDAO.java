package com.codering.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.codering.common.AbstractDAO;

@Repository("TutorProfileDAO")
public class TutorProfileDAO extends AbstractDAO
{
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTutorProfile(Map<String, Object> map)
	{
		return (Map<String, Object>) selectOne("tutorprofile.info", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectTutorInterest(Map<String, Object> map)
	{
		return (List<Map<String, Object>>) selectList("tutorprofile.interest", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTutorCareer(Map<String, Object> map)
	{
		return (List<Map<String, Object>>) selectList("tutorprofile.career", map);
	}

	public int selectTutorCareerCount(Map<String, Object> map)
	{
		return (int) selectOne("tutorprofile.careerCount", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTutorCategory(Map<String, Object> map)
	{
		return (List<Map<String, Object>>) selectList("tutorprofile.category", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTutorLink(Map<String, Object> map)
	{
		return (List<Map<String, Object>>) selectList("tutorprofile.link", map);
	}
	
	public int selectTutorLinkCount(Map<String, Object> map)
	{
		return (int) selectOne("tutorprofile.linkCount", map);
	}
	
	

	
	
	public void deleteTutorInterest(Map<String, Object> map)
	{
		delete("tutorprofile.deleteInterest", map);
	}
	
	public void deleteTutorCategory(Map<String, Object> map)
	{
		delete("tutorprofile.deleteCategory", map);
	}
	
	public void deleteTutorCareer(Map<String, Object> map)
	{
		delete("tutorprofile.deleteCareer", map);
	}
	
	public void deleteTutorLink(Map<String, Object> map)
	{
		delete("tutorprofile.linkDelete", map);
	}
	
	
	
	public void insertTutorInterest(Map<String, Object> map)
	{
		insert("tutorprofile.interestInsert", map);
	}
	public void insertTutorCategory(Map<String, Object> map)
	{
		insert("tutorprofile.categoryInsert", map);
	}
	public void insertTutorCareer(Map<String, Object> map)
	{
		insert("tutorprofile.careerInsert", map);
	}
	public void insertTutorLink(Map<String, Object> map)
	{
		insert("tutorprofile.linkInsert", map);
	}
	
	
	
	
	
	
	
	
	public void updateTutorInfo(Map<String, Object> map)
	{
		update("tutorprofile.updateTutorInfo", map);
	}
	
	
	
}
