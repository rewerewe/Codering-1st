package com.codering.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TutorTutoringSearchService {
	public List<Map<String, Object>> selectTutorTutoringSearchList(HttpServletRequest request, Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectTutorTutoringFilterList1(HttpServletRequest request, Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectTutorTutoringFilterList2(HttpServletRequest request, Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectTutorTutoringFilterList3(HttpServletRequest request, Map<String, Object> map) throws Exception;

	public int selectTutorTutoringSearchListCnt2(HttpServletRequest request, Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectTutorTutoringSearchList2(HttpServletRequest request, Map<String, Object> map) throws Exception;
	
	public Map<String,Object> selectTutoringTuteeDetail(Map<String,Object> map);
	
	public void insertApply(Map<String,Object> map);
	
	public void insertReservation(Map<String,Object> map);

	public void deleteReservation(Map<String,Object> map);
	
	public void deleteApply(Map<String,Object> map);
}
