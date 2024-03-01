package com.book.cord;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Data;

@Controller
public class TestMainController {

	@Autowired
	private RestTemplate restTemplate;

	private static final String API_URL = "http://www.aladin.co.kr/ttb/api/ItemList.aspx";
	private static final String API_KEY = "ttbfldpf20031555001";

	@GetMapping("/testmain")
	public String main() {
		return "testmain";
	}

	// JSON 데이터를 SearchResult 객체로 변환하는 메서드
	public SearchResult convertJsonToSearchResult(String json) {
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			SearchResult searchResult = objectMapper.readValue(json, SearchResult.class);
			return searchResult;
		} catch (IOException e) {
			e.printStackTrace();
			return null; // 변환 실패 시 null 반환
		}
	}

	// 컨트롤러 메서드에서 사용 예시
	@GetMapping("/search")
	public String searchBooks(@RequestParam("queryType") String queryType, @RequestParam("keyword") String keyword,
			Model model) {

		String url = API_URL + "?ttbkey=" + API_KEY + "&QueryType=" + queryType
				+ "&MaxResults=10&start=1&SearchTarget=Book&output=json&Version=20131101";

		ResponseEntity<String> responseEntity = restTemplate.getForEntity(url, String.class);
		String json = responseEntity.getBody();

		// JSON 데이터를 SearchResult 객체로 변환
		SearchResult searchResult = convertJsonToSearchResult(json);

		if (searchResult != null) {
			// SearchResult 객체를 모델에 추가
			model.addAttribute("books", searchResult.getBooks());
		} else {
			// 변환 실패 시 예외 처리
			model.addAttribute("error", "Failed to parse JSON data");
		}

		return "search";
	}

	@Data
	public class SearchResult {
		private List<Book> books;

		// 생성자, 게터, 세터 생략
	}

	@Data
	public class Book {
		private String title;
		private String author;
		private String publisher;
		private String isbn;

		// 생성자, 게터, 세터 생략
	}
}
