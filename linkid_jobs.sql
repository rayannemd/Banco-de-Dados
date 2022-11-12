-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.24-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para linkid_jobs
CREATE DATABASE IF NOT EXISTS `linkid_jobs` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `linkid_jobs`;

-- Copiando estrutura para tabela linkid_jobs.company
CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `cnpj` varchar(30) NOT NULL,
  `email` varchar(80) NOT NULL,
  `street` varchar(100) NOT NULL,
  `neighborhood` varchar(50) NOT NULL,
  `lang_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_company_language_id` (`lang_id`),
  CONSTRAINT `fk_company_language_id` FOREIGN KEY (`lang_id`) REFERENCES `language` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela linkid_jobs.company: ~1 rows (aproximadamente)
REPLACE INTO `company` (`id`, `name`, `cnpj`, `email`, `street`, `neighborhood`, `lang_id`) VALUES
	(2, 'ayrtonsan', '12345678', 'asdsadasdasdsad', 'sadsdas', 'jhooooo', 1);

-- Copiando estrutura para tabela linkid_jobs.job_type
CREATE TABLE IF NOT EXISTS `job_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tile` varchar(10) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela linkid_jobs.job_type: ~1 rows (aproximadamente)
REPLACE INTO `job_type` (`id`, `tile`, `description`) VALUES
	(1, 'asdsadsads', 'sdasdsadsa');

-- Copiando estrutura para tabela linkid_jobs.language
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela linkid_jobs.language: ~1 rows (aproximadamente)
REPLACE INTO `language` (`id`, `name`) VALUES
	(1, 'português');

-- Copiando estrutura para tabela linkid_jobs.opening
CREATE TABLE IF NOT EXISTS `opening` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `salary` double DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `is_valid` tinyint(4) DEFAULT 1,
  `company_id` int(11) DEFAULT NULL,
  `job_type_id` int(11) DEFAULT NULL,
  `payment_rate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_opening_company_id` (`company_id`),
  KEY `fk_opening_job_type_id` (`job_type_id`),
  KEY `fk_opening_payment_rate_id` (`payment_rate`),
  CONSTRAINT `fk_opening_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_opening_job_type_id` FOREIGN KEY (`job_type_id`) REFERENCES `job_type` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_opening_payment_rate_id` FOREIGN KEY (`payment_rate`) REFERENCES `payment_rate` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela linkid_jobs.opening: ~1 rows (aproximadamente)
REPLACE INTO `opening` (`id`, `title`, `description`, `salary`, `date_posted`, `date_valid`, `is_valid`, `company_id`, `job_type_id`, `payment_rate`) VALUES
	(2, 'asdasdsadasda', 'adsadsadas', 1232131, '2009-10-22 00:00:00', '2009-10-22 00:00:00', 0, 2, 1, 1);

-- Copiando estrutura para tabela linkid_jobs.payment_rate
CREATE TABLE IF NOT EXISTS `payment_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tile` varchar(10) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela linkid_jobs.payment_rate: ~1 rows (aproximadamente)
REPLACE INTO `payment_rate` (`id`, `tile`, `description`) VALUES
	(1, 'pagamento', 'asdasdsdsadsadsadsadds');

-- Copiando estrutura para tabela linkid_jobs.person
CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(80) NOT NULL,
  `middle_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `street` varchar(80) DEFAULT NULL,
  `neighborhood` varchar(80) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `lang_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_person_language_id` (`lang_id`),
  CONSTRAINT `fk_person_language_id` FOREIGN KEY (`lang_id`) REFERENCES `language` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela linkid_jobs.person: ~1 rows (aproximadamente)
REPLACE INTO `person` (`id`, `first_name`, `middle_name`, `last_name`, `street`, `neighborhood`, `email`, `lang_id`) VALUES
	(1, 'raya', 'asdasd', 'dsasadsa', 'lalaallal', 'hoooooooo', 'asdsadsadas', 1);

-- Copiando estrutura para tabela linkid_jobs.status_type
CREATE TABLE IF NOT EXISTS `status_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela linkid_jobs.status_type: ~1 rows (aproximadamente)
REPLACE INTO `status_type` (`id`, `name`) VALUES
	(1, 'rayarya');

-- Copiando estrutura para tabela linkid_jobs.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(50) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_company_id` (`company_id`),
  KEY `fk_user_person_id` (`person_id`),
  CONSTRAINT `fk_user_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_person_id` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela linkid_jobs.user: ~1 rows (aproximadamente)
REPLACE INTO `user` (`id`, `username`, `password`, `email`, `company_id`, `person_id`) VALUES
	(1, 'rayanenlinda', 'asdasdasdasddsas', 'asdsadasdasdsdasdas', 2, 1);

-- Copiando estrutura para tabela linkid_jobs.user_opening
CREATE TABLE IF NOT EXISTS `user_opening` (
  `date_apply` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `opening` int(11) DEFAULT NULL,
  KEY `fk_user_opening_user_id` (`user_id`),
  KEY `fk_user_opening_status_id` (`status_id`),
  KEY `fk_user_opening_opening_id` (`opening`),
  CONSTRAINT `fk_user_opening_opening_id` FOREIGN KEY (`opening`) REFERENCES `opening` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_opening_status_id` FOREIGN KEY (`status_id`) REFERENCES `status_type` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_opening_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela linkid_jobs.user_opening: ~1 rows (aproximadamente)
REPLACE INTO `user_opening` (`date_apply`, `user_id`, `status_id`, `opening`) VALUES
	('2009-10-22 00:00:00', 1, 1, 2);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
