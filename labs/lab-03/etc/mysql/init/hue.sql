CREATE DATABASE IF NOT EXISTS hue;
CREATE USER 'hue'@'%' IDENTIFIED WITH mysql_native_password BY 'hue_secret';
CREATE USER 'hue'@'localhost' IDENTIFIED WITH mysql_native_password BY 'hue_secret';
GRANT ALL PRIVILEGES ON hue.* TO 'hue'@'%';
GRANT ALL PRIVILEGES ON hue.* TO 'hue'@'localhost';
