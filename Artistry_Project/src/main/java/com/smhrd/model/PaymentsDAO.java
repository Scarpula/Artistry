package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class PaymentsDAO {

	SqlSessionFactory sf = SqlSessionManager.getSqlSession();
	
	public List<Payments> payment_info(Payments payments) {
		SqlSession session = sf.openSession(true);
		List<Payments> paymentList = session.selectList("com.smhrd.db.PaymentsMapper.get_payments_info", payments);
		session.close();
		return  paymentList;
	}

}
