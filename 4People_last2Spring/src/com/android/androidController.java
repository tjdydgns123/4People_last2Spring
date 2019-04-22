package com.android;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.sun.istack.internal.logging.Logger;


@Controller
@RequestMapping(value="/and/")
public class androidController {
	
	Logger logger = Logger.getLogger(androidController.class);
	
	
	@Autowired
	androidDao androidDao = null;
	
	@ResponseBody
	@RequestMapping(value ="anddata")
	public List<Map<String,Object>> andlogin(@RequestParam Map<String,Object> pMap){
		
		logger.info("컨트롤러 태우기");
		logger.info(pMap.get("mem_id").toString());
		logger.info(pMap.get("mem_pw").toString());
		
		List<Map<String,Object>> loginList =null;
		loginList=androidDao.loginCall(pMap);
		
		logger.info(loginList.get(0).keySet().toString());
		
		
		JsonObject jsonObject = new JsonObject();
		for(Map<String,Object> rMap:loginList) {
			for(String key:rMap.keySet()) {
				logger.info(key+" rMap:"+rMap.get(key));
				jsonObject.addProperty(key, rMap.get(key).toString());
			}
		}
		String mem_name=(pMap.get("mem_id").toString());
		
		return loginList;
		
	}
	
	
	// boarddata 가져가기
	
	@ResponseBody
	@RequestMapping(value ="boardMap" ,produces="text/plain;charset=utf-8")
//	public List<List<Map<String,String>>> boarddata(@RequestParam Map<String,Object> pMap){
	public String boarddata(@RequestParam Map<String,Object> pMap){
		
		logger.info("컨트롤러 태우기");
		
		List<Map<String,Object>> boardList =null;
		boardList=androidDao.BoardSel(pMap);
		List<Map<String,Object>> temp1 = new ArrayList<Map<String,Object>>();
		List<Map<String,String>> temp2 = new ArrayList<Map<String,String>>();
		//temp2.(boardList.get(0).get("teamMap"));
		logger.info(boardList.get(0).get("teamMap").toString());
		Gson gson = new Gson();
//		String result=gson.toJson(boardList.get(0).get("teamMap").toString());
		String result=gson.toJson(boardList);
		logger.info("result:"+result);
		JSONArray jsonArray = null;
		JSONObject jobj = null;
		String s = null;
		try {
			jsonArray = new JSONArray(result);
			logger.info("배열길이:"+jsonArray.length());
			jobj = (JSONObject)jsonArray.get(0);
			s =jobj.get("boardMap").toString();
//			JSONArray jsonArray = new JSONArray(boardList.get(0).get("teamMap").toString());
			logger.info("jobj.toString():"+jobj.toString());
			logger.info("boardMap:"+jobj.get("boardMap"));
			
			Object obj = gson.toJson(jobj.get("boardMap"));
			
			//String test = obj.toString();
			//logger.info("test:"+test);
			
			
		    ///gson.
			//logger.info("팀코드:"+jsono.get("team_code"));
			//JSONArray jsonArray2 = new JSONArray(jobj.get("boardMap"));
			//JSONObject jobj2 = (JSONObject)jsonArray.get(0);
			//logger.info("team_code:"+jobj2.get("team_code"));
			//logger.info(jsonArray.toString());
		} catch (Exception e) {
			logger.info(e.toString());
		}
		JsonObject jsonObject = new JsonObject();
		
		
		
		//logger.info("boardListsize:"+boardList.size());
		//logger.info("boardListsize:"+boardList.get(0).toString());
		
		/*
		 * String teammap = gson.toJson(boardList.get(0).get("teamMap")); String
		 * boardmap = gson.toJson(boardList.get(0).get("boardMap")); String mem_id =
		 * boardList.get(0).get("mem_id").toString();
		 */
		
		/*
		 * List<Map<String,String>> teamMap =(List<Map<String, String>>)
		 * boardList.get(0).get("teamMap"); List<Map<String,String>> boardMap =
		 * (List<Map<String, String>>) boardList.get(0).get("boardMap");
		 * 
		 * 
		 * List<List<Map<String,String>>> test= new
		 * ArrayList<List<Map<String,String>>>(); test.add(teamMap); test.add(boardMap);
		 */
		
		/*
		 * logger.info("teammap:"+teammap); logger.info("boardmap:"+boardmap);
		 */
		
		
		
		/*
		 * jsonObject.addProperty("mem_id", (String) boardList.get(0).get("mem_id"));
		 * jsonObject.addProperty("teamMap", teammap);
		 * jsonObject.addProperty("boardMap", boardmap);
		 */
		 
		
		
		
		//logger.info("테스트"+boardList.get(1).keySet().toString());
		
//		return boardList;
		return s;
	
	}
	
	// teammap 가져가기
	
