package com.room.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.PageMaker;
import com.room.admin.dto.PaymentDTO;
import com.room.admin.dto.SearchCriteria;
import com.room.admin.service.AdminService;
import com.room.member.dto.MemberDTO;



@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
    @Inject    //서비스를 호출하기 위해서 의존성을 주입
    AdminService adminService;
    //--------------------------------------------------------------------------------------------------
    // 관리자페이지 get
    //--------------------------------------------------------------------------------------------------
    @RequestMapping(value = "/adminMain", method = RequestMethod.GET)
    public String adminMain() throws Exception {
    	return "/admin/adminMain";
    }
	
	// -------------------------------------------------------------------------------------------------
	// 공지사항 추가 GET
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/notice/noticeInsert", method = RequestMethod.GET)
	public String getNotice() throws Exception {
		return "/admin/notice/noticeInsert";
	}
	// -------------------------------------------------------------------------------------------------
	// 공지사항 추가  POST
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/notice/noticeInsert", method = RequestMethod.POST)
	public String writeNoitce(BoardDTO boardDTO) throws Exception {
		
		adminService.noticeWrite(boardDTO);
		
		return "redirect:/admin/notice/noticeList";
	}
	// -------------------------------------------------------------------------------------------------
	// 공지사항 list 페이징
	// -------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/notice/noticeList", method = RequestMethod.GET)
		public String noticeList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
			logger.info("noticeList");
			
			model.addAttribute("list", adminService.list(scri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(adminService.listCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			return "admin/notice/noticeList";
		}
		
	//-------------------------------------------------------------------------------------------------------
	//공지사항 상세페이지	
	//-------------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/notice/noticeDetail", method = RequestMethod.GET)
		public String noticeDetail( Model model, @RequestParam("n") int notice_bno, BoardDTO boardDTO) throws Exception {
		
		logger.info("noticeDetail");
		
		boardDTO.setNotice_bno(notice_bno);
		model.addAttribute("detail", adminService.detailView(boardDTO.getNotice_bno()));
		
		return "admin/notice/noticeDetail";
		
		}
	//-------------------------------------------------------------------------------------------------------
	//공지사항 수정 GET	
	//-------------------------------------------------------------------------------------------------------		
		@RequestMapping(value = "/notice/noticeUpdate", method = RequestMethod.GET)
		public String noticeUpdateView(@RequestParam("n") int notice_bno, BoardDTO boardDTO, Model model) throws Exception {
			logger.info("noticeUpdateView");
			
			boardDTO.setNotice_bno(notice_bno);
			model.addAttribute("update", adminService.detailView(boardDTO.getNotice_bno()));
			
			
			return "admin/notice/noticeUpdate";
		}
		//-------------------------------------------------------------------------------------------------------
		//공지사항 수정 POST	
		//-------------------------------------------------------------------------------------------------------		
		@RequestMapping(value = "/notice/noticeUpdate", method = RequestMethod.POST)
		public String noticeUpdate(@RequestParam("n") int notice_bno, BoardDTO boardDTO, Model model) throws Exception {
			logger.info("noticeUpdate");
			
			boardDTO.setNotice_bno(notice_bno);
			
			adminService.noticeUpdate(boardDTO);
			
			return "redirect:/admin/notice/noticeList";
		}
		
		//-------------------------------------------------------------------------------------------------------
		//공지사항 삭제 GET	
		//-------------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/notice/noticeDelete", method = RequestMethod.GET)
		public String noticeDelete(@RequestParam("n") int notice_bno, BoardDTO boardDTO, Model model) throws Exception {
			logger.info("noticeDelete");
			
			boardDTO.setNotice_bno(notice_bno);
			
			adminService.noticeDelete(boardDTO);
			
			return "redirect:/admin/notice/noticeList";
		}
		/*-----------------------------------------------------------------------------------------------------------
		* 회원 목록(Paging 처리)
		----------------------------------------------------------------------------------------------------------*/
		@RequestMapping(value="/member/memberList", method=RequestMethod.GET)
		   public ModelAndView memberList(SearchCriteria cri,HttpSession session) throws Exception {
			String m_id = (String) session.getAttribute("m_id");
			int m_power = (adminService.searchM_power(m_id));
			
			ModelAndView mav = new ModelAndView("/admin/member/memberList");
		    
			PageMaker pageMaker = new PageMaker();	
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(adminService.memberListTotalCount(cri));
			
			//List<ManagerDTO>  list = adminService.memberListPaging(cri);
			List<MemberDTO>  list = adminService.memberListPaging(cri);
			mav.addObject("m_power",m_power);
			mav.addObject("list", list);
		    mav.addObject("pageMaker", pageMaker);
		        
		    return mav;
		    
		}
		
		/*-----------------------------------------------------------------------------------------------------------
		* 회원 번호에 해당하는 상세정보화면
		----------------------------------------------------------------------------------------------------------*/
		@RequestMapping("/member/memberDetail/{m_bno}")
		private String memberDetail(@PathVariable String m_bno, Model model,HttpSession session) throws Exception {
			String m_id = (String) session.getAttribute("m_id");
			model.addAttribute("m_power",adminService.searchM_power(m_id));
			model.addAttribute("detail", adminService.memberDetail(m_bno));
			
			return "/admin/member/memberDetail";
		}
		
		/*-----------------------------------------------------------------------------------------------------------
		* 회원 수정
		----------------------------------------------------------------------------------------------------------*/
		@RequestMapping("/member/update")
		private String memberUpdate(MemberDTO memberDTO, HttpServletRequest request, Model model) throws Exception {
			
			adminService.memberUpdate(memberDTO);
			
			model.addAttribute("detail", adminService.memberDetail(memberDTO.getM_bno()));
			return "/admin/member/memberDetail";
			
		}
		
		/*-----------------------------------------------------------------------------------------------------------
		* 회원 삭제
		----------------------------------------------------------------------------------------------------------*/
		@RequestMapping("/member/delete/{m_bno}")
		private String memberDelete(@PathVariable String m_bno) throws Exception {
			
			adminService.memberDelete(m_bno);
			
			return "redirect:/admin/member/memberList";
		}
		// -------------------------------------------------------------------------------------------------
		// 결제수단 list 페이징
		// -------------------------------------------------------------------------------------------------
			@RequestMapping(value = "/payment/paymentList", method = RequestMethod.GET)
			public String paymentList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
				logger.info("paymentList");
				
				model.addAttribute("list", adminService.paymentList(scri));
				
				
				return "admin/payment/paymentList";
			}
		
		// -------------------------------------------------------------------------------------------------
		// 공지사항 GET
		// -------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/payment/paymentInsert", method = RequestMethod.GET)
		public String getPayment() throws Exception {
			return "/admin/payment/paymentInsert";
		}
		// -------------------------------------------------------------------------------------------------
		// 공지사항 POST
		// -------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/payment/paymentInsert", method = RequestMethod.POST)
		public String insertPayment(PaymentDTO paymentDTO) throws Exception {
			
			adminService.insertPayment(paymentDTO);
			
			return "redirect:/admin/payment/paymentList";
		}

		
		//-------------------------------------------------------------------------------------------------------
		//공지사항 상세페이지	
		//-------------------------------------------------------------------------------------------------------
			@RequestMapping(value = "/payment/paymentDetail", method = RequestMethod.GET)
			public String paymentDetail( Model model, @RequestParam("n") int pay_bno, PaymentDTO paymentDTO) throws Exception {
			
			logger.info("paymentDetail");
			
			paymentDTO.setPay_bno(pay_bno);
			model.addAttribute("detail", adminService.paymentdetailView(paymentDTO.getPay_bno()));
			
			return "admin/payment/paymentDetail";
			
			}
		//-------------------------------------------------------------------------------------------------------
		//공지사항 수정 GET	
		//-------------------------------------------------------------------------------------------------------		
			@RequestMapping(value = "/payment/paymentUpdate", method = RequestMethod.GET)
			public String paymentUpdateView(@RequestParam("n") int pay_bno, PaymentDTO paymentDTO, Model model) throws Exception {
				logger.info("noticeUpdateView");
				
				paymentDTO.setPay_bno(pay_bno);
				model.addAttribute("update", adminService.paymentdetailView(paymentDTO.getPay_bno()));
				
				
				return "admin/payment/paymentUpdate";
			}
			//-------------------------------------------------------------------------------------------------------
			//공지사항 수정 POST	
			//-------------------------------------------------------------------------------------------------------		
			@RequestMapping(value = "/payment/paymentUpdate", method = RequestMethod.POST)
			public String paymentUpdate(@RequestParam("n") int pay_bno, PaymentDTO paymentDTO) throws Exception {
				logger.info("noticeUpdate");
				
				paymentDTO.setPay_bno(pay_bno);
				
				adminService.paymentUpdate(paymentDTO);
				
				return "redirect:/admin/payment/paymentList";
			}
			
			//-------------------------------------------------------------------------------------------------------
			//공지사항 삭제 GET	
			//-------------------------------------------------------------------------------------------------------
			@RequestMapping(value = "/payment/paymentDelete", method = RequestMethod.GET)
			public String paymentDelete(@RequestParam("n") int pay_bno, PaymentDTO paymentDTO) throws Exception {
				logger.info("noticeDelete");
				
				paymentDTO.setPay_bno(pay_bno);
				
				adminService.paymentDelete(paymentDTO);
				
				return "redirect:/admin/payment/paymentList";
			}
		
}
