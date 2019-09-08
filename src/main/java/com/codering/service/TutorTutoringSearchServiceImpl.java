package com.codering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codering.dao.TutorTutoringSearchDAO;

@SuppressWarnings({ "unchecked", "rawtypes" })
@Service("tutorTutoringSearchService")
public class TutorTutoringSearchServiceImpl implements TutorTutoringSearchService
{
	@Autowired
	private TutorTutoringSearchDAO tutorTutoringSearchDAO;

	private Map<String, Object> setMemberInfo(HttpServletRequest request, Map<String, Object> map)
	{
//		Map loginInfo = (Map) request.getSession().getAttribute("loginInfo");
//		String MEMBER_ID = loginInfo.get("MEMBER_ID") == null ? "" : (String) loginInfo.get("MEMBER_ID");
//		String NICKNAME = loginInfo.get("NICKNAME") == null ? "" : (String) loginInfo.get("NICKNAME");

		String MEMBER_ID = "";
		String NICKNAME = "";
		String TUTOR_ID = "";
		String TUTOR_NAME = "";
//		if ("".equals(MEMBER_ID)) {
		// TODO 세션에서 꺼내올 예정
		MEMBER_ID = "1";
		NICKNAME = "미스터추";
		TUTOR_ID = "10";
		TUTOR_NAME = "추신수";

//		}
		map.put("MEMBER_ID", MEMBER_ID);
		map.put("NICKNAME", NICKNAME);
		map.put("TUTOR_ID", TUTOR_ID);
		map.put("TUTOR_NAME", TUTOR_NAME);

		return map;
	}

	/**
	 * 튜터 개설 인기 튜터링 찾기 목록 - TOP 3
	 */
	@Override
	public List<Map<String, Object>> selectTutorTutoringSearchList(HttpServletRequest request, Map<String, Object> map)
			throws Exception
	{
		map = setMemberInfo(request, map);

		List list = tutorTutoringSearchDAO.selectTutorTutoringSearchList(map);

		return list;
	}

	/**
	 * Filter1
	 */
	@Override
	public List<Map<String, Object>> selectTutorTutoringFilterList1(HttpServletRequest request, Map<String, Object> map)
			throws Exception
	{
		map = setMemberInfo(request, map);

		List list = tutorTutoringSearchDAO.selectTutorTutoringFilterList1(map);

		return list;
	}
	
	/**
	 * Filter2
	 */
	@Override
	public List<Map<String, Object>> selectTutorTutoringFilterList2(HttpServletRequest request, Map<String, Object> map)
			throws Exception
	{
		map = setMemberInfo(request, map);

		List list = tutorTutoringSearchDAO.selectTutorTutoringFilterList2(map);

		return list;
	}

	/**
	 * Filter3
	 */
	@Override
	public List<Map<String, Object>> selectTutorTutoringFilterList3(HttpServletRequest request, Map<String, Object> map)
			throws Exception
	{
		map = setMemberInfo(request, map);

		List list = tutorTutoringSearchDAO.selectTutorTutoringFilterList3(map);

		return list;
	}

	/**
	 * 튜터의 튜터링 찾기 Paging
	 */
	@Override
	public int selectTutorTutoringSearchListCnt2(HttpServletRequest request, Map<String, Object> map) throws Exception
	{
		map = setMemberInfo(request, map);

		int listCnt = tutorTutoringSearchDAO.selectTutorTutoringSearchListCnt2(map);

		return listCnt;
	}

	/**
	 * 튜터 개설 튜터링 찾기 목록
	 */
	@Override
	public List<Map<String, Object>> selectTutorTutoringSearchList2(HttpServletRequest request, Map<String, Object> map)
			throws Exception
	{
		map = setMemberInfo(request, map);

		List list = tutorTutoringSearchDAO.selectTutorTutoringSearchList2(map);

		return list;
	}

	@Override
	public Map<String, Object> selectTutoringTuteeDetail(Map<String, Object> map)
	{
		Map<String,Object> resultMap = new HashMap<String,Object>();
		
		int applyCount = tutorTutoringSearchDAO.selectTutorApply(map);
	    int reservationCount = tutorTutoringSearchDAO.selectReservationCount(map);
	    
	    resultMap.put("selectTutoringTutee", tutorTutoringSearchDAO.selectTutoringTutee(map));
	    resultMap.put("selectTutoringTime", tutorTutoringSearchDAO.selectTimeDivision(map));
	    resultMap.put("selectApplyCount", applyCount);
	    resultMap.put("selectReservationCount", reservationCount);
		resultMap.put("selectTuteeNeedTech", tutorTutoringSearchDAO.selectTuteeNeedTech(map));
	    resultMap.put("selectTotReservationCount",tutorTutoringSearchDAO.selectTotReservationCount(map));
		
		return resultMap;
	}
	
	public void insertApply(Map<String,Object> map)
	{
		tutorTutoringSearchDAO.insertTutorApply(map);
	}
	
	public void insertReservation(Map<String,Object> map)
	{
		tutorTutoringSearchDAO.insertTutoringReservation(map);
	}
	
	public void deleteApply(Map<String,Object> map)
	{
		tutorTutoringSearchDAO.deleteApply(map);
	}
	
	public void deleteReservation(Map<String,Object> map)
	{
		tutorTutoringSearchDAO.deleteReservation(map);
	}
}