	@ResponseBody
	@RequestMapping(value ="teamMap" ,produces="text/plain;charset=utf-8")
//	public List<List<Map<String,String>>> boarddata(@RequestParam Map<String,Object> pMap){
	public String teamMap(@RequestParam Map<String,Object> pMap){
		
		logger.info("컨트롤러 태우기");
		
		List<Map<String,Object>> boardList =null;
		boardList=androidDao.BoardSel(pMap);
		List<Map<String,Object>> temp1 = new ArrayList<Map<String,Object>>();
		List<Map<String,String>> temp2 = new ArrayList<Map<String,String>>();
		//temp2.(boardList.get(0).get("teamMap"));
		logger.info(boardList.get(0).get("teamMap").toString());
		Gson gson = new Gson();
//		String result=gson.toJson(boardList.get(0).get("teamMap").toString());
		String result=gson.toJson(boardList);
		logger.info("result:"+result);
		JSONArray jsonArray = null;
		JSONObject jobj = null;
		String s = null;
		try {
			jsonArray = new JSONArray(result);
			logger.info("배열길이:"+jsonArray.length());
			jobj = (JSONObject)jsonArray.get(0);
			s =jobj.get("teamMap").toString();
//			JSONArray jsonArray = new JSONArray(boardList.get(0).get("teamMap").toString());
			logger.info("jobj.toString():"+jobj.toString());
			logger.info("teamMap:"+jobj.get("teamMap"));
			
			Object obj = gson.toJson(jobj.get("teamMap"));
			
			//String test = obj.toString();
			//logger.info("test:"+test);
			
			
		    ///gson.
			//logger.info("팀코드:"+jsono.get("team_code"));
			//JSONArray jsonArray2 = new JSONArray(jobj.get("boardMap"));
			//JSONObject jobj2 = (JSONObject)jsonArray.get(0);
			//logger.info("team_code:"+jobj2.get("team_code"));
			//logger.info(jsonArray.toString());
		} catch (Exception e) {
			logger.info(e.toString());
		}
		JsonObject jsonObject = new JsonObject();
		
		
		
		//logger.info("boardListsize:"+boardList.size());
		//logger.info("boardListsize:"+boardList.get(0).toString());
		
		/*
		 * String teammap = gson.toJson(boardList.get(0).get("teamMap")); String
		 * boardmap = gson.toJson(boardList.get(0).get("boardMap")); String mem_id =
		 * boardList.get(0).get("mem_id").toString();
		 */
		
		/*
		 * List<Map<String,String>> teamMap =(List<Map<String, String>>)
		 * boardList.get(0).get("teamMap"); List<Map<String,String>> boardMap =
		 * (List<Map<String, String>>) boardList.get(0).get("boardMap");
		 * 
		 * 
		 * List<List<Map<String,String>>> test= new
		 * ArrayList<List<Map<String,String>>>(); test.add(teamMap); test.add(boardMap);
		 */
		
		/*
		 * logger.info("teammap:"+teammap); logger.info("boardmap:"+boardmap);
		 */
		
		
		
		/*
		 * jsonObject.addProperty("mem_id", (String) boardList.get(0).get("mem_id"));
		 * jsonObject.addProperty("teamMap", teammap);
		 * jsonObject.addProperty("boardMap", boardmap);
		 */
		 
		
		
		
		//logger.info("테스트"+boardList.get(1).keySet().toString());
		
//		return boardList;
		return s;
	
	}
	
	@ResponseBody
	//@RequestMapping(value ="boardListSel" ,produces="text/plain;charset=utf-8")
	@RequestMapping(value ="boardListSel")
	Map<String,List<Map<String,String>>> BoardList(@RequestParam Map<String,Object> pMap) {
		
		Gson gson = new Gson();
		JSONArray jsonArray = null;
		JSONObject jobj = null;
		String s=null;
		
		List<Map<String,Object>> boardList =null;
		boardList=androidDao.BoardListsel(pMap);
		
		String result=gson.toJson(boardList);
		
		List<Map<String,String>> etc = new ArrayList<Map<String,String>>();
		Map<String,String> etcmap = new HashMap<String, String>();
		
		
		String board_no  =(String) boardList.get(0).get("board_no");
		String team_name =(String) boardList.get(0).get("team_name");
		String board_name =(String) boardList.get(0).get("board_name");
		String r_team_code =(String) boardList.get(0).get("r_team_code");
		
		etcmap.put("board_no", board_no);
		etcmap.put("team_name", team_name);
		etcmap.put("board_name", board_name);
		etcmap.put("r_team_code", r_team_code);
		
		etc.add(etcmap);
		
		
		String boardList_and = null;
		String CARDLISTMAP = null;
		String BLISTMAP = null;
		String profileMap = null;
		
		Map<String,List<Map<String,String>>>  test = new HashMap<String,List<Map<String,String>>>();
		 
		List<Map<String,String>> CARDLISTMAP_map = new ArrayList<Map<String,String>>();
		
		try {
			
			jsonArray = new JSONArray(result);
			jobj = (JSONObject)jsonArray.get(0);
			
			boardList_and = jobj.toString();
			
			 CARDLISTMAP =jobj.get("CARDLISTMAP").toString();
			 BLISTMAP =jobj.get("BLISTMAP").toString();
			 profileMap =jobj.get("porfileMap").toString();
			 
			 
			 
			 
			 test.put("CARDLISTMAP", (List<Map<String,String>> ) gson.fromJson(CARDLISTMAP, CARDLISTMAP_map.getClass()));
			 test.put("BLISTMAP", (List<Map<String,String>> ) gson.fromJson(BLISTMAP, CARDLISTMAP_map.getClass()));
			 test.put("profileMap", (List<Map<String,String>> ) gson.fromJson(profileMap, CARDLISTMAP_map.getClass()));
			 test.put("etcMap", etc);
			 
			 // BoardVO[] boards = gson.fromJson(board,BoardVO[].class);
	         // final List<BoardVO> boardList = Arrays.asList(boards);
			 
			 
			Object obj = gson.toJson(jobj.get("CARDLISTMAP"));
			
		} catch (Exception e) {
			logger.info(e.toString());
			
		}
		
		return test;
	
}
	
	
	
