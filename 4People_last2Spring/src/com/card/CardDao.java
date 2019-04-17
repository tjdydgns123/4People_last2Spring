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
		pMap.put("history_content", "님이 라벨을 생성했습니다.");
		sqlSessionTemplate.insert("historyIns",pMap);
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
		pMap.put("history_content", "님이 라벨을 삭제했습니다.");
		sqlSessionTemplate.insert("historyIns",pMap);
	}

	public void labelUpd(Map<String, Object> pMap) {
		sqlSessionTemplate.update("labelUpd",pMap);
		logger.info("upd호출");
		pMap.put("history_content", "님이 라벨을 수정했습니다.");
		sqlSessionTemplate.insert("historyIns",pMap);
		
	}
	public void desIns(Map<String, Object> pMap) {
		logger.info("desIns호출");
		sqlSessionTemplate.insert("desIns",pMap);
		String mem_id = pMap.get("des_maker").toString();
		pMap.put("history_content", "님이 요약을 작성했습니다.");
		pMap.put("mem_id",mem_id);
		sqlSessionTemplate.insert("historyIns",pMap);
		
	}

	public void desUPD(Map<String, Object> pMap) {
		logger.info("desUPD호출");
		sqlSessionTemplate.update("desUPD",pMap);
		pMap.put("history_content", "님이 요약을 수정했습니다.");
		sqlSessionTemplate.insert("historyIns",pMap);
	}

	public void memberINS(Map<String, Object> pMap) {
		logger.info("memberINS호출");
		sqlSessionTemplate.insert("memberINS",pMap);
		pMap.put("history_content", "님이 참여자를 추가했습니다.");
		sqlSessionTemplate.insert("historyIns",pMap);
		
	}

	public void partiDEL(Map<String, Object> pMap) {
		sqlSessionTemplate.delete("partiDEL",pMap);
		pMap.put("history_content", "님이 참여자를 삭제했습니다.");
		sqlSessionTemplate.insert("historyIns",pMap);
	}

	public void checkINS(Map<String, Object> pMap) {
		logger.info("checkINS호출");
		sqlSessionTemplate.insert("checkINS",pMap);
		String mem_id = pMap.get("check_maker").toString();
		pMap.put("history_content", "님이 체크리스트 타이틀을 작성했습니다.");
		pMap.put("mem_id",mem_id);
		sqlSessionTemplate.insert("historyIns",pMap);
	}
	public void checkListINS(Map<String, Object> pMap) {
		logger.info("checkListINS호출");
		sqlSessionTemplate.insert("checkListINS",pMap);
		String mem_id = pMap.get("check_con_maker").toString();
		pMap.put("mem_id",mem_id);
		pMap.put("history_content", "님이 체크리스트 아이콘을 생성했습니다.");
		sqlSessionTemplate.insert("historyIns",pMap);
		
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
		pMap.put("history_content", "님이 체크리스트 아이콘을 삭제했습니다.");
		sqlSessionTemplate.insert("historyIns",pMap);
	}

	public void checkDEL(Map<String, Object> pMap) {
		logger.info("checkDEL호출");
		sqlSessionTemplate.delete("checkDEL2",pMap);
		sqlSessionTemplate.delete("checkDEL",pMap);
		pMap.put("history_content", "님이 체크리스트를 삭제했습니다.");
		sqlSessionTemplate.insert("historyIns",pMap);
	}

	public void fileINS(Map<String, Object> pMap) {
		sqlSessionTemplate.insert("fileINS",pMap);
		String mem_id = pMap.get("f_maker").toString();
		String team_code = pMap.get("f_team_code").toString();
		pMap.put("history_content", "님이 첨부파일을 업로드했습니다.");
		pMap.put("mem_id",mem_id);
		pMap.put("team_code",team_code);
		sqlSessionTemplate.insert("historyIns",pMap);
	}

	public void fileDEL(Map<String, Object> pMap) {
		sqlSessionTemplate.insert("fileDEL",pMap);
		pMap.put("history_content", "님이 첨부파일을 삭제했습니다.");
		sqlSessionTemplate.insert("historyIns",pMap);
	}

	public void cardDueDateUPD(Map<String, Object> pMap) {
		logger.info("cardDueDateUPD호출");
try {
	sqlSessionTemplate.update("cardDueDateUPD",pMap);
	pMap.put("history_content", "님이 카드 기한설정을 작성했습니다.");
	sqlSessionTemplate.insert("historyIns",pMap);
	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void commentIns(Map<String, Object> pMap) {
try {
	sqlSessionTemplate.update("commentIns",pMap);
	String mem_id = pMap.get("comm_maker").toString();
	pMap.put("history_content", "님이 댓글을 작성했습니다.");
	pMap.put("mem_id",mem_id);
	sqlSessionTemplate.insert("historyIns",pMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void commentDEL(Map<String, Object> pMap) {
try {
	sqlSessionTemplate.delete("commentDEL",pMap);
	pMap.put("history_content", "님이 댓글을 삭제했습니다.");
	sqlSessionTemplate.insert("historyIns",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
