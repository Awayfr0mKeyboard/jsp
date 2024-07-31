CREATE TABLE IF NOT EXISTS mvc_member (
	num INT PRIMARY KEY AUTO_INCREMENT,		-- 회원 번호
	id VARCHAR(30) UNIQUE,					-- 회원 아이디
	pass VARCHAR(30) NOT NULL,				-- 비밀번호
	name VARCHAR(20),						-- 이름
	age INT(3),								-- 나이
	gender ENUM('male', 'female'),			-- 성별
	regdate TIMESTAMP DEFAULT now(),		-- 회원 가입일
	updatedate TIMESTAMP DEFAULT now()		-- 회원정보 수정 시간
);

SELECT * FROM mvc_member;