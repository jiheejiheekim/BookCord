package com.book.cord.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.book.cord.board.BookService;
import com.book.cord.board.Criteria;
import com.book.cord.board.PageDTO;
import com.book.cord.board.BookVO.DetailBooks;
import com.book.cord.mypage.ReviewVO;

@Controller
public class DetailController {
	
	//상품 리스트 API
    private static final String API_URL1 = "http://www.aladin.co.kr/ttb/api/ItemList.aspx";
    
    //상품 검색 API
    private static final String API_URL2 = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
    
    //상품 조회 API
    private static final String API_URL3 = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";
    
    private static final String API_KEY = "ttbfldpf20031555001";

    public final RestTemplate restTemplate = new RestTemplate();

    @Autowired
	@Qualifier("bookServiceImpl")
	private final BookService bookService;
	
	@Autowired // BookService 주입
    public DetailController(BookService bookService) {
        this.bookService = bookService;
    }
	
	@GetMapping("/detail")
	public String detail() {
		return "book/detail";
	}
	
	
	@GetMapping("/detail/{isbn13}")
    public String detail(@PathVariable("isbn13") String isbn13, Criteria cri, Model model) {
		System.out.println(">>>>>>>>>>>>>> 컨트롤러 detail() 호출");
        DetailBooks searchResult = bookService.getDetailBook(isbn13);
        // 리뷰 목록을 가져오는 메서드 호출
        getReviewListAjax(isbn13, cri, model);
        
        /*
		cri.setAmount(5);
		List<ReviewVO> list = bookService.getDetailReviewList(cri, isbn13);
		
		int totalCount = bookService.detailReviewTotal(isbn13);
		model.addAttribute("totalCount", totalCount);

		PageDTO pageMaker = new PageDTO(cri, totalCount);
		model.addAttribute("pageMaker", pageMaker);
		
		if(list != null) {
			model.addAttribute("myReviewList", list);
		}else {
			System.out.println("=============> 리뷰 갖고 오기 실패");
		}
		*/
        if (searchResult != null) {
            model.addAttribute("items", searchResult.getItem());
            System.out.println(searchResult.getItem());
        } else {
            model.addAttribute("items", null);
        }
        return "book/detail";
    }
	
	
	// 리뷰 목록을 가져오는 메서드
	@GetMapping("/getReviewList/{isbn13}")
    public String getReviewListAjax(@PathVariable("isbn13") String isbn13, Criteria cri, Model model) {
        cri.setAmount(5);
        List<ReviewVO> list = bookService.getDetailReviewList(cri, isbn13);
        
        int totalCount = bookService.detailReviewTotal(isbn13);
        model.addAttribute("totalCount", totalCount);
        
        PageDTO pageMaker = new PageDTO(cri, totalCount);
        model.addAttribute("pageMaker", pageMaker);
        
        if (list != null) {
            model.addAttribute("myReviewList", list);
        } else {
            System.out.println("=============> 리뷰 갖고 오기 실패");
        }
        
        return "book/detail";
    }
    
 

}
