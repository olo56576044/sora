DROP SEQUENCE user_seq;
DROP SEQUENCE bd_comm_seq;

-- 사용자
DROP TABLE user_;

-- 권한코드
DROP TABLE auth;
-- 태그
DROP TABLE tag_info;

-- 커뮤니티게시판
DROP TABLE bd_comm;

-- 커뮤니티게시글사진
DROP TABLE img_bd_comm;

-- 게시글카테고리
DROP TABLE cat_bd_comm;

-- 커뮤니티게시판댓글
DROP TABLE bd_comm_re;

-- 공감테이블
DROP TABLE bd_comm_like;

-- 점포
DROP TABLE store;

-- 가게사진
DROP TABLE img_store;

-- 점포태그
DROP TABLE store_tag;

-- 점포공감테이블
DROP TABLE store_like;

-- 점포즐겨찾기테이블
DROP TABLE store_favorites;

-- 업종
DROP TABLE cat_store;

-- 점포리뷰
DROP TABLE store_review;

-- 가게리뷰사진
DROP TABLE img_store_review;

-- 공지사항게시판
DROP TABLE bd_announce;

-- 사용자
CREATE TABLE user_ (
	user_no    INTEGER       NOT NULL, -- 회원번호
	user_email VARCHAR2(50)  NULL,     -- 이메일
	user_pass  VARCHAR2(255) NULL,     -- 비밀번호
	user_name  VARCHAR2(50)  NULL,     -- 이름
	user_nick  VARCHAR2(50)  NULL,     -- 닉네임
	auth_cd    VARCHAR2(4)   NULL,     -- 권한코드
	user_sdt   DATE          NULL,     -- 가입일자
	user_mdt   DATE          NULL,     -- 수정일자
	gb_del     VARCHAR2(1)   NULL,     -- 탈퇴여부
	user_img   VARCHAR2(200) NULL      -- 프로필사진
);

-- 사용자 기본키
CREATE UNIQUE INDEX PK_user_
	ON user_ ( -- 사용자
		user_no ASC -- 회원번호
	);

-- 사용자
ALTER TABLE user_
	ADD
		CONSTRAINT PK_user_ -- 사용자 기본키
		PRIMARY KEY (
			user_no -- 회원번호
		);

-- 권한코드
CREATE TABLE auth (
	auth_cd VARCHAR2(4)   NOT NULL, -- 권한코드
	cd_nm   VARCHAR2(10)  NULL,     -- 코드명
	cd_des  VARCHAR2(100) NULL      -- 코드설명
);

-- 권한코드 기본키
CREATE UNIQUE INDEX PK_auth
	ON auth ( -- 권한코드
		auth_cd ASC -- 권한코드
	);

-- 권한코드
ALTER TABLE auth
	ADD
		CONSTRAINT PK_auth -- 권한코드 기본키
		PRIMARY KEY (
			auth_cd -- 권한코드
		);

-- 태그
CREATE TABLE tag_info (
	store_tagNm VARCHAR2(200) NOT NULL -- 태그명
);

-- 태그 기본키
CREATE UNIQUE INDEX PK_tag_info
	ON tag_info ( -- 태그
		store_tagNm ASC -- 태그명
	);

-- 태그
ALTER TABLE tag_info
	ADD
		CONSTRAINT PK_tag_info -- 태그 기본키
		PRIMARY KEY (
			store_tagNm -- 태그명
		);

-- 커뮤니티게시판
CREATE TABLE bd_comm (
	bd_no      INTEGER        NOT NULL, -- 글번호
	user_no    INTEGER        NULL,     -- 회원번호
	bd_cat     VARCHAR2(50)   NULL,     -- 카테고리명
	bd_title   VARCHAR2(100)  NULL,     -- 제목
	user_nick  VARCHAR2(50)   NULL,     -- 작성자닉네임
	bd_content VARCHAR2(4000) NULL,     -- 내용
	bd_hit     INTEGER        NULL,     -- 조회수
	bd_like    INTEGER        NULL,     -- 좋아요수
	bd_wdt     DATE           NULL,     -- 작성일자
	gb_del     VARCHAR2(1)    NULL      -- 삭제여부
);

