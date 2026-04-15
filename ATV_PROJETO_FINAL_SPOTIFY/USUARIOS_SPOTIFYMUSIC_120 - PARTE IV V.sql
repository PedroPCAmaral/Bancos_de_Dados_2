USE SPOTYMUSIC_120;

-- 1. Limpeza de ambiente
DROP USER IF EXISTS 'dev_user'@'localhost';
DROP USER IF EXISTS 'suporte_user'@'localhost';
DROP USER IF EXISTS 'admin_user'@'localhost';

-- 2. Criação dos usuários e atribuição de privilégios
-- Perfil: Desenvolvedor (DML e DDL básico)
CREATE USER 'dev_user'@'localhost' IDENTIFIED BY 'SenhaDev123!';
GRANT CREATE, INSERT, SELECT ON SPOTYMUSIC_120.* TO 'dev_user'@'localhost';

-- Perfil: Suporte (Focado em manutenção de dados e testes de CASCADE)
CREATE USER 'suporte_user'@'localhost' IDENTIFIED BY 'SenhaSup456!';
GRANT SELECT, DELETE ON SPOTYMUSIC_120.* TO 'suporte_user'@'localhost';

-- Perfil: Administrador (Controle total de dados e estrutura)
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'SenhaAdm789!';
GRANT UPDATE, SELECT, DROP ON SPOTYMUSIC_120.* TO 'admin_user'@'localhost';

-- 3. Atualização de privilégios
FLUSH PRIVILEGES;

-- 4. Relatório de Verificação (Para conferência do Professor)
SELECT user, host FROM mysql.user 
WHERE user IN ('dev_user', 'suporte_user', 'admin_user');

SHOW GRANTS FOR 'dev_user'@'localhost';
SHOW GRANTS FOR 'suporte_user'@'localhost';
SHOW GRANTS FOR 'admin_user'@'localhost';