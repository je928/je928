create table bow_research (
	rs_no number primary key,
	rs_subject varchar2(500) not null,
	rs_writer number not null,
	rs_que_cnt number not null, 
	rs_readcount number default 0,
	rs_start_date date,
	rs_end_date date,
	rs_reg_date date default sysdate,
	rs_update_date date,
	rs_del_yn char(1) default 'n' check (rs_del_yn in ('y','n')),
	ref number not null,
	re_step number not null,
	re_level number not null
);

create table bow_rs_question (
	q_no number primary key,
	rs_no number,
	q_subject varchar2(500) not null	
);

create table bow_rs_item (
	i_no number primary key,
	q_no number,
	rs_no number,
	i_num1 varchar2(2),
	i_num2 varchar2(2),
	i_num3 varchar2(2),
	i_num4 varchar2(2),
	i_num5 varchar2(2),
	i_title1 varchar2(200),
	i_title2 varchar2(200),
	i_title3 varchar2(200),
	i_title4 varchar2(200),
	i_title5 varchar2(200)	
);

create table bow_rs_result (
	r_no number primary key,
	q_no number,
	rs_no number,
	i_no number,
	r_i_title varchar2(200),
	r_description varchar(200),
	r_writer number,
	r_reg_date date default sysdate,
	r_update_date date
);

select * from bow_research;
select * from bow_rs_question;
select * from bow_rs_item;
select * from bow_rs_result;

drop table bow_research;
drop table bow_rs_question;
drop table bow_rs_item;
drop table bow_rs_result;