-- 커뮤니티게시판 기본키
CREATE UNIQUE INDEX PK_bd_comm
	ON bd_comm ( -- 커뮤니티게시판
		bd_no ASC -- 글번호
	);

-- 커뮤니티게시판
ALTER TABLE bd_comm
	ADD
		CONSTRAINT PK_bd_comm -- 커뮤니티게시판 기본키
		PRIMARY KEY (
			bd_no -- 글번호
		);

-- 커뮤니티게시글사진
CREATE TABLE img_bd_comm (
	img_no   INTEGER       NOT NULL, -- 사진번호
	bd_no    INTEGER       NULL,     -- 글번호
	img_url  VARCHAR2(200) NULL,     -- 사진
	img_updt DATE          NULL      -- 업로드날짜
);

-- 커뮤니티게시글사진 기본키
CREATE UNIQUE INDEX PK_img_bd_comm
	ON img_bd_comm ( -- 커뮤니티게시글사진
		img_no ASC -- 사진번호
	);

-- 커뮤니티게시글사진
ALTER TABLE img_bd_comm
	ADD
		CONSTRAINT PK_img_bd_comm -- 커뮤니티게시글사진 기본키
		PRIMARY KEY (
			img_no -- 사진번호
		);

-- 게시글카테고리
CREATE TABLE cat_bd_comm (
	cat_name VARCHAR2(50) NOT NULL -- 카테고리명
);

-- 게시글카테고리 기본키
CREATE UNIQUE INDEX PK_cat_bd_comm
	ON cat_bd_comm ( -- 게시글카테고리
		cat_name ASC -- 카테고리명
	);

-- 게시글카테고리
ALTER TABLE cat_bd_comm
	ADD
		CONSTRAINT PK_cat_bd_comm -- 게시글카테고리 기본키
		PRIMARY KEY (
			cat_name -- 카테고리명
		);

-- 커뮤니티게시판댓글
CREATE TABLE bd_comm_re (
	re_no      INTEGER        NOT NULL, -- 댓글번호
	bd_no      INTEGER        NULL,     -- 글번호
	user_no    INTEGER        NULL,     -- 회원번호
	user_nick  VARCHAR2(50)   NULL,     -- 작성자
	re_content VARCHAR2(1000) NULL,     -- 댓글내용
	re_wdt     DATE           NULL,     -- 작성일자
	ge_del     VARCHAR2(1)    NULL      -- 삭제여부
);

-- 커뮤니티게시판댓글 기본키
CREATE UNIQUE INDEX PK_bd_comm_re
	ON bd_comm_re ( -- 커뮤니티게시판댓글
		re_no ASC -- 댓글번호
	);

-- 커뮤니티게시판댓글
ALTER TABLE bd_comm_re
	ADD
		CONSTRAINT PK_bd_comm_re -- 커뮤니티게시판댓글 기본키
		PRIMARY KEY (
			re_no -- 댓글번호
		);

-- 공감테이블
CREATE TABLE bd_comm_like (
	bd_no    INTEGER NOT NULL, -- 글번호
	user_no  INTEGER NULL,     -- 회원번호
	like_cnt INTEGER NULL      -- 공감수
);

-- 공감테이블 기본키
CREATE UNIQUE INDEX PK_bd_comm_like
	ON bd_comm_like ( -- 공감테이블
		bd_no ASC -- 글번호
	);

-- 공감테이블
ALTER TABLE bd_comm_like
	ADD
		CONSTRAINT PK_bd_comm_like -- 공감테이블 기본키
		PRIMARY KEY (
			bd_no -- 글번호
		);

