package com.book.cord.notice;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class NoticeController {

	@Autowired
	@Qualifier("noticeServiceImpl")
	NoticeService service;

	@Autowired
	NoticeMapper mapper;

	// 공지사항 리스트
	@GetMapping("/notice")
	public String list(Criteria cri, Model model) throws Exception {
		System.out.println("컨트롤러 list(): " + cri); // 로그 출력

		List<NoticeVO> list = service.getList(cri);
		model.addAttribute("list", list);

		int totalCount = service.count();
		model.addAttribute("totalCount", totalCount);

		PageDTO pageMaker = new PageDTO(cri, totalCount);
		model.addAttribute("pageMaker", pageMaker);

		return "notice/notice";
	}
	
	// 공지사항 작성 get
	@GetMapping("/writeNotice")
	public String writeNotice() {
		return "notice/writeNotice";
	}
	
	// 공지사항 작성 post
    @PostMapping("/insertNotice")
    public String insertNotice(NoticeVO notice, @RequestParam("uploadFiles") MultipartFile[] uploadFile, Model model) {
        System.out.println("공지사항 작성 중 ===> " + notice);

        String uploadDir = "C:\\multicamp\\SpringWorkspace\\BookCord\\src\\main\\webapp\\resources\\notice_files";
        
        //Make Folder
  		File uploadPath = new File(uploadDir);
  		System.out.println("upload path: "+uploadPath);
  		
  		if(uploadPath.exists() == false) {
  			uploadPath.mkdirs();
  		} 
		
        String fileNames = Arrays.stream(uploadFile)
                .filter(file -> !file.isEmpty())
                .map(file -> {
                	String originalFileName = file.getOriginalFilename();
                    String uuid = UUID.randomUUID().toString();
                    String uploadFileName = uuid + "_" + originalFileName;
                    File destinationFile = new File(uploadPath, uploadFileName);
                    try {
                        file.transferTo(destinationFile);
                    } catch (IOException e) {
                        log.error(e.getMessage());
                    }
                    return uploadFileName;
                })
                .collect(Collectors.joining(",  "));	//여러 개의 파일을 ,로 구분
				
				notice.setFiles(fileNames);
				
				service.write(notice); // 데이터베이스에 NoticeVO 저장

        log.info("컨트롤러에서 서비스.insertNotice 호출!!!");
        return "redirect:/notice";
    }

	//파일을 날짜 별로 폴더에 저장할 때 사용 ==> 미사용 메서드
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	//공지사항 첨부 파일 다운로드
	@GetMapping(value="/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestParam("fileName") String fileName) {
		System.out.println("download file : "+fileName);
		
		//FileSystemResource resource = new FileSystemResource("C:\\multicamp\\SpringWorkspace\\BookCord\\src\\main\\webapp\\resources\\notice_files\\"+fileName);
		Resource resource = new FileSystemResource("C:\\multicamp\\SpringWorkspace\\BookCord\\src\\main\\webapp\\resources\\notice_files\\"+fileName);
		
		System.out.println("resource : "+resource);
		
		String resourceName = resource.getFilename();
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Disposition", 
					"attachment; filename=" + new String(resourceName.getBytes("UTF-8"),
					"ISO-8859-1"));
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}

	// 공지사항 확인
	@GetMapping("/detailNotice/{notice_num}")
	public String detailNotice(@PathVariable("notice_num") int notice_num, Model model) {
		System.out.println("===============클릭한 공지사항 글 번호 ===> " + notice_num + " !!!");
		NoticeVO vo = service.getNotice(notice_num);
		if (vo != null) {
			model.addAttribute("notice", vo);
		}
		return "notice/detailNotice";
	}

	// 공지사항 삭제
	@GetMapping("/deleteNotice")
	public String deleteNotice(int notice_num) throws Exception {
		System.out.println("===============삭제할 공지사항 글 번호 ===> " + notice_num + " !!!");
		int result = service.delNotice(notice_num);
		if (result > 0) {
			System.out.println("컨트롤러 =========> " + notice_num + "번 게시물 삭제 완료");
			return "redirect:/notice";
		} else {
			System.out.println(" 실패 >>>>> 컨트롤러에서 deleteNotice");
			return "redirect:/";
		}
	}

	// 공지사항 수정 get
	@GetMapping("/updateNotice")
	public String updateNotice(int notice_num, Model model) {
		NoticeVO vo = service.getNotice(notice_num);
		if (vo != null) {
			model.addAttribute("notice", vo);
		}
		return "notice/updateNotice";
	}

}