	@ResponseBody
	@RequestMapping(value ="cardSel")
	Map<String,List<Map<String,Object>>> CardSel(@RequestParam Map<String,Object> pMap) {
		logger.info("cardsel");
		List<Map<String,Object>> cardList =new ArrayList<Map<String,Object>>();
		cardList = androidDao.cardSEL(pMap);
			
			
		// 데이터 파싱 시작 
		
		Gson gson = new Gson();
		JSONArray jsonArray = null;
		JSONObject jobj = null;
		String s=null;
		
		
		String result=gson.toJson(cardList);
		
		List<Map<String,Object>> etc = new ArrayList<Map<String,Object>>();
		Map<String,Object> etcmap = new HashMap<String, Object>();
		
		String card_code  =(String) cardList.get(0).get("card_code");
		String card_name =(String) cardList.get(0).get("card_name");
		String card_duedate =(String) cardList.get(0).get("card_duedate");
		
		etcmap.put("card_code", card_code);
		etcmap.put("card_name", card_name);
		etcmap.put("card_duedate", card_duedate);
		
		etc.add(etcmap);
		
		String labelMap = null;
		String commentsMap = null;
		String desMap = null;
		String partiMap = null;
		String checkMap = null;
		String checklistMap = null;
		String fileMap = null;
		
		
		Map<String,List<Map<String,Object>>>  test = new HashMap<String,List<Map<String,Object>>>();
		List<Map<String,Object>> CARDLISTMAP_map = new ArrayList<Map<String,Object>>();
			
		
try {
			
			jsonArray = new JSONArray(result);
			jobj = (JSONObject)jsonArray.get(0);
			
			
			labelMap 		=jobj.get("labelMap").toString();
			commentsMap 	=jobj.get("commentsMap").toString();
			partiMap 		=jobj.get("partiMap").toString();
			checkMap 		=jobj.get("checkMap").toString();
			checklistMap	=jobj.get("checklistMap").toString();
			fileMap 		=jobj.get("fileMap").toString();
			desMap 			=jobj.get("desMap").toString();			 
			 
			 test.put("labelMap" 	, (List<Map<String,Object>> ) gson.fromJson(labelMap, CARDLISTMAP_map.getClass()));
			 test.put("commentsMap" , (List<Map<String,Object>> ) gson.fromJson(commentsMap, CARDLISTMAP_map.getClass()));
			 test.put("partiMap" 	, (List<Map<String,Object>> ) gson.fromJson(partiMap, CARDLISTMAP_map.getClass()));
			 test.put("checkMap" 	, (List<Map<String,Object>> ) gson.fromJson(checkMap, CARDLISTMAP_map.getClass()));
			 test.put("checklistMap", (List<Map<String,Object>> ) gson.fromJson(checklistMap, CARDLISTMAP_map.getClass()));
			 test.put("fileMap" 	, (List<Map<String,Object>> ) gson.fromJson(fileMap, CARDLISTMAP_map.getClass()));
			 test.put("desMap" 	, (List<Map<String,Object>> ) gson.fromJson(desMap, CARDLISTMAP_map.getClass()));
			 test.put("etcMap", etc);
			 
			 
			
		} catch (Exception e) {
			logger.info(e.toString());
			
		}
			
			
			
			
			return test;
		}
	
	
	
	
	@ResponseBody
	   @RequestMapping(value ="chatList", produces="text/plain;charset=utf-8")
	   String chatList(@RequestParam String mem_id){
		
		Gson gson = new Gson();
	      
	      
	      Map<String,List<Map<String,Object>>>  chatList = new HashMap<String,List<Map<String,Object>>> ();
	      
	      List<Map<String,Object>> getPrivate = androidDao.getPrivate(mem_id);
	      List<Map<String,Object>> getTeam = androidDao.getTeam(mem_id);
	      chatList.put("team",getTeam);
	      chatList.put("private",getPrivate);
	      
	      String test = gson.toJson(chatList);
	      logger.info(test);
	      
	      
	      
	      return test;
	   }
	

	
	
	
	
	
	
	
	
	
	
	 
}
