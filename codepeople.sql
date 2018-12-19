
/* Drop Tables */

DROP TABLE user_badge CASCADE CONSTRAINTS;
DROP TABLE badge CASCADE CONSTRAINTS;
DROP TABLE user_follow CASCADE CONSTRAINTS;
DROP TABLE user_avatar CASCADE CONSTRAINTS;
DROP TABLE user_chat CASCADE CONSTRAINTS;
DROP TABLE user_log CASCADE CONSTRAINTS;
DROP TABLE Users CASCADE CONSTRAINTS;




/* Create Tables */

-- 새 테이블
CREATE TABLE badge
(
	-- badge_no
	badge_no number(5,0) NOT NULL UNIQUE,
	-- badge_name
	badge_name varchar2(100) NOT NULL,
	-- badge_icon
	badge_icon varchar2(100) NOT NULL,
	-- badge_exp
	badge_exp number(5,0) NOT NULL,
	PRIMARY KEY (badge_no)
);


-- 회원
CREATE TABLE Users
(
	-- user_no
	user_no number(5,0) NOT NULL UNIQUE,
	-- user_id
	user_id varchar2(20) NOT NULL UNIQUE,
	-- user_password
	user_password varchar2(20) NOT NULL UNIQUE,
	-- user_email
	user_email varchar2(40) NOT NULL UNIQUE,
	-- user_name
	user_name varchar2(24) NOT NULL,
	-- user_create_date
	user_create_date date NOT NULL,
	PRIMARY KEY (user_no)
);


-- 유저 기타정보
CREATE TABLE user_avatar
(
	-- user_no
	user_no number(5,0) NOT NULL UNIQUE,
	-- avatar_image
	avatar_image varchar2(100),
	-- avatar_bg
	avatar_bg varchar2(100),
	-- avatar_nick
	avatar_nick varchar2(30),
	-- avatar_exp
	avatar_exp number(5,0)
);


-- 새 테이블
CREATE TABLE user_badge
(
	-- user_no
	user_no number(5,0) NOT NULL UNIQUE,
	-- badge_no
	badge_no number(5,0) NOT NULL UNIQUE,
	-- create_date
	create_date date NOT NULL
);


-- 채팅
CREATE TABLE user_chat
(
	-- send_user
	send_user number(5,0) NOT NULL UNIQUE,
	-- recv_user
	recv_user number(5,0) NOT NULL UNIQUE,
	-- chat_msg
	chat_msg varchar2(3000),
	-- chat_create_date
	chat_create_date date
);


-- 친구
CREATE TABLE user_follow
(
	-- 신청 받은 사람
	fllower number(5,0) NOT NULL UNIQUE,
	-- 신청한 사람
	following number(5,0) NOT NULL UNIQUE,
	-- follow_create_date
	follow_create_date date
);


-- 새 테이블
CREATE TABLE user_log
(
	-- user_no
	user_no number(5,0) NOT NULL UNIQUE,
	-- log_account
	log_account varchar2(500) NOT NULL,
	-- log_ip
	log_ip varchar2(20) NOT NULL,
	-- log_create_date
	log_create_date date NOT NULL
);



/* Create Foreign Keys */

ALTER TABLE user_badge
	ADD FOREIGN KEY (badge_no)
	REFERENCES badge (badge_no)
;


ALTER TABLE user_avatar
	ADD FOREIGN KEY (user_no)
	REFERENCES Users (user_no)
;


ALTER TABLE user_badge
	ADD FOREIGN KEY (user_no)
	REFERENCES Users (user_no)
;


ALTER TABLE user_chat
	ADD FOREIGN KEY (send_user)
	REFERENCES Users (user_no)
;


ALTER TABLE user_chat
	ADD FOREIGN KEY (recv_user)
	REFERENCES Users (user_no)
;


ALTER TABLE user_log
	ADD FOREIGN KEY (user_no)
	REFERENCES Users (user_no)
;


ALTER TABLE user_follow
	ADD FOREIGN KEY (fllower)
	REFERENCES user_avatar (user_no)
;


ALTER TABLE user_follow
	ADD FOREIGN KEY (following)
	REFERENCES user_avatar (user_no)
;



/* Comments */

COMMENT ON TABLE badge IS '새 테이블';
COMMENT ON COLUMN badge.badge_no IS 'badge_no';
COMMENT ON COLUMN badge.badge_name IS 'badge_name';
COMMENT ON COLUMN badge.badge_icon IS 'badge_icon';
COMMENT ON COLUMN badge.badge_exp IS 'badge_exp';
COMMENT ON TABLE Users IS '회원';
COMMENT ON COLUMN Users.user_no IS 'user_no';
COMMENT ON COLUMN Users.user_id IS 'user_id';
COMMENT ON COLUMN Users.user_password IS 'user_password';
COMMENT ON COLUMN Users.user_email IS 'user_email';
COMMENT ON COLUMN Users.user_name IS 'user_name';
COMMENT ON COLUMN Users.user_create_date IS 'user_create_date';
COMMENT ON TABLE user_avatar IS '유저 기타정보';
COMMENT ON COLUMN user_avatar.user_no IS 'user_no';
COMMENT ON COLUMN user_avatar.avatar_image IS 'avatar_image';
COMMENT ON COLUMN user_avatar.avatar_bg IS 'avatar_bg';
COMMENT ON COLUMN user_avatar.avatar_nick IS 'avatar_nick';
COMMENT ON COLUMN user_avatar.avatar_exp IS 'avatar_exp';
COMMENT ON TABLE user_badge IS '새 테이블';
COMMENT ON COLUMN user_badge.user_no IS 'user_no';
COMMENT ON COLUMN user_badge.badge_no IS 'badge_no';
COMMENT ON COLUMN user_badge.create_date IS 'create_date';
COMMENT ON TABLE user_chat IS '채팅';
COMMENT ON COLUMN user_chat.send_user IS 'send_user';
COMMENT ON COLUMN user_chat.recv_user IS 'recv_user';
COMMENT ON COLUMN user_chat.chat_msg IS 'chat_msg';
COMMENT ON COLUMN user_chat.chat_create_date IS 'chat_create_date';
COMMENT ON TABLE user_follow IS '친구';
COMMENT ON COLUMN user_follow.fllower IS '신청 받은 사람';
COMMENT ON COLUMN user_follow.following IS '신청한 사람';
COMMENT ON COLUMN user_follow.follow_create_date IS 'follow_create_date';
COMMENT ON TABLE user_log IS '새 테이블';
COMMENT ON COLUMN user_log.user_no IS 'user_no';
COMMENT ON COLUMN user_log.log_account IS 'log_account';
COMMENT ON COLUMN user_log.log_ip IS 'log_ip';
COMMENT ON COLUMN user_log.log_create_date IS 'log_create_date';



