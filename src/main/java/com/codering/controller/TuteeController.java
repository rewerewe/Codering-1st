package com.codering.controller;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.codering.service.TuteeService;

import codering.common.common.CommandMap;

@Controller
public class TuteeController
{	
	@Resource(name="TuteeService")
	private TuteeService service;
	
	private static final Log log = LogFactory.getLog(TuteeController.class);
	
	@RequestMapping(value="tutee_mypage_writtenboard")
	public ModelAndView writtenBoard(CommandMap commandMap)
	{
		ModelAndView mav = new ModelAndView("mypage_tutee_writtenComm");		
		
		mav.addObject("boardList", service.tuteeWrittenBoard(commandMap.getMap()));
		
		return mav;
	}
	
	
	@RequestMapping(value="tutee_mypage_writtencomment")
	public ModelAndView writtenComm(CommandMap commandMap)
	{
		ModelAndView mav = new ModelAndView("mypage_tutee_writtenReply");			
		
		mav.addObject("commList", service.tuteeWrittenComment(commandMap.getMap()));
		
		return mav;
	}
	
	
	@RequestMapping(value="tutee_asking_tutor")
	public ModelAndView askingTutor(CommandMap commandMap)
	{
		ModelAndView mav = new ModelAndView("done_AskingTutor");
				
		if(commandMap.get("TUTOR_ID") != null)
		{
			mav.addObject("msg", "이미 튜터신청이 완료된 상태입니다.");
			mav.addObject("location", "user_main");
			mav.setViewName("Alert");
		}
		
		return mav;
	}
	
	@RequestMapping(value="tutor_asking_done")
	public ModelAndView askingTutorDone(CommandMap commandMap, HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView("done_AskingTutorDone");
		
		
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
		
		Map<String, Object> loginInfo = service.tuteeAskingTutor(commandMap.getMap());		
		
		request.getSession().setAttribute("loginInfo", loginInfo);
		request.getSession().setMaxInactiveInterval(60 * 60);		
		
		return mav;
	}
	
	@RequestMapping(value="tutoringlist")
	public ModelAndView tutoringList(CommandMap commandMap)
	{
		ModelAndView mav = new ModelAndView("Tutor_TutoringSearch");
		
		return mav;
	}
	
	@RequestMapping(value="tutoring_tutee_done")
	public ModelAndView tutoring_tutee_done(CommandMap commandMap)
	{
		ModelAndView mav = new ModelAndView("Tutoring_tutee_done");
		
		return mav;
	}
}

