-- 점포
CREATE TABLE store (

	store_no    INTEGER        NOT NULL, -- 점포번호
	cat_name    VARCHAR2(200)  NOT NULL, -- 업종명
	store_name  VARCHAR2(100)  NULL,     -- 상호명
	store_addr  VARCHAR2(200)  NULL,     -- 도로명주소
	store_tel   VARCHAR2(15)   NULL,     -- 전화번호
	store_hour  VARCHAR2(50)   NULL,     -- 영업시간
	store_break VARCHAR2(50)   NULL,     -- 휴식시간
	store_url   VARCHAR2(100)  NULL,     -- 점포웹주소
	store_des_s VARCHAR2(200)  NULL,     -- 점포간단설명
	store_des_d VARCHAR2(4000) NULL,     -- 점포상세설명
	store_rate  NUMBER(1,1)    NULL,     -- 평점평균
	store_views INTEGER        NULL,     -- 조회수
	store_like  INTEGER        NULL,     -- 좋아요수
	store_fav   INTEGER        NULL,     -- 즐겨찾기수
	store_rdt   DATE           NULL,     -- 등록일자
	gb_del      VARCHAR2(1)    NULL      -- 삭제여부

);

-- 점포 기본키
CREATE UNIQUE INDEX PK_store
	ON store ( -- 점포
		store_no ASC -- 점포번호
	);

-- 점포
ALTER TABLE store
	ADD
		CONSTRAINT PK_store -- 점포 기본키
		PRIMARY KEY (
			store_no -- 점포번호
		);

-- 가게사진
CREATE TABLE img_store (
	img_no   INTEGER       NOT NULL, -- 사진번호
	store_no INTEGER       NULL,     -- 점포번호
	img_url  VARCHAR2(200) NULL,     -- 사진
	img_updt DATE          NULL,     -- 업로드날짜
	gb_rep   VARCHAR2(1)   NULL      -- 대표사진구분
);

-- 가게사진 기본키
CREATE UNIQUE INDEX PK_img_store
	ON img_store ( -- 가게사진
		img_no ASC -- 사진번호
	);

-- 가게사진
ALTER TABLE img_store
	ADD
		CONSTRAINT PK_img_store -- 가게사진 기본키
		PRIMARY KEY (
			img_no -- 사진번호
		);

-- 점포태그
CREATE TABLE store_tag (
	store_no      INTEGER       NOT NULL, -- 점포번호
	store_tagNm_1 VARCHAR2(200) NULL,     -- 태그명1
	store_tagNm_2 VARCHAR2(200) NULL,     -- 태그명2
	store_tagNm_3 VARCHAR2(200) NULL      -- 태그명3
);

-- 점포태그 기본키
CREATE UNIQUE INDEX PK_store_tag
	ON store_tag ( -- 점포태그
		store_no ASC -- 점포번호
	);

-- 점포태그
ALTER TABLE store_tag
	ADD
		CONSTRAINT PK_store_tag -- 점포태그 기본키
		PRIMARY KEY (
			store_no -- 점포번호
		);

-- 점포공감테이블
CREATE TABLE store_like (
	store_no INTEGER NOT NULL, -- 점포번호
	user_no  INTEGER NOT NULL, -- 회원번호
	like_cnt INTEGER NULL      -- 좋아요수
);

-- 점포공감테이블 기본키
CREATE UNIQUE INDEX PK_store_like
	ON store_like ( -- 점포공감테이블
		store_no ASC, -- 점포번호
		user_no  ASC  -- 회원번호
	);

-- 점포공감테이블
ALTER TABLE store_like
	ADD
		CONSTRAINT PK_store_like -- 점포공감테이블 기본키
		PRIMARY KEY (
			store_no, -- 점포번호
			user_no   -- 회원번호
		);

-- 점포즐겨찾기테이블
CREATE TABLE store_favorites (
	store_no INTEGER NOT NULL, -- 가게번호
	user_no  INTEGER NOT NULL, -- 회원번호
	fav_cnt  INTEGER NULL      -- 즐겨찾기수
);

-- 점포즐겨찾기테이블 기본키
CREATE UNIQUE INDEX PK_store_favorites
	ON store_favorites ( -- 점포즐겨찾기테이블
		store_no ASC, -- 가게번호
		user_no  ASC  -- 회원번호
	);

-- 점포즐겨찾기테이블
ALTER TABLE store_favorites
	ADD
		CONSTRAINT PK_store_favorites -- 점포즐겨찾기테이블 기본키
		PRIMARY KEY (
			store_no, -- 가게번호
			user_no   -- 회원번호
		);

