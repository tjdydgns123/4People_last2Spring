package com.card;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.util.MyBatisCommonFactory;
@Repository
public class CardDao {
	//은수
	@Autowired
	SqlSessionTemplate sqlSessionTemplate =null;
	Logger logger = Logger.getLogger(CardDao.class);
	
//	public  String commentIns(Map<String, Object> pMap) {
//		logger.info("CardDao호출");
//		SqlSessionFactory = MyBatisCommonFactory.getSqlSessionFactory();
//		session = SqlSessionFactory.openSession();
//		session.selectList("commentIns",pMap);
//		String card_code = "";
////		logger.info("사이즈"+commentNo.size());
//		for(Object key:pMap.keySet()) {
//			if(key.equals("r_card_code")) {
//				card_code = (String)pMap.get(key);
//			}
//		}
//		logger.info("사이즈"+pMap.size());
//		
//		return card_code;
//		
//	}

	public List<Map<String,Object>> labelIns(Map<String, Object> pMap) {
		List<Map<String,Object>> labelIns = new ArrayList<Map<String,Object>>();
		sqlSessionTemplate.selectOne("labelIns",pMap);
		logger.info(pMap.size());
		logger.info(labelIns.size());
		labelIns.add(pMap);
//		session.commit();
		return labelIns;
	}

	public List<Map<String, Object>> cardSEL(Map<String, Object> pMap) {
		List<Map<String,Object>> cardList = new ArrayList<Map<String,Object>>();
		sqlSessionTemplate.selectList("cardSEL",pMap);
		logger.info(pMap);
		cardList.add(pMap);
		
		return cardList;
	}

	public void labelDel(Map<String, Object> pMap) {
		sqlSessionTemplate.delete("labelDel",pMap);
		logger.info("del호출");
	}

	public void labelUpd(Map<String, Object> pMap) {
		sqlSessionTemplate.update("labelUpd",pMap);
		logger.info("upd호출");
		
	}
	public void desIns(Map<String, Object> pMap) {
		logger.info("desIns호출");
		sqlSessionTemplate.insert("desIns",pMap);
	}

	public void desUPD(Map<String, Object> pMap) {
		logger.info("desUPD호출");
		sqlSessionTemplate.update("desUPD",pMap);
		
	}

	public void memberINS(Map<String, Object> pMap) {
		logger.info("memberINS호출");
		sqlSessionTemplate.insert("memberINS",pMap);
		
	}

	public void partiDEL(Map<String, Object> pMap) {
		sqlSessionTemplate.delete("partiDEL",pMap);
	}

	public void checkINS(Map<String, Object> pMap) {
		logger.info("checkINS호출");
		sqlSessionTemplate.insert("checkINS",pMap);
	}
	public void checkListINS(Map<String, Object> pMap) {
		logger.info("checkListINS호출");
		sqlSessionTemplate.insert("checkListINS",pMap);
	}

	public void checkListUPD(Map<String, Object> pMap) {
		logger.info("checkListUPD호출");
		sqlSessionTemplate.update("checkListUPD",pMap);
	}
	public void checkListUPD2(Map<String, Object> pMap) {
		logger.info("checkListUPD호출");
		sqlSessionTemplate.update("checkListUPD2",pMap);
	}

	public void checklistDEL(Map<String, Object> pMap) {
		logger.info("checklistDEL호출");
		sqlSessionTemplate.delete("checklistDEL",pMap);
	}

	public void checkDEL(Map<String, Object> pMap) {
		logger.info("checkDEL호출");
		sqlSessionTemplate.delete("checkDEL2",pMap);
		sqlSessionTemplate.delete("checkDEL",pMap);
	}

	public void fileINS(Map<String, Object> pMap) {
		sqlSessionTemplate.insert("fileINS",pMap);
	}

	public void fileDEL(Map<String, Object> pMap) {
		sqlSessionTemplate.insert("fileDEL",pMap);
	}

	public void cardDueDateUPD(Map<String, Object> pMap) {
		logger.info("cardDueDateUPD호출");
		sqlSessionTemplate.update("cardDueDateUPD",pMap);
	}

	public void commentIns(Map<String, Object> pMap) {
		sqlSessionTemplate.update("commentIns",pMap);
	}

	public void commentDEL(Map<String, Object> pMap) {
		sqlSessionTemplate.delete("commentDEL",pMap);
	}
}
