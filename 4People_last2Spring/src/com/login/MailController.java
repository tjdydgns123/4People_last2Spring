package com.login;
 
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sun.istack.internal.logging.Logger;
 
@Controller
@RequestMapping(value = "/mail/")
public class MailController {
 
  @Autowired
  private JavaMailSender mailSender;
 
 
  // mailForm
  @RequestMapping(value = "/mail/mailForm")
  public String mailForm() {
   
    return "redirect:/login/mailForm.jsp";
  }  
 
  // mailSending 코드
  @PostMapping(value = "mailSending")
  public String mailSending(HttpServletRequest request) {
	  
	  Logger logger = Logger.getLogger(mailForm().getClass());
	  logger.info("호출");
	  
	  String send_email= request.getParameter("send_email");
	  String email_key = request.getParameter("email_key");
	  
	  logger.info(send_email);
	  logger.info(email_key);
	  
	  
	  
    String setfrom = "dudtjd7820@gmail.com";         
    String tomail  = request.getParameter("send_email");     // 받는 사람 이메일
    String title   = "4 people 인증번호입니다 .";     // 제목
    String content = "이메일 인증 번호 : "+email_key;
    // 내용
   
    try {
      MimeMessage message = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper 
                        = new MimeMessageHelper(message, true, "UTF-8");
 
      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
      messageHelper.setTo(tomail);     // 받는사람 이메일
      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
      messageHelper.setText(content);  // 메일 내용
     
      mailSender.send(message);
    } catch(Exception e){
      System.out.println(e);
    }
   
    return "redirect:/login/mailForm.jsp";
  }
} 