-- 업종
CREATE TABLE cat_store (

	cat_name VARCHAR2(200) NOT NULL -- 업종명
  
);

-- 업종 기본키
CREATE UNIQUE INDEX PK_cat_store
	ON cat_store ( -- 업종
		cat_name ASC -- 업종명

	);

-- 업종
ALTER TABLE cat_store
	ADD
		CONSTRAINT PK_cat_store -- 업종 기본키
		PRIMARY KEY (
			cat_name -- 업종명

		);

-- 점포리뷰
CREATE TABLE store_review (
	re_no      INTEGER        NOT NULL, -- 리뷰번호
	user_no    INTEGER        NULL,     -- 회원번호
	store_no   INTEGER        NULL,     -- 점포번호
	user_nick  VARCHAR2(50)   NULL,     -- 작성자
	re_content VARCHAR2(1000) NULL,     -- 리뷰내용
	rate       INTEGER        NULL,     -- 평점
	re_wdt     DATE           NULL,     -- 작성일자
	ge_del     VARCHAR2(1)    NULL      -- 삭제여부
);

-- 점포리뷰 기본키
CREATE UNIQUE INDEX PK_store_review
	ON store_review ( -- 점포리뷰
		re_no ASC -- 리뷰번호
	);

-- 점포리뷰
ALTER TABLE store_review
	ADD
		CONSTRAINT PK_store_review -- 점포리뷰 기본키
		PRIMARY KEY (
			re_no -- 리뷰번호
		);

-- 가게리뷰사진
CREATE TABLE img_store_review (
	img_no   INTEGER       NOT NULL, -- 사진번호
	re_no    INTEGER       NULL,     -- 리뷰번호
	img_url  VARCHAR2(200) NULL,     -- 사진
	img_updt DATE          NULL      -- 업로드날짜
);

-- 가게리뷰사진 기본키
CREATE UNIQUE INDEX PK_img_store_review
	ON img_store_review ( -- 가게리뷰사진
		img_no ASC -- 사진번호
	);

-- 가게리뷰사진
ALTER TABLE img_store_review
	ADD
		CONSTRAINT PK_img_store_review -- 가게리뷰사진 기본키
		PRIMARY KEY (
			img_no -- 사진번호
		);

-- 공지사항게시판
CREATE TABLE bd_announce (
	bd_no      INTEGER        NOT NULL, -- 글번호
	bd_title   VARCHAR2(100)  NULL,     -- 제목
	bd_content VARCHAR2(4000) NULL,     -- 내용
	bd_wdt     DATE           NULL,     -- 작성일자
	gb_del     VARCHAR2(1)    NULL      -- 삭제여부
);

-- 공지사항게시판 기본키
CREATE UNIQUE INDEX PK_bd_announce
	ON bd_announce ( -- 공지사항게시판
		bd_no ASC -- 글번호
	);

-- 공지사항게시판
ALTER TABLE bd_announce
	ADD
		CONSTRAINT PK_bd_announce -- 공지사항게시판 기본키
		PRIMARY KEY (
			bd_no -- 글번호
		);

-- 커뮤니티게시판
ALTER TABLE bd_comm
	ADD
		CONSTRAINT FK_user__TO_bd_comm -- 사용자 -> 커뮤니티게시판
		FOREIGN KEY (
			user_no -- 회원번호
		)
		REFERENCES user_ ( -- 사용자
			user_no -- 회원번호
		);

-- 커뮤니티게시글사진
ALTER TABLE img_bd_comm
	ADD
		CONSTRAINT FK_bd_comm_TO_img_bd_comm -- 커뮤니티게시판 -> 커뮤니티게시글사진
		FOREIGN KEY (
			bd_no -- 글번호
		)
		REFERENCES bd_comm ( -- 커뮤니티게시판
			bd_no -- 글번호
		);

-- 커뮤니티게시판댓글
ALTER TABLE bd_comm_re
	ADD
		CONSTRAINT FK_bd_comm_TO_bd_comm_re -- 커뮤니티게시판 -> 커뮤니티게시판댓글
		FOREIGN KEY (
			bd_no -- 글번호
		)
		REFERENCES bd_comm ( -- 커뮤니티게시판
			bd_no -- 글번호
		);

