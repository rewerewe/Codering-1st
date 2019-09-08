package com.codering.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.codering.common.AbstractDAO;

@Repository("RecommRepDAO")
public class RecommRepDAO extends AbstractDAO
{
	// 글 추천 갯수 반환
	public int recommBoardCount(Map<String, Object> map)
	{
		return (Integer) selectOne("recomm.boardCount", map);
	}
		
	// 한사람이 글에 추천한 갯수
	public int recommBoardCheck(Map<String, Object> map)
	{
		return (Integer) selectOne("recomm.boardCheck", map);
	}
	
	// 글 추천 +1
	public void recommBoard(Map<String, Object> map)
	{
		insert("recomm.board", map);
	}	
	
	// 댓글 추천 갯수 반환
	public int recommCommentCount(Map<String, Object> map)
	{
		return (Integer) selectOne("recomm.commentCount", map);
	}
	
	// 한사람이 댓글에 추천한 갯수
	public int recommCommentCheck(Map<String, Object> map)
	{
		return (Integer) selectOne("recomm.commentCheck", map);
	}
	
	// 댓글 추천 +1
	public void recommComment(Map<String, Object> map)
	{
		insert("recomm.comment",map);
	}	
	
	
	// 질문글 신고 했는지 확인
	public int reportBoardCheck(Map<String, Object> map)
	{
		return (Integer) selectOne("recomm.boardCheck", map);
	}
	
	// 질문글 신고
	public void reportBoard(Map<String, Object> map)
	{
		insert("report.board", map);
	}
	
	// 질문댓글 신고 했는지 확인
	public int reportCommentCheck(Map<String, Object> map)
	{
		return (Integer) selectOne("recomm.commentCheck", map);
	}
	
	// 질문댓글 신고
	public void reportComment(Map<String, Object> map)
	{
		insert("report.comm", map);
	}	
	
	// 튜터질답 신고 했는지 확인
	public int reportTutorCheck(Map<String, Object> map)
	{
		return (Integer) selectOne("recomm.tutorCheck", map);
	}
	
	// 튜터질답 신고
	public void reportTutor(Map<String, Object> map)
	{
		insert("report.tutor", map);
	}
	
	
	// 튜티질답 신고 했는지 확인
	public int reportTuteeCheck(Map<String, Object> map)
	{
		return (Integer) selectOne("recomm.tuteeCheck", map);
	}
	
	// 튜티질답 신고
	public void reportTutee(Map<String, Object> map)
	{
		insert("report.tutee", map);
	}
	
	// 내부게시판 글 신고 했는지 확인
	public int reportTBoardCheck(Map<String, Object> map)
	{
		return (Integer) selectOne("recomm.tboardCheck", map);
	}
	
	// 내부게시판 글 신고
	public void reportTBoard(Map<String, Object> map)
	{
		insert("report.tboard", map);
	}
	
	// 내부게시판 댓글신고 했는지 확인
	public int reportTCommentCheck(Map<String, Object> map)
	{
		return (Integer) selectOne("recomm.tcommentCheck", map);
	}
	
	// 내부게시판 댓글
	public void reportTComment(Map<String, Object> map)
	{
		insert("report.tcomm", map);
	}
}
