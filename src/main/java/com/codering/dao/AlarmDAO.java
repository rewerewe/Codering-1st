package com.codering.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.codering.common.AbstractDAO;

@Repository("AlramDAO")
public class AlarmDAO extends AbstractDAO
{
	public void insertTutoringEnroll(Map<String, Object> map)
	{
		insert("alarm.tutoringEnroll", map);
	}
	
	public void insertTutorFAQ(Map<String, Object> map)
	{
		insert("alarm.tutorFAQ", map);
	}
	
	public void insertTuteeFAQ(Map<String, Object> map)
	{
		insert("alarm.tuteeFAQ", map);
	}
	
	public void insertInvite(Map<String, Object> map)
	{
		insert("alarm.invite", map);
	}
	
	public void insertApply(Map<String, Object> map)
	{
		insert("alarm.apply", map);
	}
	
	public void insertComment(Map<String, Object> map)
	{
		insert("alarm.comment", map);
	}
	
	public void insertCommentPar(Map<String, Object> map)
	{
		insert("alarm.commentPar", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAlarmList(Map<String, Object> map)
	{
		return (List<Map<String, Object>>)selectList("alarm.alarmList", map);
	}
	
	public int selectAlarmCount(Map<String, Object> map)
	{
		return (Integer) selectOne("alarm.count", map);
	}
	
	public void updateAlarmRead(Map<String, Object> map)
	{
		update("alarm.readCheck", map);
	}
}
