package com.codering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codering.dao.TuteeMatchingDAO;
import com.codering.dao.TutorProfileDAO;

@Service("TuteeMatchingService")
public class TuteeMatchingServiceImpl implements TuteeMatchingService 
{
	
	@Autowired
	private TuteeMatchingDAO dao;

	@Override
	public Map<String, Object> selectTuteeOpen(Map<String, Object> map)
	{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("openList", dao.selectTuteeOpen(map));
				
		return resultMap;	
	}

	// 초대/지원 튜터 목록 조회
	@Override
	public Map<String, Object> selectTutorList(Map<String, Object> map)
	{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("tutorList", dao.selectTutorList(map));
		resultMap.put("tutorLang", dao.selectTutorLang(map));
		resultMap.put("qnaList", dao.selectQnaList(map));
		
		
		return resultMap;
	}

	// 튜터 목록에서 튜터의 언어및레벨 조회
	@Override
	public Map<String, Object> selectTutorLang(Map<String, Object> map)
	{
		return null;
	}

	// 지원튜터 수락
	@Override
	public void updateApplyLvAccept(Map<String, Object> map)
	{
		dao.updateApplyLvAccept(map);
	}
	
	// 지원튜터 거절
	@Override
	public void updateApplyLvRefuse(Map<String, Object> map)
	{
		dao.updateApplyLvRefuse(map);
	}
	
	// 초대 튜터 목록에서 삭제
	@Override
	public void inviteDeleteLv(Map<String, Object> map)
	{
		dao.inviteDeleteLv(map);
	}
	
	
	// 초대 튜터 이름 조회
	@Override
	public Map<String, Object> selectInviteTutor(Map<String, Object> map)
	{
		/*
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("inviteTutor", dao.selectInviteTutor(map));
		
		return resultMap;
		*/
		
		return null;
	}

	
	// 초대튜터 대화 메시지 조회
	@Override
	public Map<String, Object> selectInviteMsg(Map<String, Object> map) 
	{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		dao.updateInviteReadcheck(map);
		resultMap.put("inviteMsg", dao.selectInviteMsg(map));
		resultMap.put("inviteTutor", dao.selectInviteTutor(map));
		return resultMap;
	}
	
	// 초대 튜터 대화 메시지 읽음 처리
	@Override
	public void updateApplyReadcheck(Map<String, Object> map)
	{
		// TODO Auto-generated method stub
		
	}

	// 초대 튜터 대화 메시지 등록
	@Override
	public void insertSendMsgInvite(Map<String, Object> map)
	{
		dao.insertSendMsgInvite(map);
	}


	// 지원 튜터와의 대화 조회
	@Override
	public Map<String, Object> selectApplyMsg(Map<String, Object> map)
	{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		dao.updateApplyReadcheck(map);
		resultMap.put("applyMsg", dao.selectApplyMsg(map));
		resultMap.put("applyTutor", dao.selectApplyTutor(map));
		
		return resultMap;
	}

	
	// 지원튜터 읽음 표시
	@Override
	public void updateInviteReadcheck(Map<String, Object> map)
	{
		// TODO Auto-generated method stub
		
	}


	// 지원튜터 메시지 등록
	@Override
	public void insertSendMsgApply(Map<String, Object> map)
	{
		dao.insertSendMsgApply(map);
		
	}

	// 확정버튼 클릭 시 (초대튜터와의 대화일 경우)
	@Override
	public void updateConfirmInvite(Map<String, Object> map)
	{
		dao.updateConfirmInvite(map);
	}

	// 확정버튼 클릭 시 (지원튜터와의 대화일 경우)
	@Override
	public void updateConfirmApply(Map<String, Object> map)
	{
		dao.updateConfirmApply(map);
	}
	
	// 문의목록 조회
	@Override
	public Map<String, Object> selectQnaList(Map<String, Object> map)
	{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("qnaList", dao.selectQnaList(map));
		return resultMap;
	}


	// 문의 상세페이지 조회
	@Override
	public Map<String, Object> selectQnaPage(Map<String, Object> map)
	{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		dao.selectQnaPage(map);
		resultMap.put("qnaPage", dao.selectQnaPage(map));
		
		return resultMap;
	}

	// 문의 답변 등록
	@Override
	public void insertQnaAnswer(Map<String, Object> map)
	{
		dao.insertQnaAnswer(map);
	}
	
	// 문의 답변 조회
	@Override
	public Map<String, Object> selectQnaAnswer(Map<String, Object> map)
	{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("qnaAnswer", dao.selectQnaAnswer(map));
		
		return resultMap;
	}

	
	// 대화에서 지원 튜터 이름 조회
	@Override
	public Map<String, Object> selectApplyTutor(Map<String, Object> map)
	{
		// TODO Auto-generated method stub
		return null;
	}



}
