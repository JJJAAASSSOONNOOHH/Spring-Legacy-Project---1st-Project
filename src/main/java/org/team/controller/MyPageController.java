package org.team.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.team.join.MemberDTO;
import org.team.mypage.PageDTO;
import org.team.mypage.orderCriteria;
import org.team.mypage.orderDTO;
import org.team.mypage.orderService;
import org.team.mypage.updateService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/*")
@Log4j
public class MyPageController {
	@Autowired
	private updateService updateservice;
	
	@Autowired
	private orderService orderservice;
	
	@GetMapping("/myPage")
	 public void myPage() {
	      log.info("myPage get 페이지");

	}
	

	@GetMapping("/orderTracking")
	public void mypage(orderCriteria cri, Model model) {
		log.info("cri : "+cri);
		List<orderDTO> oDTO = orderservice.orderListWithPaging(cri);
		
		model.addAttribute("orderList", oDTO);
		
		int total = orderservice.getTotalOrderCount(cri);
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		
	}
		
	@GetMapping("openApiAddress")
	   public void oepnApiAddress() {
	      log.info("openApiAddress get 페이지");
   }
	
	
   //open API ADDRESS 페이지에서 Join페이지로 정보를 갖고 돌아올 때 필요
   @PostMapping("openApiAddress")
   public void oepnApiAddress2() {
      log.info("openApiAddress2 post 페이지");
   }
   
   
   @RequestMapping(value="/memberUpdate", method=RequestMethod.POST, produces = "application/json; charset=UTF-8")
   public String memberUpdate(MemberDTO member) throws Exception {
      
      log.info("update: "+ member);
      int i = updateservice.update(member);
      log.info("update i : "+ i);
      return "mypage/myPage";
   }
   
   
   @RequestMapping(value="passwordCheck", method =RequestMethod.POST)
   @ResponseBody
   public String passwordCheck(String password, int id) throws Exception{
	   MemberDTO member = new MemberDTO();
	   member.setId(id);
	   member.setPassword(password);
      log.info("받은 memeber : " + member);
      int result = updateservice.passwordCheck(member);
      log.info("체크 결과 : " + result);
      if(result !=0) {
         return "success";
      }else {
         return "fail";
      }
   }
	   

}
   
