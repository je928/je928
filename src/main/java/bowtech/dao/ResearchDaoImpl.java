package bowtech.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bowtech.model.Research;
import bowtech.model.ResearchItem;
import bowtech.model.ResearchQuestion;

@Repository
public class ResearchDaoImpl implements ResearchDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public List<Research> list(Research research) {
		return session.selectList("research.researchList", research);
	}

	public int getTotal(Research research) {
		int total = 0;
		try {
			total = session.selectOne("research.researchTotal", research);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return total;
	}

	public void researchHit(int rs_no) {
		session.update("research.researchHit", rs_no);
	}

	public Research researchSelect(int rs_no) {
		return session.selectOne("research.researchSelect", rs_no);
	}
	
	public int insertNo() {
		return session.selectOne("research.insertNo");
	}

	public int researchInsert(Research research) {
		int result = 0;
		try {
			result = session.insert("research.researchInsert", research);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public int insertQno() {
		return session.selectOne("question.insertQno");
	}
	
	public void questionInsert(ResearchQuestion question) {
		 session.insert("question.questionInsert", question);
	}

	public int insertIno() {
		return session.selectOne("item.insertIno");
	}

	public void itemInsert(ResearchItem item) {
		session.insert("item.itemInsert", item);
	}

}
