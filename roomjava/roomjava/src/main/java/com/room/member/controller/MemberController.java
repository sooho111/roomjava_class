package com.room.member.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.room.admin.dto.BoardDTO;
import com.room.admin.dto.PageMaker;
import com.room.admin.dto.PaymentDTO;
import com.room.admin.dto.SearchCriteria;
import com.room.main.dto.BookDTO;
import com.room.member.dto.MemberDTO;
import com.room.member.dto.QnaDTO;
import com.room.member.dto.ReplyDTO;
import com.room.member.dto.ReviewDTO;
import com.room.member.service.MemberService;
import com.room.member.dto.FaqDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject // 서비스를 호출하기 위해서 의존성을 주입
	MemberService memberService;

	// -------------------------------------------------------------------------------------------------
	// 로그인 GET
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin() throws Exception {
		return "/member/login";

	} // end String getLogin()

	// -------------------------------------------------------------------------------------------------
	// 로그인 POST
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberDTO memberDTO, HttpServletRequest req, RedirectAttributes rttr) throws Exception {

		HttpSession session = req.getSession();

		// 넘겨받은 회원정보를 가지고 Service에게 의뢰한다.
		MemberDTO login = memberService.login(memberDTO);

		// RedirectAttributes : redirect로 리턴하는 코드가 있어야 한다.
		// Model : jsp페이지를 거쳐갈때는 model로 값을 보내주면 된다.

		// 해당하는 회원정보가 없다면
		if (login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		} else {
			// 로그인이 정상이라면 세션을 발급한다.
			session.setAttribute("member", login);
			session.setAttribute("m_id", memberDTO.getM_id());
		}
		return "redirect:/member/login";
	}
	
	// -------------------------------------------------------------------------------------------------
	// 비로그인 GET
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/belogin", method = RequestMethod.GET)
	public String getbeLogin() throws Exception {
		return "/member/belogin";

	} // end String getLogin()
		 
	@RequestMapping (value ="/beLoginBookList")
 	public void beLoginBookList(BookDTO bookDTO, Model model) throws Exception {
		List<BookDTO> bookList = memberService.belogin(bookDTO.getM_bname());

		logger.info("다 가져온다며 " + bookList);
			
		model.addAttribute("bookList", bookList);
	}
	
	// -------------------------------------------------------------------------------------------------
	// 비로그인 뷰
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value="/beLoginBookView", method=RequestMethod.GET)
	public void beLoginBookView(@RequestParam("book_order") String book_order, Model model) throws Exception {
		
		logger.info("managerController 주문상세정보 가져오기 ==> " + book_order);
		
		List<BookDTO> bookView = new ArrayList<BookDTO>();
		bookView.addAll(memberService.bookView(book_order));
		logger.info("managerController return Value ==> " + bookView);
		
		BookDTO bookDTO = new BookDTO();
		bookDTO.setBook_order(bookView.get(0).getBook_order());
		bookDTO.setM_name(bookView.get(0).getM_name());
		bookDTO.setBook_people(bookView.get(0).getBook_people());
		bookDTO.setBook_ok(bookView.get(0).getBook_ok());
		bookDTO.setBook_tel(bookView.get(0).getBook_tel());
		bookDTO.setM_bname(bookView.get(0).getM_bname());
		logger.info("orderView.get(0).getDelivery_name() => " + bookDTO);
		
		model.addAttribute("bookView", bookView);
	}

	// -------------------------------------------------------------------------------------------------
	// 로그아웃
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		// 로그아웃 버튼을 눌렀을 경우에는 세션을 없앤다.
		session.invalidate();
		logger.info("123");
		return "redirect:/";
	}

	// -------------------------------------------------------------------------------------------------
	// 회원 가입 : GET
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/memberInsert", method = RequestMethod.GET)
	public String memberInsertGet(Model model) throws Exception {
		// 캘린더 호출
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR); // 연도 추출
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1); // 월 추출
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE)); // 일 추출
		String subNum = ""; // 랜덤 숫자를 저장할 문자열 변수

		for (int i = 1; i <= 6; i++) { // 6회 반복
			subNum += (int) (Math.random() * 6); // 0~9까지의 숫자를 생성하여 subNum에 저장
		}

		String m_bno = ymd + "_" + subNum; // [연월일]_[랜덤숫자] 로 구성된 문자
		model.addAttribute("m_bno", m_bno);
		logger.info("MemberController memberInsertGET().....");
		return "/member/memberInsert";
	}

	// -----------------------------------------------------------------------------------------------------------
	// 아이디 중복 검사
	// -----------------------------------------------------------------------------------------------------------
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(MemberDTO memberDTO) throws Exception {

		logger.info("MemberController 아이디 검사()");

		int result = memberService.idCheck(memberDTO);

		logger.info("MemberController 아이디 검사() 결과 ==> " + result);

		return result;

	} // End - public int idCheck(MemberDTO memberDTO)

	// -----------------------------------------------------------------------------------------------------------
	// 이메일 중복 검사
	// -----------------------------------------------------------------------------------------------------------
	@ResponseBody
	@RequestMapping(value = "/eCheck", method = RequestMethod.POST)
	public int eCheck(MemberDTO memberDTO) throws Exception {

		logger.info("MemberController 이메일 검사()");

		int result = memberService.eCheck(memberDTO);

		logger.info("MemberController 이메일 검사() 결과 ==> " + result);

		return result;

	}

	// -------------------------------------------------------------------------------------------------
	// 회원 가입 : POST
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/memberInsert", method = RequestMethod.POST)
	public String memberInsertPost(MemberDTO memberDTO) throws Exception {

		logger.info("MemberController memberInsertPost(MemberDTO memberDTO).....");

		// 회원 아이디가 존재하는지 먼저 검사한다.
		int result = memberService.idCheck(memberDTO);

		try {
			if (result == 1) {
				return "/member/memberInsert";
			} else if (result == 0) {
				memberService.memberInsert(memberDTO);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/member/login";
		// return "redirect:/member/login";
	}

	// -------------------------------------------------------------------------------------------------
	// 회원 정보 수정 GET
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/memberUpdate/{m_id}", method = RequestMethod.GET)
	public String getMemberUpdate(@PathVariable String m_id, Model model) throws Exception {
		MemberDTO view = memberService.view(m_id);
		model.addAttribute("view", view);
		return "/member/memberUpdate";
	}

	// -------------------------------------------------------------------------------------------------
	// 회원 탈퇴
	// -------------------------------------------------------------------------------------------------
/*	@RequestMapping(value = "/memberDelete/{m_id}", method = RequestMethod.GET)
	private String productDelete(@PathVariable String m_id, HttpSession session) throws Exception {
		memberService.memberDelete(m_id);
		session.invalidate();
		return "redirect:/";
	}*/
	@RequestMapping(value="/memberDelete/{m_id}", method = RequestMethod.GET)
	public String memberDeleteGET() throws Exception {
		return "/member/memberDelete";
	}
	@RequestMapping(value="/memberDelete/{m_id}", method = RequestMethod.POST)
	public String removePOST(MemberDTO memberDTO, HttpSession session, RedirectAttributes ra) throws Exception {
		logger.info("removePOST");
		
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		String oldPass = memberDTO.getM_pwd();
		String newPass = member.getM_pwd();
		
		if(oldPass.equals(newPass)) {
			memberService.memberDelete(memberDTO);
			ra.addFlashAttribute("result", "removeOK");
			session.invalidate();
			return "redirect:/";
		} else {
			ra.addFlashAttribute("result", "removeFalse");
			return "redirect:/member/memberDelete";
		}
	}

	// -------------------------------------------------------------------------------------------------
	// 회원 정보 수정 POST
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String postMemberUpdate(MemberDTO memberDTO, HttpSession session) throws Exception {
		memberService.update(memberDTO);
		session.invalidate();
		return "redirect:/member/login";
	}
	
	 
	  // 아이디 찾기 폼
	  
	  @RequestMapping(value = "/findidpage", method = RequestMethod.GET) public
	  String findidpage() throws Exception { return "/member/findidpage"; }
	  
	  // 아이디 찾기
	  
	  @RequestMapping(value = "/findidform", method = RequestMethod.POST) public
	  String findidform(HttpServletResponse response, @RequestParam("m_email")
	  String m_email, Model md) throws Exception { md.addAttribute("m_id",
	  memberService.findidform(response, m_email)); return "/member/findidform";
	  }
	  
	  // 비밀번호 찾기 폼
	  
	  @RequestMapping("/findpwpage") public String findpwpage() { return
	  "/member/findpwpage"; }
	  
	  // 비밀번호 찾기
	  
	  @RequestMapping( "/findpwform") public String
	  memberfindpwform(HttpServletResponse response, MemberDTO memberDTO, Model md)
	  throws Exception {
	  md.addAttribute("userPw",memberService.memberfindpwform(response,
	  memberDTO)); return "/member/findpwform"; }
	  
	//마이페이지
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public void myPage(MemberDTO memberDTO, HttpSession session, Model model) throws Exception {
		
		memberDTO = (MemberDTO)session.getAttribute("member");
		model.addAttribute("member", memberDTO);
		
		List<BookDTO> bookList = memberService.getBooks(memberDTO.getM_name());
		BookDTO buyDTO = new BookDTO();

		logger.info("managerController orderList()  return Value ==> " + bookList);
			
		model.addAttribute("bookList", bookList);
			
	} // end void myPage
	
	// -------------------------------------------------------------------------------------------------
	// 마이페이지 예약 뷰
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value="/myBookView", method=RequestMethod.GET)
	public void orderView(@RequestParam("book_order") String book_order, Model model) throws Exception {
		
		
		
		logger.info("managerController 주문상세정보 가져오기 ==> " + book_order);
		Integer checkReview = memberService.checkReview(book_order);
		model.addAttribute("checkReview", checkReview);
		logger.info("뭐나오나 보쟈"+checkReview);
		List<BookDTO> bookView = new ArrayList<BookDTO>();
		bookView.addAll(memberService.bookView(book_order));
		logger.info("managerController return Value ==> " + bookView);
		
		model.addAttribute("bookView", bookView);
	}
	// -------------------------------------------------------------------------------------------------
	// 후기 작성 GET
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value="/insertReview", method=RequestMethod.GET)
	public void reviewGOget(@RequestParam("book_order") String book_order, Model model, HttpSession session) throws Exception {
		
		
		logger.info("뭐나오나 보쟈"+book_order);
		List<BookDTO> review = new ArrayList<BookDTO>();
		review.addAll(memberService.bookView(book_order));
		logger.info("managerController return Value ==> " + review);
		
		BookDTO bookDTO = new BookDTO();
		bookDTO.setBook_order(review.get(0).getBook_order());
		bookDTO.setM_name(review.get(0).getM_name());
		bookDTO.setBook_people(review.get(0).getBook_people());
		bookDTO.setBook_ok(review.get(0).getBook_ok());
		bookDTO.setBook_tel(review.get(0).getBook_tel());
		logger.info("orderView.get(0).getDelivery_name() => " + bookDTO);
		
		model.addAttribute("review", review);
	}
	// -------------------------------------------------------------------------------------------------
	// 후기 수정 GET
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value="/updateReview", method=RequestMethod.GET)
	public void updatereviewget(@RequestParam("book_order") String book_order, ReviewDTO reviewDTO,Model model, HttpSession session) throws Exception {
		
		
		reviewDTO.setBook_order(book_order);
		model.addAttribute("review", memberService.getReview(book_order));
	}

	// -------------------------------------------------------------------------------------------------
	// 후기 작성 Post
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value="/insertReview", method=RequestMethod.POST)
	public String reviewGOpost(ReviewDTO reviewDTO) throws Exception {
		
		memberService.insertReview(reviewDTO);
		
		return "redirect:/member/review";

		
		}
	
	//-------------------------------------------------------------------------------------------------------
	//후기 수정 POST	
	//-------------------------------------------------------------------------------------------------------		
	@RequestMapping(value = "/updateReview", method = RequestMethod.POST)
	public String updateReview(@RequestParam("book_order") String book_order, ReviewDTO reviewDTO,Model model) throws Exception {

		
		memberService.updateReview(reviewDTO);
		
		return "redirect:/member/review";
	}
	// -------------------------------------------------------------------------------------------------
	// 후기 삭제 GET
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value="/deleteReview", method=RequestMethod.GET)
	public String deletereview(@RequestParam("book_order") String book_order) throws Exception {
		memberService.deleteReview(book_order);
		return "redirect:/member/myPage";
	}
	
	//공지사항 view
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public String noticeList(Model model, @ModelAttribute("scri") SearchCriteria scri ,BoardDTO boardDTO) throws Exception {
		logger.info("noticeList");
		
		model.addAttribute("list", memberService.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(memberService.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("detail", memberService.detailView(boardDTO.getNotice_bno()));
		logger.info("noticeList 나와" +  memberService.detailView(boardDTO.getNotice_bno()));
		return "/member/notice";
	}
	// -------------------------------------------------------------------------------------------------
	// 예약 취소 GET
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value="/deleteBook", method=RequestMethod.GET)
	public String deleteBook(@RequestParam("book_order") String book_order) throws Exception {
		memberService.deleteBook(book_order);
		return "redirect:/member/myPage";
	}
	// -------------------------------------------------------------------------------------------------
	// 비회원 예약 취소 GET
	// -------------------------------------------------------------------------------------------------
	@RequestMapping(value="/deletebeBook", method=RequestMethod.GET)
	public String deletebeBook(@RequestParam("book_order") String book_order) throws Exception {
		memberService.deleteBook(book_order);
		return "redirect:/";
	}
	
	
	
	//-------------------------------------------------------------------------------------------------------
	//공지사항 상세페이지	
	//-------------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/noticeDetail", method = RequestMethod.GET)
		public String noticeDetail( Model model, @RequestParam("n") int notice_bno, BoardDTO boardDTO) throws Exception {
		
		logger.info("noticeDetail");
		
		boardDTO.setNotice_bno(notice_bno);
		model.addAttribute("detail", memberService.detailView(boardDTO.getNotice_bno()));
		
		return "/member/noticeDetail";
		
		}
		
	/*-----------------------------------------------------------------------------------------------------------
	* faq 목록(Paging 처리)
	----------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value="/faq", method=RequestMethod.GET)
	   public ModelAndView faqList(SearchCriteria cri) throws Exception {
		
		logger.info("---------------------------------------------------------------------");
		logger.info("ManagerController memberList CRI ==> " + cri);
		logger.info("---------------------------------------------------------------------");
		
		ModelAndView mav = new ModelAndView("/member/faq");
	    
		PageMaker pageMaker = new PageMaker();	
		pageMaker.setCri(cri);
		logger.info("---------------------------------------------------------------------"+cri);
		pageMaker.setTotalCount(memberService.faqListTotalCount(cri));
		
		//List<ManagerDTO>  list = managerService.memberListPaging(cri);
		List<FaqDTO>  list = memberService.faqListPaging(cri);
		
		mav.addObject("list", list);
	    mav.addObject("pageMaker", pageMaker);
	        
	    return mav;
	    
	   }
	/*-----------------------------------------------------------------------------------------------------------
	* 리뷰
	----------------------------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="/review", method=RequestMethod.GET)
	   public ModelAndView reviewList(SearchCriteria cri) throws Exception {
		ModelAndView mav = new ModelAndView("/member/review");
	    
		PageMaker pageMaker = new PageMaker();	
		pageMaker.setCri(cri);
		logger.info("---------------------------------------------------------------------"+cri);
		pageMaker.setTotalCount(memberService.reviewListTotalCount(cri));
		
		List<ReviewDTO>  list = memberService.reviewListPaging(cri);
		
		mav.addObject("list", list);
	    mav.addObject("pageMaker", pageMaker);
	        
	    return mav;
	    
	   }
	/*-----------------------------------------------------------------------------------------------------------
	* qna 작성
	----------------------------------------------------------------------------------------------------------*/
	@RequestMapping(value = "/qnaInsert", method = RequestMethod.GET)
	public void qnaView() throws Exception {}
	
	@RequestMapping(value = "/qnaInsert", method = RequestMethod.POST)
	public String qnaWrite(HttpSession httpSession ,QnaDTO QnaDTO) throws Exception {
		MemberDTO member = (MemberDTO) httpSession.getAttribute("member");
		String userId = member.getM_id();
		
		QnaDTO.setM_id(userId);
		
		memberService.qnaWrite(QnaDTO);
		
		
		return "redirect:/member/qna";
	}



	// -------------------------------------------------------------------------------------------------
	// qna list 페이징
	// -------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/qna", method = RequestMethod.GET)
		public String qnaList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
			logger.info("qnaList");
		
			model.addAttribute("qnaList", memberService.qnaList(scri));
		
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(memberService.qnaListCount(scri));

			model.addAttribute("pageMaker", pageMaker);
	

			return "member/qna";
		}
		// -------------------------------------------------------------------------------------------------
		// qna 상세보기
		// -------------------------------------------------------------------------------------------------
		
		@RequestMapping(value="/qnaDetail", method = RequestMethod.GET)
		public String qnaDetailView(@RequestParam("qna_bno") int qna_bno, Model model, QnaDTO qnaDTO) throws Exception {
			logger.info("gna Detail View");
			
			qnaDTO.setQna_bno(qna_bno);
			
			model.addAttribute("Detail" ,memberService.qnaDetail(qna_bno));
		
			return "/member/qnaDetail";
		}
		// -------------------------------------------------------------------------------------------------
		// QnA 상세보기
		// -------------------------------------------------------------------------------------------------
		@ResponseBody
		@RequestMapping(value = "/qnaDetail", method = RequestMethod.POST)
		public int secret(QnaDTO qnaDTO, HttpSession session) throws Exception {
			logger.info("one on one");

			int result = 0;

			MemberDTO member = (MemberDTO) session.getAttribute("member");
			String userId = memberService.qnaOne(qnaDTO.getQna_bno());

			if (member.getM_id().equals(userId)) {

				qnaDTO.setM_id(member.getM_id());
				result = 1;
			} else if (member.getM_power() == 1 || member.getM_power() == 2) {
				result = 1;
			}

			return result;
		}
		// -------------------------------------------------------------------------------------------------
		// QnA 수정
		// -------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/qnaUpdate", method = RequestMethod.GET)
		public String qnaUpdateView(Model model, @RequestParam("qna_bno") int qna_bno, QnaDTO qnaDTO ) throws Exception {
			
			qnaDTO.setQna_bno(qna_bno);
			
			model.addAttribute("update", memberService.qnaDetail(qna_bno));
			
			return "/member/qnaUpdate";
		}
		// -------------------------------------------------------------------------------------------------
		// QnA 수정
		// -------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/qnaUpdate", method = RequestMethod.POST)
		public String qnaUpdate(@RequestParam("qna_bno") int qna_bno, QnaDTO qnaDTO) throws Exception{
			
			qnaDTO.setQna_bno(qna_bno);
			
			memberService.qnaUpdate(qnaDTO);
			
			return "redirect:/member/qna";
		}
		
		// -------------------------------------------------------------------------------------------------
		// QnA 삭제
		// -------------------------------------------------------------------------------------------------
		@RequestMapping(value = "/qnaDelete", method = RequestMethod.GET)
		public String qnaDelete(@RequestParam("qna_bno") int qna_bno, QnaDTO qnaDTO) throws Exception {
			
			qnaDTO.setQna_bno(qna_bno);
			
			memberService.qnaDelete(qnaDTO);
			
			return "redirect:/member/qna";

		}
		// -------------------------------------------------------------------------------------------------
		// QnA 리플 리스트
		// -------------------------------------------------------------------------------------------------
		@ResponseBody
		@RequestMapping(value="/qnaDetail/QnAreplyList", method = RequestMethod.GET)
		public List<ReplyDTO> getReply(@RequestParam("qna_bno") int qna_bno) throws Exception {
			logger.info("get reply list");
			
			List<ReplyDTO> reply = memberService.replyList(qna_bno);
			
			return reply;
		}
		
		// -------------------------------------------------------------------------------------------------
		// QnA 리플 작성
		// -------------------------------------------------------------------------------------------------
		@ResponseBody
		@RequestMapping(value = "/qnaDetail/QnAregistReply", method = RequestMethod.POST)
		public void registReply(ReplyDTO replyDTO, HttpSession httpSession, @RequestParam("qna_bno") int qna_bno) throws Exception {
			logger.info("regist reply");
			
			MemberDTO member = (MemberDTO)httpSession.getAttribute("member");
			replyDTO.setM_id(member.getM_id());
			
			replyDTO.setQna_bno(qna_bno);
			
			memberService.registReply(replyDTO);
		}
		// -------------------------------------------------------------------------------------------------
		// QnA 리플 삭제
		// -------------------------------------------------------------------------------------------------
		@ResponseBody
		@RequestMapping(value = "/qnaDetail/deleteReply", method = RequestMethod.POST)
		public void deleteReply(ReplyDTO replyDTO, @RequestParam("rep_bno") int rep_bno) throws Exception {
			logger.info("delete reply");
			
			replyDTO.setRep_bno(rep_bno);
			
			memberService.deleteReply(replyDTO);
		}
		// -------------------------------------------------------------------------------------------------
		// QnA 리플 수정
		// -------------------------------------------------------------------------------------------------
		@ResponseBody
		@RequestMapping(value = "/qnaDetail/modifyReply", method = RequestMethod.POST)
		public void modifyReply(ReplyDTO replyDTO, @RequestParam("rep_bno") int rep_bno) throws Exception {
			logger.info("modify reply");
			
			replyDTO.setRep_bno(rep_bno);
			
			memberService.modifyReply(replyDTO);
		}
} // end class MemberController
