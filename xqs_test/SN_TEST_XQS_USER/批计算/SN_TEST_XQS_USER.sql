--DROP TABLE IF EXISTS sn_test.xqs_user2;
CREATE TABLE IF NOT EXISTS sn_test.xqs_user2(
`id` int comment '用户ID',
`username` string comment '用户名',
`age` int comment '年龄',
`register_time` string comment '注册时间（格式：yyyy-MM-dd）',
`DW_ETL_Dt` DATE,
`DW_Ins_Dt` DATE,
`DW_Ins_Tm` STRING,
`DW_Upd_Dt` DATE,
`DW_Upd_Tm` STRING
)PARTITIONED BY (PRT_DT STRING)
stored as orc;

INSERT OVERWRITE TABLE sn_test.xqs_user2 partition(prt_dt='${prt_dt}')
SELECT
`id`,
`username`,
`age`,
`register_time`,
SUBSTR(DATE_SUB(FROM_UNIXTIME(UNIX_TIMESTAMP()),1),1,10) AS DW_ETL_Dt,
SUBSTR(FROM_UNIXTIME(UNIX_TIMESTAMP()),1,10) AS DW_Ins_Dt,
SUBSTR(FROM_UNIXTIME(UNIX_TIMESTAMP()),11,9) AS DW_Ins_Tm,
SUBSTR(FROM_UNIXTIME(UNIX_TIMESTAMP()),1,10) AS DW_Upd_Dt,
SUBSTR(FROM_UNIXTIME(UNIX_TIMESTAMP()),11,9) AS DW_Upd_Tm

FROM sn_test.xqs_user;
