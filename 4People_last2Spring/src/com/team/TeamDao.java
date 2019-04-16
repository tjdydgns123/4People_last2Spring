package com.team;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeamDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate=null;
	Logger logger = Logger.getLogger(TeamDao.class);
	//board가져오기
	public List<Map<String, Object>> getBoard(Map<String, Object> pMap) {
		List<Map<String,Object>> boardList = null;
		try {
			boardList = sqlSessionTemplate.selectList("boardList",pMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boardList;
	}
	//프로젝트에 참여중인 회원정보가져오기
	public List<Map<String, Object>> getMember(Map<String, Object> pMap) {
		List<Map<String,Object>> memberList = null;
		try {
			memberList = sqlSessionTemplate.selectList("getMember",pMap);
			Map<String,Object> rMap = sqlSessionTemplate.selectOne("teamInfo",pMap);
			memberList.add(rMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberList;
	}
	public List<Map<String, Object>> getMember2(Map<String, Object> pMap) {
		List<Map<String,Object>> memberList = null;
		try {
			memberList = sqlSessionTemplate.selectList("getMember2",pMap);
			Map<String,Object> rMap = sqlSessionTemplate.selectOne("teamInfo",pMap);
			memberList.add(rMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberList;
	}
	public List<Map<String, Object>> getMember3(Map<String, Object> pMap) {
		List<Map<String,Object>> memberList = null;
		try {
			memberList = sqlSessionTemplate.selectList("getMember3",pMap);
			Map<String,Object> rMap = sqlSessionTemplate.selectOne("teamInfo",pMap);
			memberList.add(rMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberList;
	}
	//초대를 위해 검색햇을떄.
	public Map<String,Object> getInvite(Map<String, Object> pMap) {
		logger.info("TeamDao호출");
		sqlSessionTemplate.selectList("getInvite",pMap);
			pMap.remove("p_code");
			pMap.remove("mem_email");
		return pMap;
	}
	//초대버튼눌럿을떄
	public void inviteMember(Map<String, Object> pMap) {
		sqlSessionTemplate.insert("inviteMember",pMap);
//		sqlSessionTemplate.commit();
	}
	public String newTeam(Map<String, Object> pMap) {
		sqlSessionTemplate.insert("newTeam",pMap);
		String team_code="";
		for(String key:pMap.keySet()) {
			if(key.equals("v_teamcode")) {
				team_code=(String)pMap.get(key);
			}
		}
		return team_code;
	}
	public void teamOut(Map<String, Object> pMap) {
		sqlSessionTemplate.delete("teamOut",pMap);
		logger.info("teamOut호출");
	}
	

}
