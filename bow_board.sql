create table bow_board (
	brd_no number primary key,
	brd_subject varchar2(500) not null, 
	brd_content varchar2(4000) not null,
	brd_readcount number default 0,
	brd_reg_date date default sysdate,
	brd_update_date date,
	brd_del_yn char(1) default 'n' check (brd_del_yn in ('y','n')),
	ref number not null,
	re_step number not null,
	re_level number not null,
	m_no number not null
);

create table bow_board_re (
	re_no number primary key,
	re_content varchar2(2000) not null,
	re_reg_date date default sysdate,
	re_update_date date,
	re_del_yn char(1) default 'n' check (re_del_yn in ('y','n')),
	brd_no number not null,
	m_no number not null
);

select * from bow_board;
select * from bow_board_re;

drop table bow_board;
drop table bow_board_re;

