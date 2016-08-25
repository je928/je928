package bowtech.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bowtech.model.Research;
import bowtech.model.ResearchItem;
import bowtech.model.ResearchQuestion;
import bowtech.service.BoardPagingBean;
import bowtech.service.BoardService;
import bowtech.service.ResearchService;

@Controller
public class ResearchController {
	
	@Autowired
	private ResearchService rs;
	
	@Autowired
	private BoardService bs;
	
	@RequestMapping(value = "researchList")
	public String list(Research research, String pageNum, String searchType, String searchTxt, Model model) {
		final int rowPerPage = 10;

		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}

		if (searchType == null) {
			searchType = "all";
		}
		if (searchTxt == null) {
			searchTxt = "";
		}
		
		int nowPage = Integer.parseInt(pageNum);
		int startRow = (nowPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		research.setStartRow(startRow);
		research.setEndRow(endRow);
		research.setSearchType(searchType);
		research.setSearchTxt(searchTxt);
		
		int total = rs.getTotal(research);
		
		BoardPagingBean pb = new BoardPagingBean(nowPage, total);
		List<Research> list = rs.list(research);
		for(int i=0; i<list.size(); i++) {
			String subject_replace = list.get(i).getRs_subject().replaceAll("<", "&lt;");
			String subject_replace_finish = subject_replace.replaceAll(">", "&gt;");
			list.get(i).setRs_subject(subject_replace_finish);
			if (searchTxt != null) {
				String subject_txt = list.get(i).getRs_subject().replaceAll(searchTxt, "<span class='subjecttxt'>"+searchTxt+"</span>");
				list.get(i).setRs_subject(subject_txt);
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		
		if (research.getSearchType() != null) {
			model.addAttribute("searchType", research.getSearchType());
			model.addAttribute("searchTxt", research.getSearchTxt());
		}
		
		model.addAttribute("bs", bs);
		model.addAttribute("pgm", "../research/researchList.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "researchView")
	public String view(int rs_no, String pageNum, String searchType, String searchTxt, Model model, HttpSession session) {
		if (searchType == null) {
			searchType = "all";
		}
		if (searchTxt == null) {
			searchTxt = "";
		}
		rs.researchHit(rs_no);
		Research research = rs.researchSelect(rs_no);
		// 태그 치환
		String subject_replace = research.getRs_subject().replaceAll("<", "&lt;");
		String subject_replace_finish = subject_replace.replaceAll(">", "&gt;");
		research.setRs_subject(subject_replace_finish);
		// 태그 치환 끝
		
		if (searchTxt != null) {
			String subject_txt = research.getRs_subject().replaceAll(searchTxt, "<span class='subjecttxt'>"+searchTxt+"</span>");
			research.setRs_subject(subject_txt);
		}// 검색어 글자 색상 바꾸기
		
		research.setSearchType(searchType);
		research.setSearchTxt(searchTxt);
		if (research.getSearchType() != null) {
			model.addAttribute("searchType", research.getSearchType());
			model.addAttribute("searchTxt", research.getSearchTxt());
		}
		
		int itemListTotal = rs.getitemTotal(rs_no);
		List<ResearchItem> itemList = rs.itemSelect(rs_no);
		
		model.addAttribute("research", research);
		model.addAttribute("itemListTotal", itemListTotal);
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pgm", "../research/researchView.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "researchEditForm")
	public String editForm(Research research, ResearchQuestion question, String pageNum, Model model) {
		research.setRs_no(0);
		question.setQ_no(0);
		model.addAttribute("research", research);
		model.addAttribute("question", question);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pgm", "../research/researchEdit.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "researchEdit")
	public String edit(Research research, ResearchQuestion question, ResearchItem item, String pageNum, Model model, HttpSession session) {
		int number = rs.insertNo();
		research.setRs_no(number);
		int result = rs.researchInsert(research);

		List<String> questionList = question.getQ_subject_list();
		List<String> item1List = item.getI_title1_list();
		List<String> item2List = item.getI_title2_list();
		List<String> item3List = item.getI_title3_list();
		List<String> item4List = item.getI_title4_list();
		List<String> item5List = item.getI_title5_list();
		
		int qno = 0;
		if (questionList != null) {
			for (String que : questionList) {
				qno = rs.insertQno();
				question.setQ_no(qno);
				question.setRs_no(number);
				question.setQ_subject(que);
				rs.questionInsert(question);
			}
		}
		
		int qno2 = qno - questionList.size() + 1;
		for(int i=0; i<questionList.size(); i++) {
			int ino = rs.insertIno();
			item.setI_no(ino);
			item.setQ_no(qno2+i);
			item.setI_title1(item1List.get(i));
			item.setI_title2(item2List.get(i));
			item.setI_title3(item3List.get(i));
			item.setI_title4(item4List.get(i));
			item.setI_title5(item5List.get(i));
			rs.itemInsert(item);
		}
		model.addAttribute("pageNum", pageNum);
		if (result > 0) {
			return "redirect:researchView.do?rs_no=" + research.getRs_no();
		} else {
			model.addAttribute("msg", "입력 실패");
			model.addAttribute("research", research);
			return "forward:researchEditForm.do";
		}
	}
	
}
