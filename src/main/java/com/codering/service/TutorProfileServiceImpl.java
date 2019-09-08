package com.codering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codering.dao.TutorProfileDAO;

@Service("TutorProfileService")
public class TutorProfileServiceImpl implements TutorProfileService 
{
	
	@Autowired
	private TutorProfileDAO dao;

	@Override
	public Map<String, Object> selectTutorProfile(Map<String, Object> map)
	{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("info", dao.selectTutorProfile(map));
		resultMap.put("interest", dao.selectTutorInterest(map));
		resultMap.put("career", dao.selectTutorCareer(map));
		resultMap.put("careerCount", dao.selectTutorCareerCount(map));
		resultMap.put("category", dao.selectTutorCategory(map));
		resultMap.put("linkCount", dao.selectTutorLinkCount(map));
		resultMap.put("link", dao.selectTutorLink(map));
				
		return resultMap;
	}

	@Override
	public List<Map<String, Object>> selectTutorInterest(Map<String, Object> map)
	{
		return null;
	}

	@Override
	public List<Map<String, Object>> selectTutorCareer(Map<String, Object> map)
	{
		return null;
	}

	@Override
	public List<Map<String, Object>> selectTutorLink(Map<String, Object> map)
	{
		return null;
	}

	@Override
	public List<Map<String, Object>> selectTutorCategory(Map<String, Object> map)
	{
		return null;
	}

	@Override
	public int selectTutorCareerCount(Map<String, Object> map)
	{
		return 0;
	}

	@Override
	public int selectTutorLinkCount(Map<String, Object> map)
	{
		return 0;
	}

	// 튜터 관심사 수정
	public void updateTutorInterest(Map<String, Object> map)
	{
		dao.deleteTutorCareer(map);
		dao.insertTutorCareer(map);
	}

	// 튜터 카테고리 수정
	public void updateTutorCategory(Map<String, Object> map)
	{
		dao.deleteTutorCategory(map);
		dao.insertTutorCategory(map);
	}

	// 튜터 경력 수정
	public void updateTutorCareer(Map<String, Object> map)
	{
		dao.deleteTutorCareer(map);
		dao.insertTutorCareer(map);
	}
	
	// 튜터 링크 수정
	public void updateTutorLink(Map<String, Object> map)
	{
		dao.deleteTutorCareer(map);
		dao.insertTutorLink(map);
	}
	

	// 튜터 기본정보 수정
	public void updateTutorInfo(Map<String, Object> map)
	{
		dao.updateTutorInfo(map);
	}

	
	
	
}
