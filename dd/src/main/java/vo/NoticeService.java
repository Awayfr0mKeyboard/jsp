package vo;

import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;

public interface NoticeService {

	// 전체 게시글 목록
	ArrayList<NoticeVO> noticeAllList();
	
	// 게시글 등록
	boolean noticeWrite(HttpServletRequest request);
	
	// 게시글 목록
	ArrayList<NoticeVO> noticeList(HttpServletRequest request);
	
	// 게시글 상세보기
	NoticeVO noticeDetail(HttpServletRequest request);
	
	// 게시글 수정
	boolean noticeUpdate(HttpServletRequest request);
	
	// 게시글 삭제
	boolean noticeDelete(HttpServletRequest request);
	
	// 검색된 게시글 목록
	ArrayList<NoticeVO> search(HttpServletRequest request);
}
