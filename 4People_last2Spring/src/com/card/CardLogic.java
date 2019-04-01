package com.card;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class CardLogic {
	//은수
	CardDao c_Dao = new CardDao();
	Logger logger = Logger.getLogger(CardLogic.class);
	public String commentIns(Map<String, Object> pMap) {
		logger.info("CardLogic 호출");
		String comment_code=c_Dao.commentIns(pMap);
		return comment_code;
	}
	//은수
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
	public void desIns(Map<String, Object> pMap) {
		c_Dao.desIns(pMap);
	}
}
