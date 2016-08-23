package bowtech.model;

import java.util.List;

public class ResearchQuestion {

	private int q_no;
	private int rs_no;
	private String q_subject;
	private List<String> q_subject_list;

	public int getQ_no() {
		return q_no;
	}

	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}

	public int getRs_no() {
		return rs_no;
	}

	public void setRs_no(int rs_no) {
		this.rs_no = rs_no;
	}

	public String getQ_subject() {
		return q_subject;
	}

	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}

	public List<String> getQ_subject_list() {
		return q_subject_list;
	}

	public void setQ_subject_list(List<String> q_subject_list) {
		this.q_subject_list = q_subject_list;
	}

}
