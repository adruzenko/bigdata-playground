CREATE DATABASE IF NOT EXISTS hive;
CREATE USER 'hive'@'%' IDENTIFIED WITH mysql_native_password BY 'hive_secret';
CREATE USER 'hive'@'localhost' IDENTIFIED WITH mysql_native_password  BY 'hive_secret';
GRANT ALL PRIVILEGES ON hive.* TO 'hive'@'%';
GRANT ALL PRIVILEGES ON hive.* TO 'hive'@'localhost';
