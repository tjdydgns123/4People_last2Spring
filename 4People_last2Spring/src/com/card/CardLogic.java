package com.card;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class CardLogic {
	@Autowired
	CardDao c_Dao = null;
	Logger logger = Logger.getLogger(CardLogic.class);
//	public String commentIns(Map<String, Object> pMap) {
//		logger.info("CardLogic 호출");
//		String comment_code=c_Dao.commentIns(pMap);
//		return comment_code;
//	}
	public List<Map<String,Object>> labelIns(Map<String, Object> pMap) {
		List<Map<String,Object>> labelIns =c_Dao.labelIns(pMap);
				
		return labelIns;
	}
	public List<Map<String, Object>> cardSEL(Map<String, Object> pMap) {
		List<Map<String,Object>> cardList =null;
		cardList = c_Dao.cardSEL(pMap);
		return cardList;
	}
	public void labelDel(Map<String, Object> pMap) {
		c_Dao.labelDel(pMap);
	}
	public void labelUpd(Map<String, Object> pMap) {
		c_Dao.labelUpd(pMap);
		
	}
	public List<Map<String, Object>> desIns(Map<String, Object> pMap) {
		List<Map<String,Object>> cardList = null;
		c_Dao.desIns(pMap);
		cardList = c_Dao.cardSEL(pMap);
		return cardList;
	}
	public void desUPD(Map<String, Object> pMap) {
		c_Dao.desUPD(pMap);
		
	}
	public List<Map<String, Object>> memberINS(Map<String, Object> pMap) {
		List<Map<String,Object>> cardList = null;
		c_Dao.memberINS(pMap);
		cardList = c_Dao.cardSEL(pMap);
		return cardList;
		
	}
	public void partiDEL(Map<String, Object> pMap) {
		c_Dao.partiDEL(pMap);
	}
	public List<Map<String, Object>> checkINS(Map<String, Object> pMap) {
		List<Map<String,Object>> cardList = null;
		c_Dao.checkINS(pMap);
		cardList = c_Dao.cardSEL(pMap);
		return cardList;
	}
}
