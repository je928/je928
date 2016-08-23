package bowtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bowtech.dao.ResearchDao;
import bowtech.model.Research;
import bowtech.model.ResearchItem;
import bowtech.model.ResearchQuestion;

@Service
public class ResearchServiceImpl implements ResearchService {

	@Autowired
	private ResearchDao rd;

	public List<Research> list(Research research) {
		return rd.list(research);
	}

	public int getTotal(Research research) {
		return rd.getTotal(research);
	}

	public void researchHit(int rs_no) {
		rd.researchHit(rs_no);
	}

	public Research researchSelect(int rs_no) {
		return rd.researchSelect(rs_no);
	}

	public int insertNo() {
		return rd.insertNo();
	}

	public int researchInsert(Research research) {
		return rd.researchInsert(research);
	}

	public int insertQno() {
		return rd.insertQno();
	}
	
	public void questionInsert(ResearchQuestion question) {
		rd.questionInsert(question);
	}

	public int insertIno() {
		return rd.insertIno();
	}

	public void itemInsert(ResearchItem item) {
		rd.itemInsert(item);
	}

}
