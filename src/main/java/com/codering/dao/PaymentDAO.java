package com.codering.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.codering.common.AbstractDAO;

@Repository("PaymentDAO")
public class PaymentDAO extends AbstractDAO
{
	public int selectTuteeAuth(Map<String, Object> map)
	{
		return (Integer) selectOne("payment.selectTuteeAuth");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectTutoringTutor(Map<String,Object> map)
	{
		return (Map<String, Object>) selectOne("payment.selectTutoringTutor",map);
	}
	
	public int selectCouponCount(Map<String,Object> map)
	{
		return (Integer) selectOne("payment.selectCouponCount",map); 
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectCoupon(Map<String,Object> map)
	{
		return selectList("payment.selectCoupon",map);
	}
	
	public void deleteCoupon(Map<String,Object> map)
	{
		delete("payment.deleteCoupon",map);
	}
	
	public void insertTutoringEnroll(Map<String,Object> map)
	{
		insert("payment.insertTutoringEnroll",map);
	}
	
	
}
