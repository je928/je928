package bowtech.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bowtech.dao.ResearchDao;

@Service
public class ResearchServiceImpl implements ResearchService {

	@Autowired
	private ResearchDao rd;
	
}
