package com.study.springboot;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotBlank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.study.springboot.dao.IBasketDao;
import com.study.springboot.dao.IFaqDao;
import com.study.springboot.dao.INoticeDao;
import com.study.springboot.dao.IOne2OneDao;
import com.study.springboot.dao.IOrderDao;
import com.study.springboot.dao.IOrderDetailDao;
import com.study.springboot.dao.IProductDao;
import com.study.springboot.dao.IReviewDao;
import com.study.springboot.dao.IUsersDao;
import com.study.springboot.dto.BasketDto;
import com.study.springboot.dto.DeliveryDto;
import com.study.springboot.dto.FaqDto;
import com.study.springboot.dto.NoticeDto;
import com.study.springboot.dto.One2OneDto;
import com.study.springboot.dto.OrderDetailDto;
import com.study.springboot.dto.OrderDto;
import com.study.springboot.dto.ProductDto;
import com.study.springboot.dto.ReviewDto;
import com.study.springboot.dto.UsersDto;

@Controller
public class MyController {
	static final int PORT=7000;
	ServerSocket server = null;
	Socket child;
	@Autowired
	IUsersDao iUsersdao;
	@Autowired
	IOne2OneDao iOne2onedao;
	@Autowired
	IProductDao iProductdao;
	@Autowired
	IOrderDao iOrderdao;
	@Autowired
	INoticeDao iNoticedao;
	@Autowired
	IFaqDao iFaqdao;
	@Autowired
	IBasketDao iBasketdao;
	@Autowired 
	IReviewDao iReviewdao;
	@Autowired
	IOrderDetailDao iOrderdetaildao;
	@Autowired
	fileUploadService fileUploadService;
	
	// Root로 들어올시 index로 redirect
	@RequestMapping("/")
	public String root() {
		return "redirect:index";
	}
	
	// 메인 페이지
	@RequestMapping("/index")
	public String main(Model model) {
		model.addAttribute("mainPage", "main.jsp");
		return "index"; // "index.jsp" 디스패치함.
	}

