/* Table "email_templates"  - TABLA DEBIL
Almacena las plantillas base para los correos dentro de novonautica.

email_template_id   -> ID natural
title               -> Título del correo
body_text           -> Texto de body en el correo
body_html           -> Contenido HTML dentro del correo

PK = email_template_id 
*/
CREATE TABLE email_templates  (
	email_template_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(120) NOT NULL,
    body_text TEXT NOT NULL,
    body_html TEXT NOT NULL,
    
    PRIMARY KEY (email_template_id)
);