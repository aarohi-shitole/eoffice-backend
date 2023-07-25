-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.23-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for eoffice
CREATE DATABASE IF NOT EXISTS `eoffice` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `eoffice`;

-- Dumping structure for table eoffice.comment_master
CREATE TABLE IF NOT EXISTS `comment_master` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `last_modified` datetime(6) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `dak_master_id` bigint(20) DEFAULT NULL,
  `security_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8bvm4jh3wwhp96i4ca3elr8yd` (`dak_master_id`),
  KEY `FKjkaeqpdj0rbelhjgc82m1hoou` (`security_user_id`),
  CONSTRAINT `FK8bvm4jh3wwhp96i4ca3elr8yd` FOREIGN KEY (`dak_master_id`) REFERENCES `dak_master` (`id`),
  CONSTRAINT `FKjkaeqpdj0rbelhjgc82m1hoou` FOREIGN KEY (`security_user_id`) REFERENCES `security_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.comment_master: ~0 rows (approximately)
DELETE FROM `comment_master`;
/*!40000 ALTER TABLE `comment_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_master` ENABLE KEYS */;

-- Dumping structure for table eoffice.dak_history
CREATE TABLE IF NOT EXISTS `dak_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assigned_by` varchar(255) DEFAULT NULL,
  `assigned_on` datetime(6) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `dak_status` varchar(255) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `last_modified` datetime(6) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `dak_master_id` bigint(20) DEFAULT NULL,
  `security_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7s4yp01w24vv56dbfqxmq1a0y` (`dak_master_id`),
  KEY `FKlg3vx1vh4bfsvs2prwg5hl6k` (`security_user_id`),
  CONSTRAINT `FK7s4yp01w24vv56dbfqxmq1a0y` FOREIGN KEY (`dak_master_id`) REFERENCES `dak_master` (`id`),
  CONSTRAINT `FKlg3vx1vh4bfsvs2prwg5hl6k` FOREIGN KEY (`security_user_id`) REFERENCES `security_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.dak_history: ~0 rows (approximately)
DELETE FROM `dak_history`;
/*!40000 ALTER TABLE `dak_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `dak_history` ENABLE KEYS */;

-- Dumping structure for table eoffice.dak_id_generator
CREATE TABLE IF NOT EXISTS `dak_id_generator` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `next_val_inward` bigint(20) DEFAULT NULL,
  `next_val_outward` bigint(20) DEFAULT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_bd17y2ih462l4ed7getg3wkf2` (`organization_id`),
  CONSTRAINT `FKgx0na2kripscp88bp5o2kh6s4` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.dak_id_generator: ~0 rows (approximately)
DELETE FROM `dak_id_generator`;
/*!40000 ALTER TABLE `dak_id_generator` DISABLE KEYS */;
INSERT INTO `dak_id_generator` (`id`, `next_val_inward`, `next_val_outward`, `organization_id`) VALUES
	(1, 11444, 509, 1);
/*!40000 ALTER TABLE `dak_id_generator` ENABLE KEYS */;

-- Dumping structure for table eoffice.dak_journey
CREATE TABLE IF NOT EXISTS `dak_journey` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assigned_on` datetime(6) DEFAULT NULL,
  `dak_assigned_by` varchar(255) DEFAULT NULL,
  `dak_assigned_to` varchar(255) DEFAULT NULL,
  `dak_status` varchar(255) DEFAULT NULL,
  `last_modified` datetime(6) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `comment_master_id` bigint(20) DEFAULT NULL,
  `dak_master_id` bigint(20) DEFAULT NULL,
  `security_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1d8vu36dnskegckkm7d2n8eyq` (`comment_master_id`),
  KEY `FKlbwex1kmtsagbctwaporptxrj` (`dak_master_id`),
  KEY `FKp8kbxq630d4k2nuyjb8fxl8nf` (`security_user_id`),
  CONSTRAINT `FK1d8vu36dnskegckkm7d2n8eyq` FOREIGN KEY (`comment_master_id`) REFERENCES `comment_master` (`id`),
  CONSTRAINT `FKlbwex1kmtsagbctwaporptxrj` FOREIGN KEY (`dak_master_id`) REFERENCES `dak_master` (`id`),
  CONSTRAINT `FKp8kbxq630d4k2nuyjb8fxl8nf` FOREIGN KEY (`security_user_id`) REFERENCES `security_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.dak_journey: ~0 rows (approximately)
DELETE FROM `dak_journey`;
/*!40000 ALTER TABLE `dak_journey` DISABLE KEYS */;
/*!40000 ALTER TABLE `dak_journey` ENABLE KEYS */;

-- Dumping structure for table eoffice.dak_master
CREATE TABLE IF NOT EXISTS `dak_master` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assigned_date` datetime(6) DEFAULT NULL,
  `await_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contact_number` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `sender_address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `current_status` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `dispatched_date` datetime(6) DEFAULT NULL,
  `inward_number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sender_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `response_received` bit(1) DEFAULT NULL,
  `letter_date` datetime(6) DEFAULT NULL,
  `letter_received_date` datetime(6) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `letter_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `outward_number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sender_email` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `taluka` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `dak_assign_from` bigint(20) DEFAULT NULL,
  `dak_assignee` bigint(20) DEFAULT NULL,
  `dispatched_by` bigint(20) DEFAULT NULL,
  `sender_outward` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbnb3ll1w3xcpk1m0mg30pqwxp` (`organization_id`),
  CONSTRAINT `FKbnb3ll1w3xcpk1m0mg30pqwxp` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table eoffice.dak_master: ~0 rows (approximately)
