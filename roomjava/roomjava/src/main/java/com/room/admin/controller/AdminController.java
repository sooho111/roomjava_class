package com.room.admin.controller;

import java.util.ArrayList;
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
import com.room.admin.dto.Room_fncDTO;
import com.room.admin.dto.Room_rentDTO;
import com.room.admin.dto.SearchCriteria;
import com.room.admin.service.AdminService;
import com.room.main.dto.BookDTO;
import com.room.member.dto.FaqDTO;
import com.room.member.dto.FaqTypeDTO;
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
	@RequestMapping(value = "/board/noticeInsert", method = RequestMethod.GET)
	public String getNotice() throws Exception {
		return "/admin/board/noticeInsert";
	}
	// -------------------------------------------------------------------------------------------------
	// 공지사항 추가  POST
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/board/noticeInsert", method = RequestMethod.POST)
	public String writeNoitce(BoardDTO boardDTO) throws Exception {
		
		adminService.noticeWrite(boardDTO);
		
		return "redirect:/admin/board/boardList";
	}
	// -------------------------------------------------------------------------------------------------
	// faq 추가 GET
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/board/faqInsert", method = RequestMethod.GET)
	public String getFaq() throws Exception {
		return "/admin/board/faqInsert";
	}
	// -------------------------------------------------------------------------------------------------
	// faq 추가  POST
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/board/faqInsert", method = RequestMethod.POST)
	public String writeFaq(FaqDTO faqDTO) throws Exception {
		
		adminService.faqWrite(faqDTO);
		
		return "redirect:/admin/board/boardList";
	}
	//-------------------------------------------------------------------------------------------------------
	//faq 삭제 
	//-------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/board/faqDelete", method = RequestMethod.GET)
	public String faqDelete(@RequestParam("n") int faq_bno, FaqDTO faqDTO) throws Exception {
		logger.info("noticeDelete");
		
		faqDTO.setFaq_bno(faq_bno);
		
		adminService.faqDelete(faqDTO);
		
		return "redirect:/admin/board/boardList";
	}
	//-------------------------------------------------------------------------------------------------------
	//faq 수정 GET	
	//-------------------------------------------------------------------------------------------------------		
		@RequestMapping(value = "/board/faqUpdate", method = RequestMethod.GET)
		public String faqUpdateView(@RequestParam("n") int faq_bno, FaqDTO faqDTO, Model model) throws Exception {
			
			
			faqDTO.setFaq_bno(faq_bno);
			model.addAttribute("update", adminService.faqdetailView(faqDTO.getFaq_bno()));
			List<FaqTypeDTO> list= null;
			list = adminService.selectFaqType();
			model.addAttribute("selectFaqType", list);
			
			return "admin/board/faqUpdate";
		}
	//-------------------------------------------------------------------------------------------------------
	//faq 수정 POST	
	//-------------------------------------------------------------------------------------------------------		
		@RequestMapping(value = "/board/faqUpdate", method = RequestMethod.POST)
		public String faqUpdate(@RequestParam("n") int faq_bno,  FaqDTO faqDTO) throws Exception {
			
			
			faqDTO.setFaq_bno(faq_bno);
			
			adminService.faqUpdate(faqDTO);
			
			return "redirect:/admin/board/boardList";
		}
		



	// -------------------------------------------------------------------------------------------------
	// 보드 list 페이징
	// -------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/board/boardList", method = RequestMethod.GET)
		public String noticeList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
			logger.info("boardList");
			
			logger.info("list ==> " + adminService.list(scri));
			
			model.addAttribute("list", adminService.list(scri));
			model.addAttribute("faqlist", adminService.faqlist(scri));

			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(adminService.listCount(scri));
			PageMaker pageMaker2 = new PageMaker();
			pageMaker2.setCri(scri);
			pageMaker2.setTotalCount(adminService.faqlistCount(scri));
		
			
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("pageMaker2", pageMaker2);
			
			
			return "admin/board/boardList";
		}
		
	//-------------------------------------------------------------------------------------------------------
	//공지사항 상세페이지	
	//-------------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/board/noticeDetail", method = RequestMethod.GET)
		public String noticeDetail( Model model, @RequestParam("n") int notice_bno, BoardDTO boardDTO) throws Exception {
		
		logger.info("noticeDetail");
		
		boardDTO.setNotice_bno(notice_bno);
		model.addAttribute("detail", adminService.detailView(boardDTO.getNotice_bno()));
		
		return "admin/board/noticeDetail";
		
		}
	//-------------------------------------------------------------------------------------------------------
	//공지사항 수정 GET	
	//-------------------------------------------------------------------------------------------------------		
		@RequestMapping(value = "/board/noticeUpdate", method = RequestMethod.GET)
		public String noticeUpdateView(@RequestParam("n") int notice_bno, BoardDTO boardDTO, Model model) throws Exception {
			logger.info("noticeUpdateView");
			
			boardDTO.setNotice_bno(notice_bno);
			model.addAttribute("update", adminService.detailView(boardDTO.getNotice_bno()));
			
			
			return "admin/board/noticeUpdate";
		}
		//-------------------------------------------------------------------------------------------------------
		//공지사항 수정 POST	
		//-------------------------------------------------------------------------------------------------------		
		@RequestMapping(value = "/board/noticeUpdate", method = RequestMethod.POST)
		public String noticeUpdate(@RequestParam("n") int notice_bno, BoardDTO boardDTO, Model model) throws Exception {
			logger.info("noticeUpdate");
			
			boardDTO.setNotice_bno(notice_bno);
			
			adminService.noticeUpdate(boardDTO);
			
			return "redirect:/admin/board/boardList";
		}
		
		//-------------------------------------------------------------------------------------------------------
		//공지사항 삭제 GET	
		//-------------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/board/noticeDelete", method = RequestMethod.GET)
		public String noticeDelete(@RequestParam("n") int notice_bno, BoardDTO boardDTO, Model model) throws Exception {
			logger.info("noticeDelete");
			
			boardDTO.setNotice_bno(notice_bno);
			
			adminService.noticeDelete(boardDTO);
			
			return "redirect:/admin/board/boardList";
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
		// 결제수단 list 
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
			//결제항목 삭제 GET	
			//-------------------------------------------------------------------------------------------------------
			@RequestMapping(value = "/payment/paymentDelete", method = RequestMethod.GET)
			public String paymentDelete(@RequestParam("n") int pay_bno, PaymentDTO paymentDTO) throws Exception {
				logger.info("noticeDelete");
				
				paymentDTO.setPay_bno(pay_bno);
				
				adminService.paymentDelete(paymentDTO);
				
				return "redirect:/admin/payment/paymentList";
			}
			// -------------------------------------------------------------------------------------------------
			// 결제수단 list 
			// -------------------------------------------------------------------------------------------------
				@RequestMapping(value = "/etc/etcList", method = RequestMethod.GET)
				public String etcList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
					logger.info("etcList");
					
					model.addAttribute("list", adminService.fncList(scri));
					model.addAttribute("list2", adminService.rentList(scri));
					
					
					return "admin/etc/etcList";
				}
			// -------------------------------------------------------------------------------------------------
			// 기능 추가 GET
			// -------------------------------------------------------------------------------------------------
			@RequestMapping(value = "/etc/fncInsert", method = RequestMethod.GET)
			public String insertFncGet() throws Exception {
				return "/admin/etc/fncInsert";
			}
			// -------------------------------------------------------------------------------------------------
			// 대여 추가 GET
			// -------------------------------------------------------------------------------------------------
			@RequestMapping(value = "/etc/rentInsert", method = RequestMethod.GET)
			public String insertRentGet() throws Exception {
				return "/admin/etc/rentInsert";
			}
			// -------------------------------------------------------------------------------------------------
			// 기능 추가 POST
			// -------------------------------------------------------------------------------------------------
			@RequestMapping(value = "/etc/fncInsert", method = RequestMethod.POST)
			public String insertFncPost(Room_fncDTO room_fncDTO) throws Exception {
				
				adminService.insertfnc(room_fncDTO);
				
				return "redirect:/admin/etc/etcList";
			}
			// -------------------------------------------------------------------------------------------------
			// 기능 추가 POST
			// -------------------------------------------------------------------------------------------------
			@RequestMapping(value = "/etc/rentInsert", method = RequestMethod.POST)
			public String insertRentPost(Room_rentDTO room_rentDTO) throws Exception {
				
				adminService.insertrent(room_rentDTO);
				
				return "redirect:/admin/etc/etcList";
			}
			//-------------------------------------------------------------------------------------------------------
			//기능 수정 GET	///dddddd
			//-------------------------------------------------------------------------------------------------------		
			@RequestMapping(value = "/etc/fncUpdate", method = RequestMethod.GET)
			public String fncUpdateView(@RequestParam("n") int fnc_bno, Room_fncDTO room_fncDTO, Model model) throws Exception {
				
				
				room_fncDTO.setFnc_bno(fnc_bno);
				model.addAttribute("update", adminService.fncdetailView(room_fncDTO.getFnc_bno()));
				
				
				return "admin/etc/fncUpdate";
			}
			//-------------------------------------------------------------------------------------------------------
			//기능 수정 POST	
			//-------------------------------------------------------------------------------------------------------		
			@RequestMapping(value = "/etc/fncUpdate", method = RequestMethod.POST)
			public String fncUpdate(@RequestParam("n") int fnc_bno, Room_fncDTO room_fncDTO) throws Exception {
				
				
				room_fncDTO.setFnc_bno(fnc_bno);
				
				adminService.fncUpdate(room_fncDTO);
				
				return "redirect:/admin/etc/etcList";
			}
			
			//-------------------------------------------------------------------------------------------------------
			//대여 수정 GET	
			//-------------------------------------------------------------------------------------------------------		
			@RequestMapping(value = "/etc/rentUpdate", method = RequestMethod.GET)
			public String rentUpdateView(@RequestParam("n") int rent_bno, Room_rentDTO room_rentDTO, Model model) throws Exception {
				
				
				room_rentDTO.setRent_bno(rent_bno);
				model.addAttribute("update", adminService.rentdetailView(room_rentDTO.getRent_bno()));
				
				
				return "admin/etc/rentUpdate";
			}
			//-------------------------------------------------------------------------------------------------------
			//대여 수정 POST	
			//-------------------------------------------------------------------------------------------------------		
			@RequestMapping(value = "/etc/rentUpdate", method = RequestMethod.POST)
			public String fncUpdate(@RequestParam("n") int rent_bno, Room_rentDTO room_rentDTO) throws Exception {
				
				
				room_rentDTO.setRent_bno(rent_bno);
				
				adminService.rentUpdate(room_rentDTO);
				
				return "redirect:/admin/etc/etcList";
			}
			//-------------------------------------------------------------------------------------------------------
			//기능 삭제 
			//-------------------------------------------------------------------------------------------------------
			@RequestMapping(value = "/etc/fncDelete", method = RequestMethod.GET)
			public String fncDelete(@RequestParam("n") int fnc_bno, Room_fncDTO room_fncDTO) throws Exception {
				logger.info("noticeDelete");
				
				room_fncDTO.setFnc_bno(fnc_bno);
				
				adminService.fncDelete(room_fncDTO);
				
				return "redirect:/admin/etc/etcList";
			}
			//-------------------------------------------------------------------------------------------------------
			//대여 삭제 
			//-------------------------------------------------------------------------------------------------------
			@RequestMapping(value = "/etc/rentDelete", method = RequestMethod.GET)
			public String fncDelete(@RequestParam("n") int rent_bno, Room_rentDTO room_rentDTO) throws Exception {
				logger.info("noticeDelete");
				
				room_rentDTO.setRent_bno(rent_bno);
				
				adminService.rentDelete(room_rentDTO);
				
				return "redirect:/admin/etc/etcList";
			}
			
			//-------------------------------------------------------------------------------------------------
			// 회원들이 예약한 방 목록
			//-------------------------------------------------------------------------------------------------
			@RequestMapping(value="/member/memberBookList", method=RequestMethod.GET)
			public String memberBookList(Model model) throws Exception {
			      
			   List<BookDTO> memberBookList = null;
			   memberBookList = adminService.memberBookList(); // 작업할 테이블명을 매개변수로 넘겨준다.
			      
			model.addAttribute("memberBookList", adminService.memberBookList());
			logger.info("고객들이 예약한 정보 잘 가져오나요? ==> " + memberBookList);
			  
			return "admin/member/memberBookList"; 
				      
			}
			
			//-------------------------------------------------------------------------------------------------
			// 예약 상세정보를 가져온다.
			//-------------------------------------------------------------------------------------------------
			@RequestMapping(value="/member/memberBookView", method=RequestMethod.GET)
			public void memberBookView(@RequestParam("book_order") String book_order, Model model) throws Exception {
			
			List<BookDTO> memberBookView = new ArrayList<BookDTO>();
			
			memberBookView.addAll(adminService.memberBookView(book_order));
					
			model.addAttribute("memberBookView", memberBookView);
			
			logger.info("예약번호 잘 가져오나요~~? " + book_order);
			
			} 
			
			//-------------------------------------------------------------------------------------------------
			// 예약 상태 변경 => 가예약, 예약 확정, 입실 중, 퇴실 완료
			//-------------------------------------------------------------------------------------------------
			@RequestMapping(value = "/member/memberBookView", method = RequestMethod.POST)
			public String BookOk(BookDTO bookDTO, String book_order) throws Exception {
		    	logger.info("예약 상세 정보 => 상태 변경 " + bookDTO.getBook_ok());
		    	logger.info("주문 상세 정보 => 상태 변경 주문번호 " + bookDTO.getBook_order());
		       
		    	adminService.bookOk(bookDTO);
		       
		        return "redirect:/admin/member/memberBookView?book_order=" + bookDTO.getBook_order();
		    }
			
			
}
