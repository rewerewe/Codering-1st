package com.codering.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.codering.common.AbstractDAO;

@SuppressWarnings("unchecked")
@Repository("tutorTutoringSearchDAO")
public class TutorTutoringSearchDAO extends AbstractDAO {

	/**
	 * 튜터 개설 인기 튜터링 찾기 목록 - TOP 3
	 */
	public List<Map<String, Object>> selectTutorTutoringSearchList(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> list = selectList("tutorTutoringSearch.selectTutorTutoringSearchList", map);
		return list;
	}
	
	/**
	 * Filter1
	 */
	public List<Map<String, Object>> selectTutorTutoringFilterList1(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> list = selectList("tutorTutoringSearch.selectTutorTutoringFilterList1", map);
		return list;
	}
	
	/**
	 * Filter2
	 */
	public List<Map<String, Object>> selectTutorTutoringFilterList2(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> list = selectList("tutorTutoringSearch.selectTutorTutoringFilterList2", map);
		return list;
	}
	
	/**
	 * Filter3
	 */
	public List<Map<String, Object>> selectTutorTutoringFilterList3(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> list = selectList("tutorTutoringSearch.selectTutorTutoringFilterList3", map);
		return list;
	}

	/**
	 * 튜터의 튜터링 찾기 Paging
	 */
	public int selectTutorTutoringSearchListCnt2(Map<String, Object> map) throws Exception {
		int listCnt = (Integer) selectOne("tutorTutoringSearch.selectTutorTutoringSearchListCnt2", map);
		return listCnt;
	}

	/**
	 * 튜터 개설 튜터링 찾기 목록
	 */
	public List<Map<String, Object>> selectTutorTutoringSearchList2(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> list = selectList("tutorTutoringSearch.selectTutorTutoringSearchList2", map);
		return list;
	}
	
	//튜티가 개설한 튜터링에 대해서 시간조회
	public List<Map<String,Object>> selectTimeDivision(Map<String,Object> map)
	{
		return selectList("tutorTutoringSearch.selectTimeDivision",map);
	}
	
	//튜티가 개설한 튜터링에 대한 정보 조회
	public Map<String,Object> selectTutoringTutee(Map<String,Object> map)
	{
		return (Map<String, Object>) selectOne("tutorTutoringSearch.selectTutoringTutee",map);
	}
	
	//튜티가 개설한 튜터링 예약하기
	public void insertTutoringReservation(Map<String,Object> map)
	{
		insert("tutorTutoringSearch.insertTutoringReservation",map);
	}
	
	//튜티장이 개설한 튜터링에 예약했는지 여부 확인
	public int selectReservationCount(Map<String,Object> map)
	{
		return (int) selectOne("tutorTutoringSearch.selectReservationCount",map);
	}
	
	//튜티장이 개설한 튜터링에 튜터로 지원했는지 확인
	public int selectTutorApply(Map<String,Object> map)
	{
		return (int) selectOne("tutorTutoringSearch.selectApplyCount",map);
	}
	
	//튜티장이 개설한 튜터링에 튜터로 지원하기
	public void insertTutorApply(Map<String,Object> map)
	{
		insert("tutorTutoringSearch.insertTutorApply",map);
	}
	
	//튜티장이 개설한 튜터링의 최소 권장 레벨
	public List<Map<String,Object>> selectTuteeNeedTech(Map<String,Object> map)
	{
		return selectList("tutorTutoringSearch.selectTuteeNeedTech",map);
		
	}
	
	public int selectTotReservationCount(Map<String,Object> map)
	{
		return (int) selectOne("tutorTutoringSearch.selectTotReservationCount",map);
		
	}
	
	public void deleteReservation(Map<String,Object> map)
	{
		delete("tutorTutoringSearch.deleteReservation", map);
	}
	
	public void deleteApply(Map<String,Object> map)
	{
		delete("tutorTutoringSearch.deleteApply",map);
	}
	
	

}