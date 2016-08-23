package bowtech.dao;

import java.util.List;

import bowtech.model.Research;
import bowtech.model.ResearchItem;
import bowtech.model.ResearchQuestion;

public interface ResearchDao {
	
	List<Research> list(Research research);
	int getTotal(Research research);
	void researchHit(int rs_no);
	Research researchSelect(int rs_no);
	int insertNo();
	int researchInsert(Research research);
	int insertQno();
	void questionInsert(ResearchQuestion question);
	int insertIno();
	void itemInsert(ResearchItem item);

}
