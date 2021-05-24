USE TODO;

CREATE TABLE `tbl_todo` (
	`td_seq`	BIGINT	auto_increment primary key,
	`td_place`	VARCHAR(125),
	`td_date`	VARCHAR(20)	NOT NULL,
	`td_time`	VARCHAR(20)	NOT NULL,
	`td_content`	VARCHAR(1000)	NOT NULL
);

INSERT INTO tbl_todo (td_date, td_time, td_content)
VALUES('2021-05-24', '13:27', '오늘?');

SELECT * FROM tbl_todo;
