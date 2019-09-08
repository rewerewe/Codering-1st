package com.codering.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.codering.common.AbstractDAO;

@Repository("QtboardDAO")
public class QtboardDAO extends AbstractDAO
{
	// 리스트 불러오기
	@SuppressWarnings("unchecked")    
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map)
	{
		return (List<Map<String, Object>>) selectList("qtboard.boardList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBestList(Map<String, Object> map)
	{
		return (List<Map<String, Object>>) selectList("qtboard.commBoardList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectHitList(Map<String, Object> map)
	{
		return (List<Map<String, Object>>) selectList("qtboard.hitBoardList", map);
	}
	
	// 페이징을 위한 데이터 갯수 불러오기
	public int selectDataCount(Map<String, Object> map)
	{
		return (Integer) selectOne("qtboard.dataCount", map);
	}
	
	// 조회수 업데이트
	public void updateHitCount(Map<String, Object> map)
	{
		update("qtboard.updateHitCount", map);
	}
	
	// 페이지 읽기 , 업데이트를 위해 불러오기
	@SuppressWarnings("unchecked") 
	public Map<String, Object> selectReadBoard(Map<String, Object> map)
	{
		return (Map<String, Object>) selectOne("qtboard.readBoard", map);
	}
	
	// 파일 목록 불러오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map)
	{
		return (List<Map<String, Object>>) selectList("qtboard.selectFileList", map);
	}
	
	// 글 작성
	public void insertBoard(Map<String, Object> map)
	{
		insert("qtboard.insertBoard", map);
	}
	
	// 파일 추가
	public void insertFile(Map<String, Object> map)
	{
		insert("qtboard.insertFile", map);
	}
	
	// 페이지 업데이트
	public void updateBoard(Map<String, Object> map)
	{
		update("qtboard.updateBoard", map);
	}
	
	// 페이지 삭제
	public void deleteBoard(Map<String, Object> map)
	{
		delete("qtboard.deleteBoard", map);
	}
		
	
	// 댓글 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCommList(Map<String, Object> map)
	{
		return (List<Map<String, Object>>) selectList("qtboard.commList", map);
	}
	
	// 댓글 입력
	public void insertComment(Map<String, Object> map)
	{
		insert("qtboard.addComment", map);
	}
	
	
	// 댓글 업데이트를 위한 정보 불러오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCommUpdate(Map<String, Object> map)
	{
		return (Map<String, Object>) selectOne("qtboard.selectComment", map);
	}
	
	// 댓글 업데이트
	public void updateComment(Map<String, Object> map)
	{
		update("qtboard.updateComment", map);
	}
	
	// 댓글 삭제
	public void deleteComment(Map<String, Object> map)
	{
		delete("qtboard.deleteComment",map);
	}
	
	// 댓글이 자식이 있다면 삭제된것처럼 업데이트 처리
	public void updateDeleteComment(Map<String, Object> map)
	{
		update("qtboard.updateDeleteComment", map);
	}
	
	// 댓글자식이 삭제되었을때 그 부모가 자식이 있나없나 확인
	public int selectChildCheck(Map<String, Object> map)
	{
		return (Integer) selectOne("qtboard.parCommentCheck", map);
	}
}