-- 커뮤니티게시판댓글
ALTER TABLE bd_comm_re
	ADD
		CONSTRAINT FK_user__TO_bd_comm_re -- 사용자 -> 커뮤니티게시판댓글
		FOREIGN KEY (
			user_no -- 회원번호
		)
		REFERENCES user_ ( -- 사용자
			user_no -- 회원번호
		);

-- 공감테이블
ALTER TABLE bd_comm_like
	ADD
		CONSTRAINT FK_bd_comm_TO_bd_comm_like -- 커뮤니티게시판 -> 공감테이블
		FOREIGN KEY (
			bd_no -- 글번호
		)
		REFERENCES bd_comm ( -- 커뮤니티게시판
			bd_no -- 글번호
		);

-- 공감테이블
ALTER TABLE bd_comm_like
	ADD
		CONSTRAINT FK_user__TO_bd_comm_like -- 사용자 -> 공감테이블
		FOREIGN KEY (
			user_no -- 회원번호
		)
		REFERENCES user_ ( -- 사용자
			user_no -- 회원번호
		);

-- 가게사진
ALTER TABLE img_store
	ADD
		CONSTRAINT FK_store_TO_img_store -- 점포 -> 가게사진
		FOREIGN KEY (
			store_no -- 점포번호
		)
		REFERENCES store ( -- 점포
			store_no -- 점포번호
		);

-- 점포태그
ALTER TABLE store_tag
	ADD
		CONSTRAINT FK_store_TO_store_tag -- 점포 -> 점포태그
		FOREIGN KEY (
			store_no -- 점포번호
		)
		REFERENCES store ( -- 점포
			store_no -- 점포번호
		);

-- 점포공감테이블
ALTER TABLE store_like
	ADD
		CONSTRAINT FK_user__TO_store_like -- 사용자 -> 점포공감테이블
		FOREIGN KEY (
			user_no -- 회원번호
		)
		REFERENCES user_ ( -- 사용자
			user_no -- 회원번호
		);

-- 점포공감테이블
ALTER TABLE store_like
	ADD
		CONSTRAINT FK_store_TO_store_like -- 점포 -> 점포공감테이블
		FOREIGN KEY (
			store_no -- 점포번호
		)
		REFERENCES store ( -- 점포
			store_no -- 점포번호
		);

-- 점포즐겨찾기테이블
ALTER TABLE store_favorites
	ADD
		CONSTRAINT FK_user__TO_store_favorites -- 사용자 -> 점포즐겨찾기테이블
		FOREIGN KEY (
			user_no -- 회원번호
		)
		REFERENCES user_ ( -- 사용자
			user_no -- 회원번호
		);

-- 점포즐겨찾기테이블
ALTER TABLE store_favorites
	ADD
		CONSTRAINT FK_store_TO_store_favorites -- 점포 -> 점포즐겨찾기테이블
		FOREIGN KEY (
			store_no -- 가게번호
		)
		REFERENCES store ( -- 점포
			store_no -- 점포번호
		);

-- 점포리뷰
ALTER TABLE store_review
	ADD
		CONSTRAINT FK_user__TO_store_review -- 사용자 -> 점포리뷰
		FOREIGN KEY (
			user_no -- 회원번호
		)
		REFERENCES user_ ( -- 사용자
			user_no -- 회원번호
		);

-- 점포리뷰
ALTER TABLE store_review
	ADD
		CONSTRAINT FK_store_TO_store_review -- 점포 -> 점포리뷰
		FOREIGN KEY (
			store_no -- 점포번호
		)
		REFERENCES store ( -- 점포
			store_no -- 점포번호
		);

-- 가게리뷰사진
ALTER TABLE img_store_review
	ADD

		CONSTRAINT FK_store_rev_TO_img_store_rev -- 점포리뷰 -> 가게리뷰사진

		FOREIGN KEY (
			re_no -- 리뷰번호
		)
		REFERENCES store_review ( -- 점포리뷰
			re_no -- 리뷰번호
		);
	

	
