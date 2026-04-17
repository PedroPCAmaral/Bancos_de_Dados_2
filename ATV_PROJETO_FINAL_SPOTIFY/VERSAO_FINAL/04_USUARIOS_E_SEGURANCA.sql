USE SPOTYMUSIC_120;
DROP USER IF EXISTS 'dev_user'@'localhost', 'suporte_user'@'localhost', 'admin_user'@'localhost';

CREATE USER 'dev_user'@'localhost' IDENTIFIED BY 'Senha123';
GRANT CREATE, INSERT, SELECT ON SPOTYMUSIC_120.* TO 'dev_user'@'localhost';

CREATE USER 'suporte_user'@'localhost' IDENTIFIED BY 'Senha456';
GRANT SELECT, DELETE ON SPOTYMUSIC_120.* TO 'suporte_user'@'localhost';

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'Senha789';
GRANT UPDATE, SELECT, DROP ON SPOTYMUSIC_120.* TO 'admin_user'@'localhost';

FLUSH PRIVILEGES;