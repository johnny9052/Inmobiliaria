


DROP TABLE IF EXISTS `log_msg`;
CREATE TABLE IF NOT EXISTS `log_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


DROP PROCEDURE IF EXISTS log_msg;

DELIMITER //
CREATE PROCEDURE log_msg(`msg` VARCHAR(255)) 
COMMENT  'Funcion que permite hacer debug'
READS SQL DATA 
DETERMINISTIC 
BEGIN 
    insert into log_msg (log) value (msg);
END//

DELIMITER ;

