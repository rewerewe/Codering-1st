package com.codering.service;

import java.util.Map;

public interface TuteeMatchingService
{
	// 개설한 튜터링 목록
	public Map<String, Object> selectTuteeOpen(Map<String, Object> map);
	
	// 매칭 튜터 목록
	public Map<String, Object> selectTutorList(Map<String, Object> map);
	public Map<String, Object> selectTutorLang(Map<String, Object> map);
	public void updateApplyLvAccept(Map<String, Object> map);
	public void updateApplyLvRefuse(Map<String, Object> map);
	public void inviteDeleteLv(Map<String, Object> map);
	
	
	// 초대 튜터 대화
	public Map<String, Object> selectInviteMsg(Map<String, Object> map);
	public void insertSendMsgInvite(Map<String, Object> map);
	public void updateInviteReadcheck(Map<String, Object> map);
	public void updateConfirmInvite(Map<String, Object> map);
	public Map<String, Object> selectInviteTutor(Map<String, Object> map);
	
	// 지원 튜터 대화
	public Map<String, Object> selectApplyMsg(Map<String, Object> map);
	public void updateApplyReadcheck(Map<String, Object> map);
	public void insertSendMsgApply(Map<String, Object> map);
	public void updateConfirmApply(Map<String, Object> map);
	public Map<String, Object> selectApplyTutor(Map<String, Object> map);
	

	// 문의 관리
	public Map<String, Object> selectQnaList(Map<String, Object> map);
	public Map<String, Object> selectQnaPage(Map<String, Object> map);
	public Map<String, Object> selectQnaAnswer(Map<String, Object> map);
	public void insertQnaAnswer(Map<String, Object> map);

}