-- 테스트용

-- auth
INSERT INTO auth (auth_cd, cd_nm, cd_des) VALUES ('A101', '관리자', '홈페이지 관리자 계정이 갖는 권한');
INSERT INTO auth (auth_cd, cd_nm, cd_des) VALUES ('B101', '사용자', '일반사용자 계정이 갖는 권한');

-- 테스트 계정
CREATE SEQUENCE  user_seq;
INSERT INTO user_ (user_no, USER_EMAIL, USER_PASS, USER_NAME, USER_NICK, AUTH_CD, USER_SDT, gb_del)
			VALUES(user_seq.nextval, 'admin@test.com', '!Test12345', '관리자이름', '관리자닉네임', 'A101', SYSDATE, 'N');
INSERT INTO user_ (user_no, USER_EMAIL, USER_PASS, USER_NAME, USER_NICK, AUTH_CD, USER_SDT, gb_del)
			VALUES(user_seq.nextval, 'user1@test.com', '!Test12345', '테스트1이름', '테스트1닉네임', 'B101', SYSDATE, 'N');
INSERT INTO user_ (user_no, USER_EMAIL, USER_PASS, USER_NAME, USER_NICK, AUTH_CD, USER_SDT, gb_del)
			VALUES(user_seq.nextval, 'user2@test.com', '!Test12345', '테스트2이름', '테스트2닉네임', 'B101', SYSDATE, 'N');
INSERT INTO user_ (user_no, USER_EMAIL, USER_PASS, USER_NAME, USER_NICK, AUTH_CD, USER_SDT, gb_del)
			VALUES(user_seq.nextval, 'user3@test.com', '!Test12345', '테스트3이름', '테스트3닉네임', 'B101', SYSDATE, 'N');
INSERT INTO user_ (user_no, USER_EMAIL, USER_PASS, USER_NAME, USER_NICK, AUTH_CD, USER_SDT, gb_del)
			VALUES(user_seq.nextval, 'user4@test.com', '!Test12345', '테스트4이름', '테스트4닉네임', 'B101', SYSDATE, 'N');
INSERT INTO user_ (user_no, USER_EMAIL, USER_PASS, USER_NAME, USER_NICK, AUTH_CD, USER_SDT, gb_del)
			VALUES(user_seq.nextval, 'user5@test.com', '!Test12345', '테스트5이름', '테스트5닉네임', 'B101', SYSDATE, 'N');
INSERT INTO user_ (user_no, USER_EMAIL, USER_PASS, USER_NAME, USER_NICK, AUTH_CD, USER_SDT, gb_del)
			VALUES(user_seq.nextval, 'user6@test.com', '!Test12345', '테스트6이름', '테스트6닉네임', 'B101', SYSDATE, 'N');
INSERT INTO user_ (user_no, USER_EMAIL, USER_PASS, USER_NAME, USER_NICK, AUTH_CD, USER_SDT, gb_del)
			VALUES(user_seq.nextval, 'user7@test.com', '!Test12345', '테스트7이름', '테스트7닉네임', 'B101', SYSDATE, 'N');
INSERT INTO user_ (user_no, USER_EMAIL, USER_PASS, USER_NAME, USER_NICK, AUTH_CD, USER_SDT, gb_del)
			VALUES(user_seq.nextval, 'user8@test.com', '!Test12345', '테스트8이름', '테스트8닉네임', 'B101', SYSDATE, 'N');
INSERT INTO user_ (user_no, USER_EMAIL, USER_PASS, USER_NAME, USER_NICK, AUTH_CD, USER_SDT, gb_del)
			VALUES(user_seq.nextval, 'user9@test.com', '!Test12345', '테스트9이름', '테스트9닉네임', 'B101', SYSDATE, 'N');
INSERT INTO user_ (user_no, USER_EMAIL, USER_PASS, USER_NAME, USER_NICK, AUTH_CD, USER_SDT, gb_del)
			VALUES(user_seq.nextval, 'user10@test.com', '!Test12345', '테스트10이름', '테스트10닉네임', 'B101', SYSDATE, 'N');
