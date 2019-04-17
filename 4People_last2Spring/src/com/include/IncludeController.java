package com.include;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value="/include/")
public class IncludeController{
	@Autowired
	IncludeLogic i_logic =null;
	String category = "";
	String crud= "";
	Logger logger=  Logger.getLogger(IncludeController.class);
	
	
	
	@PostMapping("sidebarTeam")
	public String sidebarTeam(HttpServletRequest req,Model model, @RequestParam Map<String,Object> pMap) {
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id",mem_id);
		List<Map<String,Object>> sideTeamList = i_logic.sideTeamList(pMap);
		model.addAttribute("sideTeamList",sideTeamList);
		return "forward:/include/Result.jsp";
	}
	@PostMapping("messageCount")
	public String messageCount(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		int count =i_logic.messageCount(mem_id);
		String messageCount = String.valueOf(count);
		model.addAttribute("messageCount", messageCount);
		return"forward:/include/Result.jsp";
	}
	@PostMapping("profile")
	public String profile(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		List<Map<String,Object>> profileList = i_logic.profile(mem_id);
		model.addAttribute("profileList", profileList);
		return "forward:profileResult.jsp";
	}
	@PostMapping("passwordOk")
	public String passwordOk(HttpServletRequest req,Model model, @RequestParam Map<String,Object> pMap) {
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id",mem_id);
		int result = i_logic.passwordOk(pMap);
		model.addAttribute("result",result);
		model.addAttribute("command",pMap.get("command"));
		logger.info("====="+result);
		return "forward:passwordOk.jsp";
	}
	@PostMapping("newPasswordUpd")
	public String newPasswordUpd(HttpServletRequest req,Model model, @RequestParam Map<String,Object> pMap,@RequestParam("mem_img") MultipartFile mem_img ) {
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		pMap.put("mem_id",mem_id);
		String savePath = "\\\\192.168.0.6\\pds";//첨부파일이 다운로드될 물리적인 경로 등록
		
		//첨부파일이 있니?
		if(mem_img !=null) {
			//실제 존재하는 파일이름을 객체로 생성해주는 클래스
			//File이름만 객체로 생성해 줄 뿐 실제 파일안에 들어있는 내용까지 포함하지는 않음.
			//파일 내용을 처리하는 코드는 따로 처리해야 함.(OutputStream사용)
			if(!mem_img.isEmpty()) {
				String filename = mem_id+mem_img.getOriginalFilename();
				pMap.put("mem_image", filename);
				String fullPath = savePath+"\\"+filename;
				File file = new File(fullPath);
				try {
					byte[] bytes = mem_img.getBytes();
					//사용자가 선택한 파일이름으로 생성된 File객체를 활용하여 
					//OutputStream생성 후 파일 내용 담아야 함.
					BufferedOutputStream bos = 
							new BufferedOutputStream(
									new FileOutputStream(file));
					//첨부파일에 실제 내용 담는 코드
					bos.write(bytes);
					bos.close();
					try {
						Thread.sleep(5000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//////////end of if - 첨부파일 처리끝
		}
		i_logic.newPasswordUpd(pMap);
		
		return "redirect:profile.jsp";
	}
	@PostMapping("profileUpd")
	public String profileUpd(HttpServletRequest req,Model model, @RequestParam Map<String,Object> pMap,@RequestParam("mem_img") MultipartFile mem_img ) {
		HttpSession session = req.getSession();
		session.setAttribute("MEM_NAME",pMap.get("profile_name"));
		session.setAttribute("MEM_COMPANYNAME",pMap.get("profile_companyName"));
		session.setAttribute("MEM_POSITION",pMap.get("profile_position"));
		String mem_id  = (String)pMap.get("profile_id");
		for(String key:pMap.keySet()) {
			logger.info("key="+key+"  value="+pMap.get(key));
		}

		//첨부파일이 있니?
		if(mem_img !=null) {
			//실제 존재하는 파일이름을 객체로 생성해주는 클래스
			//File이름만 객체로 생성해 줄 뿐 실제 파일안에 들어있는 내용까지 포함하지는 않음.
			//파일 내용을 처리하는 코드는 따로 처리해야 함.(OutputStream사용)
			if(!mem_img.isEmpty()) {
				String savePath = "\\\\192.168.0.6\\pds";//첨부파일이 다운로드될 물리적인 경로 등록
				String filename = mem_id+mem_img.getOriginalFilename();
				session.setAttribute("MEM_IMAGE",filename);
				pMap.put("mem_image", filename);
				String fullPath = savePath+"\\"+filename;
				File file = new File(fullPath);
				try {
					byte[] bytes = mem_img.getBytes();
					//사용자가 선택한 파일이름으로 생성된 File객체를 활용하여 
					//OutputStream생성 후 파일 내용 담아야 함.
					BufferedOutputStream bos = 
							new BufferedOutputStream(
									new FileOutputStream(file));
					//첨부파일에 실제 내용 담는 코드
					bos.write(bytes);
					bos.close();
					try {
						Thread.sleep(5000);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}//////////end of if - 첨부파일 처리끝
		}
		i_logic.profileUpd(pMap);
		
		return "redirect:profile.jsp";
	}
	
	@GetMapping("memberDelete")
	public String memberDelete(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		i_logic.memberDelete(mem_id);
		return "../intro/intro.jsp";
	}
	@PostMapping("sidebarMeet")
	@ResponseBody
	public List<Map<String,Object>> sidebarMeet(HttpServletRequest req){
		HttpSession session = req.getSession();
		String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
		List<Map<String,Object>> sidebarMeet = i_logic.sidebarMeet(mem_id);
		return sidebarMeet;
	}
	
}
