package com.codering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codering.controller.QtboardController;
import com.codering.dao.AlarmDAO;
import com.codering.dao.QtboardDAO;
import com.codering.util.FileUtils;

@Service("QtboardService")
public class QtboardServiceImpl implements QtboardService
{
	private static final Log log = LogFactory.getLog(QtboardServiceImpl.class);
	
	@Autowired
	private QtboardDAO dao;
	
	@Autowired
	private AlarmDAO alarmDao;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Override
	public Map<String, Object> boardList(Map<String, Object> map)
	{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("boardList", dao.selectBoardList(map));
		resultMap.put("bestList", dao.selectBestList(map));
		resultMap.put("hitList", dao.selectHitList(map));
		
		return resultMap;
	}

	@Override
	public int dataCount(Map<String, Object> map)
	{
		return dao.selectDataCount(map);
	}

	@Override
	public Map<String, Object> readBoardAll(Map<String, Object> map)
	{
		Map<String, Object> resultMap = new HashMap();

		dao.updateHitCount(map);

		resultMap.put("post", dao.selectReadBoard(map));

		resultMap.put("comm", dao.selectCommList(map));

		resultMap.put("fileList", dao.selectFileList(map));

		return resultMap;
	}

	@Override
	public Map<String, Object> readBoard(Map<String, Object> map)
	{
		Map<String, Object> resultMap = new HashMap();

		resultMap.put("post", dao.selectReadBoard(map));

		resultMap.put("fileList", dao.selectFileList(map));

		return resultMap;
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception
	{
		dao.insertBoard(map);

		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);

		for (int i = 0, size = list.size(); i < size; i++)
		{
			dao.insertFile(list.get(i));
		}

	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request)
	{
		dao.updateBoard(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map)
	{
		dao.deleteBoard(map);
	}

	@Override
	public List<Map<String, Object>> commList(Map<String, Object> map)
	{
		return dao.selectCommList(map);
	}

	@Override
	public void addComment(Map<String, Object> map)
	{
		dao.insertComment(map);
		
		if(!(boolean)map.get("postNICKNAME").equals((String)map.get("NICKNAME")))
		{
			alarmDao.insertComment(map);
			
			if(map.get("PAR_COMM_ID") != null && map.get("PAR_COMM_ID") != "")
			{
				alarmDao.insertCommentPar(map);
			}
		}		
	}

	@Override
	public Map<String, Object> commentUpdateForm(Map<String, Object> map)
	{
		return dao.selectCommUpdate(map);
	}

	@Override
	public void updateComment(Map<String, Object> map)
	{
		dao.updateComment(map);
	}

	@Override
	public void deleteComment(Map<String, Object> map)
	{
		//�뙎湲��쓣 �궘�젣�븯�젮�븷�븣 �옄�떇�씠 �엳�떎硫� �뵜泥댄겕留� 蹂�寃�
		if(Integer.parseInt((String)map.get("PARCHECK")) != 0)
		{
			dao.updateDeleteComment(map);
		}
		else // �뾾�떎硫� �씪�떒 �궘�젣
		{
			dao.deleteComment(map);
			
			if(dao.selectChildCheck(map) == 0) // �궘�젣�븳�뙎湲��쓽 遺�紐④� �뜑�씠�긽 �옄�떇�씠 �뾾�쑝硫� 媛숈씠 �궘�젣
			{
				map.put("COMM_ID", map.get("PAR_COMM_ID"));
				
				dao.deleteComment(map);
			}
		}		
	}
}
