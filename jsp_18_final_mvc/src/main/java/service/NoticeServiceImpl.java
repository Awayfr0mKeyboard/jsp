package service;

import java.util.ArrayList;

import dao.*;
import jakarta.servlet.http.HttpServletRequest;
import vo.NoticeVO;

public class NoticeServiceImpl implements NoticeService {

	NoticeDAO dao = new NoticeDAOImpl();
	
	@Override
	public ArrayList<NoticeVO> noticeAllList() {

		return null;
	}

	// 게시글 등록
	@Override
	public boolean noticeWrite(HttpServletRequest request) {
		NoticeVO notice = new NoticeVO();
		
		String notice_category = request.getParameter("notice_category");
		String notice_author = request.getParameter("notice_author");
		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");
		
		notice.setNotice_category(notice_category);
		notice.setNotice_author(notice_author);
		notice.setNotice_title(notice_title);
		notice.setNotice_content(notice_content);
		
		return false;
	}

	@Override
	public ArrayList<NoticeVO> noticeList(HttpServletRequest request) {

		return null;
	}

	@Override
	public NoticeVO noticeDetail(HttpServletRequest request) {

		return null;
	}

	@Override
	public boolean noticeUpdate(HttpServletRequest request) {

		return false;
	}

	@Override
	public boolean noticeDelete(HttpServletRequest request) {

		return false;
	}

	@Override
	public ArrayList<NoticeVO> search(HttpServletRequest request) {
		
		return null;
	}

}