DELETE FROM `dak_master`;
/*!40000 ALTER TABLE `dak_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `dak_master` ENABLE KEYS */;

-- Dumping structure for table eoffice.databasechangelog
CREATE TABLE IF NOT EXISTS `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.databasechangelog: ~6 rows (approximately)
DELETE FROM `databasechangelog`;
/*!40000 ALTER TABLE `databasechangelog` DISABLE KEYS */;
INSERT INTO `databasechangelog` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`) VALUES
	('00000000000001', 'jhipster', 'config/liquibase/changelog/00000000000000_initial_schema.xml', '2022-06-15 14:55:22', 1, 'EXECUTED', '8:1a5f32270e664dee65256c5fff5c0e33', 'createTable tableName=jhi_user; createTable tableName=jhi_authority; createTable tableName=jhi_user_authority; addPrimaryKey tableName=jhi_user_authority; addForeignKeyConstraint baseTableName=jhi_user_authority, constraintName=fk_authority_name, ...', '', NULL, '4.6.1', NULL, NULL, '5285121248'),
	('20220420122539-1', 'jhipster', 'config/liquibase/changelog/20220420122539_added_entity_SecurityUser.xml', '2022-06-15 14:55:22', 2, 'EXECUTED', '8:f57d6da2dfc2a5bc2b1507d7bf4cace9', 'createTable tableName=security_user; dropDefaultValue columnName=reset_date, tableName=security_user; dropDefaultValue columnName=created_on, tableName=security_user', '', NULL, '4.6.1', NULL, NULL, '5285121248'),
	('20220420122539-1-relations', 'jhipster', 'config/liquibase/changelog/20220420122539_added_entity_SecurityUser.xml', '2022-06-15 14:55:22', 3, 'EXECUTED', '8:926ead00c895c98bd175b9bcedae81b9', 'createTable tableName=rel_security_user__security_permission; addPrimaryKey tableName=rel_security_user__security_permission; createTable tableName=rel_security_user__security_role; addPrimaryKey tableName=rel_security_user__security_role', '', NULL, '4.6.1', NULL, NULL, '5285121248'),
	('20220420122540-1', 'jhipster', 'config/liquibase/changelog/20220420122540_added_entity_UserAccess.xml', '2022-06-15 14:55:22', 4, 'EXECUTED', '8:3c7e7959753345ddd9607794f6d724e7', 'createTable tableName=user_access; dropDefaultValue columnName=last_modified, tableName=user_access', '', NULL, '4.6.1', NULL, NULL, '5285121248'),
	('20220420122541-1', 'jhipster', 'config/liquibase/changelog/20220420122541_added_entity_SecurityRole.xml', '2022-06-15 14:55:23', 5, 'EXECUTED', '8:721737c00c1467c3bd1600633d1a901c', 'createTable tableName=security_role; dropDefaultValue columnName=last_modified, tableName=security_role', '', NULL, '4.6.1', NULL, NULL, '5285121248'),
	('20220420122541-1-relations', 'jhipster', 'config/liquibase/changelog/20220420122541_added_entity_SecurityRole.xml', '2022-06-15 14:55:23', 6, 'EXECUTED', '8:1f821e784dfbdfa849345e5445f370b8', 'createTable tableName=rel_security_role__security_permission; addPrimaryKey tableName=rel_security_role__security_permission', '', NULL, '4.6.1', NULL, NULL, '5285121248');
/*!40000 ALTER TABLE `databasechangelog` ENABLE KEYS */;

-- Dumping structure for table eoffice.databasechangeloglock
CREATE TABLE IF NOT EXISTS `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.databasechangeloglock: ~0 rows (approximately)
DELETE FROM `databasechangeloglock`;
/*!40000 ALTER TABLE `databasechangeloglock` DISABLE KEYS */;
INSERT INTO `databasechangeloglock` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`) VALUES
	(1, b'0', NULL, NULL);
