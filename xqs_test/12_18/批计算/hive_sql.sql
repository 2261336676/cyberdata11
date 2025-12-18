use sn_test;
CREATE TABLE IF NOT EXISTS xqs_user2 (
    id INT COMMENT '用户ID',
    username STRING COMMENT '用户名',
    age INT COMMENT '年龄',
)
COMMENT '用户基础信息表'
ROW FORMAT DELIMITED
    FIELDS TERMINATED BY ','  -- 字段用逗号分隔（适配CSV格式数据）
    LINES TERMINATED BY '\n'
STORED AS TEXTFILE;  -- 存储为文本文件（默认格式）

ALTER TABLE xqs_user REPLACE COLUMNS (
    id INT COMMENT '用户ID',
    username STRING COMMENT '用户名',
    age INT COMMENT '年龄'
);

insert into xqs_user values(1,'xqs'),(2,'sss');
select *from xqs_user;
