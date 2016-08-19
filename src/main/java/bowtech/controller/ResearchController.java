package bowtech.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ResearchController {
	
	@RequestMapping(value = "researchList")
	public String list(Model model) {
		model.addAttribute("pgm", "../research/researchList.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "researchView")
	public String view(Model model) {
		model.addAttribute("pgm", "../research/researchView.jsp");
		return "module/main";
	}
	
	@RequestMapping(value = "researchEdit")
	public String edit(Model model) {
		model.addAttribute("pgm", "../research/researchEdit.jsp");
		return "module/main";
	}
	
}
