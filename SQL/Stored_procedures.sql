CREATE DEFINER=`lldlt`@`%` PROCEDURE `insert_row`(IN a VARCHAR(1), IN b INT, IN c INT)
BEGIN
	INSERT INTO users2 (gender, age, occupation)
	VALUEs	(a,b,c);
	SELECT * FROM users2;
END