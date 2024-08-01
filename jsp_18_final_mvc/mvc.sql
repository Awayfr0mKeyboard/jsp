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

INSERT INTO mvc_member
VALUES(null, 'admin', 'admin', 'MASTER', 23, 'male', now(), sysdate());

DROP TABLE mvc_member_backup;

SELECT * FROM mvc_member_backup;

DESC mvc_member_backup;
DESC mvc_member;

CREATE TABLE mvc_member_backup (SELECT * FROM mvc_member WHERE 1 = 0);

CREATE TABLE mvc_member_backup LIKE mvc_member;

SELECT * FROM mvc_member WHERE id = 'id001'
UNION
SELECT * FROM mvc_member_backup WHERE id = 'id001';

-- mvc_member 에서 DELETE 된 행 정보를 mvc_member_backup 에 추가하는 TRIGGER
DELIMITER //
	CREATE TRIGGER after_delete_member
    AFTER DELETE ON mvc_member
    FOR EACH ROW
    BEGIN
    -- NEW : 새로 작성된 행 정보
    -- OLD : 기존 행 정보
		INSERT INTO mvc_member_backup
        VALUES(OLD.num, OLD.id, OLD.pass, OLD.name, OLD.age, OLD.gender, OLD.regdate, now());
	END //
DELIMITER ;

SELECT * FROM mvc_member;

DELETE FROM mvc_member WHERE num = 4;

SELECT * FROM mvc_member_backup;