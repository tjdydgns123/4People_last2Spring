package com.card;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.util.MyBatisCommonFactory;

public class CardDao {
	//은수
	SqlSessionFactory SqlSessionFactory=null;
	SqlSession session = null;
	Logger logger = Logger.getLogger(CardDao.class);
	
	public  String commentIns(Map<String, Object> pMap) {
		logger.info("CardDao호출");
		SqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
		session = SqlSessionFactory.openSession();
		session.selectList("commentIns",pMap);
		String card_code = "";
//		logger.info("사이즈"+commentNo.size());
		for(Object key:pMap.keySet()) {
			if(key.equals("r_card_code")) {
				card_code = (String)pMap.get(key);
			}
		}
		logger.info("사이즈"+pMap.size());
		
		return card_code;
		
	}
	//은수

	public List<Map<String,Object>> labelIns(Map<String, Object> pMap) {
		List<Map<String,Object>> labelIns = new ArrayList<Map<String,Object>>();
		SqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
		session = SqlSessionFactory.openSession();
			session.selectOne("labelIns",pMap);
		logger.info(pMap.size());
		labelIns.add(pMap);
		logger.info(labelIns.size());
		logger.info(labelIns.get(0).get("r_label_color"));
//		session.commit();
		return labelIns;
	}

	public List<Map<String, Object>> cardSEL(Map<String, Object> pMap) {
		List<Map<String,Object>> cardList = new ArrayList<Map<String,Object>>();
		SqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
		session = SqlSessionFactory.openSession();
		session.selectList("cardSEL",pMap);
		logger.info(pMap.get("labelMap"));
		cardList.add(pMap);
		return cardList;
	}

	public void labelDel(Map<String, Object> pMap) {
		SqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
		session = SqlSessionFactory.openSession();
		session.delete("labelDel",pMap);
		session.commit();
		logger.info("del호출");
	}

	public void labelUpd(Map<String, Object> pMap) {
		SqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
		session = SqlSessionFactory.openSession();
		session.update("labelUpd",pMap);
		session.commit();
		logger.info("upd호출");
		
	}

	public void desIns(Map<String, Object> pMap) {
		logger.info("desIns호출");
		SqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
		session = SqlSessionFactory.openSession();
		session.insert("desIns",pMap);
		session.commit();
	}

}