INSERT INTO user_ (user_no, USER_EMAIL, USER_PASS, USER_NAME, USER_NICK, AUTH_CD, USER_SDT, gb_del)
			VALUES(user_seq.nextval, 'user11@test.com', '!Test12345', '테스트1이름', '테스트11닉네임', 'B101', SYSDATE, 'N');
INSERT INTO user_ (user_no, USER_EMAIL, USER_PASS, USER_NAME, USER_NICK, AUTH_CD, USER_SDT, gb_del)
			VALUES(user_seq.nextval, 'user12@test.com', '!Test12345', '테스트12이름', '테스트12닉네임', 'B101', SYSDATE, 'N');

-- 테스트 커뮤글
CREATE SEQUENCE  bd_comm_seq;
INSERT INTO bd_comm VALUES (bd_comm_seq.nextval, 2, '리뷰','커뮤게시글테스트1제목','테스트닉네임1','커뮤게시글테스트1내용', 0, 0, SYSDATE, 'N');
INSERT INTO bd_comm VALUES (bd_comm_seq.nextval, 2, '리뷰','커뮤게시글테스트2제목','테스트닉네임1','커뮤게시글테스트2내용', 0, 0, SYSDATE, 'N');
INSERT INTO bd_comm VALUES (bd_comm_seq.nextval, 2, '리뷰','커뮤게시글테스트3제목','테스트닉네임1','커뮤게시글테스트3내용', 0, 0, SYSDATE, 'N');
INSERT INTO bd_comm VALUES (bd_comm_seq.nextval, 2, '리뷰','커뮤게시글테스트4제목','테스트닉네임1','커뮤게시글테스트4내용', 0, 0, SYSDATE, 'N');
INSERT INTO bd_comm VALUES (bd_comm_seq.nextval, 2, '리뷰','커뮤게시글테스트5제목','테스트닉네임1','커뮤게시글테스트5내용', 0, 0, SYSDATE, 'N');
INSERT INTO bd_comm VALUES (bd_comm_seq.nextval, 2, '리뷰','커뮤게시글테스트6제목','테스트닉네임1','커뮤게시글테스트6내용', 0, 0, SYSDATE, 'N');
INSERT INTO bd_comm VALUES (bd_comm_seq.nextval, 3, '리뷰','커뮤게시글테스트7제목','테스트닉네임2','커뮤게시글테스트7내용', 0, 0, SYSDATE, 'N');
INSERT INTO bd_comm VALUES (bd_comm_seq.nextval, 3, '리뷰','커뮤게시글테스트8제목','테스트닉네임2','커뮤게시글테스트8내용', 0, 0, SYSDATE, 'N');
INSERT INTO bd_comm VALUES (bd_comm_seq.nextval, 3, '리뷰','커뮤게시글테스트9제목','테스트닉네임2','커뮤게시글테스트9내용', 0, 0, SYSDATE, 'N');
INSERT INTO bd_comm VALUES (bd_comm_seq.nextval, 3, '리뷰','커뮤게시글테스트10제목','테스트닉네임2','커뮤게시글테스트10내용', 0, 0, SYSDATE, 'N');
INSERT INTO bd_comm VALUES (bd_comm_seq.nextval, 3, '리뷰','커뮤게시글테스트11제목','테스트닉네임2','커뮤게시글테스트11내용', 0, 0, SYSDATE, 'N');
INSERT INTO bd_comm VALUES (bd_comm_seq.nextval, 3, '리뷰','커뮤게시글테스트12제목','테스트닉네임2','커뮤게시글테스트12내용', 0, 0, SYSDATE, 'N');

-- 업종
INSERT INTO CAT_STORE cs VALUES ('한식');
INSERT INTO CAT_STORE cs VALUES ('중식');
INSERT INTO CAT_STORE cs VALUES ('일식');
INSERT INTO CAT_STORE cs VALUES ('분식');
INSERT INTO CAT_STORE cs VALUES ('양식');
INSERT INTO CAT_STORE cs VALUES ('주점');
INSERT INTO CAT_STORE cs VALUES ('카페');

