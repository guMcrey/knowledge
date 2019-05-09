/*
Navicat MySQL Data Transfer

Source Server         : admin
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : smt

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2019-05-07 16:42:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `authtoken_token`
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authtoken_token
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add Bookmark', '6', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('22', 'Can change Bookmark', '6', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete Bookmark', '6', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('24', 'Can view Bookmark', '6', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('25', 'Can add User Setting', '7', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('26', 'Can change User Setting', '7', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete User Setting', '7', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('28', 'Can view User Setting', '7', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('29', 'Can add User Widget', '8', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('30', 'Can change User Widget', '8', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete User Widget', '8', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('32', 'Can view User Widget', '8', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('33', 'Can add log entry', '9', 'add_log');
INSERT INTO `auth_permission` VALUES ('34', 'Can change log entry', '9', 'change_log');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete log entry', '9', 'delete_log');
INSERT INTO `auth_permission` VALUES ('36', 'Can view log entry', '9', 'view_log');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 用户信息', '10', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 用户信息', '10', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 用户信息', '10', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 用户信息', '10', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('41', 'Can add Token', '11', 'add_token');
INSERT INTO `auth_permission` VALUES ('42', 'Can change Token', '11', 'change_token');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete Token', '11', 'delete_token');
INSERT INTO `auth_permission` VALUES ('44', 'Can view Token', '11', 'view_token');
INSERT INTO `auth_permission` VALUES ('45', 'Can add normal answers', '12', 'add_normalanswers');
INSERT INTO `auth_permission` VALUES ('46', 'Can change normal answers', '12', 'change_normalanswers');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete normal answers', '12', 'delete_normalanswers');
INSERT INTO `auth_permission` VALUES ('48', 'Can view normal answers', '12', 'view_normalanswers');
INSERT INTO `auth_permission` VALUES ('49', 'Can add normal questions', '13', 'add_normalquestions');
INSERT INTO `auth_permission` VALUES ('50', 'Can change normal questions', '13', 'change_normalquestions');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete normal questions', '13', 'delete_normalquestions');
INSERT INTO `auth_permission` VALUES ('52', 'Can view normal questions', '13', 'view_normalquestions');
INSERT INTO `auth_permission` VALUES ('53', 'Can add select answers', '14', 'add_selectanswers');
INSERT INTO `auth_permission` VALUES ('54', 'Can change select answers', '14', 'change_selectanswers');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete select answers', '14', 'delete_selectanswers');
INSERT INTO `auth_permission` VALUES ('56', 'Can view select answers', '14', 'view_selectanswers');
INSERT INTO `auth_permission` VALUES ('57', 'Can add select questions', '15', 'add_selectquestions');
INSERT INTO `auth_permission` VALUES ('58', 'Can change select questions', '15', 'change_selectquestions');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete select questions', '15', 'delete_selectquestions');
INSERT INTO `auth_permission` VALUES ('60', 'Can view select questions', '15', 'view_selectquestions');
INSERT INTO `auth_permission` VALUES ('61', 'Can add normal operations', '16', 'add_normaloperations');
INSERT INTO `auth_permission` VALUES ('62', 'Can change normal operations', '16', 'change_normaloperations');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete normal operations', '16', 'delete_normaloperations');
INSERT INTO `auth_permission` VALUES ('64', 'Can view normal operations', '16', 'view_normaloperations');
INSERT INTO `auth_permission` VALUES ('65', 'Can add select operations', '17', 'add_selectoperations');
INSERT INTO `auth_permission` VALUES ('66', 'Can change select operations', '17', 'change_selectoperations');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete select operations', '17', 'delete_selectoperations');
INSERT INTO `auth_permission` VALUES ('68', 'Can view select operations', '17', 'view_selectoperations');
INSERT INTO `auth_permission` VALUES ('69', 'Can add select teacher operations', '18', 'add_selectteacheroperations');
INSERT INTO `auth_permission` VALUES ('70', 'Can change select teacher operations', '18', 'change_selectteacheroperations');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete select teacher operations', '18', 'delete_selectteacheroperations');
INSERT INTO `auth_permission` VALUES ('72', 'Can view select teacher operations', '18', 'view_selectteacheroperations');
INSERT INTO `auth_permission` VALUES ('73', 'Can add select comment operations', '19', 'add_selectcommentoperations');
INSERT INTO `auth_permission` VALUES ('74', 'Can change select comment operations', '19', 'change_selectcommentoperations');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete select comment operations', '19', 'delete_selectcommentoperations');
INSERT INTO `auth_permission` VALUES ('76', 'Can view select comment operations', '19', 'view_selectcommentoperations');
INSERT INTO `auth_permission` VALUES ('77', 'Can add course', '20', 'add_course');
INSERT INTO `auth_permission` VALUES ('78', 'Can change course', '20', 'change_course');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete course', '20', 'delete_course');
INSERT INTO `auth_permission` VALUES ('80', 'Can view course', '20', 'view_course');
INSERT INTO `auth_permission` VALUES ('81', 'Can add information', '21', 'add_information');
INSERT INTO `auth_permission` VALUES ('82', 'Can change information', '21', 'change_information');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete information', '21', 'delete_information');
INSERT INTO `auth_permission` VALUES ('84', 'Can view information', '21', 'view_information');
INSERT INTO `auth_permission` VALUES ('85', 'Can add information comment', '22', 'add_informationcomment');
INSERT INTO `auth_permission` VALUES ('86', 'Can change information comment', '22', 'change_informationcomment');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete information comment', '22', 'delete_informationcomment');
INSERT INTO `auth_permission` VALUES ('88', 'Can view information comment', '22', 'view_informationcomment');

-- ----------------------------
-- Table structure for `course_course`
-- ----------------------------
DROP TABLE IF EXISTS `course_course`;
CREATE TABLE `course_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `score` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `interview_time` datetime(6) NOT NULL,
  `room` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_course
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('11', 'authtoken', 'token');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('20', 'course', 'course');
INSERT INTO `django_content_type` VALUES ('21', 'infomations', 'information');
INSERT INTO `django_content_type` VALUES ('22', 'infomations', 'informationcomment');
INSERT INTO `django_content_type` VALUES ('16', 'operations', 'normaloperations');
INSERT INTO `django_content_type` VALUES ('19', 'operations', 'selectcommentoperations');
INSERT INTO `django_content_type` VALUES ('17', 'operations', 'selectoperations');
INSERT INTO `django_content_type` VALUES ('18', 'operations', 'selectteacheroperations');
INSERT INTO `django_content_type` VALUES ('12', 'qa', 'normalanswers');
INSERT INTO `django_content_type` VALUES ('13', 'qa', 'normalquestions');
INSERT INTO `django_content_type` VALUES ('14', 'qa', 'selectanswers');
INSERT INTO `django_content_type` VALUES ('15', 'qa', 'selectquestions');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('10', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('6', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('9', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('7', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('8', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-04-20 20:32:15.645810');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2019-04-20 20:32:15.845698');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2019-04-20 20:32:16.478116');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2019-04-20 20:32:16.595650');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2019-04-20 20:32:16.607553');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2019-04-20 20:32:16.617970');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2019-04-20 20:32:16.635343');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2019-04-20 20:32:16.645265');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2019-04-20 20:32:16.670546');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2019-04-20 20:32:16.699314');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2019-04-20 20:32:16.751394');
INSERT INTO `django_migrations` VALUES ('12', 'users', '0001_initial', '2019-04-20 20:32:17.520194');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0001_initial', '2019-04-20 20:32:17.929395');
INSERT INTO `django_migrations` VALUES ('14', 'admin', '0002_logentry_remove_auto_add', '2019-04-20 20:32:17.944275');
INSERT INTO `django_migrations` VALUES ('15', 'admin', '0003_logentry_add_action_flag_choices', '2019-04-20 20:32:17.963125');
INSERT INTO `django_migrations` VALUES ('16', 'authtoken', '0001_initial', '2019-04-20 20:32:18.169955');
INSERT INTO `django_migrations` VALUES ('17', 'authtoken', '0002_auto_20160226_1747', '2019-04-20 20:32:18.359927');
INSERT INTO `django_migrations` VALUES ('18', 'operations', '0001_initial', '2019-04-20 20:32:18.516659');
INSERT INTO `django_migrations` VALUES ('19', 'qa', '0001_initial', '2019-04-20 20:32:18.815748');
INSERT INTO `django_migrations` VALUES ('20', 'sessions', '0001_initial', '2019-04-20 20:32:18.926852');
INSERT INTO `django_migrations` VALUES ('21', 'users', '0002_userprofile_type', '2019-04-20 20:32:19.051842');
INSERT INTO `django_migrations` VALUES ('22', 'users', '0003_userprofile_score', '2019-04-20 20:32:19.180305');
INSERT INTO `django_migrations` VALUES ('23', 'xadmin', '0001_initial', '2019-04-20 20:32:19.842996');
INSERT INTO `django_migrations` VALUES ('24', 'xadmin', '0002_log', '2019-04-20 20:32:20.152467');
INSERT INTO `django_migrations` VALUES ('25', 'xadmin', '0003_auto_20160715_0100', '2019-04-20 20:32:20.303250');
INSERT INTO `django_migrations` VALUES ('26', 'operations', '0002_selectteacheroperations', '2019-04-28 15:40:14.502553');
INSERT INTO `django_migrations` VALUES ('27', 'qa', '0002_auto_20190423_1553', '2019-04-28 15:40:14.785814');
INSERT INTO `django_migrations` VALUES ('28', 'qa', '0003_selectquestions_level', '2019-04-28 15:40:14.889512');
INSERT INTO `django_migrations` VALUES ('29', 'course', '0001_initial', '2019-05-02 18:03:20.363224');
INSERT INTO `django_migrations` VALUES ('30', 'operations', '0003_selectcommentoperations', '2019-05-02 18:03:20.483901');
INSERT INTO `django_migrations` VALUES ('31', 'qa', '0004_auto_20190430_1625', '2019-05-02 18:03:20.800087');
INSERT INTO `django_migrations` VALUES ('32', 'course', '0002_auto_20190504_1124', '2019-05-05 18:36:45.986496');
INSERT INTO `django_migrations` VALUES ('33', 'course', '0003_auto_20190504_1747', '2019-05-05 18:36:46.179954');
INSERT INTO `django_migrations` VALUES ('34', 'course', '0004_auto_20190504_1924', '2019-05-05 18:36:46.193938');
INSERT INTO `django_migrations` VALUES ('35', 'course', '0005_auto_20190505_1830', '2019-05-05 18:36:46.207903');
INSERT INTO `django_migrations` VALUES ('36', 'course', '0006_auto_20190505_1833', '2019-05-05 18:36:46.226824');
INSERT INTO `django_migrations` VALUES ('37', 'course', '0007_auto_20190505_1833', '2019-05-05 18:36:46.240787');
INSERT INTO `django_migrations` VALUES ('38', 'course', '0008_auto_20190505_1836', '2019-05-05 18:36:46.254750');
INSERT INTO `django_migrations` VALUES ('39', 'infomations', '0001_initial', '2019-05-05 18:36:46.416319');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('bt7b57l0prcriihair7m8wuca4gxg8hx', 'NjdjNDNiZTk1OTY4OTRjY2ZkZWU3ODAyMjUwMzE3Y2Q3MjNhMmJkNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMDNiYzg4MzNkNTlhNTRjYzNmOTk0YWQ2MGUyNThlYWU0MmI4NTIzIiwiTElTVF9RVUVSWSI6W1siYXV0aCIsInBlcm1pc3Npb24iXSwiIl19', '2019-05-05 12:48:36.078189');
INSERT INTO `django_session` VALUES ('pnh79zqvg24ychu6idwq01ab76npfwml', 'NDljZGYwZDVhNzA4YTE1NzFhYmI4MDQyOTI4YjM3MGVmMTIwOWViZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMDNiYzg4MzNkNTlhNTRjYzNmOTk0YWQ2MGUyNThlYWU0MmI4NTIzIiwiTElTVF9RVUVSWSI6W1sib3BlcmF0aW9ucyIsInNlbGVjdG9wZXJhdGlvbnMiXSwiIl19', '2019-05-04 20:34:56.054691');
INSERT INTO `django_session` VALUES ('xc4fwor3qdfglg8101v5o2sayjouj9k1', 'MjM1NmEyNmFhOTEwNzI1ZmFhZTAzYjJlZmNmOGVhODQ3YjE3ZjZjMzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMDNiYzg4MzNkNTlhNTRjYzNmOTk0YWQ2MGUyNThlYWU0MmI4NTIzIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXX0=', '2019-05-18 12:36:34.242247');

-- ----------------------------
-- Table structure for `infomations_information`
-- ----------------------------
DROP TABLE IF EXISTS `infomations_information`;
CREATE TABLE `infomations_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infomations_information
-- ----------------------------

-- ----------------------------
-- Table structure for `infomations_informationcomment`
-- ----------------------------
DROP TABLE IF EXISTS `infomations_informationcomment`;
CREATE TABLE `infomations_informationcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `information_id` int(11) NOT NULL,
  `content` varchar(100) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infomations_informationcomment
-- ----------------------------

-- ----------------------------
-- Table structure for `operations_normaloperations`
-- ----------------------------
DROP TABLE IF EXISTS `operations_normaloperations`;
CREATE TABLE `operations_normaloperations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_normaloperations
-- ----------------------------
INSERT INTO `operations_normaloperations` VALUES ('1', '1', '1', '11', '10');
INSERT INTO `operations_normaloperations` VALUES ('2', '2', '2', '2', '20');

-- ----------------------------
-- Table structure for `operations_selectcommentoperations`
-- ----------------------------
DROP TABLE IF EXISTS `operations_selectcommentoperations`;
CREATE TABLE `operations_selectcommentoperations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_selectcommentoperations
-- ----------------------------

-- ----------------------------
-- Table structure for `operations_selectoperations`
-- ----------------------------
DROP TABLE IF EXISTS `operations_selectoperations`;
CREATE TABLE `operations_selectoperations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_selectoperations
-- ----------------------------
INSERT INTO `operations_selectoperations` VALUES ('1', '1', '1', '1', '10', '0');
INSERT INTO `operations_selectoperations` VALUES ('2', '2', '2', '2', '0', '0');

-- ----------------------------
-- Table structure for `operations_selectteacheroperations`
-- ----------------------------
DROP TABLE IF EXISTS `operations_selectteacheroperations`;
CREATE TABLE `operations_selectteacheroperations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selector_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `room` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `interview_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operations_selectteacheroperations
-- ----------------------------

-- ----------------------------
-- Table structure for `qa_normalanswers`
-- ----------------------------
DROP TABLE IF EXISTS `qa_normalanswers`;
CREATE TABLE `qa_normalanswers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qa_normalanswers
-- ----------------------------
INSERT INTO `qa_normalanswers` VALUES ('1', '1', '1', '111', '2019-05-03 17:04:20.181379', '2019-05-03 17:04:20.181379');

-- ----------------------------
-- Table structure for `qa_normalquestions`
-- ----------------------------
DROP TABLE IF EXISTS `qa_normalquestions`;
CREATE TABLE `qa_normalquestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `type` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qa_normalquestions
-- ----------------------------
INSERT INTO `qa_normalquestions` VALUES ('1', '1', '11', '111', '0', '2019-05-03 17:04:33.663065', '2019-05-03 17:04:33.664089', '10');

-- ----------------------------
-- Table structure for `qa_selectanswers`
-- ----------------------------
DROP TABLE IF EXISTS `qa_selectanswers`;
CREATE TABLE `qa_selectanswers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `select_code` varchar(100) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qa_selectanswers
-- ----------------------------
INSERT INTO `qa_selectanswers` VALUES ('1', '1', '111111111111111111', '1', '2019-05-03 16:27:51.082180', '2019-05-03 16:27:51.082180');
INSERT INTO `qa_selectanswers` VALUES ('2', '2', '第二题', '2', '2019-05-03 17:09:46.943836', '2019-05-03 17:09:46.943836');

-- ----------------------------
-- Table structure for `qa_selectquestions`
-- ----------------------------
DROP TABLE IF EXISTS `qa_selectquestions`;
CREATE TABLE `qa_selectquestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `type` int(11) NOT NULL,
  `correct_code` varchar(100) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `analyzations` longtext NOT NULL,
  `level` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qa_selectquestions
-- ----------------------------
INSERT INTO `qa_selectquestions` VALUES ('1', 'test', '11111111111', '0', '11111111111', '2019-05-03 16:25:30.722082', '2019-05-03 16:25:30.722082', '1111111111111111', '0', '10');
INSERT INTO `qa_selectquestions` VALUES ('2', '第二题', '第二题的标题', '0', '2', '2019-05-03 17:12:48.244502', '2019-05-03 17:12:48.244502', '这部分是解析', '0', '10');

-- ----------------------------
-- Table structure for `users_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$120000$sBC1Teax2zom$QMoHPTkMFaTN5R5xES2GMYpnRTz76OtJlGbJgBfXYC4=', '2019-04-25 09:15:04.515512', '1', 'gumeixing', '', '', '1', '1', '2019-04-20 20:34:11.859106', null, null, 'female', '', '943383098@qq.com', '0', '0');
INSERT INTO `users_userprofile` VALUES ('2', 'pbkdf2_sha256$120000$GhKsQqajPwmk$jcy9mP5gUHGPj54VjkmKYJYAwddLh4tGUcTaI2JmAXQ=', null, '0', 'ddd', '', '', '0', '1', '2019-05-03 09:41:33.879751', null, null, 'female', '', null, '0', '0');
INSERT INTO `users_userprofile` VALUES ('3', 'pbkdf2_sha256$120000$oTHJ9wf9pORh$SqkfurK5EDRoXph4unZ0Me2Kidd8qCOfEJx+lY40Jv4=', null, '0', '\"test\"', '', '', '0', '1', '2019-05-03 10:03:37.502382', null, null, 'female', '', null, '0', '0');
INSERT INTO `users_userprofile` VALUES ('4', 'pbkdf2_sha256$120000$Eb3cTac9wPDi$8YwuuLpMWaU6bth20jy+3Th7GZjhWWHU5HF8O3m4JWE=', null, '0', '\"test1\"', '', '', '0', '1', '2019-05-03 10:05:32.288584', null, null, 'female', '', null, '0', '0');
INSERT INTO `users_userprofile` VALUES ('5', 'pbkdf2_sha256$120000$DtLyqt6tYVOB$7HxXidMBlntdZM/jQgMJP3lin4uj42tjzuPj/qnCGE4=', null, '0', '\"test2\"', '', '', '0', '1', '2019-05-03 10:08:18.723665', null, null, 'female', '', null, '0', '0');
INSERT INTO `users_userprofile` VALUES ('6', 'pbkdf2_sha256$120000$Nt1gAbhq77X0$G/0Kp0xK3jp1Rpy+YFoPSDobZRXvOKwDwmSS/ZksIMI=', null, '0', '\"test3\"', '', '', '0', '1', '2019-05-03 10:10:08.375530', null, null, 'female', '', null, '0', '0');
INSERT INTO `users_userprofile` VALUES ('7', 'pbkdf2_sha256$120000$DT4SotMqNQpI$toiZBF144abDaBW8AX/EaP4L1YNDA+tnuv6BvDSED84=', null, '0', '\"test4\"', '', '', '0', '1', '2019-05-03 10:10:33.757704', null, null, 'female', '', null, '0', '0');
INSERT INTO `users_userprofile` VALUES ('8', 'pbkdf2_sha256$120000$xvZSXLSDZP9t$8UCcixcKIH7UIuNeawau9sah9kOzcGlsWkM8OHYzYm8=', null, '0', '\"test5\"', '', '', '0', '1', '2019-05-03 10:14:15.350882', null, null, 'female', '', null, '0', '0');
INSERT INTO `users_userprofile` VALUES ('9', 'pbkdf2_sha256$120000$r4XPRxkIOqmB$Yzdxn0q/zHLzb+/Ya5W06EoIH3/P5M2PWuRuZIJVRz4=', null, '0', '\"test7\"', '', '', '0', '1', '2019-05-03 10:34:03.422685', null, null, 'female', '', null, '0', '0');
INSERT INTO `users_userprofile` VALUES ('10', 'pbkdf2_sha256$120000$b9Ji1dUldq1y$htislBKx74VNTH0TnFg9l6/sul5BocQsV1QD25oy3FI=', null, '0', 'test', '', '', '0', '1', '2019-05-03 10:41:12.852121', null, null, 'female', '', null, '0', '0');
INSERT INTO `users_userprofile` VALUES ('11', 'pbkdf2_sha256$120000$seQnxwu82JPb$OAEnJ5Uo8ohyoXskkhmMDjbohEBnIXTYqdWoWOO1XVY=', null, '0', 'test1', '', '', '0', '1', '2019-05-03 11:21:33.270339', null, null, 'female', '', null, '0', '0');
INSERT INTO `users_userprofile` VALUES ('12', 'pbkdf2_sha256$120000$n6B6FQqFA9uw$oc/JQAplO4FGllDIDbbWbohJ/sET1a2P8Zo45C/wsuo=', null, '0', '\"123\"', '', '', '0', '1', '2019-05-03 11:25:28.618345', null, null, 'female', '', null, '0', '0');
INSERT INTO `users_userprofile` VALUES ('13', 'pbkdf2_sha256$120000$9qQUU5l0nDgR$S7h33GOpdiTsY8AMKwSOvEUCCLU/NZ56VHXPzXT91lE=', null, '0', '1234', '', '', '0', '1', '2019-05-03 11:26:00.000000', null, null, 'female', '176822212', '', '0', '0');
INSERT INTO `users_userprofile` VALUES ('14', 'pbkdf2_sha256$120000$BmOU5yQLV3Ck$coTOcocPC5QHoYJ+UBw+8Oppzf7GZGZhJzPQsNup0dk=', null, '0', '\"gmx\"', '', '', '0', '1', '2019-05-03 11:30:38.315652', null, null, 'female', '', null, '0', '0');
INSERT INTO `users_userprofile` VALUES ('15', 'pbkdf2_sha256$120000$ouJkCZBV1ami$aZd3DTulsuRdTZCUZBFIoMWAUVZ/dTMe38nX82N70nA=', null, '0', 'gmx1', '', '', '0', '1', '2019-05-03 11:32:12.333494', null, null, 'female', '', null, '0', '0');
INSERT INTO `users_userprofile` VALUES ('16', 'pbkdf2_sha256$120000$MwseYA5zktKK$4YE/lMHuNOgE973Bp1gak7Ax0y3h6KBL8GMSm3cUwyo=', null, '0', 'test2', '', '', '0', '1', '2019-05-05 20:41:37.246542', null, null, 'female', '', null, '0', '0');
INSERT INTO `users_userprofile` VALUES ('17', 'pbkdf2_sha256$120000$5k1avUmcGtMm$iw1XHexeG7e9/rLvOz/fCZGomsrA1BLbxdH1dnj33MU=', null, '0', 'gmx2', '', '', '0', '1', '2019-05-05 20:45:26.324711', null, null, 'female', '', null, '0', '0');

-- ----------------------------
-- Table structure for `users_userprofile_groups`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `users_userprofile_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `xadmin_bookmark`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for `xadmin_log`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2019-05-03 11:28:46.032113', '127.0.0.1', '13', '1234', 'change', '修改 username 和 mobile', '10', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2019-05-03 16:25:30.788895', '127.0.0.1', '1', 'SelectQuestions object (1)', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2019-05-03 16:27:51.084172', '127.0.0.1', '1', 'SelectAnswers object (1)', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2019-05-03 16:56:50.556502', '127.0.0.1', '1', 'SelectOperations object (1)', 'create', '已添加。', '17', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2019-05-03 17:04:08.550970', '127.0.0.1', '1', 'NormalOperations object (1)', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2019-05-03 17:04:20.187363', '127.0.0.1', '1', 'NormalAnswers object (1)', 'create', '已添加。', '12', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2019-05-03 17:04:33.667051', '127.0.0.1', '1', 'NormalQuestions object (1)', 'create', '已添加。', '13', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2019-05-03 17:09:46.945808', '127.0.0.1', '2', 'SelectAnswers object (2)', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2019-05-03 17:10:22.317544', '127.0.0.1', '2', 'SelectOperations object (2)', 'create', '已添加。', '17', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2019-05-03 17:11:33.148387', '127.0.0.1', '2', 'NormalOperations object (2)', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2019-05-03 17:12:48.244502', '127.0.0.1', '2', 'SelectQuestions object (2)', 'create', '已添加。', '15', '1');

-- ----------------------------
-- Table structure for `xadmin_usersettings`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');

-- ----------------------------
-- Table structure for `xadmin_userwidget`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