	// 로그인 페이지
	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("mainPage", "Member/login.jsp");
		return "index";
	}
	
	// 로그인 기능
	@RequestMapping("/loginAction")
	public String admin_member(@RequestParam("user_id") String user_id,
							   @RequestParam("user_pw") String user_pw,
							   HttpServletRequest request, Model model) {
		List<UsersDto> list = iUsersdao.list_member();
		ArrayList<String> list_id = new ArrayList<String>();
		ArrayList<String> list_pw = new ArrayList<String>();
		for(int i=0; i<list.size(); i++) {
			list_id.add(i, list.get(i).getUser_id());
			list_pw.add(i, list.get(i).getUser_pw());
		}
			if(list_id.contains(user_id)) {
				if(list_pw.contains(user_pw)) {
					request.setAttribute("list", list);
					UsersDto result = iUsersdao.login(user_id, user_pw);
					request.getSession().setAttribute("user_id", user_id);
					request.getSession().setAttribute("user_idx", result.getUser_idx());
					request.getSession().setAttribute("user_name", result.getUser_name());
					if(result != null) {
						if(user_id.equals("admin")) {
							for(int j = 0; j<list.size(); j++) {
								if(list.get(j).getUser_gender().equals("0")) {
									list.get(j).setUser_gender("여자");
								}else if(list.get(j).getUser_gender().equals("1")) {
									list.get(j).setUser_gender("남자");
								}
							}
							request.setAttribute("list", list);
							model.addAttribute("adminPage", "../Admin/admin_member.jsp");
							return "Admin/admin_index";
						}else {
							model.addAttribute("mainPage", "main.jsp");
							return "index";
						}
					}
				}else {
					model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
					model.addAttribute("mainPage", "Member/login.jsp");
					return "index";
				}
			}else {
				model.addAttribute("msg", "입력한 아이디가 존재하지 않습니다.");
				model.addAttribute("mainPage", "Member/login.jsp");
				return "index";
			}
		model.addAttribute("mainPage", "main.jsp");
		return "index";
	}
	
	// 로그아웃 기능
	@RequestMapping("logout")
	public String logout(HttpServletRequest request, Model model) {
		request.getSession().setAttribute("user_id", null);
		request.getSession().setAttribute("user_idx", null);
		request.getSession().setAttribute("user_name", null);
		model.addAttribute("mainPage", "main.jsp");
		return "index";
	}

	// 약관동의 페이지
	@RequestMapping("/join")
	public String join(Model model) {
		model.addAttribute("mainPage", "Member/join.jsp");
		return "index";
	}

	// 회원가입 입력 페이지
	@RequestMapping("/join_form")
	public String join_form(Model model) {
		model.addAttribute("mainPage", "Member/join_form.jsp");
		return "index";
	}
	
	// 회원가입 기능
	@RequestMapping("/signUp")
	public String signUp(
			@RequestParam("user_name") String user_name,
			@RequestParam("user_id") String user_id,            
			@RequestParam("user_pw") String user_pw,
			@RequestParam("user_email") String user_email,    
			@RequestParam(value="user_email_receive", required=false) String user_email_receive,
			@RequestParam("user_phone") String user_phone,
			@RequestParam(value="user_birth_date", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date user_birth_date,
			@RequestParam("user_gender") String user_gender,      
			@RequestParam("user_address") String user_address,
			Model model,
			UsersDto dto) {	
		
		if(user_email_receive == null) {
			user_email_receive = "0";
		}else {
			user_email_receive = "1";
		}
		
		dto.setUser_name(user_name);
		dto.setUser_id(user_id);
		dto.setUser_pw(user_pw);
		dto.setUser_email(user_email);
		dto.setUser_email_receive(Integer.parseInt(user_email_receive));
		dto.setUser_phone(Integer.parseInt(user_phone));
		dto.setUser_birth_date(user_birth_date);
		dto.setUser_gender(user_gender);
		dto.setUser_address(user_address);
		model.addAttribute("mainPage", "Member/join_action.jsp");
		int result = iUsersdao.signUp(dto);

		return "index";
	}
	
	// 회원가입 완료 페이지
	@RequestMapping("/join_action")
	public String join_action(Model model) {
		model.addAttribute("mainPage", "Member/join_action.jsp");
		return "index";
	}
	
	// 회원가입 중복확인 기능
	@RequestMapping("/join_form_2")
	public String join_form_2(Model model) {
		List<UsersDto> list = iUsersdao.user_list();
		model.addAttribute("list", list);
		return "Member/join_form_2";
	}
	
	// 아이디 찾기 페이지
	@RequestMapping("/idfind")
	public String idfind(Model model) {
		model.addAttribute("mainPage", "Member/idfind.jsp");
		return "index";
	}
	
	// 아이디찾기 기능
	@RequestMapping("/idfindAction")
	public String idfindAction(
			@NotBlank(message = "이름은 필수 입력 값입니다.")
			@RequestParam ("user_name") String user_name,			
			@RequestParam (value="user_email", required = false) String user_email,
			@RequestParam (value="user_phone", required = false) String user_phone,
			Model model) {	
		UsersDto userId = iUsersdao.userId(user_name, user_email, (user_phone.equals("")) ? 1 : Integer.parseInt(user_phone) );
		model.addAttribute("mainPage", "Member/idfind.jsp");
		if(userId==null){
			model.addAttribute("msg","아이디가 없습니다");
			return "index";
		}else {		
			model.addAttribute("userId", userId.getUser_id());
			return "index";
		}			
	}

	// 비밀번호 찾기 페이지
	@RequestMapping("/pwfind")
	public String pwfind(Model model) {
		model.addAttribute("mainPage", "Member/pwfind.jsp");
		return "index";
	}
	
	// 비밀번호찾기 기능
	@RequestMapping("/pwfindAction")
	public String pwfindAction(
			@NotBlank(message = "이름은 필수 입력 값입니다.")
			@RequestParam ("user_id") String user_id,
			@RequestParam ("user_name") String user_name,			
			@RequestParam (value="user_email", required = false) String user_email,
			@RequestParam (value="user_phone", required = false) String user_phone,
			Model model) {	
		UsersDto userPw = iUsersdao.userPw(user_id, user_name, user_email, (user_phone.equals("")) ? 1 : Integer.parseInt(user_phone) );
		model.addAttribute("mainPage", "Member/pwfind.jsp");
		if(userPw==null){
			model.addAttribute("msg","아이디, 이름 확인 후 다시 작성해주세요.");
			return "index";
		}else {		
			model.addAttribute("userPw", userPw.getUser_pw());
			return "index";
		}			
	}
	
	// 헤더 상품 검색기능
	@RequestMapping("/product_search")
	public String product_search(@RequestParam("keyword") String keyword, Model model) {
		List<ProductDto> search = iProductdao.search(keyword);
		model.addAttribute("all", search);
		model.addAttribute("mainPage", "Product/product.jsp");
		return "index";
	}
	
	// 상품페이지 필터
	@RequestMapping("/product_condition")
	public String product_condition(@RequestParam("product_animal") List<String> animal,
									@RequestParam("product_age") int age,
									@RequestParam("product_type") List<String> type,
									@RequestParam("product_size") List<String> size, HttpServletRequest request, Model model) {
		if(age >= 1 & age <=19){age = 1;} else if(age >= 20 & age <= 31){age = 2;} else if(age == 32){age = 3;}	else if(age == 33){age = 4;} else if(age == 34){age = 5;} else if(age == 35){age = 6;} else if(age == 36){age = 7;}	else if(age == 37){age = 8;} else if(age == 38){age = 9;} else if(age == 39){age = 10;} else if(age == 40){age = 11;}
		String str = "";
		for(int i=0; i<animal.size(); i++) {if(Integer.parseInt(animal.get(i)) == 0 || Integer.parseInt(animal.get(i)) == 1) {str += "product_animal = " + animal.get(i); if(i != animal.size()-1) {str += " OR ";}	}	} str += ") ";
		if(age == 0) {str += "AND (";	for(int j=0; j<type.size(); j++) {if(Integer.parseInt(type.get(j)) == 0 || Integer.parseInt(type.get(j)) == 1) {str += "product_feed_type = " + type.get(j);	if(j != type.size()-1) {str += " OR ";}	}	} str += ") AND (";
		for(int k=0; k<size.size(); k++) {if(Integer.parseInt(size.get(k)) == 0 || Integer.parseInt(size.get(k)) == 1 || Integer.parseInt(size.get(k)) == 2 || Integer.parseInt(size.get(k)) == 3 || Integer.parseInt(size.get(k)) == 4) {str += "product_size = " + size.get(k);	if(k != size.size()-1) {str += " OR ";}	}	}str += ")";}
		else {str += "AND product_age = " + age + " AND (";	for(int j=0; j<type.size(); j++) {if(Integer.parseInt(type.get(j)) == 0 || Integer.parseInt(type.get(j)) == 1) {str += "product_feed_type = " + type.get(j);	if(j != type.size()-1) {str += " OR ";}	}	} str += ") AND (";
		for(int k=0; k<size.size(); k++) {if(Integer.parseInt(size.get(k)) == 0 || Integer.parseInt(size.get(k)) == 1 || Integer.parseInt(size.get(k)) == 2 || Integer.parseInt(size.get(k)) == 3 || Integer.parseInt(size.get(k)) == 4) {str += "product_size = " + size.get(k);	if(k != size.size()-1) {str += " OR ";}	}	}str += ")";}
		List<ProductDto> product_condition = iProductdao.product_condition(str);		
		List<ProductDto> product_condition_food = iProductdao.product_condition_food(str);		
		List<ProductDto> product_condition_snack = iProductdao.product_condition_snack(str);		
		model.addAttribute("all", product_condition);
		model.addAttribute("food", product_condition_food);
		model.addAttribute("snack", product_condition_snack);
		model.addAttribute("mainPage", "Product/product.jsp");
		return "index";
	}
	
	// 베스트 페이지
	@RequestMapping("/product_best")
	public String product_best(HttpServletRequest request, Model model) {
		List<ProductDto> best = iProductdao.product_list_best();
		List<ProductDto> best_food = iProductdao.product_list_best_food();
		List<ProductDto> best_snack = iProductdao.product_list_best_snack();
		model.addAttribute("all", best);
		model.addAttribute("food", best_food);
		model.addAttribute("snack", best_snack);		
		model.addAttribute("mainPage", "Product/product.jsp");
		return "index";
	}
	
	// 신상품 페이지
	@RequestMapping("/product_new")
	public String product_new(Model model) {
		List<ProductDto> newlist = iProductdao.newlist_dog();
		model.addAttribute("newlist", newlist);
		model.addAttribute("mainPage", "Product/product_new_dog.jsp");
		return "index";
	}
	
	
	// 반려견 페이지
	@RequestMapping("/product_dog")
	public String product_dog(
			HttpServletRequest request,
			@RequestParam(value="page",required=false) String page,
			Model model) {
		if( page == null ) {
			page = "1";
		}
		
		model.addAttribute("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 15; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
		List<ProductDto> dog = iProductdao.product_list_dog( String.valueOf(startRowNum), String.valueOf(endRowNum) );
		List<ProductDto> dog_food = iProductdao.product_list_dog_food( String.valueOf(startRowNum), String.valueOf(endRowNum) );
		List<ProductDto> dog_snack = iProductdao.product_list_dog_snack( String.valueOf(startRowNum), String.valueOf(endRowNum) );
		model.addAttribute("pagenav", "product_dog");
		model.addAttribute("all", dog);
		model.addAttribute("food", dog_food);
		model.addAttribute("snack", dog_snack);		
		model.addAttribute("mainPage", "Product/product.jsp");
		return "index";
	}
	
	// 반려묘 페이지
	@RequestMapping("/product_cat")
	public String product_cat(HttpServletRequest request,
			@RequestParam(value="page",required=false) String page,
			Model model) {
		if( page == null ) {
			page = "1";
		}
		
		model.addAttribute("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 15; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
		List<ProductDto> cat = iProductdao.product_list_cat( String.valueOf(startRowNum), String.valueOf(endRowNum) );
		List<ProductDto> cat_food = iProductdao.product_list_cat_food( String.valueOf(startRowNum), String.valueOf(endRowNum) );
		List<ProductDto> cat_snack = iProductdao.product_list_cat_snack( String.valueOf(startRowNum), String.valueOf(endRowNum) );
		model.addAttribute("pagenav", "product_cat");
		model.addAttribute("all", cat);
		model.addAttribute("food", cat_food);
		model.addAttribute("snack", cat_snack);		
		model.addAttribute("mainPage", "Product/product.jsp");
		return "index";
	}
	
	// 신상품 반려견 페이지
	@RequestMapping("/product_new_dog_form")
	public String product_new_dog_form(Model model) {
		List<ProductDto> newlist_dog = iProductdao.newlist_dog();
		model.addAttribute("newlist", newlist_dog);
		model.addAttribute("mainPage", "Product/product_new_dog.jsp");
		return "index";
	}
	
	// 신상품 반려묘 페이지
	@RequestMapping("/product_new_cat_form")
	public String product_new_cat_form(Model model) {
		List<ProductDto> newlist_cat = iProductdao.newlist_cat();
		model.addAttribute("newlist", newlist_cat);
		model.addAttribute("mainPage", "Product/product_new_cat.jsp");
		return "index";
	}

	// 상품 상세 페이지
	@RequestMapping("/product_action")
	public String product_action(
			@RequestParam("product_idx") String product_idx,
			Model model) {
		ProductDto product = iProductdao.product_action(Integer.parseInt(product_idx));
		List<ReviewDto> reviewData = iReviewdao.review(Integer.parseInt(product_idx));
		for(int i = 0; i < reviewData.size();i++) {
			if(reviewData.get(i).getReview_score() == 1) {
				reviewData.get(i).setReview_score(20); 
			}else if(reviewData.get(i).getReview_score() == 2) {
				reviewData.get(i).setReview_score(40); 
			}else if(reviewData.get(i).getReview_score() == 3) {
				reviewData.get(i).setReview_score(60);
			}else if(reviewData.get(i).getReview_score() == 4) {
				reviewData.get(i).setReview_score(80); 
			}else if(reviewData.get(i).getReview_score() == 5) {
				reviewData.get(i).setReview_score(100); 
			}
		}
		model.addAttribute("count",reviewData.size());
		model.addAttribute("review_list", reviewData);
		model.addAttribute("product",product);
		model.addAttribute("mainPage", "Product/product_action.jsp");
		return "index";
	}

	// 샘플 페이지
	@RequestMapping("/sample")
	public String sample(Model model) {
		List<ProductDto> dog = iProductdao.sample_list_dog();
		List<ProductDto> cat = iProductdao.sample_list_cat();
		model.addAttribute("dog", dog);
		model.addAttribute("cat", cat);
		model.addAttribute("mainPage", "Product/sample.jsp");
		return "index";
	}

	// FAQ 페이지
	@RequestMapping("/faq")
	public String faq(Model model) {
		List<FaqDto> faqlist = iFaqdao.list();
		model.addAttribute("list", faqlist);
		model.addAttribute("mainPage", "Customer/faq.jsp");
		return "index";
	}
	
	// FAQ 검색기능
	@RequestMapping("/faq_search")
	public String faq_search(@RequestParam("keyword") String keyword, Model model) {
		List<FaqDto> search = iFaqdao.search(keyword);
		model.addAttribute("list", search);
		model.addAttribute("mainPage", "Customer/faq.jsp");
		return "index";
	}

	// 공지사항 페이지
	@RequestMapping("/notice")
	public String notice(
			@RequestParam(value="page",required=false) String page,
			Model model) {
		if( page == null ) {
			page = "1";
		}
		
		model.addAttribute("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 5; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
		List<NoticeDto> noticelist = iNoticedao.list( String.valueOf(startRowNum), String.valueOf(endRowNum) );
		model.addAttribute("list", noticelist);
		model.addAttribute("mainPage", "Customer/notice.jsp");
		return "index";
	}

	// 1:1문의내역 페이지
	@RequestMapping("/one2one_list")
	public String one2one_list(HttpServletRequest request, Model model) {
		int idx = (int) request.getSession().getAttribute("user_idx");
		List<One2OneDto> mylist = iOne2onedao.mylist(idx);
		model.addAttribute("mylist", mylist);
		model.addAttribute("mainPage", "Mypage/one2one_list.jsp");
		return "index";
	}
	
	// 1:1문의내역 상세 페이지
	@RequestMapping("/one2one_detail")
	public String one2one_detail(@RequestParam("one2one_idx") int one2one_idx, Model model) {
		One2OneDto content_detail = iOne2onedao.content_detail(one2one_idx);
		model.addAttribute("dto", content_detail);
		model.addAttribute("mainPage", "Mypage/one2one_detail.jsp");
		return "index";
	}
	
	// 공지사항 검색기능
	@RequestMapping("/notice_search")
	public String notice_search(@RequestParam("keyword") String keyword, Model model) {
		List<NoticeDto> search = iNoticedao.search(keyword);
		model.addAttribute("list", search);
		model.addAttribute("mainPage", "Customer/notice.jsp");
		return "index";
	}

	// 1:1문의 페이지
	@RequestMapping("/one2one")
	public String one2one(Model model) {
		model.addAttribute("mainPage", "Customer/one2one.jsp");
		return "index";
	}
	
	// 1:1문의 등록 기능
	@RequestMapping(value="/one2one_form", method = RequestMethod.POST)
	public String one2one_form(
			@RequestParam(value = "chooseFile", required=false) MultipartFile file,
			@RequestParam(value = "one2one_title", required = false, defaultValue = "") String one2one_title,
			@RequestParam(value = "one2one_content", required = false, defaultValue = "") String one2one_content, 
			HttpServletRequest request, Model model) throws Exception {
		int idx = (int) request.getSession().getAttribute("user_idx");
		One2OneDto dto = new One2OneDto();
		dto.setOne2one_title(one2one_title);
		dto.setOne2one_content(one2one_content);
		dto.setOne2one_User_idx(idx);
		if(file.isEmpty()) {
			String upload_url = "null";			
			dto.setOne2one_image(upload_url);
		}else {
			String upload_url = fileUploadService.restore(file);
			dto.setOne2one_image(upload_url);		
		}
		int result = iOne2onedao.insert( dto );
		return "redirect:/one2one_list";
	}
	
	// 1:1문의 삭제 기능
	@RequestMapping("/one2one_delete_form")
	public String one2one_delete_form(@RequestParam("one2one_idx") int one2one_idx, HttpServletRequest request, Model model ) {
		int result = iOne2onedao.delete(one2one_idx);
		model.addAttribute("msg", "삭제성공");
		int idx = (int) request.getSession().getAttribute("user_idx");
		List<One2OneDto> mylist = iOne2onedao.mylist(idx);
		model.addAttribute("mylist", mylist);
		model.addAttribute("mainPage", "Mypage/one2one_list.jsp");
		return "index";
	}	

	// 장바구니 페이지
	@RequestMapping("/cart")
	public String cart(HttpServletRequest request, Model model) {
		int idx = (int) request.getSession().getAttribute("user_idx");
		List<BasketDto> list = iBasketdao.list(idx);
		int sum = iBasketdao.sum(idx);
		model.addAttribute("list", list);
		model.addAttribute("sum", sum);
		model.addAttribute("mainPage", "Mypage/cart.jsp");
		return "index";
	}
	
	// 장바구니 수량 증가 기능
	@RequestMapping("/cart_update_plus")
	public String cart_update_plus(@RequestParam("status_value") int status_value,
								   @RequestParam("result_text") int result_text, HttpServletRequest request, Model model) {
		int idx = (int) request.getSession().getAttribute("user_idx");
		int update_plus = iBasketdao.update_plus( idx, status_value );
		List<BasketDto> list = iBasketdao.list(idx);
		int sum = iBasketdao.sum(idx);
		model.addAttribute("list", list);
		model.addAttribute("sum", sum);
		model.addAttribute("mainPage", "Mypage/cart.jsp");
		return "index";
	}
	
	// 장바구니 수량 감소 기능
	@RequestMapping("/cart_update_minus")
	public String cart_update_minus(@RequestParam("status_value") int status_value,
								   @RequestParam("result_text") int result_text, HttpServletRequest request, Model model) {
		int idx = (int) request.getSession().getAttribute("user_idx");
		int update_plus = iBasketdao.update_minus( idx, status_value );
		List<BasketDto> list = iBasketdao.list(idx);
		int sum = iBasketdao.sum(idx);
		model.addAttribute("list", list);
		model.addAttribute("sum", sum);
		model.addAttribute("mainPage", "Mypage/cart.jsp");
		return "index";
	}
	
	// 장바구니 단일 삭제 기능
	@RequestMapping("/cart_delete")
	@ResponseBody
	public String cart_delete(@RequestParam("status_idx") int status_idx, HttpServletRequest request, Model model) {
		int idx = (int) request.getSession().getAttribute("user_idx");
		int delete = iBasketdao.delete_rowNum( idx, status_idx );
		return "<script>alert('해당 상품이 장바구니에서 제외되었습니다.');location.href='/cart'</script>";
	}
	
	// 장바구니 전체 주문 기능
	@RequestMapping("/cart_order_all")
	public String cart_order_all(HttpServletRequest request, Model model) {
		int idx = (int) request.getSession().getAttribute("user_idx");
		List<BasketDto> product_list = iBasketdao.list(idx);
		model.addAttribute("product", product_list);
		model.addAttribute("mainPage", "Order/order_payments.jsp");
		return "index";
	}
	
	// 장바구니 선택 주문
	@RequestMapping("/cart_check_order")
	public String cart_check_order(@RequestParam("chk") List<String> basket_idx, HttpServletRequest request, Model model) {
		int idx = (int) request.getSession().getAttribute("user_idx");
		String str = "";
		for(int i=0; i<basket_idx.size(); i++) {
			str += "dcf_basket.basket_pd_idx = dcf_product.product_idx and basket_idx =" + basket_idx.get(i);
			if( i != basket_idx.size()-1 ) {
				str += " or ";
			}
		}
		UsersDto user = iUsersdao.usersdto(idx);
		List<OrderDto> payments_product_check = iOrderdao.payments_product_check( str );
		model.addAttribute("item",user);
		model.addAttribute("product", payments_product_check);
		model.addAttribute("mainPage", "Order/order_payments.jsp");
		return "index";
	}
	
	// 장바구니 선택 삭제
	@RequestMapping("/cart_check_delete")
	public String cart_check_delete(@RequestParam("chk") List<String> basket_idx, HttpServletRequest request, Model model) {
		for(int i=0; i<basket_idx.size(); i++) {
			int result = iBasketdao.delete(Integer.parseInt(basket_idx.get(i)));
			if(result == 0) {
				int idx = (int) request.getSession().getAttribute("user_idx");
				List<BasketDto> list = iBasketdao.list(idx);
				int sum = iBasketdao.sum(idx);
				model.addAttribute("list", list);
				model.addAttribute("sum", sum);
				model.addAttribute("msg", "선택된 상품이 없습니다.");
				model.addAttribute("mainPage", "Mypage/cart.jsp");
				return "index";
			}
		}
		int idx = (int) request.getSession().getAttribute("user_idx");
		List<BasketDto> list = iBasketdao.list(idx);
		int sum = iBasketdao.sum(idx);
		model.addAttribute("list", list);
		model.addAttribute("sum", sum);
		model.addAttribute("msg", "해당 상품이 장바구니에서 제외되었습니다.");
		model.addAttribute("mainPage", "Mypage/cart.jsp");
		return "index";
	}
	
	// 장바구니 담기 기능
	@RequestMapping("/basket_action")
	public String basket_action(
			@RequestParam("product_idx") String product_idx,
			@RequestParam("count") String count,
			HttpServletRequest request,
			Model model) {
		String idx = String.valueOf(request.getSession().getAttribute("user_idx"));
		if(idx == null) {
			model.addAttribute("mainPage", "Member/login.jsp");
			return "index";
		}
		iBasketdao.insert( Integer.parseInt(count), Integer.parseInt(product_idx), Integer.parseInt(idx));
		return "redirect:/cart";
	}

	// 단일 주문 페이지
	@RequestMapping("/order_payments")
	public String order_payments(@RequestParam("basket_idx") int basket_idx, HttpServletRequest request, Model model) {
		List<OrderDto> product_list = iOrderdao.payments_product(basket_idx);
		model.addAttribute("product", product_list);
		model.addAttribute("mainPage", "Order/order_payments.jsp");
		return "index";
	}
	
	// 주문 완료 페이지
	@RequestMapping("/order_action")
	public String order_action(
			@RequestParam(value="name", required = false, defaultValue = "") String name,
			@RequestParam(value="phone", required = false, defaultValue = "") String phone,
			@RequestParam(value="address", required = false, defaultValue = "") String address,			
			@RequestParam(value="basket_idx", required = false) List<String> basket_idx,
			@RequestParam(value="product_idx", required = false) List<String> idx,
			@RequestParam(value="product_name", required = false) List<String> pdname,
			@RequestParam(value="product_count", required = false) List<String> pdcout,
			@RequestParam(value="product_price", required = false) List<String> pdprice,
			HttpServletRequest request,
			Model model) {
		
		String idx_name = "";
		Calendar calendar = Calendar.getInstance();
		idx_name += calendar.get(Calendar.MILLISECOND);
		System.out.println(idx_name);
		int user_idx = (int) request.getSession().getAttribute("user_idx");
		OrderDto dto = new OrderDto();
		dto.setOrder_idx(Integer.parseInt(idx_name));
		dto.setOrder_user_idx(user_idx);
		dto.setUser_name(name);
		dto.setUser_phone(Integer.parseInt(phone));
		dto.setUser_address(address);
		
		int order = iOrderdao.order_insert(dto);
		for(int i = 0 ; i < idx.size();i++) {
			dto.setOrder_pd_idx(Integer.parseInt(idx.get(i)));
			dto.setProduct_name(pdname.get(i));
			dto.setOrder_quantity(Integer.parseInt(pdcout.get(i)));
			dto.setProduct_price(Integer.parseInt(pdprice.get(i)));
			int order_detail = iOrderdao.order_detail_insert(dto);
		}
		for(int i = 0 ; i < idx.size();i++) {
			int order_delete = iOrderdao.delete(Integer.parseInt(basket_idx.get(i)));
		}
		
        LocalDate now = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        String formatedNow = now.format(formatter);
        System.out.println(formatedNow);

		model.addAttribute("date", formatedNow);
		model.addAttribute("order_idx", idx_name);
		model.addAttribute("mainPage", "Order/order_action.jsp");
		return "index";
	}

	// 회원정보 변경 페이지
	@RequestMapping("/info_change")
	public String info_change(HttpServletRequest request, Model model) {
		int idx = (int) request.getSession().getAttribute("user_idx");
		UsersDto list = iUsersdao.list(idx);
		model.addAttribute("dto", list);
		model.addAttribute("mainPage", "Mypage/info_change.jsp");
		return "index";
	}
	
	// 회원정보 변경 기능
	@RequestMapping("/info_change_form")
	public String info_change_form(@RequestParam("user_idx") String user_idx,
			@RequestParam("user_pw") String user_pw,
			@RequestParam("user_name") String user_name,
			@RequestParam("user_address") String user_address,
			@RequestParam("user_email") String user_email,
			@RequestParam("user_gender") String user_gender,
			@RequestParam("user_phone") String user_phone,
			@RequestParam(value="user_birth_date", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date user_birth_date,
			HttpServletRequest request, UsersDto dto) {
		dto.setUser_idx(Integer.parseInt(user_idx));
		dto.setUser_pw(user_pw);
		dto.setUser_name(user_name);
		dto.setUser_address(user_address);
		dto.setUser_email(user_email);
		dto.setUser_phone(Integer.parseInt(user_phone));
		dto.setUser_gender(user_gender);
		dto.setUser_birth_date( user_birth_date );

		int result = iUsersdao.update(dto);
	
		return "redirect:/mypage";
	}

	// 마이페이지
	@RequestMapping("/mypage")
	public String mypage(HttpServletRequest request, Model model) {
		int idx = (int) request.getSession().getAttribute("user_idx");
		int order_status0 = iOrderdao.before(idx);
		int order_status1 = iOrderdao.during(idx);
		int order_status2 = iOrderdao.after(idx);
		List<UsersDto> mypage = iUsersdao.mypage(idx);
		model.addAttribute("mypage_name", mypage);
		model.addAttribute("before", order_status0 );
		model.addAttribute("during", order_status1 );
		model.addAttribute("after", order_status2 );
		model.addAttribute("mainPage", "Mypage/mypage.jsp");
		return "index";
	}
	
	// 주문 목록
	@RequestMapping("/order_list")
	public String order_list(			
			HttpServletRequest request,
			Model model) {		
		int idx = (int) request.getSession().getAttribute("user_idx");	
		List<OrderDto> list = iOrderdao.myOrderList(idx);		
		List<OrderDetailDto>orderProductVeiw=iOrderdetaildao.orderProductVeiw(idx);
		System.out.println(orderProductVeiw);
		model.addAttribute("myOrderList", list);
		model.addAttribute("orderProductVeiw", orderProductVeiw);
		System.out.println(orderProductVeiw);
		model.addAttribute("mainPage", "Mypage/order_list.jsp");		
		return "index";		
	}
	
	// 주문목록 단건조회
	@RequestMapping("/order_list_detail")
	public String order_list_detail(
			@RequestParam("order_idx") int order_idx,
			Model model,
			HttpServletRequest request) {		
		int idx = (int) request.getSession().getAttribute("user_idx");
			List<OrderDto> list = iOrderdao.orderdetail(order_idx, idx);			
			model.addAttribute("orderdetail", list);	
		model.addAttribute("mainPage", "./Order/order_detail.jsp");
		return "index";
	}
	
	// 리뷰 쓰기 페이지
	@RequestMapping("/review")
	public String review(@RequestParam("prodcut_idx") int prodcut_idx, HttpServletRequest request, Model model) {
		List<ReviewDto> viewproductinfo = iReviewdao.viewproductinfo(prodcut_idx);
		model.addAttribute("viewproductinfo", viewproductinfo);
		model.addAttribute("mainPage", "Mypage/review.jsp");
		return "index";
	}
	
	// 리뷰 등록 기능
	@RequestMapping(value="/reviewWriteAction", method=RequestMethod.POST)
	public String reviewWriteAction(
			@RequestParam(value="chooseFile", required=false) MultipartFile file,
			@RequestParam(value="rating", required=false) String review_score,
			@RequestParam(value="review_pd_idx", required=false) int review_pd_idx,
			@RequestParam(value="review_content", required=false) String review_content,
			HttpServletRequest request, Model model) {
		int idx = (int) request.getSession().getAttribute("user_idx");
		
		ReviewDto dto = new ReviewDto();
		dto.setReview_score(Integer.parseInt(review_score));
		
		if(file.isEmpty()) {
			String upload_url = "null";
			dto.setReview_image(upload_url);
		}else { 
			String upload_url = fileUploadService.restore(file);
			dto.setReview_image(upload_url);
		}		
		dto.setReview_content(review_content);
		dto.setReview_user_idx(idx);
		dto.setReview_pd_idx(review_pd_idx);
		
		int result = iReviewdao.reviewInsert(dto);
		
		model.addAttribute("mainPage", "Mypage/review.jsp");
		return "redirect:/order_list";
	}

	// 주문 상세 페이지
	@RequestMapping("/order_detail")
	public String order_detail(Model model) {
		model.addAttribute("mainPage", "Order/order_detail.jsp");
		return "index";
	}
	
	// 어드민 회원관리 페이지
	@RequestMapping("admin_user")
	public String adminlogin(HttpServletRequest request,Model model) {
		List<UsersDto> list = iUsersdao.list_member();
		for(int i = 0; i<list.size(); i++) {
			if(list.get(i).getUser_gender().equals("0")) {
				list.get(i).setUser_gender("여자");
			}else if(list.get(i).getUser_gender().equals("1")) {
				list.get(i).setUser_gender("남자");
			}
		}
		request.setAttribute("list", list);
		model.addAttribute("adminPage", "../Admin/admin_member.jsp");
		return "Admin/admin_index";
	}
	
	// 공지사항 상세 페이지
	@RequestMapping("/notice_detail")
	public String notice_detail(
								@RequestParam("notice_idx") String notice_idx,
								Model model) {
		NoticeDto notice = iNoticedao.notice_detail( Integer.parseInt(notice_idx));
		model.addAttribute("notice", notice);
		model.addAttribute("mainPage", "Customer/notice_detail.jsp");
		return "index";
	}
	
	//어드민 회원정보
		@RequestMapping("/admin_member")
		public String admin_member(Model model) {
			model.addAttribute("mainPage", "../Admin/admin_member.jsp");
			return "index";
		}
	//회원정보연결_상세보기 페이지
	@RequestMapping("/admin_member_detail")
	public String admin_member_detail(
			@RequestParam("user_idx") String user_idx,
			Model model,
			HttpServletRequest request) {		
		UsersDto usersdto = iUsersdao.usersdto( Integer.parseInt(user_idx));
		model.addAttribute("usersdto", usersdto);	
		model.addAttribute("adminPage", "../Admin/admin_member_detail.jsp");
		return "Admin/admin_index";
	}
		
	//회원정보변경
	@RequestMapping("/admin_member_update_form")
	public String admin_member_update_form(
			@RequestParam("user_idx") String user_idx,    
			@RequestParam("user_id") String user_id,            
			@RequestParam("user_pw") String user_pw,
			@RequestParam("user_name") String user_name,           
			@RequestParam("user_address") String user_address,       
			@RequestParam("user_email") String user_email,    
			@RequestParam("user_gender") String user_gender,      
			@RequestParam("user_phone") String user_phone,   
			@RequestParam(value="user_birth_date", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date user_birth_date,
			UsersDto dto) {
		dto.setUser_idx(Integer.parseInt(user_idx));
		dto.setUser_id(user_id);
		dto.setUser_pw(user_pw);
		dto.setUser_name(user_name);
		dto.setUser_address(user_address);
		dto.setUser_email(user_email);
		dto.setUser_phone(Integer.parseInt(user_phone));
		dto.setUser_gender(user_gender);
		dto.setUser_birth_date( user_birth_date );

		int result = iUsersdao.admin_member_update_form(dto);
	
		return "redirect:/admin_member_detail?user_idx="+user_idx;
	}
	
	//회원정보삭제 기능
	@RequestMapping("/adminMemberDeleteAction")
	public String adminMemberDeleteAction(
			@RequestParam("user_idx") List<String> user_idx,
			HttpServletRequest request) {
		for(int i = 0; i<user_idx.size();i++) {
			int result = iUsersdao.adminMemberDeleteAction(Integer.parseInt(user_idx.get(i)));
		}
		return "redirect:/admin_user";
	}
	
	//회원관리 검색기능
	@RequestMapping("/admin_user_search")
	public String admin_user_search(@RequestParam("keyword") String keyword, 
									@RequestParam("search") String search, Model model) {
		String str = "";
		System.out.println(search);
		if(search.equals("id") ) {
			str = "user_id LIKE '%"+keyword+"%' ORDER BY user_idx DESC";
		}else if(search.equals("name")) {
			str = "user_name LIKE '%"+keyword+"%' ORDER BY user_idx DESC";
		}else if(search.equals("email")) {
			str = "user_email LIKE '%"+keyword+"%' ORDER BY user_idx DESC";
		}else if(search.equals("phone")) {
			str = "user_phone LIKE '%"+keyword+"%' ORDER BY user_idx DESC";
		}
		List<UsersDto> user_search = iUsersdao.search(str);
		model.addAttribute("list", user_search);
		model.addAttribute("adminPage", "../Admin/admin_member.jsp");
		return "Admin/admin_index";
	}
	
	// 어드민 상품 등록 페이지
	@RequestMapping("/admin_product_registration")
	public String admin_product_registration(Model model) {
		model.addAttribute("adminPage", "../Admin/admin_product_registration.jsp");
		return "Admin/admin_index";
	}
	
	// 어드민 상품 수정 페이지
	@RequestMapping("/admin_product_update")
	public String admin_product_update(@RequestParam("product_idx") int product_idx, Model model) {
		ProductDto update_view = iProductdao.update_view(product_idx);
		model.addAttribute("dto", update_view);
		model.addAttribute("adminPage", "../Admin/admin_product_update.jsp");
		return "Admin/admin_index";
	}

	// 어드민 공지사항 페이지
	@RequestMapping("/admin_notice")
	public String admin_notice(
			@RequestParam(value="page",required=false) String page,
			Model model,
			HttpServletRequest request) {
		if( page == null ) {
			page = "1";
		}
		
		System.out.println("page:" + page);
		model.addAttribute("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 5; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
			List<NoticeDto> list = iNoticedao.list( String.valueOf(startRowNum), String.valueOf(endRowNum) );
			model.addAttribute("list", list);
		model.addAttribute("adminPage", "../Admin/admin_notice.jsp");
		return "Admin/admin_index";
	}
	
	// 어드민 공지사항 검색 기능
	@RequestMapping("/admin_notice_search")
	public String admin_notice_search(@RequestParam("keyword") String keyword, Model model) {
		List<NoticeDto> search = iNoticedao.search(keyword);
		model.addAttribute("list", search);
		model.addAttribute("adminPage", "../Admin/admin_notice.jsp");
		return "Admin/admin_index";
	}
	
	// 어드민 공지사항 상세보기 페이지
	@RequestMapping("/admin_notice_detail")
	public String admin_notice_detail(
			@RequestParam("notice_idx") String notice_idx,
			Model model,
			HttpServletRequest request) {		

		NoticeDto noticedto = iNoticedao.noticedto( Integer.parseInt(notice_idx) );
		model.addAttribute("noticedto", noticedto);	
		model.addAttribute("adminPage", "../Admin/admin_notice_detail.jsp");
		return "Admin/admin_index";
	}
	
	// 어드민 공지사항 작성 페이지
	@RequestMapping("/admin_notice_write")
	public String admin_notice_write(Model model) {
		model.addAttribute("adminPage", "../Admin/admin_notice_write.jsp");
		return "Admin/admin_index";
	}
	
	// 어드민 FAQ 페이지
	@RequestMapping("/admin_faq")
	public String admin_faq(
			Model model,
			HttpServletRequest request) {
			List<FaqDto> list = iFaqdao.list();
			model.addAttribute("list", list);
		model.addAttribute("adminPage", "../Admin/admin_faq.jsp");
		return "Admin/admin_index";
	}
	
	// 어드민 FAQ 검색기능
	@RequestMapping("/admin_faq_search")
	public String admin_faq_search(@RequestParam("keyword") String keyword, Model model) {
		List<FaqDto> search = iFaqdao.search(keyword);
		model.addAttribute("list", search);
		model.addAttribute("adminPage", "../Admin/admin_faq.jsp");
		return "Admin/admin_index";
	}
	
	// 어드민 FAQ 상세보기
	@RequestMapping("/admin_faq_detail")
	public String admin_faq_detail(
			@RequestParam("faq_idx") String faq_idx,
			Model model,
			HttpServletRequest request) {		

		FaqDto faqDto = iFaqdao.faqdto( Integer.parseInt(faq_idx) );
		model.addAttribute("faqdto", faqDto);
		model.addAttribute("adminPage", "../Admin/admin_faq_detail.jsp");
		return "Admin/admin_index";
	}
	
	// 어드민 FAQ 작성 페이지
	@RequestMapping("/admin_faq_write")
	public String admin_faq_write(Model model) {
		model.addAttribute("adminPage", "../Admin/admin_faq_write.jsp");
		return "Admin/admin_index";
	}
	
	// 어드민 FAQ 작성 기능
	@RequestMapping("/adminWritefaqformAction")
	public String adminWritefaqformAction (
									@RequestParam("faq_title") String faq_title,
									@RequestParam("faq_content") String faq_content,
									HttpServletRequest request, 
									Model model) {
		int result = iFaqdao.adminWritefaqformAction(faq_title, faq_content);
		return "redirect:/admin_faq";
	}
	
	// 어드민 FAQ 수정 기능
	@RequestMapping("/adminfaqUpdateAction")
	public String adminfaqUpdateAction(
			@RequestParam("faq_idx") String faq_idx,
			@RequestParam("faq_title") String faq_title,
			@RequestParam("faq_content") String faq_content,
			Model model,
			HttpServletRequest request
			) {
		int result = iFaqdao.adminfaqUpdateAction(Integer.parseInt(faq_idx), faq_title, faq_content);
		return "redirect:/admin_faq_detail?faq_idx="+faq_idx;
	}
	
	// 어드민 FAQ 삭제 기능
	@RequestMapping("/adminfaqDeleteAction")
	public String adminfaqDeleteAction(
			@RequestParam("faq_idx") List<String> faq_idx,		
			HttpServletRequest request) {
		for(int i=0; i<faq_idx.size(); i++) {		
			int result = iFaqdao.adminfaqDeleteAction(Integer.parseInt(faq_idx.get(i)));
		}
		return "redirect:/admin_faq";
	}

	// 어드민 주문
	@RequestMapping("/admin_order_action")
	public String admin_order_action(
			@RequestParam(value = "order_detail_idx", required = false, defaultValue = "") String order_detail_idx,
			@RequestParam(value = "order_idx", required = false, defaultValue = "") String order_idx,
			HttpServletResponse resp,
			Model model) throws IOException {
		int total_quantity = 0;
		int total_price = 0;
		OrderDto result = iOrderdao.single_select(Integer.parseInt(order_idx));
		model.addAttribute("dto", result);
		
		List<OrderDto> product = iOrderdao.product(Integer.parseInt(order_idx));
		for(int i = 0; i<product.size();i++) {
			product.get(i).setProduct_price(product.get(i).getOrder_quantity()*product.get(i).getProduct_price());
			total_quantity += product.get(i).getOrder_quantity();
			total_price += product.get(i).getProduct_price();
		}
		model.addAttribute("list", product);
		model.addAttribute("total_quantity", total_quantity);
		model.addAttribute("total_price", total_price);
		model.addAttribute("adminPage", "../Admin/admin_order_action.jsp");
		return "Admin/admin_index";
	}	

	// 어드민 공지사항작성
	@RequestMapping("/adminWriteNoticeformAction")
	public String adminWriteNoticeformAction (
									@RequestParam("notice_title") String notice_title,
									@RequestParam("notice_content") String notice_content,
									HttpServletRequest request, 
									Model model) {
		int result = iNoticedao.adminWriteNoticeformAction(notice_title, notice_content);

		return "redirect:/admin_notice";
	}
	
 //아이디중복체크
	//   @RequestMapping(value="idCheck", method = RequestMethod.POST)
	 //  @ResponseBody
	//   public String idCheck(String user_id) throws Exception{
	 //     int result =iUsersdao.idCheck(user_id);
	   //   if(result != 0) {
	   //      return "fail";
	  //    }else {   return""; }
	  // }
	
	//공지사항수정
	@RequestMapping("/adminUpdateAction")
	public String adminUpdateAction(
			@RequestParam("notice_idx") String notice_idx,
			@RequestParam("notice_title") String notice_title,
			@RequestParam("notice_content") String notice_content,
			Model model,
			HttpServletRequest request
			) {
		int result = iNoticedao.adminUpdateAction(Integer.parseInt(notice_idx), notice_title, notice_content);
		
		return "redirect:/admin_notice_detail?notice_idx="+notice_idx;
	}
	
	//공지삭제
	@RequestMapping("/adminnoticeDeleteAction")
	public String adminnoticeDeleteAction(
			@RequestParam("notice_idx") List<String> notice_idx,		
			HttpServletRequest request) {
		System.out.println(notice_idx);
		for(int i=0; i<notice_idx.size(); i++) {		
			int result = iNoticedao.adminnoticeDeleteAction(Integer.parseInt(notice_idx.get(i)));
		}
		return "redirect:/admin_notice";
	}

	// 어드민 1:1 문의 페이지
	@RequestMapping("/admin_one2one")
	public String admin_one2one(Model model) {
		List<One2OneDto> list = iOne2onedao.list();
		model.addAttribute("list", list);
		model.addAttribute("adminPage", "../Admin/admin_one2one.jsp");
		return "Admin/admin_index";
	}
	
	// 어드민 1:1문의 검색 기능
	@RequestMapping("/admin_one2one_search")
	public String admin_one2one_search(@RequestParam("keyword") String keyword, Model model) {
		List<One2OneDto> search = iOne2onedao.search(keyword);
		model.addAttribute("list", search);
		model.addAttribute("adminPage", "../Admin/admin_one2one.jsp");
		return "Admin/admin_index";
	}

	// 어드민 1:1문의 상세 페이지
	@RequestMapping("/admin_one2one_detail")
	public String admin_one2one_detail(@RequestParam("one2one_idx") int one2one_idx, Model model) {
		One2OneDto content_detail = iOne2onedao.content_detail(one2one_idx);
		model.addAttribute("dto", content_detail);
		model.addAttribute("adminPage", "../Admin/admin_one2one_detail.jsp");
		return "Admin/admin_index";
	}
	
	// 어드민 1:1문의 이미지 상세보기 ( 새창으로 이미지 확대 페이지 )
	@RequestMapping("/admin_one2one_detail_image_form")
	public String admin_one2one_detail_image_form(@RequestParam("one2one_idx") int one2one_idx, HttpServletRequest request) {
		One2OneDto content_detail = iOne2onedao.content_detail(one2one_idx);
		request.setAttribute("list", content_detail);
		return "/Admin/admin_one2one_detail_image";
	}
	
	// 어드민 1:1문의 상세보기 답글 작성 기능
	@RequestMapping("/admin_one2one_detail_form")
	public String admin_one2one_detail_form(@RequestParam("one2one_idx") int one2one_idx,
											@RequestParam("one2one_reply") String one2one_reply) {
		int reply = iOne2onedao.reply(one2one_reply, one2one_idx);
		return "redirect:/admin_one2one_detail?one2one_idx="+one2one_idx;
	}

	// 어드민 전체 주문 현황 페이지
	@RequestMapping("/admin_order")
	public String admin_order( Model model) {
		int order_status0 = iOrderdao.beforeDTO();
		int order_status1 = iOrderdao.duringDTO();
		int order_status2 = iOrderdao.afterDTO();
		int order_status3 = iOrderdao.cancelDTO();
		int order_status = iOrderdao.orderAllDTO();
		model.addAttribute("before", order_status0 );
		model.addAttribute("during", order_status1 );
		model.addAttribute("after", order_status2 );
		model.addAttribute("cancel", order_status3 );
		model.addAttribute("orderAll", order_status );		
		model.addAttribute("adminPage", "../Admin/admin_order.jsp");
		return "Admin/admin_index";
	}

	// 어드민 전체주문 리스트 페이지
	@RequestMapping("/admin_order_list")
	public String admin_order_list(
			@RequestParam(value="page",required=false) String page,
			Model model) {
		if( page == null ) {
			page = "1";
		}
		
		System.out.println("page:" + page);
		model.addAttribute("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 5; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
		List<OrderDto> order_list = iOrderdao.order_list( String.valueOf(startRowNum), String.valueOf(endRowNum) );
		List<DeliveryDto> _new = new ArrayList<DeliveryDto>();
		int total_price = 0;
		int total_quantity = 0;
		for(int i = 0; i < order_list.size();i++) {
			DeliveryDto dto = new DeliveryDto();
			List<DeliveryDto> product = iOrderdao.product_select(order_list.get(i).getOrder_idx());
			dto.setOrder_idx(order_list.get(i).getOrder_idx());
			dto.setOrder_date(order_list.get(i).getOrder_date());
			dto.setUser_name(order_list.get(i).getOrder_user_name());
			dto.setProduct_name(product.get(0).getProduct_name());
			if(order_list.get(i).getOrder_status().equals("0")) {
				dto.setOrder_status("배송전");
			}
			else if(order_list.get(i).getOrder_status().equals("1")) {
				dto.setOrder_status("배송중");
			}
			else if(order_list.get(i).getOrder_status().equals("2")) {
				dto.setOrder_status("배송완료");
			}
			else if(order_list.get(i).getOrder_status().equals("3")) {
				dto.setOrder_status("배송전");
			}
			List<OrderDto> _Etc = iOrderdao.Etc_(order_list.get(i).getOrder_idx());
			for(int j = 0 ; j < _Etc.size(); j++) {
				total_price += _Etc.get(j).getOrder_price();
				total_quantity += _Etc.get(j).getOrder_quantity();
			}
			dto.setOrder_price(total_price);
			dto.setOrder_quantity(total_quantity);
			_new.add(dto);
		}
		model.addAttribute("list", _new);
		
		model.addAttribute("adminPage", "../Admin/admin_order_list.jsp");
		return "Admin/admin_index";
	}
	
	//어드민 전체주문목록 검색기능
	@RequestMapping("/order_list_search")
	public String order_list_search(@RequestParam("keyword") String keyword, 
									@RequestParam("search") String search, Model model) {
		String str = "";
		if(search.equals("id") ) {
			str = "user_id LIKE '%"+keyword+"%' ORDER BY user_idx DESC";
		}else if(search.equals("name")) {
			str = "user_name LIKE '%"+keyword+"%' ORDER BY user_idx DESC";
		}else if(search.equals("email")) {
			str = "user_email LIKE '%"+keyword+"%' ORDER BY user_idx DESC";
		}else if(search.equals("phone")) {
			str = "user_phone LIKE '%"+keyword+"%' ORDER BY user_idx DESC";
		}
		List<OrderDto> order_list_search = iOrderdao.order_list_search(str);
		model.addAttribute("list", order_list_search);
		model.addAttribute("adminPage", "../Admin/admin_order_list.jsp");
		return "Admin/admin_index";
	}
	
	// 어드민 상품 페이지
	@RequestMapping("/admin_product")
	public String admin_product(
			@RequestParam(value="page",required=false) String page,
			Model model) {
		if( page == null ) {
			page = "1";
		}
		
		System.out.println("page:" + page);
		model.addAttribute("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 5; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
		List<ProductDto>list = iProductdao.list( String.valueOf(startRowNum), String.valueOf(endRowNum) );
		model.addAttribute("list", list);
		model.addAttribute("adminPage", "../Admin/admin_product.jsp");
		return "Admin/admin_index";
	}
	
	//상품관리 검색기능
	@RequestMapping("/admin_product_search")
	public String admin_product_search(@RequestParam("keyword") String keyword, Model model) {
		List<ProductDto> list = iProductdao.search(keyword);
		model.addAttribute("list", list);
		model.addAttribute("adminPage", "../Admin/admin_product.jsp");
		return "Admin/admin_index";
	}
	
	// 어드민 상품등록 기능
	@RequestMapping(value="/admin_product_registration_form", method = RequestMethod.POST)
	public String admin_product_registration_form(
			@RequestParam(value = "animal", required = false, defaultValue = "") String animal,
			@RequestParam(value = "age", required = false, defaultValue = "") String age,
			@RequestParam(value = "feed-type", required = false, defaultValue = "") String feed_type,
			@RequestParam(value = "type", required = false, defaultValue = "") String type,
			@RequestParam(value = "sample", required = false, defaultValue = "0") String sample,
			@RequestParam(value = "best", required = false, defaultValue = "0") String best,
			@RequestParam(value = "new", required = false, defaultValue = "0") String new_,
			@RequestParam(value = "size", required = false, defaultValue = "") String size,
			@RequestParam(value = "name", required = false, defaultValue = "") String name,
			@RequestParam(value = "chooseFile", required=false) MultipartFile file,
			@RequestParam(value = "price", required = false, defaultValue = "") String price,
			@RequestParam(value = "bo_content", required = false, defaultValue = "") String content, 
			Model model) {
		String upload_url = fileUploadService.restore(file);
		ProductDto dto = new ProductDto();
		dto.setProduct_animal(Integer.parseInt(animal));
		dto.setProduct_age(Integer.parseInt(age));
		dto.setProduct_feed_type(Integer.parseInt(feed_type));
		dto.setProduct_category_type(Integer.parseInt(type));
		if (Integer.parseInt(sample) == 2) {
			dto.setProduct_sample(1);
		} else {
			dto.setProduct_sample(Integer.parseInt(sample));
		}
		dto.setProduct_best(Integer.parseInt(best));
		dto.setProduct_new(Integer.parseInt(new_));
		dto.setProduct_size(Integer.parseInt(size));
		dto.setProduct_price(Integer.parseInt(price));
		dto.setProduct_name(name);
		dto.setProduct_image(upload_url);
		dto.setProduct_content(content);
		
		int result = iProductdao.insertProduct( dto );
		return "redirect:/admin_product";
	}
	
	// 어드민 상품 수정 기능
	@RequestMapping(value="/admin_product_update_form", method = RequestMethod.POST)
	public String admin_product_update_form(			
			@RequestParam(value = "product_idx") String product_idx,
			@RequestParam(value = "animal", required = false, defaultValue = "") String animal,
			@RequestParam(value = "age", required = false, defaultValue = "") String age,
			@RequestParam(value = "feed-type", required = false, defaultValue = "") String feed_type,
			@RequestParam(value = "type", required = false, defaultValue = "") String type,
			@RequestParam(value = "sample", required = false, defaultValue = "0") String sample,
			@RequestParam(value = "best", required = false, defaultValue = "0") String best,
			@RequestParam(value = "new", required = false, defaultValue = "0") String new_,
			@RequestParam(value = "size", required = false, defaultValue = "") String size,
			@RequestParam(value = "name", required = false, defaultValue = "") String name,
			@RequestParam(value = "chooseFile", required=false) MultipartFile file,
			@RequestParam(value = "price", required = false, defaultValue = "") String price,
			@RequestParam(value = "bo_content", required = false, defaultValue = "") String content,
			HttpServletRequest request) {
		ProductDto dto = new ProductDto();
		
		if(file.isEmpty()) {
			String original_image = request.getParameter("original_image");
			dto.setProduct_image(original_image);
		}else {
			String upload_url = fileUploadService.restore(file);
			dto.setProduct_image(upload_url);
		}
		dto.setProduct_idx(Integer.parseInt(product_idx));
		dto.setProduct_animal(Integer.parseInt(animal));
		dto.setProduct_age(Integer.parseInt(age));
		dto.setProduct_feed_type(Integer.parseInt(feed_type));
		dto.setProduct_category_type(Integer.parseInt(type));
		if (Integer.parseInt(sample) == 2) {
			dto.setProduct_sample(1);
		} else {
			dto.setProduct_sample(Integer.parseInt(sample));
		}
		dto.setProduct_best(Integer.parseInt(best));
		dto.setProduct_new(Integer.parseInt(new_));
		dto.setProduct_size(Integer.parseInt(size));
		dto.setProduct_price(Integer.parseInt(price));
		dto.setProduct_name(name);
		dto.setProduct_content(content);
		
		int update = iProductdao.update(dto);
		return "redirect:/admin_product";
	}
	
	// 어드민 주문상품 상태 수정 0:배송전 , 1:배송중 , 2:배송완료 , 3:주문취소
	@RequestMapping(value="/admin_order_status_update", method=RequestMethod.GET)
	public String admin_order_status_update(
			@RequestParam(value="delivery") String order_status,
			@RequestParam(value="order_idx") String order_idx,
			HttpServletRequest request,
			Model model) {
		int result = iOrderdao.order_status_update(Integer.parseInt(order_status),Integer.parseInt(order_idx));
		return "redirect:/admin_order_action?order_idx="+Integer.parseInt(order_idx);
	}
	
}
