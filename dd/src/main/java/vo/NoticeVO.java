package vo;

import java.util.Date;

public class NoticeVO {
	
	// 필드
	private int notice_num;				// 공지 게시글 번호
	private String notice_category;		// 공지글 번호
	private String notice_author;		// 작성자 이름
	private String notice_title;		// 글 제목
	private String notice_content;		// 글 내용
	private Date notice_date;			// 작성 시간
	
	// 기본 생성자
	public NoticeVO() {}
	
	// 매개변수가 있는 생성자
	public NoticeVO(int notice_num, String notice_category, String notice_author, String notice_title,
			String notice_content, Date notice_date) {
		this.notice_num = notice_num;
		this.notice_category = notice_category;
		this.notice_author = notice_author;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
	}
	
	// Getter, Setter
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_category() {
		return notice_category;
	}
	public void setNotice_category(String notice_category) {
		this.notice_category = notice_category;
	}
	public String getNotice_author() {
		return notice_author;
	}
	public void setNotice_author(String notice_author) {
		this.notice_author = notice_author;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	
	// toString()
	@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", notice_category=" + notice_category + ", notice_author="
				+ notice_author + ", notice_title=" + notice_title + ", notice_content=" + notice_content
				+ ", notice_date=" + notice_date + "]";
	}
	
}