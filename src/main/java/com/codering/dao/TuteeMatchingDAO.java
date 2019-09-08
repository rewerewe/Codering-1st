package com.codering.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.codering.common.AbstractDAO;

@Repository("TuteeMatchingDAO")
public class TuteeMatchingDAO extends AbstractDAO
{
	// 튜터링(튜티) 개설 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTuteeOpen(Map<String, Object> map)
	{
		return selectList("tuteematching.openList", map);
	}
	
	// 특정 튜터링(튜티)에 초대/지원한 튜터 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTutorList(Map<String, Object> map)
	{
		return selectList("tuteematching.tutorList", map);
	}
	
	// 특정 튜터의 언어 및 레벨
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTutorLang(Map<String, Object> map)
	{
		return selectList("tuteematching.tutorLang", map);
	}
	
	// 지원 튜터 수락 시
	public void updateApplyLvAccept(Map<String, Object> map)
	{
		update("tuteematching.applyAccept", map);
	}
	
	// 지원 튜터 거절 시
	public void updateApplyLvRefuse(Map<String, Object> map)
	{
		update("tuteematching.applyRefuse", map);
	}
	
	// 초대 튜터를 튜터 목록에서 삭제 시
	public void inviteDeleteLv(Map<String, Object> map)
	{
		delete("tuteematching.inviteDelete01", map);
		delete("tuteematching.inviteDelete02", map);
		
	}
	
	// 초대 튜터 이름 조회
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectInviteTutor(Map<String, Object> map)
	{
		return (Map<String, Object>) selectOne("tuteematching.inviteTutor", map);
	}
	
	// 초대 튜터와 대화 메시지 조회
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectInviteMsg(Map<String, Object> map)
	{
		return selectList("tuteematching.inviteMsg", map);
	}
	
	// 초대 튜터와 대화 읽음 처리
	public void updateInviteReadcheck(Map<String, Object> map)
	{
		update("tuteematching.updateInviteReadcheck", map);
	}
	
	// 초대 튜터에게 메시지 전송
	public void insertSendMsgInvite(Map<String, Object> map)
	{
		insert("tuteematching.sendMsgInvite", map);
	}
	
	
	// 초대 튜터 이름 조회
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectApplyTutor(Map<String, Object> map)
	{
		return (Map<String, Object>) selectOne("tuteematching.applyTutor", map);
	}
		
	
	// 지원 튜터와 대화 메시지 조회
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectApplyMsg(Map<String, Object> map)
	{
		return selectList("tuteematching.applyMsg", map);
	}
	
	
	// 지원 튜터와 대화 읽음 처리
	public void updateApplyReadcheck(Map<String, Object> map)
	{
		update("tuteematching.updateApplyReadcheck", map);
	}
	
	// 지원 튜터에게 메시지 전송
	public void insertSendMsgApply(Map<String, Object> map)
	{
		insert("tuteematching.sendMsgApply", map);
	}
	
		
	
	// 초대 튜터와 확정버튼 클릭 시 
	public void updateConfirmInvite(Map<String, Object> map)
	{
		update("tuteematching.confirmInvite", map);
	}
	
	// 지원 튜터와 확정버튼 클릭 시 
	public void updateConfirmApply(Map<String, Object> map)
	{
		update("tuteematching.confirmApply", map);
	}
	
	

	
	// 문의 목록 
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map)
	{
		return selectList("tuteematching.qnaList", map);
	}
	
	
	// 문의 상세 페이지
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaPage(Map<String, Object> map)
	{
		return selectList("tuteematching.qnaPage", map);
	}
	
	// 문의 답변 조회
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaAnswer(Map<String, Object> map)
	{
		return (List<Map<String, Object>>) selectList("tuteematching.qnaAnswer", map);
	}
	
	// 문의 답변 등록
	public void insertQnaAnswer(Map<String, Object> map)
	{
		insert("tuteematching.insertQnaAnswer", map);
	}
		
	
	
	
	
	
}
