-- 1. 切换到目标数据库（输入参数：数据库名）
USE @@{db_name};

-- 2. 查询目标表中符合条件的用户信息（输入参数：表名、年龄过滤阈值；输出为查询结果字段）
SELECT id,username,age
FROM @@{user_table}
WHERE 
-- 年龄大于指定阈值（输入参数）
  age >= @@{min_age};
