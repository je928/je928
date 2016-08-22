package bowtech.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResearchDaoImpl implements ResearchDao {

	@Autowired
	private SqlSessionTemplate session;
	
}