/*!40000 ALTER TABLE `databasechangeloglock` ENABLE KEYS */;

-- Dumping structure for table eoffice.ghoshwara
CREATE TABLE IF NOT EXISTS `ghoshwara` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `above_one_year` int(11) DEFAULT NULL,
  `above_six_months` int(11) DEFAULT NULL,
  `current_week_cleared` int(11) DEFAULT NULL,
  `current_week_inwards` int(11) DEFAULT NULL,
  `current_week_pendings` int(11) DEFAULT NULL,
  `daily_pendings` int(11) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `first_month` int(11) DEFAULT NULL,
  `first_week` int(11) DEFAULT NULL,
  `initial_pendings` int(11) DEFAULT NULL,
  `last_modified` datetime(6) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `register_type` varchar(255) DEFAULT NULL,
  `second_month` int(11) DEFAULT NULL,
  `second_week` int(11) DEFAULT NULL,
  `self_generated` int(11) DEFAULT NULL,
  `third_month` int(11) DEFAULT NULL,
  `third_week` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `within_six_months` int(11) DEFAULT NULL,
  `security_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkpa7cq3y17y8f7nakhvuk8ect` (`security_user_id`),
  CONSTRAINT `FKkpa7cq3y17y8f7nakhvuk8ect` FOREIGN KEY (`security_user_id`) REFERENCES `security_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.ghoshwara: ~0 rows (approximately)
DELETE FROM `ghoshwara`;
/*!40000 ALTER TABLE `ghoshwara` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghoshwara` ENABLE KEYS */;

-- Dumping structure for table eoffice.hearing_details
CREATE TABLE IF NOT EXISTS `hearing_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accuser_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `last_modified` datetime(6) DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `order_date` datetime(6) DEFAULT NULL,
  `respondent_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `time` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `dak_master_id` bigint(20) DEFAULT NULL,
  `security_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdtxsunph5hbtjn9w7xk08yb3v` (`dak_master_id`),
  KEY `FK67l0syunnnh21xii26oe89kid` (`security_user_id`),
  CONSTRAINT `FK67l0syunnnh21xii26oe89kid` FOREIGN KEY (`security_user_id`) REFERENCES `security_user` (`id`),
  CONSTRAINT `FKdtxsunph5hbtjn9w7xk08yb3v` FOREIGN KEY (`dak_master_id`) REFERENCES `dak_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table eoffice.hearing_details: ~0 rows (approximately)
DELETE FROM `hearing_details`;
/*!40000 ALTER TABLE `hearing_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `hearing_details` ENABLE KEYS */;

-- Dumping structure for table eoffice.jhi_authority
CREATE TABLE IF NOT EXISTS `jhi_authority` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.jhi_authority: ~2 rows (approximately)
DELETE FROM `jhi_authority`;
/*!40000 ALTER TABLE `jhi_authority` DISABLE KEYS */;
INSERT INTO `jhi_authority` (`name`) VALUES
	('ROLE_ADMIN'),
	('ROLE_USER');
/*!40000 ALTER TABLE `jhi_authority` ENABLE KEYS */;

