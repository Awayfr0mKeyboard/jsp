-- mvc.sql
-- use digital_jsp
CREATE TABLE IF NOT EXISTS mvc_member(
	num INT PRIMARY KEY AUTO_INCREMENT,		-- 회원번호
	id VARCHAR(30) UNIQUE,					-- 회원아이디
	pass VARCHAR(30) NOT NULL,				-- 비밀번호
	name VARCHAR(20),						-- 이름
	age int(3),								-- 나이
	gender enum('male', 'female'),			-- 성별
	regdate TIMESTAMP default now(),		-- 회원 가입일
	updatedate TIMESTAMP default now()		-- 회원정보 수정 시간
);

SELECT * FROM mvc_member;

INSERT INTO mvc_member 
VALUES(null,'admin','admin','MASTER',23,'male',now(),sysdate());

DROP TABLE mvc_member_backup;

SELECT * FROM mvc_member_backup;

DESC mvc_member_backup;

CREATE TABLE mvc_member_backup (SELECT * FROM mvc_member WHERE 1 = 0);

CREATE TABLE mvc_member_backup LIKE mvc_member;

SELECT * FROM mvc_member WHERE id = 'id002'
UNION 
SELECT * FROM mvc_member_backup where id = 'id002';

--  mvc_member 에서 DELETE 된 행정보를 mvc_member_back table에 추가하는 TRIGGER 
DELIMITER //
	CREATE TRIGGER after_delete_member 
    AFTER DELETE ON mvc_member 
    FOR EACH ROW 
    BEGIN
    -- NEW 새로 작성된 행정보
    -- OLD 기존 행정보
		INSERT INTO mvc_member_backup 
        VALUES(OLD.num, OLD.id, OLD.pass, OLD.name, OLD.age, OLD.gender,OLD.regdate, now());
	END //
DELIMITER ;

SELECT * FROM mvc_member;

DELETE FROM mvc_member WHERE num = 5; 

/******************************************************************************/
-- 등록된 회원이면 참여 가능한 답변형 게시물 정보를 저장할 table
CREATE TABLE qna_board(
	qna_num INT PRIMARY KEY AUTO_INCREMENT,					-- 글번호
	qna_title VARCHAR(200) NOT NULL,						-- 게시글 제목
	qna_content TEXT NOT NULL,								-- 글 내용
	qna_writer_num INT NOT NULL,							-- 작성자 회원번호
	qna_readcount INT DEFAULT 0,							-- 조회 수
	qna_date TIMESTAMP DEFAULT NOW()						-- 게시글 작성시간
	
);

ALTER TABLE qna_board ADD COLUMN qna_re_ref INT NOT NULL DEFAULT 0;  -- 원본글 번호

ALTER TABLE qna_board 
ADD COLUMN qna_re_seq INT NOT NULL DEFAULT 0 AFTER qna_re_ref;		-- 답변글 정렬 번호 

DESC qna_board;

SELECT * FROM v_qna_board;

CREATE OR REPLACE VIEW v_qna_board AS
SELECT
	Q.qna_num AS qnaNum,
	M.name AS qnaName,
	Q.qna_title AS qnaTitle,
	Q.qna_content AS qnaContent,
	Q.qna_writer_num AS qnaWriterNum,
	Q.qna_readcount AS qnaReadCount,
	Q.qna_date AS qnaDate,
	Q.qna_re_ref AS qnaReRef,
	Q.qna_re_seq AS qnaReSeq
FROM qna_board AS Q JOIN mvc_member AS M
ON Q.qna_writer_num = M.num;

-- qnaReRef column의 번호를 게시글 번호로 수정
UPDATE v_qna_board SET qnaReRef = qnaNum;

commit;


INSERT INTO v_qna_board(qnaTitle, qnaContent, qnaWriterNum)
VALUES('내일 비오나요?진짜에요?2트, 냉무','제곧내',2);

SELECT LAST_INSERT_ID();

UPDATE v_qna_board SET qnaReRef = LAST_INSERT_ID()
WHERE qnaNum = LAST_INSERT_ID();

commit;


DESC v_qna_board;

SELECT * FROM v_qna_board WHERE qnaNum = 1;

SELECT Q.*, M.name AS qna_name FROM qna_board AS Q, mvc_member AS M
WHERE Q.qna_writer_num = M.num;


SELECT B.*, (SELECT name FROM mvc_member WHERE num = B.qna_writer_num) AS qna_name
FROM qna_board AS B WHERE qna_num = 1;




DELIMITER //
	CREATE PROCEDURE deleteBoard(
		_qna_num INT
    )
    BEGIN
		DELETE FROM qna_board WHERE qna_num = _qna_num;
    END //
DELIMITER ;

CALL deleteBoard(1);

commit;