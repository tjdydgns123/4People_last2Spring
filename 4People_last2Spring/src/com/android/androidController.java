package com.android;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	@RequestMapping(value ="boardListSel" ,produces="text/plain;charset=utf-8")
	List<Map<String,Object>> BoardList(@RequestParam Map<String,Object> pMap) {
		
		logger.info("sel호출");
		logger.info(pMap.get("board_no").toString());
		List<Map<String,Object>> b_boardList = androidDao.BoardListsel(pMap);
		

	return b_boardList;
	
}
	
	
	
	
	
	
	
	
	
	 
}
