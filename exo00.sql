CREATE TABLE hello (
    id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255)
);
INSERT INTO hello (message)
VALUES ('Hello World');
SELECT * FROM hello;