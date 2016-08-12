package bowtech.service;

import java.sql.Date;
import java.util.List;

import bowtech.model.Board;
import bowtech.model.BoardFile;
import bowtech.model.BoardReply;

public interface BoardService {

	List<Board> list(Board board);
	int getTotal(Board board);
	void boardHit(int brd_no);
	Board boardSelect(int brd_no);
	int insertNo();
	int boardInsert(Board board);
	void updateRe_step(Board board);
	int boardUpdate(Board board);
	Board deletePwdChk(int number);
	int boardDelete(int number);
	List<BoardReply> selectReply(int brd_no);
	int replyNo();
	int insertReply(BoardReply boardReply);
	int replyCount(int brd_no);
	int updateReply(BoardReply boardReply);
	int deleteReply(int crNo);
	/*BoardReply replyOne(int cr_no);*/
	int refTotal(int brd_no);
	Date newday();
	int refLimit(int ref);
	int fileNo();
	int fileInsert(BoardFile boardfile);
	List<BoardFile> selectFile(int brd_no);
	int fileCount(int brd_no);
	void fileDelete(BoardFile boardfile);
	
}