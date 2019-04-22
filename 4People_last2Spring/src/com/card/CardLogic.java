package com.card;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class CardLogic {
	@Autowired
	CardDao c_Dao = null;
	Logger logger = Logger.getLogger(CardLogic.class);
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
	public List<Map<String, Object>> checkListINS(Map<String, Object> pMap) {
		List<Map<String,Object>> cardList = null;
		c_Dao.checkListINS(pMap);
		cardList = c_Dao.cardSEL(pMap);
		return cardList;
	}
	public void checkListUPD(Map<String, Object> pMap) {
		c_Dao.checkListUPD(pMap);
	}
	public void checkListUPD2(Map<String, Object> pMap) {
		c_Dao.checkListUPD2(pMap);
	}
	public List<Map<String, Object>> checklistDEL(Map<String, Object> pMap) {
		List<Map<String,Object>> cardList = null;
		c_Dao.checklistDEL(pMap);
		cardList = c_Dao.cardSEL(pMap);
		return cardList;
	}
	public void checkDEL(Map<String, Object> pMap) {
		c_Dao.checkDEL(pMap);
	}
	public List<Map<String, Object>> fileINS(Map<String, Object> pMap) {
		List<Map<String,Object>> cardList = null;
		c_Dao.fileINS(pMap);
		cardList = c_Dao.cardSEL(pMap);
		return cardList;
	}
	public void fileDEL(Map<String, Object> pMap) {
		c_Dao.fileDEL(pMap);
	}
	public List<Map<String, Object>> cardDueDateUPD(Map<String, Object> pMap) {
		List<Map<String,Object>> cardList = null;
		c_Dao.cardDueDateUPD(pMap);
		cardList = c_Dao.cardSEL(pMap);
		return cardList;
	}
	public List<Map<String, Object>> commentIns(Map<String, Object> pMap) {
		List<Map<String,Object>> cardList = null;
		c_Dao.commentIns(pMap);
		cardList= c_Dao.cardSEL(pMap);
		return cardList;
	}
	public List<Map<String, Object>> commentDEL(Map<String, Object> pMap) {
		List<Map<String,Object>> cardList = null;
		c_Dao.commentDEL(pMap);
		cardList= c_Dao.cardSEL(pMap);
		return cardList;
	}
}
