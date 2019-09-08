package com.codering.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codering.service.TutorProfileService;

import codering.common.common.CommandMap;

@Controller
public class TutorProfileController
{
	@Autowired
	private TutorProfileService service;
	
	@RequestMapping(value="/tutor_info")
	public ModelAndView tutorProfile(CommandMap commandMap, HttpSession session)
	{
		ModelAndView mav = new ModelAndView("tutorpage");
		
		Map<String, Object> resultMap = service.selectTutorProfile(commandMap.getMap());
		
		mav.addObject("info", resultMap.get("info"));
		mav.addObject("interest", resultMap.get("interest"));
		mav.addObject("career", resultMap.get("career"));
		mav.addObject("careerCount", resultMap.get("careerCount"));
		mav.addObject("category", resultMap.get("category"));
		mav.addObject("link", resultMap.get("link"));	
		
		return mav;
	}
	
	// 수정 페이지 조회
	@RequestMapping(value="/tutor_info_updateform")
	public ModelAndView tutorProfileUpdateForm(CommandMap commandMap, HttpSession session)
	{
		ModelAndView mav = new ModelAndView("tutorpage_tutorprofile_revise");
		
		Map<String, Object> resultMap = service.selectTutorProfile(commandMap.getMap());
		
		mav.addObject("info", resultMap.get("info"));
		mav.addObject("interest", resultMap.get("interest"));
		mav.addObject("career", resultMap.get("career"));
		mav.addObject("careerCount", resultMap.get("careerCount"));
		mav.addObject("category", resultMap.get("category"));
		mav.addObject("link", resultMap.get("link"));	
		mav.addObject("linkCount", resultMap.get("linkCount"));	
		
		
		return mav;
	}
	
	// 수정
	@RequestMapping(value="/tutor_info_update")
	public String tutorProfileUpdate(CommandMap commandMap, HttpSession session, RedirectAttributes requestAttributes)
	{
		service.updateTutorInfo(commandMap.getMap());
		service.updateTutorInterest(commandMap.getMap());
		service.updateTutorCategory(commandMap.getMap());
		service.updateTutorCareer(commandMap.getMap());
		service.updateTutorLink(commandMap.getMap());
		
		return "redirect:/tutor_info";
	}
	
	
	@RequestMapping(value="/profile_tutor")
	public ModelAndView tutorProfile1(CommandMap commandMap, HttpSession session)
	{
		ModelAndView mav = new ModelAndView("Tutor_profile");
		
		Map<String, Object> resultMap = service.selectTutorProfile(commandMap.getMap());
				
		mav.addObject("info", resultMap.get("info"));
		mav.addObject("interest", resultMap.get("interest"));
		mav.addObject("career", resultMap.get("career"));
		mav.addObject("careerCount", resultMap.get("careerCount"));
		mav.addObject("category", resultMap.get("category"));
		mav.addObject("link", resultMap.get("link"));	
		
		return mav;
	}
	
	

}
