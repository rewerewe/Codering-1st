package com.codering.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.codering.common.AbstractDAO;

@SuppressWarnings("unchecked")
@Repository("tutorApplyDAO")
public class TutorApplyDAO extends AbstractDAO  
{

	/**
	 * 튜터가 지원한 튜터링 목록 조회
	 */
	public List<Map<String, Object>> selectTutorApplyList(Map<String, Object> map)
	{
		List<Map<String,Object>> list = selectList("tutorApply.selectTutorApplyList", map);
		
		return list;
	}

	/**
	 * 튜터가 지원한 튜터링 삭제 
	 */
	public int deleteTutorApplyStatus(Map<String, Object> map)
	{
		int result = (Integer) delete("tutorApply.deleteTutorApplyStatus", map);
		
		return result;
	}
	
	/**
	 * 대화 버튼 클릭시 튜터와 튜티장의 초대 게시판
	 */
	public List<Map<String, Object>> selectTutorApplyBoard(Map<String, Object> map)
	{
		List<Map<String, Object>> list = selectList("tutorApply.selectTutorApplyBoard", map);
				
		return list;
	}

	public int insertTutorApplyBoardMsg(Map<String, Object> map)
	{
		int result = -1; 
		result = (Integer) insert("tutorApply.insertTutorApplyBoardMsg", map);
		return result;
	}
	

}