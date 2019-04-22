package com.login;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.util.HangulConversion;


@Controller
@RequestMapping(value="/login/")
public class LoginController  {
	@Autowired
	LoginLogic l_logic = null;
	Logger logger =  Logger.getLogger(LoginController.class);
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping(value = "/naverLogin", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "redirect:"+naverAuthUrl;
	}

	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result", apiResult);
		System.out.println(oauthToken.toString());
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
		
        /* 네이버 로그인 성공 페이지 View 호출 */
		return "forward:./naverResult.jsp";
	}


	@RequestMapping(value = "/navergogo", method = { RequestMethod.GET, RequestMethod.POST })
	public String navergogo(Model model, @RequestParam Map<String,Object>pMap,HttpServletRequest req) {
		String path =null;
		logger.info(pMap);
		pMap.get("mem_id");
		String mem_id = pMap.get("mem_id").toString();
		String [] s_mem_id = mem_id.split("@");
		String mmem_id = mem_id.replace(s_mem_id[1], "naver.com");
		pMap.put("mem_id",mmem_id);
		List<Map<String,Object>> loginList=l_logic.loginCall2(pMap);
		if(loginList!=null && loginList.size()>0) {
			logger.info(loginList);
			path = "forward:loginAction.jsp";
		}
		else {
			loginList = new ArrayList<Map<String,Object>>();
			loginList.add(pMap);
			path="forward:signUP.jsp";
		}
		model.addAttribute("loginList",loginList);
		return path; 
	}
	
	@PostMapping("login")
	public String login(Model model, @RequestParam Map<String,Object> pMap) {
		List<Map<String,Object>> loginList=l_logic.loginCall(pMap);
		model.addAttribute("loginList",loginList);
		//이동할 페이지.
		return "forward:loginAction.jsp";
	
	}
	@PostMapping("confirm")
	public String confirm(@RequestParam Map<String,Object> pMap) {
//		l_logic.confirm(pMap);
		return "confirmResult.jsp";
	}
	@RequestMapping("logout")
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("MEM_ID");
		session.removeAttribute("MEM_COMPANYNAME");
		session.removeAttribute("MEM_POSITION");
		session.removeAttribute("MEM_NAME");
		String team_code = (String)session.getAttribute("team_code");
		if(team_code!=null) {
			session.removeAttribute("team_code");
		}
		return "redirect:login.jsp";
	}
	
	@PostMapping(value="signUp")
	public String signUp(Model model, @RequestParam Map<String,Object> pMap) {
		String mem_addr ="";
		for(String key:pMap.keySet()) {
			if(key.equals("mem_addr1")||key.equals("mem_addr2")||key.equals("mem_addr3")) {
				mem_addr+=pMap.get(key);
			}
		}
		String mem_hp = pMap.get("mem_hp1")+"-"+pMap.get("mem_hp2")+"-"+pMap.get("mem_hp3");
		pMap.put("mem_hp", mem_hp);
		
		String mem_companyphone = pMap.get("mem_companyphone2")+"-"+pMap.get("mem_companyphone3")+"-"+pMap.get("mem_companyphone1");
		pMap.put("mem_companyphone", mem_companyphone);
		String mem_id = pMap.get("mem_id1")+"@"+pMap.get("mem_id2");
		pMap.put("mem_id", mem_id);
		pMap.put("mem_addr", mem_addr);
		pMap.put("mem_connect","0");
		int result =l_logic.signUp(pMap);
	model.addAttribute("result",result);
	return "forward:signUpResult.jsp";
	}
	
	@PostMapping("findId")
	@ResponseBody
	public String findId(@RequestParam Map<String,Object> pMap) {
		String idresult = l_logic.findId(pMap);
		return idresult;
	}
	@PostMapping("findpw")
	@ResponseBody
	public String findpw(@RequestParam Map<String,Object> pMap) {
		String idresult = l_logic.findpw(pMap);
		return idresult;
	}
	
	
	@RequestMapping(value = "/googleLogin")
	public String doGoogleSignInActionPage(Model model) throws Exception{
	  OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
	  String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
	  System.out.println("/member/googleSignIn, url : " + url);
	  model.addAttribute("google_url",url);
	  return "redirect:"+url;

	}
	
	
	@RequestMapping(value = "/googleSignInCallback",method = RequestMethod.GET)
	public String doSessionAssignActionPage(HttpServletRequest request,Model model)throws Exception{
	  String code = request.getParameter("code");
	  System.out.println("code="+code);

	  OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
	  AccessGrant accessGrant = oauthOperations.exchangeForAccess(code,googleOAuth2Parameters.getRedirectUri(),null);

	  String accessToken = accessGrant.getAccessToken();
	  System.out.println("accessToken="+accessToken);
	  Long expireTime = accessGrant.getExpireTime();
	  if (expireTime != null && expireTime < System.currentTimeMillis()) {
		  System.out.println("code5="+code);
	    accessToken = accessGrant.getRefreshToken();
	    System.out.printf("accessToken is expired. refresh token = {}", accessToken);
	  }
	  Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
	  Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();

	  PlusOperations plusOperations = google.plusOperations();
	  Person profile = plusOperations.getGoogleProfile();
	  
	  
	  
//	  System.out.println(profile.getAccountEmail());
	  String path="";
	  System.out.println(profile.getAccountEmail()+","+profile.getDisplayName());
	  List<Map<String, Object>>  memberInfo = l_logic.isMemberOk(profile.getAccountEmail());
	  if(memberInfo!=null&&memberInfo.size()>0) {
		  model.addAttribute("loginList",memberInfo);
		  path = "forward:loginAction.jsp";
	  }
	  else {
		  path = "forward:signUP.jsp";
		  model.addAttribute("mem_id",profile.getAccountEmail());
		  model.addAttribute("mem_name",profile.getDisplayName());
	  }
//	  System.out.println(profile.getDisplayName());

	  return path;
	}

	
	


}

