package com.meet;

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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.vo.MeetRoomVO;


@Controller
@SessionAttributes(value= {"MEM_ID","MEM_NAME"})
@RequestMapping(value="/meetRoom/")
public class MeetRoomController {
	Logger logger = Logger.getLogger(MeetRoomController.class);
	@Autowired
	MeetRoomLogic mtRoom_logic =null;
	
	@PostMapping("meetRoomIns")
	public String meetRoomIns(Model model,@RequestParam Map<String,Object> pMap,@RequestParam("mr_image") MultipartFile mr_img ) {
		String savePath = "C:\\Users\\kosmo05-15\\git\\4People_last2Spring\\4People_last2Spring\\WebContent\\pds\\";//첨부파일이 다운로드될 물리적인 경로 등록
		String mr_name = (String)pMap.get("mr_name");
		//첨부파일이 있니?
				if(mr_img !=null) {
					//실제 존재하는 파일이름을 객체로 생성해주는 클래스
					//File이름만 객체로 생성해 줄 뿐 실제 파일안에 들어있는 내용까지 포함하지는 않음.
					//파일 내용을 처리하는 코드는 따로 처리해야 함.(OutputStream사용)
					if(!mr_img.isEmpty()) {
						String filename = mr_name+mr_img.getOriginalFilename();
						pMap.put("mr_image", filename);
						String fullPath = savePath+"\\"+filename;
						File file = new File(fullPath);
						System.out.println(filename);
						try {
							byte[] bytes = mr_img.getBytes();
							//사용자가 선택한 파일이름으로 생성된 File객체를 활용하여 
							//OutputStream생성 후 파일 내용 담아야 함.
							BufferedOutputStream bos = 
									new BufferedOutputStream(
											new FileOutputStream(file));
							//첨부파일에 실제 내용 담는 코드
							bos.write(bytes);
							bos.close();
							//첨부파일의 크기 계산
							long size=  file.length();
							//첨부파일 크기를 kByte로 계산하여 담기
							double d_size = Math.floor(size/1024.0);
							int i_size = (int)d_size;
							try {
								Thread.sleep(4500);
							} catch (InterruptedException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
					}//////////end of if - 첨부파일 처리끝
				}
		for(String key:pMap.keySet()) {
			System.out.println("key=="+key+" value=="+pMap.get(key));
		}
		mtRoom_logic.meetRoomIns(pMap);
		return "redirect:myMeetingRoom";
	}
	@RequestMapping("roomSearch")
	public String roomSearch(Model model,ModelMap mMap,@RequestParam Map<String,Object> pMap) {
		String searchDate = (String)pMap.get("searchDate");
		int searchInwon = Integer.parseInt((String) pMap.get("searchInwon"));
		pMap.remove("searchInwon");
		pMap.put("searchInwon",searchInwon);
		logger.info(searchDate);
		String mem_id =(String)mMap.get("MEM_ID");
		pMap.put("mem_id",mem_id);
		for(String key:pMap.keySet()) {
			logger.info("------------------"+pMap.get(key)+"value="+pMap.get(key));
		}
		List<Map<String,Object>> roomSearch = mtRoom_logic.roomSearch(pMap,searchDate);
		model.addAttribute("searchDate",searchDate);
		model.addAttribute("searchInwon",String.valueOf(searchInwon));
		model.addAttribute("roomSearch",roomSearch);
		
		return "forward:meetReserVation.jsp";
	}
//	@PostMapping("nextDateRoom")
//	public String nextDateRoom(Model model,@RequestParam Map<String,Object> pMap) {
////		List<Map<String,Object>> nextDateRoomList =mtRoom_logic.nextDateRoom(pMap);
//		return "nextDateRoomResult.jsp";
//	}
	@RequestMapping("myMeetingRoom")
	public String myMeetingRoom(Model model,ModelMap mMap) {
		String mem_id =(String)mMap.get("MEM_ID");
		List<Map<String,Object>> myMeetingRoomNames = mtRoom_logic.myMeetingRoom(mem_id);
		model.addAttribute("myMeetingRoomNames", myMeetingRoomNames);
		return "forward:myMeetingRoom.jsp";
	}
	@PostMapping("changeRoom")
	public String changeRoom(Model model,ModelMap mMap,@RequestParam Map<String,Object> pMap) {
		String mem_id =(String)mMap.get("MEM_ID");
		pMap.put("mem_id",mem_id);
		List<Map<String,Object>> teamAuthority = mtRoom_logic.teamAuthority(pMap);
		logger.info(pMap.toString()+"=======================");
		List<Map<String,Object>> meetingRoomInfo = mtRoom_logic.meetingRoomInfo(pMap);
		model.addAttribute("meetingRoomInfo",meetingRoomInfo);
		model.addAttribute("teamAuthority",teamAuthority);
		return "forward:changeRoomResult.jsp";
	}
	@PostMapping("roomUpd")
	public String roomUpd(Model model,@RequestParam Map<String,Object> pMap,@RequestParam("mr_image") MultipartFile mr_img ) {
		
		String savePath = "\\\\192.168.0.6\\\\pds";//첨부파일이 다운로드될 물리적인 경로 등록
		String mr_name = (String)pMap.get("mr_name");
		//첨부파일이 있니?
		if(mr_img !=null) {
			//실제 존재하는 파일이름을 객체로 생성해주는 클래스
			//File이름만 객체로 생성해 줄 뿐 실제 파일안에 들어있는 내용까지 포함하지는 않음.
			//파일 내용을 처리하는 코드는 따로 처리해야 함.(OutputStream사용)
			if(!mr_img.isEmpty()) {
				String filename = mr_name+mr_img.getOriginalFilename();
				pMap.put("mr_image", filename);
				String fullPath = savePath+"\\"+filename;
				File file = new File(fullPath);
				System.out.println(filename);
				try {
					byte[] bytes = mr_img.getBytes();
					//사용자가 선택한 파일이름으로 생성된 File객체를 활용하여 
					//OutputStream생성 후 파일 내용 담아야 함.
					BufferedOutputStream bos = 
							new BufferedOutputStream(
									new FileOutputStream(file));
					//첨부파일에 실제 내용 담는 코드
					bos.write(bytes);
					bos.close();
					//첨부파일의 크기 계산
					long size=  file.length();
					//첨부파일 크기를 kByte로 계산하여 담기
					double d_size = Math.floor(size/1024.0);
					int i_size = (int)d_size;
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
		for(String key:pMap.keySet()) {
			System.out.println("key=="+key+" value=="+pMap.get(key));
		}
		mtRoom_logic.roomUpd(pMap);
		return "redirect:myMeetingRoom";
	}
	@PostMapping("roomTeamInsert")
	public String roomTeamInsert (Model model,ModelMap mMap,@RequestParam Map<String,Object> pMap) {
		String mem_id =(String)mMap.get("MEM_ID");
		pMap.put("mem_id",mem_id);
		for(String key:pMap.keySet()) {
			logger.info("------------------"+pMap.get(key)+"value="+pMap.get(key));
		}
		List<Map<String,Object>> roomTeamInsert = mtRoom_logic.roomTeamInsert(pMap);
		model.addAttribute("roomTeamInsert",roomTeamInsert);
		return"forward:roomTeamInsertResult.jsp";
	}
	@PostMapping("teamAuthorityIns")
	public String teamAuthority(Model model,ModelMap mMap,@RequestParam Map<String,Object> pMap) {
		String mem_id =(String)mMap.get("MEM_ID");
		for(String key:pMap.keySet()) {
			logger.info("key?="+key+"value?="+pMap.get(key));
		}
		List<Map<String, Object>> getTemaInfo=mtRoom_logic.teamAuthorityIns(pMap);
		model.addAttribute("getTemaInfo",getTemaInfo);
		return "forward:teamAuthorityInsResult.jsp";
	}
	@PostMapping("teamDelete")
	public String teamDelete(@RequestParam Map<String,Object> pMap) {
		mtRoom_logic.teamDelete(pMap);
		for(String key:pMap.keySet()) {
			logger.info("key?="+key+"value?="+pMap.get(key));
		}
		return "redirect:teamRoomDeleteResult.jsp";
	}
	@PostMapping("availableTeams")
	@ResponseBody
	public List<Map<String,Object>> availableTeams(@RequestParam Map<String,Object> pMap) {
		List<Map<String,Object>> availableTeams = mtRoom_logic.availableTeams(pMap);
		return availableTeams;
	}
	@RequestMapping("reservationOk")
	public String reservationOk(@RequestParam Map<String,Object> pMap,ModelMap mMap) {
		String mem_id =(String)mMap.get("MEM_ID");
		String mem_name =(String)mMap.get("MEM_NAME");
		pMap.put("mem_id",mem_id);
		pMap.put("mem_name",mem_name);
		
		for(String key:pMap.keySet()) {
			logger.info("key?="+key+"value?="+pMap.get(key));
		}
		mtRoom_logic.reservationOk(pMap);
		
		return "redirect:myReserVation";
	}
	@RequestMapping("myReserVation")
	public String myReserVation(ModelMap mMap,Model model) {
		String mem_id =(String)mMap.get("MEM_ID");
		
		Map<String, Object> sizes = mtRoom_logic.myReserVation(mem_id);
		model.addAttribute("sizes", sizes);
		
		return "forward:myReserVation.jsp";
	}
	@PostMapping("afterDate")
	public String afterDate(ModelMap mMap,Model model) {
		String mem_id =(String)mMap.get("MEM_ID");
		List<Map<String, Object>> afterDateList = mtRoom_logic.afterDate(mem_id);
		model.addAttribute("afterDateList",afterDateList);
		return "forward:afterDateResult.jsp";
	}
	@PostMapping("beforeDate")
	public String beforeDate(ModelMap mMap,Model model) {
		String mem_id =(String)mMap.get("MEM_ID");
		List<Map<String, Object>> beforeDateList = mtRoom_logic.beforeDate(mem_id);
		model.addAttribute("beforeDateList",beforeDateList);
		return "forward:beforeDateResult.jsp";
	}
	@PostMapping("hapDate")
	public String hapDate(ModelMap mMap,Model model) {
		String mem_id =(String)mMap.get("MEM_ID");
		List<Map<String, Object>> hapDateList = mtRoom_logic.hapDate(mem_id);
		model.addAttribute("hapDateList",hapDateList);
		return "forward:hapDateResult.jsp";
	}
	@PostMapping("reservationCancel")
	@ResponseBody
	public int reservationCancel(@RequestParam("re_code") String re_code,Model model) {
		int result =mtRoom_logic.reservationCancel(re_code);
		return result;
	}
	@GetMapping("reCalList")
	   public String reservationCal(HttpServletRequest req,@ModelAttribute MeetRoomVO mrVO, Model model) {
	      logger.info("회의실 캘린더 호출 성공");
	      HttpSession session = req.getSession();
	      //String mr_no = String.valueOf(req.getAttribute("MR_NO"));
	      //mrVO.setMr_no(mr_no);
	      //logger.info("mr_no: "+mr_no);
	      logger.info(mrVO.getMr_no());
	      String mem_id = String.valueOf(session.getAttribute("MEM_ID"));
	      mrVO.setMem_id(mem_id);
	      List<Map<String, Object>> reCalList = null;
	      reCalList = mtRoom_logic.reservationCal(mrVO);
	      mrVO.setMr_start(mrVO.getMr_hopedate()+" "+mrVO.getMr_starttime());
	      model.addAttribute("reCalList", reCalList);
	      logger.info("reCalList :"+reCalList);
	      return "forward:calendar.jsp";
	   }
	}