-- Dumping structure for table eoffice.jhi_user
CREATE TABLE IF NOT EXISTS `jhi_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(10) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `reset_key` varchar(20) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_user_login` (`login`),
  UNIQUE KEY `ux_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.jhi_user: ~2 rows (approximately)
DELETE FROM `jhi_user`;
/*!40000 ALTER TABLE `jhi_user` DISABLE KEYS */;
INSERT INTO `jhi_user` (`id`, `login`, `password_hash`, `first_name`, `last_name`, `email`, `image_url`, `activated`, `lang_key`, `activation_key`, `reset_key`, `created_by`, `created_date`, `reset_date`, `last_modified_by`, `last_modified_date`) VALUES
	(1, 'admin', '$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC', 'Administrator', 'Administrator', 'admin@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'system', NULL),
	(2, 'user', '$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K', 'User', 'User', 'user@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'system', NULL);
/*!40000 ALTER TABLE `jhi_user` ENABLE KEYS */;

-- Dumping structure for table eoffice.jhi_user_authority
CREATE TABLE IF NOT EXISTS `jhi_user_authority` (
  `user_id` bigint(20) NOT NULL,
  `authority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`authority_name`),
  KEY `fk_authority_name` (`authority_name`),
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `jhi_authority` (`name`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.jhi_user_authority: ~3 rows (approximately)
DELETE FROM `jhi_user_authority`;
/*!40000 ALTER TABLE `jhi_user_authority` DISABLE KEYS */;
INSERT INTO `jhi_user_authority` (`user_id`, `authority_name`) VALUES
	(1, 'ROLE_ADMIN'),
	(1, 'ROLE_USER'),
	(2, 'ROLE_USER');
/*!40000 ALTER TABLE `jhi_user_authority` ENABLE KEYS */;

-- Dumping structure for table eoffice.organization
CREATE TABLE IF NOT EXISTS `organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `created_on` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_activate` bit(1) DEFAULT NULL,
  `last_modified` datetime(6) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `org_name_marathi` varchar(255) DEFAULT NULL,
  `organization_name` varchar(255) NOT NULL,
  `orgnization_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pw8gr9xtgl634fnv4tvqev5nn` (`organization_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.organization: ~0 rows (approximately)
DELETE FROM `organization`;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` (`id`, `address`, `created_on`, `description`, `is_activate`, `last_modified`, `last_modified_by`, `org_name_marathi`, `organization_name`, `orgnization_type`) VALUES
	(1, 'PUNE', '2021-12-16 13:19:44', 'District Deputy Registrar Co-operative Society Pune, Rural', b'1', '2021-12-16 13:20:43.000000', NULL, NULL, 'DDR Co-operative Society Pune, Rural', 'DDR');
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;

-- Dumping structure for table eoffice.parameter_lookup
CREATE TABLE IF NOT EXISTS `parameter_lookup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `last_modified` datetime(6) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `parameter_name` varchar(255) NOT NULL,
  `parameter_value` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh0fxjmc9uo3hq0ormmaetnsni` (`organization_id`),
  CONSTRAINT `FKh0fxjmc9uo3hq0ormmaetnsni` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.parameter_lookup: ~3 rows (approximately)
DELETE FROM `parameter_lookup`;
/*!40000 ALTER TABLE `parameter_lookup` DISABLE KEYS */;
INSERT INTO `parameter_lookup` (`id`, `created_by`, `created_on`, `last_modified`, `last_modified_by`, `parameter_name`, `parameter_value`, `status`, `type`, `organization_id`) VALUES
	(1, 'Admin', '2021-01-01 09:29:51.000000', '2021-01-01 09:30:20.000000', 'Admin', 'DDR EOFFICE', 'DDR EOFFICE', 'A', 'department', 1),
	(41, 'Admin', '2021-01-01 08:14:05.000000', NULL, NULL, 'Govt', 'Govt', 'A', 'section', 1),
	(42, 'Admin', '2021-01-01 08:35:50.000000', NULL, NULL, 'Indiduval', 'Indiduval', 'A', 'section', 1);
/*!40000 ALTER TABLE `parameter_lookup` ENABLE KEYS */;

-- Dumping structure for table eoffice.rel_security_role__security_permission
CREATE TABLE IF NOT EXISTS `rel_security_role__security_permission` (
  `security_permission_id` bigint(20) NOT NULL,
  `security_role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`security_role_id`,`security_permission_id`),
  KEY `FKt1a5uyto724p7s1lq79nddk5h` (`security_permission_id`),
  CONSTRAINT `FKbsj7pmwgeu5w2v1dhwrcxu0m9` FOREIGN KEY (`security_role_id`) REFERENCES `security_role` (`id`),
  CONSTRAINT `FKt1a5uyto724p7s1lq79nddk5h` FOREIGN KEY (`security_permission_id`) REFERENCES `security_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.rel_security_role__security_permission: ~26 rows (approximately)
DELETE FROM `rel_security_role__security_permission`;
/*!40000 ALTER TABLE `rel_security_role__security_permission` DISABLE KEYS */;
INSERT INTO `rel_security_role__security_permission` (`security_permission_id`, `security_role_id`) VALUES
	(1, 1),
	(3, 3),
	(6, 4),
	(7, 6),
	(8, 3),
	(12, 4),
	(13, 4),
	(15, 5),
	(18, 1),
	(19, 1),
	(24, 6),
	(27, 5),
	(29, 6),
	(30, 4),
	(32, 3),
	(32, 6),
	(33, 3),
	(33, 6),
	(34, 6),
	(35, 2),
	(35, 4),
	(35, 5),
	(35, 6),
	(36, 5),
	(37, 1),
	(37, 2);
/*!40000 ALTER TABLE `rel_security_role__security_permission` ENABLE KEYS */;

-- Dumping structure for table eoffice.rel_security_user__security_permission
CREATE TABLE IF NOT EXISTS `rel_security_user__security_permission` (
  `security_permission_id` bigint(20) NOT NULL,
  `security_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`security_user_id`,`security_permission_id`),
  KEY `FK5614tgddeoptyp9gvkltfrq2s` (`security_permission_id`),
  CONSTRAINT `FK5614tgddeoptyp9gvkltfrq2s` FOREIGN KEY (`security_permission_id`) REFERENCES `security_permission` (`id`),
  CONSTRAINT `FKl58c5ut5hpeiwvptjjpmp3nku` FOREIGN KEY (`security_user_id`) REFERENCES `security_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.rel_security_user__security_permission: ~2 rows (approximately)
DELETE FROM `rel_security_user__security_permission`;
/*!40000 ALTER TABLE `rel_security_user__security_permission` DISABLE KEYS */;
INSERT INTO `rel_security_user__security_permission` (`security_permission_id`, `security_user_id`) VALUES
	(2, 1),
	(19, 1);
/*!40000 ALTER TABLE `rel_security_user__security_permission` ENABLE KEYS */;

-- Dumping structure for table eoffice.rel_security_user__security_role
CREATE TABLE IF NOT EXISTS `rel_security_user__security_role` (
  `security_role_id` bigint(20) NOT NULL,
  `security_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`security_user_id`,`security_role_id`),
  KEY `FKg17ipmms5umqqvjt5ftp74uol` (`security_role_id`),
  CONSTRAINT `FKg17ipmms5umqqvjt5ftp74uol` FOREIGN KEY (`security_role_id`) REFERENCES `security_role` (`id`),
  CONSTRAINT `FKkaiqyj300yfvsdl0126ukom3f` FOREIGN KEY (`security_user_id`) REFERENCES `security_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.rel_security_user__security_role: ~21 rows (approximately)
DELETE FROM `rel_security_user__security_role`;
/*!40000 ALTER TABLE `rel_security_user__security_role` DISABLE KEYS */;
INSERT INTO `rel_security_user__security_role` (`security_role_id`, `security_user_id`) VALUES
	(1, 1),
	(2, 11),
	(3, 31),
	(4, 24),
	(5, 26),
	(5, 40),
	(5, 41),
	(6, 25),
	(6, 27),
	(6, 28),
	(6, 29),
	(6, 30),
	(6, 32),
	(6, 33),
	(6, 34),
	(6, 35),
	(6, 36),
	(6, 37),
	(6, 38),
	(6, 39),
	(6, 42);
/*!40000 ALTER TABLE `rel_security_user__security_role` ENABLE KEYS */;

-- Dumping structure for table eoffice.security_permission
CREATE TABLE IF NOT EXISTS `security_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `last_modified` datetime(6) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `permission_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_beln4we8xfy2v7v3mdy2d6x28` (`permission_name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.security_permission: ~33 rows (approximately)
DELETE FROM `security_permission`;
/*!40000 ALTER TABLE `security_permission` DISABLE KEYS */;
INSERT INTO `security_permission` (`id`, `description`, `last_modified`, `last_modified_by`, `permission_name`) VALUES
	(1, 'This is developer admin role', '2022-04-19 15:34:34.000000', 'ADMIN', 'ROLE_ADMIN'),
	(2, 'This is developer user role', '2022-04-19 10:50:37.000000', 'ADMIN', 'ROLE_USER'),
	(3, 'This is dashboard menu', '2022-04-20 01:03:38.000000', 'ADMIN', 'DASHBOARD_MENU'),
	(6, 'This is for inward dak related menu', '2022-04-19 22:47:38.000000', 'ADMIN', 'DAK_INWARD_MENU'),
	(7, 'This is for add, update & delete inward dak ', '2022-04-20 03:01:17.000000', 'ADMIN', 'DAK_INWARD_EDIT'),
	(8, 'Permission  for view only inward ', '2022-04-20 02:11:45.000000', 'ADMIN', 'DAK_INWARD_VIEW_ONLY'),
	(12, 'This is for recently added dak related menu', '2022-04-19 15:32:46.000000', 'ADMIN', 'REC_ADD_DAK_MENU'),
	(13, 'This is for add, update & delete recently added dak', '2022-04-19 15:32:46.000000', 'ADMIN', 'REC_ADD_DAK_EDIT'),
	(14, 'Permission  for view only the recently added dak', '2022-04-19 15:32:46.000000', 'ADMIN', 'REC_ADD_DAK_VIEW_ONLY'),
	(15, 'This is for assigned dak related menu', '2022-04-19 15:32:46.000000', 'ADMIN', 'ASSIGN_DAK_MENU'),
	(16, 'This is for add, update & delete assign dak ', '2022-04-19 15:32:46.000000', 'ADMIN', 'ASSIGN_DAK_EDIT'),
	(17, 'Permission  for view only the assigned dak', '2022-04-19 15:32:46.000000', 'ADMIN', 'ASSIGN_DAK_VIEW_ONLY'),
	(18, 'This is for organization related menu', '2022-04-19 15:32:46.000000', 'ADMIN', 'ORGANIZATION_MENU'),
	(19, 'This is for add, update & delete organization', '2022-04-19 15:32:46.000000', 'ADMIN', 'ORGANIZATION_EDIT'),
	(20, 'Permission  for view only the organizations', '2022-04-19 15:32:46.000000', 'ADMIN', 'ORGANIZATION_VIEW_ONLY'),
	(21, 'This is for comment related menu', '2022-04-19 15:32:46.000000', 'ADMIN', 'COMMENT_MENU'),
	(22, 'This is for add, update & delete comment', '2022-04-19 15:32:46.000000', 'ADMIN', 'COMMENT_EDIT'),
	(23, 'Permission  for view only the comments', '2022-04-19 15:32:46.000000', 'ADMIN', 'COMMENT_VIEW_ONLY'),
	(24, 'This is for goshwara related menu', '2022-04-19 15:32:46.000000', 'ADMIN', 'GOSHWARA_MENU'),
	(25, 'This is for add, update & delete goshwara ', '2022-04-19 15:32:46.000000', 'ADMIN', 'GOSHWARA_EDIT'),
	(26, 'Permission  for view only the goshwara', '2022-04-19 15:32:46.000000', 'ADMIN', 'GOSHWARA_VIEW_ONLY'),
	(27, 'This permission handed over report only', '2022-04-22 14:05:04.000000', 'ADMIN', 'HANDEDOVER_MENU'),
	(28, 'this menu useful for user management', '2022-04-25 18:30:00.000000', 'Admin', 'USER_MENU'),
	(29, 'This menu for nodwahi report', '2022-04-25 18:30:00.000000', 'Admin', 'NONDWAHI_MENU'),
	(30, 'This for inward registered menu for clerk', '2022-04-25 18:30:00.000000', 'Admin', 'INWARD_REGISTER_MENU'),
	(31, 'letter list for marker which is dispatched ', '2022-04-25 18:30:00.000000', 'Admin', 'DISPATCHED_DAK_MENU'),
	(32, 'Cleared dak list menu for every user', '2022-04-25 18:30:00.000000', 'Admin', 'DAK_CLEARED_MENU'),
	(33, 'command for all ', '2022-04-25 18:30:00.000000', 'Admin', 'HEARING_MENU'),
	(34, 'This permission for employee to show there assignments', '2022-04-27 18:30:00.000000', 'Admin', 'DAK_MY_ASSIGNMENTS'),
	(35, 'fetch user list for clerk and Marker', '2022-04-29 18:30:00.000000', 'Admin', 'USERS_LIST'),
	(36, 'Display menu for marker which are comes from clerk', '2022-05-02 13:07:59.000000', 'Admin', 'INWARDS_MARKER_MENU'),
	(37, 'permission for user management specific to Admin and Super admin', '2022-05-03 18:30:00.000000', 'Admin', 'USER_EDIT'),
	(38, 'special permission for Super Admin', '2022-05-03 18:30:00.000000', 'Admin', 'ORG_EDIT');
/*!40000 ALTER TABLE `security_permission` ENABLE KEYS */;

-- Dumping structure for table eoffice.security_role
CREATE TABLE IF NOT EXISTS `security_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `last_modified` datetime(6) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_security_role__role_name` (`role_name`),
  UNIQUE KEY `UK_3to96bxl7kdr60b6ttddvol3l` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.security_role: ~6 rows (approximately)
DELETE FROM `security_role`;
/*!40000 ALTER TABLE `security_role` DISABLE KEYS */;
INSERT INTO `security_role` (`id`, `role_name`, `description`, `last_modified`, `last_modified_by`) VALUES
	(1, 'ROLE_SUPER_ADMIN', 'Super Admin', '2021-12-14 15:33:39.000000', 'VG Team'),
	(2, 'ROLE_ORG_ADMIN', 'Admin', '2021-12-14 16:25:33.000000', 'VG Team'),
	(3, 'ROLE_HEAD_OFFICE', 'DDR', '2021-12-14 16:55:25.000000', 'VG Team'),
	(4, 'ROLE_CLERK', 'Clerk', '2021-12-14 16:29:24.000000', 'VG Team'),
	(5, 'ROLE_MARKER', 'Marker', '2021-12-14 16:54:03.000000', 'VG Team'),
	(6, 'ROLE_EMP', 'Employee', '2021-12-14 16:54:38.000000', 'VG Team');
/*!40000 ALTER TABLE `security_role` ENABLE KEYS */;

-- Dumping structure for table eoffice.security_user
CREATE TABLE IF NOT EXISTS `security_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `activated` bit(1) DEFAULT NULL,
  `lang_key` varchar(255) DEFAULT NULL,
  `activation_key` varchar(255) DEFAULT NULL,
  `reset_key` varchar(255) DEFAULT NULL,
  `reset_date` datetime(6) DEFAULT NULL,
  `mobile_no` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `organization_id` bigint(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `last_modified` datetime(6) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_security_user__username` (`username`),
  UNIQUE KEY `ux_security_user__email` (`email`),
  KEY `FKnrwn7cg1ow6y40e054gmo6byc` (`organization_id`),
  CONSTRAINT `FKnrwn7cg1ow6y40e054gmo6byc` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.security_user: ~21 rows (approximately)
DELETE FROM `security_user`;
/*!40000 ALTER TABLE `security_user` DISABLE KEYS */;
INSERT INTO `security_user` (`id`, `first_name`, `last_name`, `designation`, `username`, `password_hash`, `email`, `description`, `department`, `image_url`, `activated`, `lang_key`, `activation_key`, `reset_key`, `reset_date`, `mobile_no`, `created_by`, `created_on`, `organization_id`, `address`, `gender`, `last_modified`, `last_modified_by`) VALUES
	(1, 'VG Tech', 'Admin', 'VG admin', 'super_admin', '$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC', 'superadmin@gmail.com', 'super admin', 'Software Development Unit', '', b'0', '', '', '', '2022-04-19 14:46:00.000000', '9394948474', 'VG user', '2022-04-20 03:58:00.000000', NULL, 'VG Infotech', 'MALE', '2022-05-09 14:46:42.000000', 'VG Admin'),
	(11, 'Admin', 'Admin', NULL, 'admin', '$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC', 'admin@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, '2022-06-16 11:48:58.000000', '9922299877', NULL, '2022-06-16 11:49:02.000000', 1, 'Pune', 'MALE', '2022-06-16 11:49:08.000000', NULL),
	(24, 'Sunita', 'Randive', NULL, 'SRRandive', '$2a$10$W.Ku./wa9LOBWLMX1OZ9Mu1NaSw3k.fdo.Sqiz.g3q7rsu/id.qZG', 'sunita@gmil.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '9145289705', NULL, NULL, 1, 'pune 411014', 'FEMALE', NULL, NULL),
	(25, 'Sanjay', 'Sasane', 'Employee', 'SDSasane', '$2a$10$xG/NOsDQLi0Xn0N6BW6az.4X2DBmwXoSnZMQS/x30dRVs7CgNPBSC', 'atmaram@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '9881810456', NULL, NULL, 1, 'pune 411014', 'MALE', NULL, NULL),
	(26, 'Atmaram', 'Jadhav', NULL, 'jadhavmarker', '$2a$10$31QWMpETiBiM3XUtFceL4uOHMfIJx/34YRrRmR.Jxj6/t5BRv/pE6', 'jadhav@gmail.com', NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, '9850783334', NULL, NULL, 1, 'pune 411014', 'MALE', NULL, NULL),
	(27, 'Yunus', 'Shaikh', NULL, 'YDShaikh', '$2a$10$a.NcSmellCT7U.KILa1uvOPUBvGCtUdYgw0gab0TVmFglutidCCGS', 'yunus@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '7709441226', NULL, NULL, 1, 'pune 411014', 'MALE', NULL, NULL),
	(28, 'Sandip', 'Bhosale', 'Employee', 'SABhosale', '$2a$10$/6XNnejM1Z7ILPtrFFOZ0OjBZQArmrlabJR9TD7ePbnnvn3O5wgC.', 'Anupama@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '9552551368', NULL, NULL, 1, 'Pune 411001', 'MALE', NULL, NULL),
	(29, 'Ashwini', 'Neve', NULL, 'AMNeve', '$2a$10$oZKUkjKYbq49kaTGe0gczOBGYhMY5MMtJwg.aukSrVKY0Ra9iUODi', 'neve@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '9028314463', NULL, NULL, 1, 'Pune 411001', 'FEMALE', NULL, NULL),
	(30, 'Sangita', 'Mombarkar', NULL, 'SPMombarkar', '$2a$10$58ApCFKl9gFzIf/Y7f6.8ePpNhHobAtSYSm83YCHqXmxtSGVIfddm', 'sangita@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '9822086747', NULL, NULL, 1, 'Pune 411001', 'FEMALE', NULL, NULL),
	(31, 'DDR', 'PuneRural', 'DDR', 'MPSobale', '$2a$10$K14roPZYjK04NWdRbQSRE.o.uHN0KjQUiDX..37UjC32p.Fywz3BW', 'Milind@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '9850881070', NULL, NULL, 1, 'Pune 411001', 'MALE', NULL, NULL),
	(32, 'Suryakant', 'More', NULL, 'SMMore', '$2a$10$cyQU.gmexalkN6bALq9TJuCvifu3nWJB0B7DE5bFCr4nm1ef2Ts6m', 'suryakantmmore@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '8600769852', NULL, NULL, 1, 'Pune 411001', 'MALE', NULL, NULL),
	(33, 'Anil', 'Bengle', 'Employee', 'ARBengle', '$2a$10$NIERHVt5Z/wdz94oPElwbuqhXgvdQoZp5YKqLuEUlcRUSwE2sWBae', 'bengleanil@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '8888031530', NULL, NULL, 1, 'Pune 411001', 'MALE', NULL, NULL),
	(34, 'Vandana', 'Parate', NULL, 'VGParate', '$2a$10$8Zs8nvpkfJf3dPNrOvyCQuGoC35/Fc/VI0mX89uFTjutOn4o/YM4m', 'Parate@gamil.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '9167468745', NULL, NULL, 1, 'Pune 411001', 'FEMALE', NULL, NULL),
	(35, 'Nitin', 'Nagare', 'Employee', 'NCNagare', '$2a$10$UXytDPvZtVrIHYxcR0D3duWnL/UqWYQ18qawzwQUpgdYml2FUvx/W', 'Nagare@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '7507272762', NULL, NULL, 1, 'Pune 411001', 'MALE', NULL, NULL),
	(36, 'Ulka', 'Gaikwad', NULL, 'URGaikwad', '$2a$10$/xb1cUEr.RRHXcO/pD7XK.378jRIMxVZx5dT01PMFhp4J8AAdDH8y', 'Gaikwad@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '9405815809', NULL, NULL, 1, 'Pune 411001', 'FEMALE', NULL, NULL),
	(37, 'Balkrushna', 'Kadgi', NULL, 'BVKadgi', '$2a$10$ipl5M3WlpbAJ7qJ8dqspfeA3cm/xKAPIqsJKeJihbuLrI5DJlpHN.', 'Kadagi@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '9552320461', NULL, NULL, 1, 'Pune 411001', 'MALE', NULL, NULL),
	(38, 'Chitra', 'Marathe', NULL, 'CPMarathe', '$2a$10$mW./8VEERA1ggmiF6HRuHOl8RWXieCziP51zYV.5rR664ZMcYw/Ha', 'Marathe@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '9049861288', NULL, NULL, 1, 'Pune 411001', 'FEMALE', NULL, NULL),
	(39, 'Ganesh', 'Chaudhari', NULL, 'GHChaudhari', '$2a$10$TrSm2y5Ye8nI//TjA0P7NO3Axj2JtzPkvrA/7djttCnuehkqEeF4K', 'Chaudhari@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '9922073793', NULL, NULL, 1, 'Pune 411001', 'MALE', NULL, NULL),
	(40, 'Branch', 'Marker', NULL, 'BMMarker', '$2a$10$xAVOCr2Q9JPvJrTm9lxI2OsJD5L.k4nnliHSTApH1z5SHLc/9VKEu', 'ddrpunegramin@gmail.com', NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, '9823433603', NULL, NULL, 1, '5 B J Road Pune 411001', 'MALE', NULL, NULL),
	(41, 'Branch', 'Marker', NULL, 'BMarker', '$2a$10$azZmnMXlhJDD6ah0BgLDmuMhXY4DAOfPq80lC8ii78ZGxuPCEaOtu', 'marker@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '9823433603', NULL, NULL, 1, '5 bj road', 'MALE', NULL, NULL),
	(42, 'Sunil', 'Karhadkar', NULL, 'SGKarhadkar', '$2a$10$XfL.Bo9Lq7dow/SU1fFtnec41eXz8Gbg6/9.6Ga3EFehjGdyy7ZU2', 'sunil.karhadkar@gmail.com', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, '9823433603', NULL, NULL, 1, 'H-7; Mourya Vihar, Kothrud, Pune 411038', 'MALE', NULL, NULL);
/*!40000 ALTER TABLE `security_user` ENABLE KEYS */;

-- Dumping structure for table eoffice.user_access
CREATE TABLE IF NOT EXISTS `user_access` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` varchar(255) DEFAULT NULL,
  `access_id` bigint(20) DEFAULT NULL,
  `last_modified` datetime(6) DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `security_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK87ktiehoka476n793k1p4sjk2` (`security_user_id`),
  CONSTRAINT `FK87ktiehoka476n793k1p4sjk2` FOREIGN KEY (`security_user_id`) REFERENCES `security_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table eoffice.user_access: ~0 rows (approximately)
DELETE FROM `user_access`;
/*!40000 ALTER TABLE `user_access` DISABLE KEYS */;
INSERT INTO `user_access` (`id`, `level`, `access_id`, `last_modified`, `last_modified_by`, `security_user_id`) VALUES
	(1, 'ORGANIZATION', 1, '2022-06-16 11:02:37.000000', 'Admin', 1);
/*!40000 ALTER TABLE `user_access` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
