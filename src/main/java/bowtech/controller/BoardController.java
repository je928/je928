package bowtech.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import bowtech.model.Board;
import bowtech.model.BoardFile;
import bowtech.model.BoardReply;
import bowtech.service.BoardPagingBean;
import bowtech.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bs;
	
	@RequestMapping(value="board")
	public String list(Board board, String pageNum, String searchType, String searchTxt, Model model) {
		
		final int rowPerPage = 10;
		
		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		if(searchType == null){
			searchType = "all";
		}
		if(searchTxt == null){
			searchTxt = "";
		}
		
		int nowPage = Integer.parseInt(pageNum);
		int startRow = (nowPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		board.setSearchType(searchType);		
		board.setSearchTxt(searchTxt);
		
		int total = bs.getTotal(board);
		
		BoardPagingBean pb = new BoardPagingBean(nowPage, total);
		List<Board> list = bs.list(board);
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		
		if (board.getSearchType() != null) {
			model.addAttribute("searchType", board.getSearchType());
			model.addAttribute("searchTxt", board.getSearchTxt());
		}
		model.addAttribute("bs", bs);
		model.addAttribute("pgm", "../board/list.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="view")
	public String view(int brd_no, String pageNum, String searchType, String searchTxt, Model model, HttpSession session) {
		if(searchType == null){
			searchType = "all";
		}
		if(searchTxt == null){
			searchTxt = "";
		}
		bs.boardHit(brd_no);
		Board board = bs.boardSelect(brd_no);
		List<BoardReply> reList = bs.selectReply(brd_no);
		List<BoardFile> fileList = bs.selectFile(brd_no);
		int replyCount = bs.replyCount(brd_no);
		int refTotal = bs.refTotal(brd_no);
		board.setSearchType(searchType);	
		board.setSearchTxt(searchTxt);
		if (board.getSearchType() != null) {
			model.addAttribute("searchType", board.getSearchType());
			model.addAttribute("searchTxt", board.getSearchTxt());
		}
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("reList", reList);
		model.addAttribute("fileList", fileList);
		model.addAttribute("replyCount", replyCount);
		model.addAttribute("refTotal", refTotal);
		model.addAttribute("bs", bs);
		model.addAttribute("pgm", "../board/view.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="writeForm")
	public String writeForm(Board board, String pageNum, String brd_no, Model model) {
		board.setBrd_no(0);
		board.setRef(0);
		board.setRe_level(0);
		board.setRe_step(0);
		// 답변글 시작
		if(brd_no != null) {
			int no = Integer.parseInt(brd_no);
			Board brd = bs.boardSelect(no);
			board.setBrd_no(brd.getBrd_no());
			board.setRef(brd.getRef());
			board.setRe_level(brd.getRe_level());
			board.setRe_step(brd.getRe_step());
		}
		// 끝
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pgm", "../board/write.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="write")
	public String write(Board board, BoardFile boardfile, String pageNum, Model model, HttpSession session) throws IllegalStateException, IOException {
		int number = bs.insertNo();
		// 답변글 시작
		if(board.getBrd_no() > 0) {
			bs.updateRe_step(board);
			board.setRe_level(board.getRe_level()+1);
			board.setRe_step(board.getRe_step()+1);
		}else {
			board.setRef(number);
		}
		// 답변글 끝
		board.setBrd_no(number);
		List<MultipartFile> files = boardfile.getFiles();
		while (files.remove(null));
		System.out.println(files);
		if (null != files && files.size() > 0) {
			for (MultipartFile mf : files) {
				if(!mf.isEmpty()) {
					int fileNo = bs.fileNo();
					String originalName = mf.getOriginalFilename();
					String match = "[@]|[#]|[$]|[%]|[&]|[+]|[=]|[,]";
					String re_originalName = originalName.replaceAll(match, "");
					String uploadName = System.currentTimeMillis()+re_originalName;
					int size = (int) mf.getSize();
					mf.transferTo(new File(session.getServletContext().getRealPath("/")+uploadName));
					boardfile.setF_no(fileNo);
					boardfile.setF_original_name(originalName);
					boardfile.setF_stored_name(uploadName);
					boardfile.setF_size(size);
					boardfile.setBrd_no(number);
					bs.fileInsert(boardfile);
				}
			}
		}
		int result = bs.boardInsert(board);
		model.addAttribute("pageNum", pageNum);
		if(result > 0) {
			return "redirect:view.do?brd_no="+board.getBrd_no();
		}else {
			model.addAttribute("msg", "입력 실패");
			model.addAttribute("board", board);
			return "forward:writeForm.do";
		}
	}
	
	@RequestMapping(value="updateForm")
	public String updateForm(int brd_no, String pageNum, Model model) {
		Board board = bs.boardSelect(brd_no);
		List<BoardFile> fileList = bs.selectFile(brd_no);
		int fileCount = bs.fileCount(brd_no);
		model.addAttribute("board", board);
		model.addAttribute("fileList", fileList);
		model.addAttribute("fileCount", fileCount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pgm", "../board/updateForm.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="update")
	public String update(Board board, BoardFile boardfile, String pageNum, Model model, HttpSession session) throws IllegalStateException, IOException { 
		int result = bs.boardUpdate(board);
		int number = board.getBrd_no();
		List<String> filedellist = boardfile.getFiledellist();
		if(filedellist != null) {
			for (String fno : filedellist) {
				int delfno = Integer.parseInt(fno);
				boardfile.setF_no(delfno);
				bs.fileDelete(boardfile);
			}
		}
		List<MultipartFile> files = boardfile.getFiles();
		while (files.remove(null));
		if (null != files && files.size() > 0) {
			for (MultipartFile mf : files) {
				if(!mf.isEmpty()) {
					int fileNo = bs.fileNo();
					String originalName = mf.getOriginalFilename();
					String match = "[@]|[#]|[$]|[%]|[&]|[+]|[=]|[,]";
					String re_originalName = originalName.replaceAll(match, "");
					String uploadName = System.currentTimeMillis()+re_originalName;
					int size = (int) mf.getSize();
					mf.transferTo(new File(session.getServletContext().getRealPath("/")+uploadName));
					boardfile.setF_no(fileNo);
					boardfile.setF_original_name(originalName);
					boardfile.setF_stored_name(uploadName);
					boardfile.setF_size(size);
					boardfile.setBrd_no(number);
					bs.fileInsert(boardfile);
				}
			}
		}
		if(result > 0) {
			return "redirect:view.do?brd_no="+board.getBrd_no()+"&pageNum="+pageNum;
		}else {
			model.addAttribute("msg", "수정 실패");		
			model.addAttribute("board", board);
			model.addAttribute("pageNum", pageNum);
			return "forward:updateForm.do?brd_no="+board.getBrd_no()+"&pageNum="+pageNum;
		}
	}
	
	@RequestMapping(value="deleteForm")
	public String deleteForm(int brd_no, String pageNum, Model model) {
		Board board = bs.deletePwdChk(brd_no);
		String dbPass = board.getM_passwd();
		model.addAttribute("brd_no", brd_no);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dbPass", dbPass);
		model.addAttribute("pgm", "../board/deleteForm.jsp");
		return "module/main";
	}
	
	@RequestMapping(value="delete")
	public String delete(Board board, String brd_no, String pageNum, Model model) {
		int number = Integer.parseInt(brd_no);
		int result = bs.boardDelete(number);
		if(result > 0) {
			return "redirect:board.do?pageNum="+pageNum;
		}else {
			model.addAttribute("msg", "삭제 실패");
			model.addAttribute("board", board);
			model.addAttribute("pageNum", pageNum);
			return "forward:deleteForm.do?brd_no="+board.getBrd_no()+"&pageNum="+pageNum;
		}
	}
	
	@RequestMapping(value="writeReply")
	public String writeReply(BoardReply boardReply, String pageNum, String brd_no, Model model, HttpSession session) {
		int re_no = bs.replyNo();
		boardReply.setRe_no(re_no);
		int result = bs.insertReply(boardReply);
		model.addAttribute("pageNum", pageNum);
		if(result > 0) {
			return "redirect:view.do?brd_no="+boardReply.getBrd_no();
		}else {
			model.addAttribute("msg", "입력 실패");
			model.addAttribute("boardReply", boardReply);
			return "forward:view.do?brd_no="+boardReply.getBrd_no();
		}
	}
	
	@RequestMapping(value="updateReply")
	public String update(BoardReply boardReply, String pageNum, Model model) {
		int result = bs.updateReply(boardReply);
		if(result > 0) {
			model.addAttribute("pageNum", pageNum);
			return "redirect:view.do?brd_no="+boardReply.getBrd_no();
		}else {
			model.addAttribute("msg", "수정 실패");
			model.addAttribute("boardReply", boardReply);
			model.addAttribute("pageNum", pageNum);
			return "forward:view.do?brd_no="+boardReply.getBrd_no();
		}
	}
	
	@RequestMapping(value="deleteReply")
	public String deleteReply(BoardReply boardReply, String re_no, String pageNum, Model model) {
		int reNo = Integer.parseInt(re_no);
		int result = bs.deleteReply(reNo);
		if(result > 0) {
			model.addAttribute("pageNum", pageNum);
			return "redirect:view.do?brd_no="+boardReply.getBrd_no();
		}else {
			model.addAttribute("msg", "삭제 실패");
			model.addAttribute("boardReply", boardReply);
			model.addAttribute("pageNum", pageNum);
			return "forward:view.do?brd_no="+boardReply.getBrd_no();
		}
	}
	
	@RequestMapping(value="filedown")
	public void filedown(String fileName, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException{

		String filePath = session.getServletContext().getRealPath("/")+fileName;
		
		FileInputStream fileInputStream = null;
		ServletOutputStream servletOutputStream = null;
		
		String subfileName = fileName.substring(13);
		
		try {
			String downName = null;
			String browser = request.getHeader("User-Agent");
			if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){
				downName = URLEncoder.encode(subfileName,"UTF-8");
			} else {
				downName = new String(subfileName.getBytes("UTF-8"), "ISO-8859-1");
			}
			response.setHeader("Content-Disposition","attachment;filename=\""+downName+"\"");
			response.setContentType("application/octer-stream");
			response.setHeader("Content-Transfer-Encoding", "binary;");

			fileInputStream = new FileInputStream(filePath);
			servletOutputStream = response.getOutputStream();
			
			byte b [] = new byte[1024];
			int data = 0;
			
			while((data=(fileInputStream.read(b, 0, b.length))) != -1) {
				servletOutputStream.write(b, 0, data);
			}
			servletOutputStream.flush();
			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				if(servletOutputStream!=null){
					try {
						servletOutputStream.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				if (fileInputStream!=null){
					try {
						fileInputStream.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	
		/*response.setHeader("Content-Disposition", "attachment;filename="+ofileName);
		String filePath = session.getServletContext().getRealPath("/")+fileName;
		FileInputStream fi = new FileInputStream(filePath);
		ServletOutputStream sout = response.getOutputStream();
		byte[] buf = new byte[1024];
		int size = 0;
		while((size = fi.read(buf, 0, 1024))!=-1){
			sout.write(buf, 0, size);
		}
		fi.close();
		sout.close();*/
	
	}
