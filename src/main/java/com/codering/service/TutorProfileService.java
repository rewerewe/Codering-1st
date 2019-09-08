package com.codering.service;

import java.util.List;
import java.util.Map;

public interface TutorProfileService
{
	public Map<String, Object> selectTutorProfile(Map<String, Object> map);
	public List<Map<String,Object>> selectTutorInterest(Map<String, Object> map);
	public List<Map<String, Object>> selectTutorCareer(Map<String, Object> map);
	public int selectTutorCareerCount(Map<String, Object> map);
	public List<Map<String, Object>> selectTutorCategory(Map<String, Object> map);
	public List<Map<String, Object>> selectTutorLink(Map<String, Object> map);
	public int selectTutorLinkCount(Map<String, Object> map);
	
	public void updateTutorCareer(Map<String, Object> map);
	public void updateTutorLink(Map<String, Object> map);
	public void updateTutorInterest(Map<String, Object> map);
	public void updateTutorCategory(Map<String, Object> map);
	
	public void updateTutorInfo(Map<String, Object> map);
	
}
