package com.codering.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.codering.common.MyUtil;
import com.codering.common.StringUtil;
import com.codering.service.QtboardService;

import codering.common.common.CommandMap;

@Controller
public class QtboardController
{
	private static final Log log = LogFactory.getLog(QtboardController.class);
	
	@Resource(name="QtboardService")
	private QtboardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private StringUtil stringUtil;
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/qtboard_list")
	public ModelAndView boardList(CommandMap cMap,HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView("QTBoard_list");
		
		int rows = 10;			
		int total_page = 0;		
		int dataCount = 0;
		
		int current_page = 1;
		String searchKey = "subject";
		String searchValue = "";
		
		
		if(cMap.get("page")!=null && myUtil.isStringDouble((String)cMap.get("page")))
		{
			current_page = Integer.parseInt((String)cMap.get("page"));
		}		
		if(cMap.get("searchKey")!=null)
		{
			searchKey = (String) cMap.get("searchKey");
		}
		if(cMap.get("searchValue")!=null)
		{
			searchValue = (String) cMap.get("searchValue");
		}			
		
		
		
		Map<String, Object> map = new HashMap();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.dataCount(map);
		
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if (current_page > total_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		
		map.put("START", start);
		map.put("END", end);
		
		Map<String, Object> resultMap = service.boardList(map);
		
		List<Map<String,Object>> list = (List<Map<String, Object>>) resultMap.get("boardList");	
		List<Map<String,Object>> bestList = (List<Map<String, Object>>) resultMap.get("bestList");
		List<Map<String,Object>> hitList = (List<Map<String, Object>>) resultMap.get("hitList");
		
		
		
		int listNum, n = 0;
		Iterator<Map<String, Object>> it = list.iterator();
		
		while (it.hasNext())
		{
			Map<String, Object> dto = it.next();
			listNum = dataCount - (start + n - 1);
			dto.put("listNum", listNum);
			n++;
		}

		String query = "";
		String listUrl, articleUrl;
		if (searchValue != null)
		{
			query = "searchKey=" + searchKey + "&searchValue=" + searchValue;
		}
		

		String cp = request.getContextPath();
		listUrl = cp + "/qtboard_list";
		articleUrl = cp + "/qtboard_detail?page=" + current_page;
		if (query.length() != 0)
		{
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}

		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
	

		mav.addObject("list", list); // 글 리스트
		mav.addObject("bestList", bestList); // 추천글
		mav.addObject("hitList", hitList); // 주회수많은글
		mav.addObject("articleUrl", articleUrl); // 눌럿을 때
		mav.addObject("paging", paging); // 페이징 바
		mav.addObject("page", current_page); // 현재 페이지
		mav.addObject("dataCount", dataCount); // 글 갯수
		mav.addObject("total_page", total_page); // 전체 페이지
		
		return mav;
	}
	
	@RequestMapping(value="/qtboard_create")
	public ModelAndView createForm(CommandMap commandMap)
	{
		ModelAndView mav = new ModelAndView("QTBoard_form");
		
		return mav;
	}
	
	
	@RequestMapping(value="/qtboard_created")
	public ModelAndView create(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception
	{
		ModelAndView mav = new ModelAndView("redirect:/qtboard_list");
		
		service.insertBoard(commandMap.getMap(), request);
		
		return mav;
	}	
	
	@RequestMapping(value="받는주소")
	public ModelAndView listfunction(@RequestParam("selectValue")String selectValue)
	{
		ModelAndView mav = new ModelAndView();
		
		
		return mav;
	}	
	
	// 페이지 상세 내용
	@RequestMapping(value = "/qtboard_detail")
	public ModelAndView article(CommandMap commandMap) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		
		
		String searchKey = "subject";
		String searchValue = "";				
		if(commandMap.get("searchKey")!=null)
		{
			searchKey = (String) commandMap.get("searchKey");
		}
		
		if(commandMap.get("searchValue")!=null)
		{
			searchValue = (String) commandMap.get("searchValue");
		}	

		
		String query = "page=" + commandMap.get("page");
		if (searchValue != null)
			query += "&searchKey=" + searchKey + "&searchValue=" + searchValue;

		
		
		
		
		Map<String, Object> resultMap = service.readBoardAll(commandMap.getMap());
		
		@SuppressWarnings("unchecked")
		Map<String, Object> post = (Map<String, Object>) resultMap.get("post");
		
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> comm = (List<Map<String, Object>>) resultMap.get("comm");
		
		
		
		// 읽으려는 글이 삭제되었을 때
		if (post == null)
		{
			mav.setViewName("redirect:/qtboard_list?" + query);
			return mav;
		}
		
		
		
		
		Object value = null;
		
		if(post.get("CONTENT") instanceof java.sql.Clob)
		{
			value = stringUtil.clobToString((java.sql.Clob)post.get("CONTENT"));
		}
		else
		{
			value = post.get("CONTENT");
		}		
		
		post.put("CONTENT", value);				
		
		mav.addObject("post", post);
		mav.addObject("comm", comm);
		mav.addObject("fileList", resultMap.get("fileList"));
		mav.addObject("page", commandMap.get("page"));
		mav.addObject("query", query);
		mav.addObject("searchKey", searchKey);
		mav.addObject("searchValue", searchValue);
		
		
		mav.setViewName("QTBoard_detail");

		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/qtboard_updateForm")
	public ModelAndView updateForm(CommandMap commandMap) throws SQLException, IOException
	{
		ModelAndView mav = new ModelAndView("QTBoard_update");	
		
		String searchKey = "subject";
		String searchValue = "";				
		if(commandMap.get("searchKey")!=null)
		{
			searchKey = (String) commandMap.get("searchKey");
		}
		
		if(commandMap.get("searchValue")!=null)
		{
			searchValue = (String) commandMap.get("searchValue");
		}	
		
		
		
		Map<String, Object> resultMap = service.readBoard(commandMap.getMap());
		
		if(resultMap==null)
		{
			mav.setViewName("redirect:/qtboard_list");
			return mav;
		}
		
		
		Map<String, Object> post = (Map<String, Object>) resultMap.get("post");
		
		Object value = null;
		
		if(post.get("CONTENT") instanceof java.sql.Clob)
		{
			value = stringUtil.clobToString((java.sql.Clob)post.get("CONTENT"));
		}
		else
		{
			value = post.get("CONTENT");
		}		
		
		post.put("CONTENT", value);	
		
		List<Map<String, Object>> fileList = (List<Map<String, Object>>) resultMap.get("fileList");
		
		
		
		mav.addObject("post", post);
		mav.addObject("fileList", fileList);
		mav.addObject("QT_ID", commandMap.get("QT_ID"));	
		mav.addObject("searchKey", searchKey);
		mav.addObject("searchValue", searchValue);
		
		return mav;
	}
	
	@RequestMapping(value="/qtboard_update")
	public ModelAndView update(CommandMap commandMap, HttpServletRequest request)
	{
		ModelAndView mav = new ModelAndView("redirect:/qtboard_detail?QT_ID=" + commandMap.get("QT_ID"));
		
		service.updateBoard(commandMap.getMap(), request);		
		
		return mav;
	}
	
	@RequestMapping(value="/qtboard_delete")
	public ModelAndView delete(CommandMap commandMap)
	{
		ModelAndView mav = new ModelAndView("redirect:/qtboard_list");
		
		service.deleteBoard(commandMap.getMap());
		
		return mav;
	}
	
	// 댓글 리스트 불러오기
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/qtboard_comment_ajax")
	public ResponseEntity ajaxComment(CommandMap commandMap , HttpServletRequest request)
	{
		HttpHeaders headers = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		
		List<Map<String, Object>> commList = service.commList(commandMap.getMap());
		
		if(commList.size() > 0)
		{
			for(int i=0; i<commList.size(); i++)
			{
				HashMap hm = new HashMap();
				
				hm.put("ROWNUM", commList.get(i).get("ROWNUM"));
				hm.put("COMM_ID", commList.get(i).get("COMM_ID"));
				hm.put("NICKNAME", commList.get(i).get("NICKNAME"));
				hm.put("PAR_COMM_ID", commList.get(i).get("PAR_COMM_ID"));
				hm.put("PAR_NICKNAME", commList.get(i).get("PAR_NICKNAME"));
				hm.put("COMM_DEPT", commList.get(i).get("COMM_DEPT"));
				hm.put("CONTENT", commList.get(i).get("CONTENT"));
				hm.put("WRITEDATE", commList.get(i).get("WRITEDATE"));
				hm.put("RECOMM", commList.get(i).get("RECOMM"));
				hm.put("REP", commList.get(i).get("REP"));
				hm.put("PARCHECK", commList.get(i).get("PARCHECK"));
				hm.put("DELCHECK", commList.get(i).get("DELCHECK"));
				
				hmlist.add(hm);
			}
		}
		
		JSONArray json = new JSONArray(hmlist);		
		
		return new ResponseEntity(json.toString(), headers,HttpStatus.CREATED);
	}
	
	
	@RequestMapping(value="/qtboard_addComment_ajax")
	public void addComment(CommandMap commandMap , HttpServletResponse response, HttpServletRequest request) throws IOException
	{
		log.debug(commandMap.getMap());
		
		service.addComment(commandMap.getMap());
		
		response.getWriter().print("");
	}	
	
	
	@RequestMapping(value="/qtboard_updateComment_ajax")
	public void updateComment(CommandMap commandMap, HttpServletResponse response) throws IOException
	{
		service.updateComment(commandMap.getMap());
		
		response.getWriter().print("");
	}
	
	@RequestMapping(value="/qtboard_deleteComment_ajax")
	public void deleteComment(CommandMap commandMap, HttpServletResponse response) throws IOException
	{
		service.deleteComment(commandMap.getMap());
		
		response.getWriter().print("");
	}	
}

















