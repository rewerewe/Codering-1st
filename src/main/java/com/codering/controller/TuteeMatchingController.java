package com.codering.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codering.service.TuteeMatchingService;

import codering.common.common.CommandMap;

@Controller
public class TuteeMatchingController
{
	private static final Log log = LogFactory.getLog(TuteeMatchingController.class);
	
	@Autowired
	private TuteeMatchingService service;
	
	// 개설 튜터링 목록
	@RequestMapping(value="/tutee_open")
	public ModelAndView tuteeOpen(CommandMap commandMap, HttpSession session)
	{
		ModelAndView mav = new ModelAndView("mypage_tuteeOpen");
		
		// 세션이 없는 상태이므로 임의로 값을 넣어 테스트
		
		Map<String, Object> resultMap = service.selectTuteeOpen(commandMap.getMap());
				
		mav.addObject("openList", resultMap.get("openList"));
		
		return mav;
	}
	
	// 튜터링에 초대/지원한 튜터 목록
	@RequestMapping(value="/tutee_tutorlist")
	public ModelAndView tutorList(CommandMap commandMap, HttpSession session)
	{
		log.debug("==============================================================");
		if (commandMap.isEmpty() == false)
		{
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			
			Entry<String, Object> entry = null;
			
			while (iterator.hasNext())
			{
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		
		ModelAndView mav = new ModelAndView("mypage_Matching_main_tab_done");
		
		Map<String, Object> resultMap = service.selectTutorList(commandMap.getMap());
		
		mav.addObject("tutorList", resultMap.get("tutorList"));
		mav.addObject("tutorLang", resultMap.get("tutorLang"));
		mav.addObject("qnaList", resultMap.get("qnaList"));
		
		return mav;
	}
	
	// 지원 튜터 수락 시
	@RequestMapping(value="/tutee_update_applylv_accept")
	public String updateApplyLvAccept(CommandMap commandMap, HttpServletResponse response)
	{	
		String TUTORING_TUTEE_ID = (String) commandMap.get("TUTORING_TUTEE_ID");
		
		service.updateApplyLvAccept(commandMap.getMap());
		
		log.debug("TUTORING_TUTEE_ID ==" + TUTORING_TUTEE_ID);
		
		return "redirect:/tutee_tutorlist?TUTORING_TUTEE_ID=" + TUTORING_TUTEE_ID;
	}
	
	// 지원 튜터 거절 시
	@RequestMapping(value="/tutee_update_applylv_refuse")
	public String updateApplyLvRefuse(CommandMap commandMap, HttpServletResponse response)
	{
		service.updateApplyLvRefuse(commandMap.getMap());
		
		return "redirect:/tutee_tutorlist";
	}
	

	// 초대 튜터를 튜터 목록에서 삭제 시 
	@RequestMapping(value="/tutee_delete_invitelv")
	public String inviteDeleteLv(CommandMap commandMap, HttpServletResponse response) 
	{	
		
		String TUTORING_TUTEE_ID = (String) commandMap.get("TUTORING_TUTEE_ID");
		
		service.inviteDeleteLv(commandMap.getMap());
		
		return "redirect:/tutee_tutorlist?TUTORING_TUTEE_ID=" + TUTORING_TUTEE_ID;
	}
	
	// 초대 튜터 대화 페이지
	@RequestMapping(value="/tutee_msg_invite")
	@ResponseBody
	public ModelAndView selectInviteMsg(CommandMap commandMap, HttpSession session)
	{

		log.debug("==============================================================");
		if (commandMap.isEmpty() == false)
		{
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			
			Entry<String, Object> entry = null;
			
			while (iterator.hasNext())
			{
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		
		
		ModelAndView mav = new ModelAndView("mypage_Matching_message_done");
		
		Map<String, Object> resultMap = service.selectInviteMsg(commandMap.getMap());
		log.debug("inviteTutor======================"+resultMap.get("inviteTutor"));
		mav.addObject("inviteMsg", resultMap.get("inviteMsg"));
		mav.addObject("inviteTutor", resultMap.get("inviteTutor"));
		
		
		resultMap = service.selectQnaList(commandMap.getMap());
		mav.addObject("INVITE_ID", commandMap.get("INVITE_ID"));
		mav.addObject("qnaList", resultMap.get("qnaList"));
		
		return mav;
	}
	
	
	// 지원 튜터 대화 페이지
	@RequestMapping(value="/tutee_msg_apply")
	public ModelAndView selectApplyMsg(CommandMap commandMap)
	{
		
		log.debug("==============================================================");
		if (commandMap.isEmpty() == false)
		{
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			
			Entry<String, Object> entry = null;
			
			while (iterator.hasNext())
			{
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		
		ModelAndView mav = new ModelAndView("mypage_Matching_message_done_apply");
		
		Map<String, Object> resultMap = service.selectApplyMsg(commandMap.getMap());
		mav.addObject("applyMsg", resultMap.get("applyMsg"));
		mav.addObject("applyTutor", resultMap.get("applyTutor"));
		
		resultMap = service.selectQnaList(commandMap.getMap());
		mav.addObject("APPLY_ID", commandMap.get("APPLY_ID"));
		mav.addObject("qnaList", resultMap.get("qnaList"));
		
		return mav;
	}
	
	
	
	
	
	
	// 초대 튜터 메시지 가져오기 
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/tutee_msg_invite_ajax")
	public void selectInviteMsgAjax(CommandMap commandMap, HttpServletResponse response) throws IOException
	{
		
		log.debug("==============================================================");
		if (commandMap.isEmpty() == false)
		{
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			
			Entry<String, Object> entry = null;
			
			while (iterator.hasNext())
			{
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		
		response.setCharacterEncoding("UTF-8");
		
		Map<String, Object> resultMap = service.selectInviteMsg(commandMap.getMap());
		
		List<Map<String, Object>> listMap = (List<Map<String, Object>>) resultMap.get("inviteMsg");
		
		JSONArray json = new JSONArray(listMap);
		
		response.getWriter().print(json.toString());
	}
	
	
	// 지원 튜터 메시지 가져오기 
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/tutee_msg_apply_ajax")
	public void selectApplyMsgAjax(CommandMap commandMap, HttpServletResponse response) throws IOException
	{
		
		log.debug("==============================================================");
		if (commandMap.isEmpty() == false)
		{
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			
			Entry<String, Object> entry = null;
			
			while (iterator.hasNext())
			{
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		
		
		response.setCharacterEncoding("UTF-8");
		
		Map<String, Object> resultMap = service.selectApplyMsg(commandMap.getMap());
				
		List<Map<String, Object>> listMap = (List<Map<String, Object>>) resultMap.get("applyMsg");
		
		JSONArray json = new JSONArray(listMap);
		
		response.getWriter().print(json.toString());
	}

	
	
	
	
	// 초대 튜터 대화 메시지 입력
	@RequestMapping(value="/tutee_msg_invite_send_ajax")
	public void insertSendMsgInvite(CommandMap commandMap, HttpServletResponse response) throws IOException 
	{
		service.insertSendMsgInvite(commandMap.getMap());
		
		response.getWriter().print("");
	}
	
	
	// 지원 튜터 대화 메시지 입력
	@RequestMapping(value="/tutee_msg_apply_send_ajax")
	public void insertApplyMsgInvite(CommandMap commandMap, HttpServletResponse response) throws IOException 
	{
		service.insertSendMsgApply(commandMap.getMap());
		
		response.getWriter().print("");
	}
	
	
	
	
	
	
	
	// 초대 튜터 확정버튼 클릭
	@RequestMapping(value="/tutee_msg_confirm_invite")
	public String updateConfirmInvite(CommandMap commandMap, HttpServletResponse response, RedirectAttributes requestAttributes) 
	{
		

		log.debug("==============================================================");
		if (commandMap.isEmpty() == false)
		{
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			
			Entry<String, Object> entry = null;
			
			while (iterator.hasNext())
			{
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		
		
		
		service.updateConfirmInvite(commandMap.getMap());
		
		Map<String, Object> map = commandMap.getMap();
		String INVITE_ID = (String) map.get("INVITE_ID");
		requestAttributes.addAttribute("INVITE_ID", INVITE_ID);
		return "redirect:/tutee_msg_invite";
	}
	
	
	// 지원 튜터 확정버튼 클릭
	@RequestMapping(value="/tutee_msg_confirm_apply")
	public String updateConfirmApply(CommandMap commandMap, HttpServletResponse response, RedirectAttributes requestAttributes) 
	{
		
		
		log.debug("==============================================================");
		if (commandMap.isEmpty() == false)
		{
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			
			Entry<String, Object> entry = null;
			
			while (iterator.hasNext())
			{
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		
		
		
		service.updateConfirmApply(commandMap.getMap());
		
		Map<String, Object> map = commandMap.getMap();
		String APPLY_ID = (String) map.get("APPLY_ID");
		requestAttributes.addAttribute("APPLY_ID", APPLY_ID);
		return "redirect:/tutee_msg_apply";
	}
	
	
	

	
	// 문의 상세 페이지 조회
	@RequestMapping(value="/tutee_qnapage")
	public ModelAndView selectQnaPage(CommandMap commandMap)
	{
		
		log.debug("==============================================================");
		if (commandMap.isEmpty() == false)
		{
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			
			Entry<String, Object> entry = null;
			
			while (iterator.hasNext())
			{
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		
		ModelAndView mav = new ModelAndView("mypage_Matching_qna_answer_done");
		
		Map<String, Object> resultMap = service.selectQnaPage(commandMap.getMap());
		mav.addObject("qnaPage", resultMap.get("qnaPage"));
		
		return mav;
	}
	

	// 문의 답변 가져오기 
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/tutee_qnapage_answer_ajax")
	public void selectQnaAnswer(CommandMap commandMap, HttpServletResponse response) throws IOException
	{
		
		log.debug("==============================================================");
		if (commandMap.isEmpty() == false)
		{
			Iterator<Entry<String, Object>> iterator = commandMap.getMap().entrySet().iterator();
			
			Entry<String, Object> entry = null;
			
			while (iterator.hasNext())
			{
				entry = iterator.next();
				log.debug("key : " + entry.getKey() + ", value : " + entry.getValue());
			}
		}
		
		
		response.setCharacterEncoding("UTF-8");
		
		Map<String, Object> resultMap = service.selectQnaAnswer(commandMap.getMap());
		
		List<Map<String, Object>> listMap = (List<Map<String, Object>>) resultMap.get("qnaAnswer");
		
		JSONArray json = new JSONArray(listMap);
		
		response.getWriter().print(json.toString());
	}

	
	
	
	// 답변 등록
	@RequestMapping(value="/tutee_qnapage_answer_insert_ajax")
	public void insertQnaAnswer(CommandMap commandMap, HttpServletResponse response) throws IOException 
	{
		service.insertQnaAnswer(commandMap.getMap());
		response.getWriter().print("");
	}
	
	

	
	

	
		
	
}