-- 상점 테스트용 레코드
CREATE SEQUENCE store_seq;
INSERT INTO store
	 VALUES (store_seq.nextval, '한식', '테스트매장1', '대전광역시 테스트동1', '042-1111-1111', '09:00-21:00', '15:00-17:00', 'www.test.com', '테스트1간단설명입니다.', '테스트1상세설명입니다.', 0, 0, 0, 0, sysdate, 'N');
INSERT INTO store
	 VALUES (store_seq.nextval, '한식', '테스트매장2', '대전광역시 테스트동2', '042-1111-1112', '09:00-21:00', '15:00-17:00', 'www.test.com', '테스트2간단설명입니다.', '테스트2상세설명입니다.', 0, 0, 0, 0, sysdate, 'N');
INSERT INTO store
	 VALUES (store_seq.nextval, '일식', '테스트매장3', '대전광역시 테스트동3', '042-1111-1113', '09:00-21:00', '15:00-17:00', 'www.test.com', '테스트3간단설명입니다.', '테스트3상세설명입니다.', 0, 0, 0, 0, sysdate, 'N');
INSERT INTO store
	 VALUES (store_seq.nextval, '일식', '테스트매장4', '대전광역시 테스트동4', '042-1111-1114', '09:00-21:00', '15:00-17:00', 'www.test.com', '테스트4간단설명입니다.', '테스트4상세설명입니다.', 0, 0, 0, 0, sysdate, 'N');
INSERT INTO store
	 VALUES (store_seq.nextval, '분식', '테스트매장5', '대전광역시 테스트동5', '042-1111-1115', '09:00-21:00', '15:00-17:00', 'www.test.com', '테스트5간단설명입니다.', '테스트5상세설명입니다.', 0, 0, 0, 0, sysdate, 'N');
INSERT INTO store
	 VALUES (store_seq.nextval, '분식', '테스트매장6', '대전광역시 테스트동6', '042-1111-1116', '09:00-21:00', '15:00-17:00', 'www.test.com', '테스트6간단설명입니다.', '테스트6상세설명입니다.', 0, 0, 0, 0, sysdate, 'N');
INSERT INTO store
	 VALUES (store_seq.nextval, '중식', '테스트매장7', '대전광역시 테스트동7', '042-1111-1117', '09:00-21:00', '15:00-17:00', 'www.test.com', '테스트7간단설명입니다.', '테스트7상세설명입니다.', 0, 0, 0, 0, sysdate, 'N');
INSERT INTO store
	 VALUES (store_seq.nextval, '중식', '테스트매장8', '대전광역시 테스트동8', '042-1111-1118', '09:00-21:00', '15:00-17:00', 'www.test.com', '테스트8간단설명입니다.', '테스트8상세설명입니다.', 0, 0, 0, 0, sysdate, 'N');
INSERT INTO store
	 VALUES (store_seq.nextval, '양식', '테스트매장9', '대전광역시 테스트동9', '042-1111-1119', '09:00-21:00', '15:00-17:00', 'www.test.com', '테스트9간단설명입니다.', '테스트9상세설명입니다.', 0, 0, 0, 0, sysdate, 'N');
INSERT INTO store
	 VALUES (store_seq.nextval, '양식', '테스트매장10', '대전광역시 테스트동10', '042-1111-1120', '09:00-21:00', '15:00-17:00', 'www.test.com', '테스트10간단설명입니다.', '테스트10상세설명입니다.', 0, 0, 0, 0, sysdate, 'N');
INSERT INTO store
	 VALUES (store_seq.nextval, '주점', '테스트매장11', '대전광역시 테스트동11', '042-1111-1121', '09:00-21:00', '15:00-17:00', 'www.test.com', '테스트11간단설명입니다.', '테스트11상세설명입니다.', 0, 0, 0, 0, sysdate, 'N');
INSERT INTO store
	 VALUES (store_seq.nextval, '카페', '테스트매장12', '대전광역시 테스트동12', '042-1111-1122', '09:00-21:00', '15:00-17:00', 'www.test.com', '테스트12간단설명입니다.', '테스트12상세설명입니다.', 0, 0, 0, 0, sysdate, 'N');