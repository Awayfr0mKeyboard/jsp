package dao;

import java.util.ArrayList;

import util.*;
import java.sql.*;
import vo.NoticeVO;
import service.*;


public class NoticeDAOImpl implements NoticeDAO {

	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Connection conn = DBCPUtil.getConnection();
	
	@Override
	public ArrayList<NoticeVO> getAllList() {
		return null;
	}

	/**
	 * @param noticeVO - 등록할 공지형 게시글 정보
	 * @return boolean - 작성 성공 여부 반환
	 */
	@Override
	public boolean noticeWrite(NoticeVO noticeVO) {
		sql = "INSERT INTO notice_board (notice_num, notice_category, notice_author, notice_title, notice_content, notice_date) VALUES (null, ?, ?, ?, ?, now())";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, notice.getNotice_category());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return false;
	}

	@Override
	public NoticeVO getNoticeVO(int notice_num) {
		return null;
	}

	@Override
	public boolean noticeUpdate(NoticeVO noticeVO) {
		return false;
	}

	@Override
	public boolean noticeDelete(int notice_num) {
		return false;
	}

	@Override
	public ArrayList<NoticeVO> getNoticeList(int startRow, int perPageNum) {
		return null;
	}

	@Override
	public int getListCount() {
		return 0;
	}

	@Override
	public int getSearchListCount(String searchName, String searchValue) {
		return 0;
	}

	@Override
	public ArrayList<NoticeVO> getSearchNoticeList(PageMaker pageMaker) {
		return null;
	}

}
