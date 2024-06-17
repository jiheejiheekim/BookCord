package com.book.cord.board;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.book.cord.login.CustomUserDetails;
import com.book.cord.login.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FreeBoardController {
	
	@Autowired
	@Qualifier("boardServiceImpl")
	BoardService service;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpServletResponse response;
	
	//자유게시판 리스트	
	@GetMapping("/freeBoard") 
	public String freeList(Criteria cri, Model model) throws Exception {
		System.out.println("컨트롤러 freeList(): " + cri);

		List<FreeBoardVO> list = service.getFreeBoardList(cri);
		model.addAttribute("list", list);

		int totalCount = service.totalFreeBoardCount();
		model.addAttribute("totalCount", totalCount);

		PageDTO pageMaker = new PageDTO(cri, totalCount);
		model.addAttribute("pageMaker", pageMaker);

		return "board/freeBoard"; 
	}
	
	//자유게시판 작성 get
	@GetMapping("/writeFreeBoard")
	public String writeFreeBoard(Model model) throws Exception{
		System.out.println("========================================= 컨트롤러 writeFreeBoard()");
		//세션에서 ID값 얻어오기
		HttpSession session = request.getSession(false); // 세션이 없을 경우 null 반환
        if (session == null || session.getAttribute("member") == null) {
            String encodedMessage = URLEncoder.encode("로그인 하세요", "UTF-8");
            return "redirect:/loginP?error=true&message=" + encodedMessage;
        }
	    
		CustomUserDetails userDetails = (CustomUserDetails) session.getAttribute("member");
	    String member_id = userDetails.getUsername();
	    
		System.out.println("Session에 저장된 member_id : " + member_id);
		MemberVO memberName = service.getMemberName(member_id);
		if(memberName != null) {
	        System.out.println(member_id+"님의 닉네임 : "+memberName);
	        model.addAttribute("memberName", memberName.getName());
	    }else {
	    	System.out.println(member_id+"님의 닉네임 ==> "+memberName.getName());
	    }
	    
		return "board/writeFreeBoard";
	}
	
	//자유게시판 작성 post
	@PostMapping("/insertFreeBoard")
    public String insertFreeBoard(FreeBoardVO freeBoard, @RequestParam("uploadFiles") MultipartFile[] uploadFile, Model model) throws Exception {
        System.out.println("공지사항 작성 중 ===> " + freeBoard);

        String uploadDir = "C:\\multicamp\\SpringWorkspace\\BookCord\\src\\main\\webapp\\resources\\freeBoard_files";
        
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
				
        freeBoard.setFiles(fileNames);

        //세션에서 ID값 얻어오기
  		HttpSession session = request.getSession(false); // 세션이 없을 경우 null 반환
          if (session == null || session.getAttribute("member") == null) {
              String encodedMessage = URLEncoder.encode("로그인 하세요", "UTF-8");
              return "redirect:/loginP?error=true&message=" + encodedMessage;
          }
  	    
  		CustomUserDetails userDetails = (CustomUserDetails) session.getAttribute("member");
  	    String member_id = userDetails.getUsername();
  	    freeBoard.setMember_id(member_id);
  	    
		service.writeFreeBoard(freeBoard); 

        log.info("컨트롤러에서 서비스.insertFreeBoard 호출!!!");
        return "redirect:/freeBoard";
    }
	
	//자유게시판 첨부 파일 다운로드
	@GetMapping(value="/downloadF", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestParam("fileName") String fileName) {
		System.out.println("download file : "+fileName);
		
		//다운로드 경로
		//FileSystemResource resource = new FileSystemResource("C:\\multicamp\\SpringWorkspace\\BookCord\\src\\main\\webapp\\resources\\notice_files\\"+fileName);
		Resource resource = new FileSystemResource("C:\\multicamp\\SpringWorkspace\\BookCord\\src\\main\\webapp\\resources\\freeBoard_files\\"+fileName);
		//Resource resource = new FileSystemResource("C:\\Users\\JHee\\Desktop\\개인프로젝트\\fileDownloadRoot\\"+fileName);
		
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
		
		// 파일을 사용자 지정 경로에 저장
	    String userSaveDir = "C:\\Users\\JHee\\Desktop\\개인프로젝트\\fileDownloadRoot\\freeBoard\\";
	    File userSavePath = new File(userSaveDir);
	    if (!userSavePath.exists()) {
	        userSavePath.mkdirs();
	    }
	    File userFile = new File(userSavePath, resourceName);
	    try {
	        InputStream in = resource.getInputStream();
	        Files.copy(in, userFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
	        in.close();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	//자유게시판 확인
	@GetMapping("/detailFreeBoard/{freeBoard_num}")
	public String detailFreeBoard(@PathVariable("freeBoard_num") int freeBoard_num, Model model)  throws Exception {
		System.out.println("===============클릭한 공지사항 글 번호 ===> " + freeBoard_num + " !!!");
		FreeBoardVO vo = service.getFreeBoard(freeBoard_num);
		service.upHit(freeBoard_num);
		if (vo != null) {
			model.addAttribute("freeBoard", vo);
		}
		return "board/detailFreeBoard";
	}
	
	//공지사항 삭제
	//공지사항 수정 get
	//공지사항 수정 post
	//공지사항 검색
	
}
