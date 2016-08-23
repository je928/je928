package bowtech.model;

import java.sql.Date;

public class Research {

	private int rs_no;
	private String rs_subject;
	private int rs_writer;
	private int rs_que_cnt;
	private int rs_readcount;
	private Date rs_start_date;
	private Date rs_end_date;
	private Date rs_reg_date;
	private Date rs_update_date;
	private String rs_del_yn;

	// 조회용
	private int startRow;
	private int endRow;
	// 검색용
	private String searchType;
	private String searchTxt;

	public int getRs_no() {
		return rs_no;
	}

	public void setRs_no(int rs_no) {
		this.rs_no = rs_no;
	}

	public String getRs_subject() {
		return rs_subject;
	}

	public void setRs_subject(String rs_subject) {
		this.rs_subject = rs_subject;
	}

	public int getRs_writer() {
		return rs_writer;
	}

	public void setRs_writer(int rs_writer) {
		this.rs_writer = rs_writer;
	}

	public int getRs_que_cnt() {
		return rs_que_cnt;
	}

	public void setRs_que_cnt(int rs_que_cnt) {
		this.rs_que_cnt = rs_que_cnt;
	}

	public int getRs_readcount() {
		return rs_readcount;
	}

	public void setRs_readcount(int rs_readcount) {
		this.rs_readcount = rs_readcount;
	}

	public Date getRs_start_date() {
		return rs_start_date;
	}

	public void setRs_start_date(Date rs_start_date) {
		this.rs_start_date = rs_start_date;
	}

	public Date getRs_end_date() {
		return rs_end_date;
	}

	public void setRs_end_date(Date rs_end_date) {
		this.rs_end_date = rs_end_date;
	}

	public Date getRs_reg_date() {
		return rs_reg_date;
	}

	public void setRs_reg_date(Date rs_reg_date) {
		this.rs_reg_date = rs_reg_date;
	}

	public Date getRs_update_date() {
		return rs_update_date;
	}

	public void setRs_update_date(Date rs_update_date) {
		this.rs_update_date = rs_update_date;
	}

	public String getRs_del_yn() {
		return rs_del_yn;
	}

	public void setRs_del_yn(String rs_del_yn) {
		this.rs_del_yn = rs_del_yn;
	}
	
	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchTxt() {
		return searchTxt;
	}

	public void setSearchTxt(String searchTxt) {
		this.searchTxt = searchTxt;
	}

}
