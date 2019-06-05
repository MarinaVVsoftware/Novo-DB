CREATE TABLE Email_Templates  (
	email_template_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(120),
    body_text TEXT,
    body_html TEXT,
    
    PRIMARY KEY (email_template_id)
);