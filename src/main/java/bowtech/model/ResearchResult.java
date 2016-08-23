package bowtech.model;

import java.sql.Date;

public class ResearchResult {

	private int r_no;
	private int q_no;
	private int rs_no;
	private int i_no;
	private String r_i_title;
	private String r_descripttion;
	private int r_writer;
	private Date r_reg_date;
	private Date r_update_date;

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

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

	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
	}

	public String getR_i_title() {
		return r_i_title;
	}

	public void setR_i_title(String r_i_title) {
		this.r_i_title = r_i_title;
	}

	public String getR_descripttion() {
		return r_descripttion;
	}

	public void setR_descripttion(String r_descripttion) {
		this.r_descripttion = r_descripttion;
	}

	public int getR_writer() {
		return r_writer;
	}

	public void setR_writer(int r_writer) {
		this.r_writer = r_writer;
	}

	public Date getR_reg_date() {
		return r_reg_date;
	}

	public void setR_reg_date(Date r_reg_date) {
		this.r_reg_date = r_reg_date;
	}

	public Date getR_update_date() {
		return r_update_date;
	}

	public void setR_update_date(Date r_update_date) {
		this.r_update_date = r_update_date;
	}

}
