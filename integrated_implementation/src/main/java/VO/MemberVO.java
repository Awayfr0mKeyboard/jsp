package VO;

public class MemberVO {
	
	// 필드
	private int num;
	private String id;
	private String pass;
	private String name;
	private String addr;
	private String phone;
	
	// 기본 생성자
	public MemberVO() {
	}

	// 매개변수가 있는 생성자
	public MemberVO(int num, String id, String pass, String name, String addr, String phone) {
		this.num = num;
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.addr = addr;
		this.phone = phone;
	}

	// getter, setter
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "MemberVO [num=" + num + ", id=" + id + ", pass=" + pass + ", name=" + name + ", addr=" + addr
				+ ", phone=" + phone + "]";
	}
}
