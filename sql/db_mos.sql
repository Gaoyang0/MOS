/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : db_mos

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-07-07 03:05:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
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
-- Table structure for auth_group_permissions
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
-- Table structure for auth_permission
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add user', '2', 'add_user');
INSERT INTO `auth_permission` VALUES ('5', 'Can change user', '2', 'change_user');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete user', '2', 'delete_user');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add permission', '4', 'add_permission');
INSERT INTO `auth_permission` VALUES ('11', 'Can change permission', '4', 'change_permission');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete permission', '4', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add device', '7', 'add_device');
INSERT INTO `auth_permission` VALUES ('20', 'Can change device', '7', 'change_device');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete device', '7', 'delete_device');
INSERT INTO `auth_permission` VALUES ('22', 'Can add occupy seat', '8', 'add_occupyseat');
INSERT INTO `auth_permission` VALUES ('23', 'Can change occupy seat', '8', 'change_occupyseat');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete occupy seat', '8', 'delete_occupyseat');
INSERT INTO `auth_permission` VALUES ('25', 'Can add user', '9', 'add_user');
INSERT INTO `auth_permission` VALUES ('26', 'Can change user', '9', 'change_user');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete user', '9', 'delete_user');
INSERT INTO `auth_permission` VALUES ('28', 'Can add reservation device', '10', 'add_reservationdevice');
INSERT INTO `auth_permission` VALUES ('29', 'Can change reservation device', '10', 'change_reservationdevice');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete reservation device', '10', 'delete_reservationdevice');
INSERT INTO `auth_permission` VALUES ('31', 'Can add pwd and permission', '11', 'add_pwdandpermission');
INSERT INTO `auth_permission` VALUES ('32', 'Can change pwd and permission', '11', 'change_pwdandpermission');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete pwd and permission', '11', 'delete_pwdandpermission');
INSERT INTO `auth_permission` VALUES ('34', 'Can add seat', '12', 'add_seat');
INSERT INTO `auth_permission` VALUES ('35', 'Can change seat', '12', 'change_seat');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete seat', '12', 'delete_seat');
INSERT INTO `auth_permission` VALUES ('37', 'Can add current occupy', '13', 'add_currentoccupy');
INSERT INTO `auth_permission` VALUES ('38', 'Can change current occupy', '13', 'change_currentoccupy');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete current occupy', '13', 'delete_currentoccupy');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for currentoccupy
-- ----------------------------
DROP TABLE IF EXISTS `currentoccupy`;
CREATE TABLE `currentoccupy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` varchar(7) NOT NULL,
  `u_id` varchar(7) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currentoccupy_s_id_c52163fb_fk_seat_sno` (`s_id`),
  KEY `currentoccupy_u_id_f6f4785a_fk_user__uno` (`u_id`),
  CONSTRAINT `currentoccupy_s_id_c52163fb_fk_seat_sno` FOREIGN KEY (`s_id`) REFERENCES `seat` (`sno`),
  CONSTRAINT `currentoccupy_u_id_f6f4785a_fk_user__uno` FOREIGN KEY (`u_id`) REFERENCES `user_` (`uno`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of currentoccupy
-- ----------------------------
INSERT INTO `currentoccupy` VALUES ('11', '3000009', '4000002', '2018-07-06 18:22:21.000000');
INSERT INTO `currentoccupy` VALUES ('12', '3000010', '4000003', '2018-07-06 18:22:42.000000');
INSERT INTO `currentoccupy` VALUES ('13', '3000049', '4000023', '2018-07-06 18:23:07.000000');

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `dno` varchar(7) NOT NULL,
  `dname` varchar(32) NOT NULL,
  `dposition` varchar(32) NOT NULL,
  `dstate` varchar(10) NOT NULL,
  `dtype` varchar(10) NOT NULL,
  PRIMARY KEY (`dno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('1000001', '会议室001', '@1#8#1#2#4', '空闲', '会议室');
INSERT INTO `device` VALUES ('1000002', '会议室002', '@1#10#1#2#4', '空闲', '会议室');
INSERT INTO `device` VALUES ('1000003', '会议室003', '@1#12#1#2#4', '空闲', '会议室');
INSERT INTO `device` VALUES ('1000004', '会议室004', '@1#14#1#2#4', '空闲', '会议室');
INSERT INTO `device` VALUES ('1000005', '打印机001', '@1#5#8#1#1', '空闲', '打印机');
INSERT INTO `device` VALUES ('1000006', '打印机002', '@1#6#8#1#1', '空闲', '打印机');
INSERT INTO `device` VALUES ('1000007', '打印机003', '@1#5#9#1#1', '空闲', '打印机');
INSERT INTO `device` VALUES ('1000008', '打印机004', '@1#6#9#1#1', '空闲', '打印机');
INSERT INTO `device` VALUES ('1000009', '打印机005', '@1#9#7#1#1', '空闲', '打印机');
INSERT INTO `device` VALUES ('1000010', '打印机006', '@1#10#7#1#1', '空闲', '打印机');
INSERT INTO `device` VALUES ('1000011', '打印机007', '@1#11#7#1#1', '空闲', '打印机');
INSERT INTO `device` VALUES ('1000012', '打印机008', '@1#12#7#1#1', '空闲', '打印机');
INSERT INTO `device` VALUES ('1000013', '打印机009', '@1#9#8#1#1', '空闲', '打印机');
INSERT INTO `device` VALUES ('1000014', '打印机010', '@1#10#8#1#1', '空闲', '打印机');
INSERT INTO `device` VALUES ('1000015', '打印机011', '@1#11#8#1#1', '空闲', '打印机');
INSERT INTO `device` VALUES ('1000016', '打印机012', '@1#12#8#1#1', '空闲', '打印机');
INSERT INTO `device` VALUES ('1000017', '打印机013', '@1#15#8#1#1', '空闲', '打印机');
INSERT INTO `device` VALUES ('1000018', '打印机014', '@1#16#8#1#1', '空闲', '打印机');
INSERT INTO `device` VALUES ('1000019', '打印机015', '@1#15#9#1#1', '空闲', '打印机');
INSERT INTO `device` VALUES ('1000020', '打印机016', '@1#16#9#1#1', '损坏', '打印机');

-- ----------------------------
-- Table structure for django_admin_log
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
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('13', 'app', 'currentoccupy');
INSERT INTO `django_content_type` VALUES ('7', 'app', 'device');
INSERT INTO `django_content_type` VALUES ('8', 'app', 'occupyseat');
INSERT INTO `django_content_type` VALUES ('11', 'app', 'pwdandpermission');
INSERT INTO `django_content_type` VALUES ('10', 'app', 'reservationdevice');
INSERT INTO `django_content_type` VALUES ('12', 'app', 'seat');
INSERT INTO `django_content_type` VALUES ('9', 'app', 'user');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-06-26 05:24:47.786304');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-06-26 05:24:48.868871');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-06-26 05:24:49.106761');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-06-26 05:24:49.142545');
INSERT INTO `django_migrations` VALUES ('5', 'app', '0001_initial', '2018-06-26 05:24:50.485441');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2018-06-26 05:24:50.647506');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2018-06-26 05:24:50.755249');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2018-06-26 05:24:50.865176');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2018-06-26 05:24:50.884687');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2018-06-26 05:24:50.972749');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2018-06-26 05:24:50.978254');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2018-06-26 05:24:50.992764');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2018-06-26 05:24:51.097432');
INSERT INTO `django_migrations` VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2018-06-26 05:24:51.184095');
INSERT INTO `django_migrations` VALUES ('15', 'sessions', '0001_initial', '2018-06-26 05:24:51.262321');
INSERT INTO `django_migrations` VALUES ('16', 'app', '0002_auto_20180626_1758', '2018-06-26 09:58:24.254426');
INSERT INTO `django_migrations` VALUES ('17', 'app', '0003_device_dtype', '2018-06-26 11:07:03.441191');
INSERT INTO `django_migrations` VALUES ('18', 'app', '0004_auto_20180629_2321', '2018-06-29 15:21:14.190316');
INSERT INTO `django_migrations` VALUES ('19', 'app', '0005_auto_20180702_0906', '2018-07-02 01:06:46.611211');
INSERT INTO `django_migrations` VALUES ('20', 'app', '0006_seat_stype', '2018-07-02 02:32:01.427566');
INSERT INTO `django_migrations` VALUES ('21', 'app', '0007_user_ustate', '2018-07-02 03:34:31.066942');
INSERT INTO `django_migrations` VALUES ('22', 'app', '0008_auto_20180702_1505', '2018-07-02 07:07:26.083703');
INSERT INTO `django_migrations` VALUES ('23', 'app', '0009_currentoccupy', '2018-07-03 15:57:42.851254');
INSERT INTO `django_migrations` VALUES ('24', 'app', '0010_currentoccupy_start_time', '2018-07-03 16:12:42.187852');

-- ----------------------------
-- Table structure for django_session
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
INSERT INTO `django_session` VALUES ('0awsn3nwfxaimyjc2qvlvdqd6ncw3t54', 'YjVjMWNlZGIzZmZhMWE1NTY0YWQ1YzJlYWFkZThmNGJiMDM4MjQ4Yzp7InBlcm1pc3Npb24iOiI3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-06-30 15:29:23.543541');
INSERT INTO `django_session` VALUES ('1jllwva6jr8fnp7rnn3k2nzllwcgq88s', 'OTg4OWNhYzNlNmM0MWI3ZDc0MTE0YjQ5MTcxYmVlMjc1NmM0ODc1NDp7InBlcm1pc3Npb24iOiI3IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJ1bm8iOiI0MDAwMDAxIn0=', '2018-07-03 03:13:28.827965');
INSERT INTO `django_session` VALUES ('1ld0eph1iztqqvl1s8bysbcdvjwvvvt2', 'NTk0MTIwODk2NTQ0MjYyZDM2YzQ0N2U1Zjc2NWYwMWQ1Y2NlMjBhMTp7InBlcm1pc3Npb24iOiI3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsImlzX2xvZ2luIjp0cnVlLCJ1bm8iOiI0MDAwMDAxIn0=', '2018-07-06 18:47:12.677641');
INSERT INTO `django_session` VALUES ('1qz50g4lrwbm2gc7th4ifwul5ssd1ult', 'YjVjMWNlZGIzZmZhMWE1NTY0YWQ1YzJlYWFkZThmNGJiMDM4MjQ4Yzp7InBlcm1pc3Npb24iOiI3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-01 08:15:11.361929');
INSERT INTO `django_session` VALUES ('260wnnr4jv3fms95m9d4itajt7sqnqmf', 'OTg3NmQwNTZiNWViODBkYTBlNTFlZmQ4NWE0N2JlMWU5NWI5ODVhYTp7InVubyI6IjQwMDAwMDEiLCJwZXJtaXNzaW9uIjoiNyIsImlzX2xvZ2luIjp0cnVlLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2018-07-01 07:45:34.309947');
INSERT INTO `django_session` VALUES ('2am91uokx1de7ivbiektlh9jzbjuc2dx', 'MzJiN2M1NjA1MWNlMWViNjgyMzI4MmQyNjcwY2FhN2RhNDkzYmQ5Yjp7InBlcm1pc3Npb24iOiI3IiwidW5vIjoiNDAwMDAwMSIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-03 17:18:25.054374');
INSERT INTO `django_session` VALUES ('2pw05cckp1swt7v1lydnr2c6inaqph6i', 'ZjRmODJlYTgyODQxMzQwM2JhZTg3MTQ2MjdlNGY5NDUxNDVkZTJjZjp7InVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInBlcm1pc3Npb24iOiI3In0=', '2018-07-03 17:41:19.884676');
INSERT INTO `django_session` VALUES ('2veaww0d1jsqe672l1dsnxm5avm5omtc', 'MjFmNDNmNzkxMzgxOGZjNjU0OGZkYWRlNzBlYjVjOWU1NDkyNWE1ZDp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJ1bm8iOiI0MDAwMDAxIiwicGVybWlzc2lvbiI6IjciLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-06-30 16:18:19.485876');
INSERT INTO `django_session` VALUES ('2vf8ifjaiebd04ryyhvnl1c2ze341i05', 'ZTU5MDM5NzFmNTZkZmE2OWNmZmNhMDI0MzI3NjRiNGM3YjcyMjUwMjp7InVubyI6IjQwMDAwMDEiLCJwZXJtaXNzaW9uIjoiNyIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-03 02:47:12.445588');
INSERT INTO `django_session` VALUES ('377rm4c7d1xh2z730na6o9qs8u83gm94', 'NmU2NzBjYjQyNWNkNzA1MTg3NDQ5M2EyNzRjMWZlYTgzMGM4MmJlMjp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJwZXJtaXNzaW9uIjoiMTI1IiwidW5vIjoiNDAwMDAwMSIsImlzX2xvZ2luIjp0cnVlfQ==', '2018-06-30 14:47:45.494460');
INSERT INTO `django_session` VALUES ('3koy5u7h2i8jbirprzqhg9yzak6d29j8', 'YmIxYzgwZmMyMTNmYWQ0N2IzYmZjOTAwNzIxZjU5NWVhNDQzMGIxMTp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJwZXJtaXNzaW9uIjoiMTIzIiwidW5vIjoiNDAwMDAwMSIsImlzX2xvZ2luIjp0cnVlfQ==', '2018-06-30 14:58:20.258277');
INSERT INTO `django_session` VALUES ('3l0we4qgk1efu6nfszt94nkdfyl6s8t2', 'ZTFjNDYxNGQwMGY0NjQ5OTU1YjM3NDNhZjc5ZDc5OTBiNTM4NGI4ZDp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZSwicGVybWlzc2lvbiI6IjciLCJ1bm8iOiI0MDAwMDAxIn0=', '2018-07-06 20:38:05.625395');
INSERT INTO `django_session` VALUES ('3qxamc40dbd4z7tn1zdvnwxk5mht40od', 'MjFmNDNmNzkxMzgxOGZjNjU0OGZkYWRlNzBlYjVjOWU1NDkyNWE1ZDp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJ1bm8iOiI0MDAwMDAxIiwicGVybWlzc2lvbiI6IjciLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-06-30 16:07:29.200595');
INSERT INTO `django_session` VALUES ('40n0glgtsa0id4hzhvnwb9s94okf4r40', 'MTBiZmI2ZDUxZDkzNDhmY2JkZTAyZWE0MjUwNjNhNTA2NDJmYTViZjp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZSwidW5vIjoiNDAwMDAwMSIsInBlcm1pc3Npb24iOiI3In0=', '2018-07-01 03:09:51.624865');
INSERT INTO `django_session` VALUES ('4sikvwamdrvwey9obon8u40v8qurnmwt', 'MjZmMTBlNTQ1NmEwYWY2MjEyYWY5NjViOTkzNTgyNGM2OGFhNTgwNDp7ImlzX2xvZ2luIjp0cnVlLCJwZXJtaXNzaW9uIjoiNyIsInVubyI6IjQwMDAwMDEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2018-07-03 16:11:45.160652');
INSERT INTO `django_session` VALUES ('50157rpk267x71e1tkwv8de549ias9ta', 'YjVjMWNlZGIzZmZhMWE1NTY0YWQ1YzJlYWFkZThmNGJiMDM4MjQ4Yzp7InBlcm1pc3Npb24iOiI3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-01 08:26:14.415569');
INSERT INTO `django_session` VALUES ('5updze6z319531lk8dm5libqw956ziil', 'YzQ0ZWQxZGE1Y2YwYWY1Y2NlNDYwMzgyNzlhMWU0MTJhMjRiMTdlZDp7InBlcm1pc3Npb24iOiI3IiwiaXNfbG9naW4iOnRydWUsInVubyI6IjQwMDAwMDEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2018-07-02 08:03:38.770289');
INSERT INTO `django_session` VALUES ('676tkctnyphpnwul5xjdohnwial8t63r', 'ZTU5MDM5NzFmNTZkZmE2OWNmZmNhMDI0MzI3NjRiNGM3YjcyMjUwMjp7InVubyI6IjQwMDAwMDEiLCJwZXJtaXNzaW9uIjoiNyIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-02 01:18:17.914790');
INSERT INTO `django_session` VALUES ('6mxsvlx7eupy8shw86etc547xk3vxww5', 'Yzk4OTBmMGQ1YjcyYzA3NWQwZWFkM2I4NzE1NDFiZDk4ODY3MGRkZjp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJwZXJtaXNzaW9uIjoiNyIsImlzX2xvZ2luIjp0cnVlLCJ1bm8iOiI0MDAwMDAxIn0=', '2018-07-03 15:44:19.448940');
INSERT INTO `django_session` VALUES ('7c1ooqgf4dgl984jllre78h5b06vbxvb', 'NjViNDk0ODdlZTk3MWRlZDRhMWUzZjFiZjhlNmUyOWNhNGQyZTk0ZDp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJwZXJtaXNzaW9uIjoiMSIsInVubyI6IjQwMDAwMjMiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-06 18:33:02.336537');
INSERT INTO `django_session` VALUES ('7mfzitvc3b8yixv2f8mr25sxb2t1nv66', 'YjVjMWNlZGIzZmZhMWE1NTY0YWQ1YzJlYWFkZThmNGJiMDM4MjQ4Yzp7InBlcm1pc3Npb24iOiI3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-02 07:53:22.678376');
INSERT INTO `django_session` VALUES ('9btp9621za2zaq5i7joihhs55yfk491w', 'MWY2NmI3M2Y2ZWRjOWQwZTFjYjgyYzRiNzY3MTIwODI2YzQ0NmNjYzp7InBlcm1pc3Npb24iOiI3IiwidW5vIjoiNDAwMDAwMSIsImlzX2xvZ2luIjp0cnVlLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2018-07-02 14:18:14.234672');
INSERT INTO `django_session` VALUES ('9dwmmqo8ho29xbmjp0u2jwiarvbzaqyp', 'ZTFjNDYxNGQwMGY0NjQ5OTU1YjM3NDNhZjc5ZDc5OTBiNTM4NGI4ZDp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZSwicGVybWlzc2lvbiI6IjciLCJ1bm8iOiI0MDAwMDAxIn0=', '2018-07-03 01:11:14.681452');
INSERT INTO `django_session` VALUES ('alpwuqkn0sfdujsclx6nk8y7clbmarej', 'ZjRmODJlYTgyODQxMzQwM2JhZTg3MTQ2MjdlNGY5NDUxNDVkZTJjZjp7InVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInBlcm1pc3Npb24iOiI3In0=', '2018-07-03 00:56:40.597184');
INSERT INTO `django_session` VALUES ('anuz54wdlfd0lctpw23k1h2wtjougyq7', 'OTg3NmQwNTZiNWViODBkYTBlNTFlZmQ4NWE0N2JlMWU5NWI5ODVhYTp7InVubyI6IjQwMDAwMDEiLCJwZXJtaXNzaW9uIjoiNyIsImlzX2xvZ2luIjp0cnVlLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2018-07-01 07:56:00.737064');
INSERT INTO `django_session` VALUES ('b89sl2obbhrx7gqnh4nraw2ehogytg6m', 'MjFmNDNmNzkxMzgxOGZjNjU0OGZkYWRlNzBlYjVjOWU1NDkyNWE1ZDp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJ1bm8iOiI0MDAwMDAxIiwicGVybWlzc2lvbiI6IjciLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-02 02:47:59.306407');
INSERT INTO `django_session` VALUES ('bjglm21g02b7m1q0bqovwfnbv2skfmj6', 'ZTU5MDM5NzFmNTZkZmE2OWNmZmNhMDI0MzI3NjRiNGM3YjcyMjUwMjp7InVubyI6IjQwMDAwMDEiLCJwZXJtaXNzaW9uIjoiNyIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-02 02:10:02.875370');
INSERT INTO `django_session` VALUES ('cref4c1ufco6f08wotk5pc5idzrdee1w', 'NTk0MTIwODk2NTQ0MjYyZDM2YzQ0N2U1Zjc2NWYwMWQ1Y2NlMjBhMTp7InBlcm1pc3Npb24iOiI3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsImlzX2xvZ2luIjp0cnVlLCJ1bm8iOiI0MDAwMDAxIn0=', '2018-07-06 19:00:31.363281');
INSERT INTO `django_session` VALUES ('cx4ln8wqx3avwhsjh0lf994nfpjkwv0p', 'ZTU5MDM5NzFmNTZkZmE2OWNmZmNhMDI0MzI3NjRiNGM3YjcyMjUwMjp7InVubyI6IjQwMDAwMDEiLCJwZXJtaXNzaW9uIjoiNyIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-02 02:37:42.431561');
INSERT INTO `django_session` VALUES ('d1g8ukbm6gn6e54lzi5mnu4q5m98wvf0', 'ZjRmODJlYTgyODQxMzQwM2JhZTg3MTQ2MjdlNGY5NDUxNDVkZTJjZjp7InVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInBlcm1pc3Npb24iOiI3In0=', '2018-07-02 09:14:06.622012');
INSERT INTO `django_session` VALUES ('dax95fpx75uf8xzr82g2sisczmr7bqn7', 'ZTU5MDM5NzFmNTZkZmE2OWNmZmNhMDI0MzI3NjRiNGM3YjcyMjUwMjp7InVubyI6IjQwMDAwMDEiLCJwZXJtaXNzaW9uIjoiNyIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-03 11:39:39.355638');
INSERT INTO `django_session` VALUES ('e2tmlq80fg3zculc7p3ci1253c1k8bce', 'MjFmNDNmNzkxMzgxOGZjNjU0OGZkYWRlNzBlYjVjOWU1NDkyNWE1ZDp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJ1bm8iOiI0MDAwMDAxIiwicGVybWlzc2lvbiI6IjciLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-01 09:36:28.550995');
INSERT INTO `django_session` VALUES ('eg7tyixdi447ar4zfdasnlktx815ulx7', 'Y2UyNmFiNDI3NjdiMjJkOTNkNjFmOWVlZmIwZDNhMDQ2YjIxNDNmOTp7InVubyI6IjQwMDAwMDEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwiaXNfbG9naW4iOnRydWUsInBlcm1pc3Npb24iOiI3In0=', '2018-07-06 20:07:00.856884');
INSERT INTO `django_session` VALUES ('ehmnr1hgifx6ey91m334uzrafm5pgx1s', 'OTg4OWNhYzNlNmM0MWI3ZDc0MTE0YjQ5MTcxYmVlMjc1NmM0ODc1NDp7InBlcm1pc3Npb24iOiI3IiwiaXNfbG9naW4iOnRydWUsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJ1bm8iOiI0MDAwMDAxIn0=', '2018-07-03 22:42:14.547756');
INSERT INTO `django_session` VALUES ('f6ucf57q8c5a0dcc33304qxpdnct2hyp', 'ZjRmODJlYTgyODQxMzQwM2JhZTg3MTQ2MjdlNGY5NDUxNDVkZTJjZjp7InVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInBlcm1pc3Npb24iOiI3In0=', '2018-07-03 02:33:29.269090');
INSERT INTO `django_session` VALUES ('fqmh6w9b94lg5f5ofcc7fkgr13iebciw', 'MzJiN2M1NjA1MWNlMWViNjgyMzI4MmQyNjcwY2FhN2RhNDkzYmQ5Yjp7InBlcm1pc3Npb24iOiI3IiwidW5vIjoiNDAwMDAwMSIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-03 17:04:24.737506');
INSERT INTO `django_session` VALUES ('ftcjv0rm9yqnelfiv6fdaqs9tr772v96', 'ZTU5MDM5NzFmNTZkZmE2OWNmZmNhMDI0MzI3NjRiNGM3YjcyMjUwMjp7InVubyI6IjQwMDAwMDEiLCJwZXJtaXNzaW9uIjoiNyIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-02 02:26:01.033832');
INSERT INTO `django_session` VALUES ('g6nlk42kyvtcbnr1jop7maj6h1lij72h', 'OTBiZmMzNmU4ZmFlNTNkNjc1NjNhNDBjODM3ZjI2N2ExZDY3YmFmNTp7ImlzX2xvZ2luIjp0cnVlLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwicGVybWlzc2lvbiI6IjciLCJ1bm8iOiI0MDAwMDAxIn0=', '2018-07-06 02:32:55.005679');
INSERT INTO `django_session` VALUES ('h6l3e4lhigyhc00wzujsxcf1dy3tv87z', 'YjVjMWNlZGIzZmZhMWE1NTY0YWQ1YzJlYWFkZThmNGJiMDM4MjQ4Yzp7InBlcm1pc3Npb24iOiI3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-01 08:47:19.317419');
INSERT INTO `django_session` VALUES ('hds5n0pzhvfqh0nj2qy6hxlee5tm31kx', 'YjVjMWNlZGIzZmZhMWE1NTY0YWQ1YzJlYWFkZThmNGJiMDM4MjQ4Yzp7InBlcm1pc3Npb24iOiI3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-02 14:35:30.528907');
INSERT INTO `django_session` VALUES ('k8kri1clrwasta43whmzkxsix2jnt61l', 'ZjRmODJlYTgyODQxMzQwM2JhZTg3MTQ2MjdlNGY5NDUxNDVkZTJjZjp7InVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInBlcm1pc3Npb24iOiI3In0=', '2018-07-03 00:46:24.902487');
INSERT INTO `django_session` VALUES ('kquan3mfl8rb87rg0ultcdznaqw54kp7', 'MjFmNDNmNzkxMzgxOGZjNjU0OGZkYWRlNzBlYjVjOWU1NDkyNWE1ZDp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJ1bm8iOiI0MDAwMDAxIiwicGVybWlzc2lvbiI6IjciLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-01 09:51:37.014918');
INSERT INTO `django_session` VALUES ('ky7187gcd83c8al82qch8kt4zwuumtpj', 'NTk0MTIwODk2NTQ0MjYyZDM2YzQ0N2U1Zjc2NWYwMWQ1Y2NlMjBhMTp7InBlcm1pc3Npb24iOiI3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsImlzX2xvZ2luIjp0cnVlLCJ1bm8iOiI0MDAwMDAxIn0=', '2018-07-02 13:21:28.210646');
INSERT INTO `django_session` VALUES ('l59s1kcqpaudhdu0as4xvyol0pl742u3', 'MjZmMTBlNTQ1NmEwYWY2MjEyYWY5NjViOTkzNTgyNGM2OGFhNTgwNDp7ImlzX2xvZ2luIjp0cnVlLCJwZXJtaXNzaW9uIjoiNyIsInVubyI6IjQwMDAwMDEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2018-07-02 13:37:00.003241');
INSERT INTO `django_session` VALUES ('mgrjuebuddfb8wh34r4gibtl2ds8iyst', 'MjFmNDNmNzkxMzgxOGZjNjU0OGZkYWRlNzBlYjVjOWU1NDkyNWE1ZDp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJ1bm8iOiI0MDAwMDAxIiwicGVybWlzc2lvbiI6IjciLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-06-30 15:57:02.921075');
INSERT INTO `django_session` VALUES ('my4blsi5eqdwac81opto4rfzecbfb72x', 'YTI1NDJlN2RkOWQ1MzdjMDY4Nzc0YjJiMjMxNDcyZjU5ZWNlYWQzZDp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJwZXJtaXNzaW9uIjoiNyIsInVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-02 08:27:22.324246');
INSERT INTO `django_session` VALUES ('myk80lxbj8u1e5up2erc6x04luujkdkn', 'MzJiN2M1NjA1MWNlMWViNjgyMzI4MmQyNjcwY2FhN2RhNDkzYmQ5Yjp7InBlcm1pc3Npb24iOiI3IiwidW5vIjoiNDAwMDAwMSIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-03 16:40:25.740450');
INSERT INTO `django_session` VALUES ('nb4bqwn2m025aithj6o9u8t80n6nztr6', 'YjVjMWNlZGIzZmZhMWE1NTY0YWQ1YzJlYWFkZThmNGJiMDM4MjQ4Yzp7InBlcm1pc3Npb24iOiI3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-06 19:11:17.479596');
INSERT INTO `django_session` VALUES ('o2kcelrrr2pzi5mzjdgcqryrlnpu5xz0', 'YjVjMWNlZGIzZmZhMWE1NTY0YWQ1YzJlYWFkZThmNGJiMDM4MjQ4Yzp7InBlcm1pc3Npb24iOiI3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-02 07:29:10.776336');
INSERT INTO `django_session` VALUES ('p6nvwg1ie3fiou8z0xf47qcdv0x9k0d3', 'ZWFmOTlhNDJiODI2OWNmMTY0NzIwY2I4NDczYmNlNTVjYzAwOWM0MDp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJ1bm8iOiI0MDAwMDAxIiwiaXNfbG9naW4iOnRydWUsInBlcm1pc3Npb24iOiI3In0=', '2018-07-03 12:20:43.247806');
INSERT INTO `django_session` VALUES ('pl6sr5rbdtqwuht4qzhoazwv7gdo6vaf', 'OTBiZmMzNmU4ZmFlNTNkNjc1NjNhNDBjODM3ZjI2N2ExZDY3YmFmNTp7ImlzX2xvZ2luIjp0cnVlLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwicGVybWlzc2lvbiI6IjciLCJ1bm8iOiI0MDAwMDAxIn0=', '2018-07-06 21:35:06.253587');
INSERT INTO `django_session` VALUES ('qims4imfqux1vss7vhazrkivgyifhgeq', 'MTgyNmU5NWZjOWJmY2Q5MTJjYzdhOGMzYjQ0ODVlM2FiOTU4NGJhNjp7ImlzX2xvZ2luIjp0cnVlLCJwZXJtaXNzaW9uIjoiNyIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJ1bm8iOiI0MDAwMDAxIn0=', '2018-07-03 17:54:14.489561');
INSERT INTO `django_session` VALUES ('qonp6w9i3fxksmkglwm0519wo3h0pu2y', 'NWEyZDhkM2E0NzQ0ODAzYTM1YjRhZWM0Y2VkYmVmZTIzNzkwZDg4ZTp7InVubyI6IjQwMDAwMDEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwiaXNfb2NjdXB5Ijp0cnVlLCJpc19sb2dpbiI6dHJ1ZSwicGVybWlzc2lvbiI6IjcifQ==', '2018-07-03 15:33:34.507189');
INSERT INTO `django_session` VALUES ('rbl0tra54gfe4jb5kem2gvezyqsie2we', 'ZTU5MDM5NzFmNTZkZmE2OWNmZmNhMDI0MzI3NjRiNGM3YjcyMjUwMjp7InVubyI6IjQwMDAwMDEiLCJwZXJtaXNzaW9uIjoiNyIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-02 07:12:12.735532');
INSERT INTO `django_session` VALUES ('rilwk0tzs80fm1b2638qc103i8beabv4', 'ZTYxNzc1YTM1ZTRhZWQ2MmZmMzFhYTZkNDBmMWE0ZWI5ZDZiMzUzYjp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJwZXJtaXNzaW9uIjoiMTI1IiwiaXNfbG9naW4iOnRydWUsInVubyI6IjQwMDAwMDEifQ==', '2018-06-30 13:22:17.677914');
INSERT INTO `django_session` VALUES ('rzyygt1tzrbb1mbgd58k5kcnwompdol4', 'ZjRmODJlYTgyODQxMzQwM2JhZTg3MTQ2MjdlNGY5NDUxNDVkZTJjZjp7InVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInBlcm1pc3Npb24iOiI3In0=', '2018-07-03 02:00:49.437895');
INSERT INTO `django_session` VALUES ('seor6ulcjsu72lgde0lts2b3ozmyvubg', 'ZTU5MDM5NzFmNTZkZmE2OWNmZmNhMDI0MzI3NjRiNGM3YjcyMjUwMjp7InVubyI6IjQwMDAwMDEiLCJwZXJtaXNzaW9uIjoiNyIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-02 01:47:56.491474');
INSERT INTO `django_session` VALUES ('sfkh8yy15tx2gf9evytw14v8u8nyh8nq', 'YzQ0ZWQxZGE1Y2YwYWY1Y2NlNDYwMzgyNzlhMWU0MTJhMjRiMTdlZDp7InBlcm1pc3Npb24iOiI3IiwiaXNfbG9naW4iOnRydWUsInVubyI6IjQwMDAwMDEiLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2018-07-06 18:10:50.035515');
INSERT INTO `django_session` VALUES ('t6g127ycz75i453uquktlax7cxqaojql', 'OTBiZmMzNmU4ZmFlNTNkNjc1NjNhNDBjODM3ZjI2N2ExZDY3YmFmNTp7ImlzX2xvZ2luIjp0cnVlLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwicGVybWlzc2lvbiI6IjciLCJ1bm8iOiI0MDAwMDAxIn0=', '2018-07-02 08:51:14.166356');
INSERT INTO `django_session` VALUES ('tmiu3etjtb1j6txtatdg8hgsus4t1070', 'YjVjMWNlZGIzZmZhMWE1NTY0YWQ1YzJlYWFkZThmNGJiMDM4MjQ4Yzp7InBlcm1pc3Npb24iOiI3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-06 19:22:23.686286');
INSERT INTO `django_session` VALUES ('tqnr87vw31ant241ql2sd00ebmsaci69', 'YjVjMWNlZGIzZmZhMWE1NTY0YWQ1YzJlYWFkZThmNGJiMDM4MjQ4Yzp7InBlcm1pc3Npb24iOiI3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-01 08:58:16.057098');
INSERT INTO `django_session` VALUES ('uedc66vk4et24q7yvmwpmubas8neipio', 'ZTU5MDM5NzFmNTZkZmE2OWNmZmNhMDI0MzI3NjRiNGM3YjcyMjUwMjp7InVubyI6IjQwMDAwMDEiLCJwZXJtaXNzaW9uIjoiNyIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-02 09:24:43.476744');
INSERT INTO `django_session` VALUES ('ufziimojzinu068hqyex1osncenrnpzi', 'Yzk4OTBmMGQ1YjcyYzA3NWQwZWFkM2I4NzE1NDFiZDk4ODY3MGRkZjp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJwZXJtaXNzaW9uIjoiNyIsImlzX2xvZ2luIjp0cnVlLCJ1bm8iOiI0MDAwMDAxIn0=', '2018-07-03 17:30:10.282911');
INSERT INTO `django_session` VALUES ('ukknuy6uulo4ncvaf04fsjlewz3mks7z', 'MjEzMDZjY2NmNTk2NTRmZjhlNWRmMDM2OThkZmYwY2RhNjMzODVmNTp7ImlzX2xvZ2luIjp0cnVlLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwidW5vIjoiNDAwMDAwMSIsInBlcm1pc3Npb24iOiI3In0=', '2018-07-02 08:38:05.569950');
INSERT INTO `django_session` VALUES ('wila82dgfiaaoz1zfodlzeuqfzgotrhs', 'ODgyNjAzNDk2NTJmNWYyMzY0YmVmYzZhMmE1ODliMGFkZDg2MGExMzp7ImlzX2xvZ2luIjp0cnVlLCJ1bm8iOiI0MDAwMDAxIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInBlcm1pc3Npb24iOiI3In0=', '2018-06-30 15:17:51.161780');
INSERT INTO `django_session` VALUES ('wqdh4fzqkf0p60atf9x7ujz1zqly1d2z', 'ZTU5MDM5NzFmNTZkZmE2OWNmZmNhMDI0MzI3NjRiNGM3YjcyMjUwMjp7InVubyI6IjQwMDAwMDEiLCJwZXJtaXNzaW9uIjoiNyIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-03 11:28:16.821318');
INSERT INTO `django_session` VALUES ('x5lizgzkr6ar7mc6tl5bbisp67o7kzax', 'MzJiN2M1NjA1MWNlMWViNjgyMzI4MmQyNjcwY2FhN2RhNDkzYmQ5Yjp7InBlcm1pc3Npb24iOiI3IiwidW5vIjoiNDAwMDAwMSIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-02 08:15:13.888104');
INSERT INTO `django_session` VALUES ('yfm67z06bccprtuwp7a93tn4y8en6g75', 'OTBiZmMzNmU4ZmFlNTNkNjc1NjNhNDBjODM3ZjI2N2ExZDY3YmFmNTp7ImlzX2xvZ2luIjp0cnVlLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwicGVybWlzc2lvbiI6IjciLCJ1bm8iOiI0MDAwMDAxIn0=', '2018-07-02 13:11:09.744295');
INSERT INTO `django_session` VALUES ('yfu5gpkidzrjefan7gmukuhugxtzao0b', 'MzJiN2M1NjA1MWNlMWViNjgyMzI4MmQyNjcwY2FhN2RhNDkzYmQ5Yjp7InBlcm1pc3Npb24iOiI3IiwidW5vIjoiNDAwMDAwMSIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-02 09:02:12.652397');
INSERT INTO `django_session` VALUES ('yhlng47gb32cg6m38i97tr54emvdneqb', 'OTg3NmQwNTZiNWViODBkYTBlNTFlZmQ4NWE0N2JlMWU5NWI5ODVhYTp7InVubyI6IjQwMDAwMDEiLCJwZXJtaXNzaW9uIjoiNyIsImlzX2xvZ2luIjp0cnVlLCJfc2Vzc2lvbl9leHBpcnkiOjYwMH0=', '2018-07-03 16:50:39.453609');
INSERT INTO `django_session` VALUES ('yqpr19g56916exxzbodftrtlstp4xtha', 'YjVjMWNlZGIzZmZhMWE1NTY0YWQ1YzJlYWFkZThmNGJiMDM4MjQ4Yzp7InBlcm1pc3Npb24iOiI3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInVubyI6IjQwMDAwMDEiLCJpc19sb2dpbiI6dHJ1ZX0=', '2018-07-01 08:37:06.263560');
INSERT INTO `django_session` VALUES ('z0dtctol9fx5nh6e5ercadgdllklgnkh', 'OTBiZmMzNmU4ZmFlNTNkNjc1NjNhNDBjODM3ZjI2N2ExZDY3YmFmNTp7ImlzX2xvZ2luIjp0cnVlLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwicGVybWlzc2lvbiI6IjciLCJ1bm8iOiI0MDAwMDAxIn0=', '2018-07-03 03:02:00.501091');
INSERT INTO `django_session` VALUES ('z2686q6d3zfm7h9duqlx87sj9qaqgtzy', 'MjEzMDZjY2NmNTk2NTRmZjhlNWRmMDM2OThkZmYwY2RhNjMzODVmNTp7ImlzX2xvZ2luIjp0cnVlLCJfc2Vzc2lvbl9leHBpcnkiOjYwMCwidW5vIjoiNDAwMDAwMSIsInBlcm1pc3Npb24iOiI3In0=', '2018-06-30 15:44:17.614841');

-- ----------------------------
-- Table structure for occupyseat
-- ----------------------------
DROP TABLE IF EXISTS `occupyseat`;
CREATE TABLE `occupyseat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` varchar(7) NOT NULL,
  `u_id` varchar(7) NOT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occupyseat_s_id_0dfcf9be_fk_seat_sno` (`s_id`),
  KEY `occupyseat_u_id_25beea16_fk_user_uno` (`u_id`),
  CONSTRAINT `occupyseat_s_id_0dfcf9be_fk_seat_sno` FOREIGN KEY (`s_id`) REFERENCES `seat` (`sno`),
  CONSTRAINT `occupyseat_u_id_25beea16_fk_user_uno` FOREIGN KEY (`u_id`) REFERENCES `user_` (`uno`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of occupyseat
-- ----------------------------
INSERT INTO `occupyseat` VALUES ('38', '3000001', '4000001', '2018-07-03 16:24:37.000000', '2018-07-03 16:24:15.000000');
INSERT INTO `occupyseat` VALUES ('39', '3000001', '4000001', '2018-07-03 16:28:17.000000', '2018-07-03 16:25:15.000000');
INSERT INTO `occupyseat` VALUES ('40', '3000002', '4000002', '2018-07-03 16:28:36.000000', '2018-07-03 16:25:49.000000');
INSERT INTO `occupyseat` VALUES ('41', '3000041', '4000007', '2018-07-03 16:27:37.000000', '2018-07-03 16:26:49.000000');
INSERT INTO `occupyseat` VALUES ('42', '3000001', '4000001', '2018-07-03 16:41:08.000000', '2018-07-03 16:40:43.000000');
INSERT INTO `occupyseat` VALUES ('43', '3000001', '4000001', '2018-07-03 16:59:51.000000', '2018-07-03 16:59:39.000000');
INSERT INTO `occupyseat` VALUES ('44', '3000001', '4000001', '2018-07-06 20:29:24.000000', '2018-07-03 17:33:38.000000');
INSERT INTO `occupyseat` VALUES ('45', '3000009', '4000002', null, '2018-07-06 18:22:21.000000');
INSERT INTO `occupyseat` VALUES ('46', '3000010', '4000003', null, '2018-07-06 18:22:42.000000');
INSERT INTO `occupyseat` VALUES ('47', '3000049', '4000023', null, '2018-07-06 18:23:07.000000');
INSERT INTO `occupyseat` VALUES ('48', '3000001', '4000001', '2018-07-06 21:25:27.000000', '2018-07-06 21:25:14.000000');

-- ----------------------------
-- Table structure for pwdandpermission
-- ----------------------------
DROP TABLE IF EXISTS `pwdandpermission`;
CREATE TABLE `pwdandpermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pwd` varchar(32) NOT NULL,
  `permission` varchar(1) NOT NULL,
  `u_id` varchar(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pwdandpermission_u_id_2786f941_fk_user_uno` (`u_id`),
  CONSTRAINT `pwdandpermission_u_id_2786f941_fk_user_uno` FOREIGN KEY (`u_id`) REFERENCES `user_` (`uno`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pwdandpermission
-- ----------------------------
INSERT INTO `pwdandpermission` VALUES ('1', '123', '7', '4000001');
INSERT INTO `pwdandpermission` VALUES ('3', '123', '0', '4000002');
INSERT INTO `pwdandpermission` VALUES ('4', '123', '0', '4000003');
INSERT INTO `pwdandpermission` VALUES ('5', '123', '2', '4000004');
INSERT INTO `pwdandpermission` VALUES ('6', '123', '0', '4000005');
INSERT INTO `pwdandpermission` VALUES ('7', '123', '2', '4000006');
INSERT INTO `pwdandpermission` VALUES ('8', '123', '7', '4000007');
INSERT INTO `pwdandpermission` VALUES ('9', '123', '2', '4000008');
INSERT INTO `pwdandpermission` VALUES ('10', '123', '4', '4000009');
INSERT INTO `pwdandpermission` VALUES ('11', '123', '6', '4000010');
INSERT INTO `pwdandpermission` VALUES ('12', '123', '2', '4000011');
INSERT INTO `pwdandpermission` VALUES ('13', '123', '3', '4000012');
INSERT INTO `pwdandpermission` VALUES ('14', '123', '0', '4000013');
INSERT INTO `pwdandpermission` VALUES ('15', '123', '4', '4000014');
INSERT INTO `pwdandpermission` VALUES ('16', '123', '0', '4000015');
INSERT INTO `pwdandpermission` VALUES ('17', '123', '0', '4000016');
INSERT INTO `pwdandpermission` VALUES ('18', '123', '5', '4000017');
INSERT INTO `pwdandpermission` VALUES ('19', '123', '0', '4000018');
INSERT INTO `pwdandpermission` VALUES ('20', '123', '3', '4000019');
INSERT INTO `pwdandpermission` VALUES ('21', '123', '3', '4000020');
INSERT INTO `pwdandpermission` VALUES ('22', '123', '0', '4000021');
INSERT INTO `pwdandpermission` VALUES ('23', '123', '1', '4000022');
INSERT INTO `pwdandpermission` VALUES ('24', '123', '1', '4000023');
INSERT INTO `pwdandpermission` VALUES ('25', '123', '5', '4000024');
INSERT INTO `pwdandpermission` VALUES ('26', '123', '0', '4000025');
INSERT INTO `pwdandpermission` VALUES ('27', '123', '1', '4000026');
INSERT INTO `pwdandpermission` VALUES ('28', '123', '0', '4000027');
INSERT INTO `pwdandpermission` VALUES ('29', '123', '0', '4000028');
INSERT INTO `pwdandpermission` VALUES ('30', '123', '0', '4000029');
INSERT INTO `pwdandpermission` VALUES ('31', '123', '0', '4000030');
INSERT INTO `pwdandpermission` VALUES ('32', '123', '0', '4000031');
INSERT INTO `pwdandpermission` VALUES ('33', '123', '0', '4000032');
INSERT INTO `pwdandpermission` VALUES ('34', '123', '0', '4000033');
INSERT INTO `pwdandpermission` VALUES ('35', '123', '0', '4000034');
INSERT INTO `pwdandpermission` VALUES ('36', '123', '0', '4000035');
INSERT INTO `pwdandpermission` VALUES ('37', '123', '0', '4000036');
INSERT INTO `pwdandpermission` VALUES ('38', '123', '0', '4000037');

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `sno` varchar(7) NOT NULL,
  `sposition` varchar(32) NOT NULL,
  `sstate` varchar(10) NOT NULL,
  `ip` char(39) NOT NULL,
  `stype` varchar(10) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES ('3000001', '@1#2#2#1#1', '空闲', '192.168.252.1', '高级座席');
INSERT INTO `seat` VALUES ('3000002', '@1#3#2#1#1', '空闲', '192.168.252.2', '高级座席');
INSERT INTO `seat` VALUES ('3000003', '@1#2#3#1#1', '空闲', '192.168.252.3', '高级座席');
INSERT INTO `seat` VALUES ('3000004', '@1#3#3#1#1', '空闲', '192.168.252.4', '高级座席');
INSERT INTO `seat` VALUES ('3000005', '@1#2#5#1#1', '空闲', '192.168.252.5', '高级座席');
INSERT INTO `seat` VALUES ('3000006', '@1#3#5#1#1', '空闲', '192.168.252.6', '高级座席');
INSERT INTO `seat` VALUES ('3000007', '@1#2#6#1#1', '空闲', '192.168.252.7', '高级座席');
INSERT INTO `seat` VALUES ('3000008', '@1#3#6#1#1', '空闲', '192.168.252.8', '高级座席');
INSERT INTO `seat` VALUES ('3000009', '@1#5#2#1#1', '占用', '192.168.252.9', '高级座席');
INSERT INTO `seat` VALUES ('3000010', '@1#6#2#1#1', '占用', '192.168.252.10', '高级座席');
INSERT INTO `seat` VALUES ('3000011', '@1#5#3#1#1', '空闲', '192.168.252.11', '高级座席');
INSERT INTO `seat` VALUES ('3000012', '@1#6#3#1#1', '空闲', '192.168.252.12', '高级座席');
INSERT INTO `seat` VALUES ('3000013', '@1#5#5#1#1', '空闲', '192.168.252.13', '高级座席');
INSERT INTO `seat` VALUES ('3000014', '@1#6#5#1#1', '空闲', '192.168.252.14', '高级座席');
INSERT INTO `seat` VALUES ('3000015', '@1#5#6#1#1', '空闲', '192.168.252.15', '高级座席');
INSERT INTO `seat` VALUES ('3000016', '@1#6#6#1#1', '空闲', '192.168.252.16', '高级座席');
INSERT INTO `seat` VALUES ('3000017', '@1#2#8#1#1', '空闲', '192.168.252.51', '普通座席');
INSERT INTO `seat` VALUES ('3000018', '@1#3#8#1#1', '损坏', '192.168.252.52', '普通座席');
INSERT INTO `seat` VALUES ('3000019', '@1#2#9#1#1', '空闲', '192.168.252.53', '普通座席');
INSERT INTO `seat` VALUES ('3000020', '@1#3#9#1#1', '空闲', '192.168.252.54', '普通座席');
INSERT INTO `seat` VALUES ('3000021', '@1#2#11#1#1', '空闲', '192.168.252.55', '普通座席');
INSERT INTO `seat` VALUES ('3000022', '@1#3#11#1#1', '空闲', '192.168.252.56', '普通座席');
INSERT INTO `seat` VALUES ('3000023', '@1#2#12#1#1', '空闲', '192.168.252.57', '普通座席');
INSERT INTO `seat` VALUES ('3000024', '@1#3#12#1#1', '空闲', '192.168.252.58', '普通座席');
INSERT INTO `seat` VALUES ('3000025', '@1#2#14#1#1', '空闲', '192.168.252.59', '普通座席');
INSERT INTO `seat` VALUES ('3000026', '@1#3#14#1#1', '空闲', '192.168.252.60', '普通座席');
INSERT INTO `seat` VALUES ('3000027', '@1#2#15#1#1', '空闲', '192.168.252.61', '普通座席');
INSERT INTO `seat` VALUES ('3000028', '@1#3#15#1#1', '空闲', '192.168.252.62', '普通座席');
INSERT INTO `seat` VALUES ('3000029', '@1#5#11#1#1', '空闲', '192.168.252.63', '普通座席');
INSERT INTO `seat` VALUES ('3000030', '@1#6#11#1#1', '空闲', '192.168.252.64', '普通座席');
INSERT INTO `seat` VALUES ('3000031', '@1#5#12#1#1', '空闲', '192.168.252.65', '普通座席');
INSERT INTO `seat` VALUES ('3000032', '@1#6#12#1#1', '空闲', '192.168.252.66', '普通座席');
INSERT INTO `seat` VALUES ('3000033', '@1#5#14#1#1', '空闲', '192.168.252.67', '普通座席');
INSERT INTO `seat` VALUES ('3000034', '@1#6#14#1#1', '空闲', '192.168.252.68', '普通座席');
INSERT INTO `seat` VALUES ('3000035', '@1#5#15#1#1', '空闲', '192.168.252.69', '普通座席');
INSERT INTO `seat` VALUES ('3000036', '@1#6#15#1#1', '空闲', '192.168.252.70', '普通座席');
INSERT INTO `seat` VALUES ('3000037', '@1#15#11#1#1', '空闲', '192.168.252.71', '普通座席');
INSERT INTO `seat` VALUES ('3000038', '@1#16#11#1#1', '空闲', '192.168.252.72', '普通座席');
INSERT INTO `seat` VALUES ('3000039', '@1#15#12#1#1', '空闲', '192.168.252.73', '普通座席');
INSERT INTO `seat` VALUES ('3000040', '@1#16#12#1#1', '空闲', '192.168.252.74', '普通座席');
INSERT INTO `seat` VALUES ('3000041', '@1#15#14#1#1', '空闲', '192.168.252.75', '普通座席');
INSERT INTO `seat` VALUES ('3000042', '@1#16#14#1#1', '空闲', '192.168.252.76', '普通座席');
INSERT INTO `seat` VALUES ('3000043', '@1#15#15#1#1', '空闲', '192.168.252.77', '普通座席');
INSERT INTO `seat` VALUES ('3000044', '@1#16#15#1#1', '空闲', '192.168.252.78', '普通座席');
INSERT INTO `seat` VALUES ('3000045', '@1#18#5#1#1', '空闲', '192.168.252.79', '普通座席');
INSERT INTO `seat` VALUES ('3000046', '@1#19#5#1#1', '空闲', '192.168.252.80', '普通座席');
INSERT INTO `seat` VALUES ('3000047', '@1#18#6#1#1', '空闲', '192.168.252.81', '普通座席');
INSERT INTO `seat` VALUES ('3000048', '@1#19#6#1#1', '空闲', '192.168.252.82', '普通座席');
INSERT INTO `seat` VALUES ('3000049', '@1#18#8#1#1', '占用', '192.168.252.83', '普通座席');
INSERT INTO `seat` VALUES ('3000050', '@1#19#8#1#1', '空闲', '192.168.252.84', '普通座席');
INSERT INTO `seat` VALUES ('3000051', '@1#18#9#1#1', '空闲', '192.168.252.85', '普通座席');
INSERT INTO `seat` VALUES ('3000052', '@1#19#9#1#1', '空闲', '192.168.252.86', '普通座席');
INSERT INTO `seat` VALUES ('3000053', '@1#18#11#1#1', '空闲', '192.168.252.87', '普通座席');
INSERT INTO `seat` VALUES ('3000054', '@1#19#11#1#1', '空闲', '192.168.252.88', '普通座席');
INSERT INTO `seat` VALUES ('3000055', '@1#18#12#1#1', '空闲', '192.168.252.89', '普通座席');
INSERT INTO `seat` VALUES ('3000056', '@1#19#12#1#1', '空闲', '192.168.252.90', '普通座席');
INSERT INTO `seat` VALUES ('3000057', '@1#18#14#1#1', '空闲', '192.168.252.91', '普通座席');
INSERT INTO `seat` VALUES ('3000058', '@1#19#14#1#1', '空闲', '192.168.252.92', '普通座席');
INSERT INTO `seat` VALUES ('3000059', '@1#18#15#1#1', '空闲', '192.168.252.93', '普通座席');
INSERT INTO `seat` VALUES ('3000060', '@1#19#15#1#1', '空闲', '192.168.252.94', '普通座席');
INSERT INTO `seat` VALUES ('3000061', '@1#9#11#1#1', '空闲', '192.168.252.201', '外访座席');
INSERT INTO `seat` VALUES ('3000062', '@1#10#11#1#1', '空闲', '192.168.252.202', '外访座席');
INSERT INTO `seat` VALUES ('3000063', '@1#11#11#1#1', '空闲', '192.168.252.203', '外访座席');
INSERT INTO `seat` VALUES ('3000064', '@1#12#11#1#1', '空闲', '192.168.252.204', '外访座席');
INSERT INTO `seat` VALUES ('3000065', '@1#9#13#1#1', '空闲', '192.168.252.205', '外访座席');
INSERT INTO `seat` VALUES ('3000066', '@1#10#13#1#1', '空闲', '192.168.252.206', '外访座席');
INSERT INTO `seat` VALUES ('3000067', '@1#11#13#1#1', '空闲', '192.168.252.207', '外访座席');
INSERT INTO `seat` VALUES ('3000068', '@1#12#13#1#1', '空闲', '192.168.252.208', '外访座席');

-- ----------------------------
-- Table structure for user_
-- ----------------------------
DROP TABLE IF EXISTS `user_`;
CREATE TABLE `user_` (
  `uno` varchar(7) NOT NULL,
  `uname` varchar(32) NOT NULL,
  `upic` varchar(64) NOT NULL,
  `sex` varchar(3) NOT NULL,
  `idnum` varchar(18) NOT NULL,
  `duty` varchar(10) NOT NULL,
  `department` varchar(10) NOT NULL,
  `post` varchar(10) NOT NULL,
  `companymail` varchar(254) NOT NULL,
  `personalmail` varchar(254) NOT NULL,
  `housephone` varchar(20) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `ustate` varchar(20) NOT NULL,
  `reasonforleave` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_
-- ----------------------------
INSERT INTO `user_` VALUES ('4000001', 'admin', '/static/data/upic/4000001.png', '男', '421381199802116035', '董事长', '技术部', 'CEO', '123@qq.com', '123@qq.com', '18772805296', '18772805295', '18772805296', '出差', '回家');
INSERT INTO `user_` VALUES ('4000002', '李四1', '/static/data/upic/4000002.png', '女', '421381199802116035', '总经理', '财务部', '经理', '123@qq.com', '123@qq.com', '18772805296', '18772805295', '18772805296', '在席', '');
INSERT INTO `user_` VALUES ('4000003', '李四2', '/static/data/upic/4000001.png', '男', '421381199802116035', '主管', '财务部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '在席', '');
INSERT INTO `user_` VALUES ('4000004', '李四3', '/static/data/upic/4000001.png', '男', '421381199802116035', '主管', '财务部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000005', '李四4', '/static/data/upic/4000001.png', '男', '421381199802116035', '主管', '财务部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000006', '李四5', '/static/data/upic/4000001.png', '男', '421381199802116035', '主管', '财务部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000007', '张三1', '/static/data/upic/4000001.png', '男', '421381199802116035', '主管', '人事部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '请假', '吃屎');
INSERT INTO `user_` VALUES ('4000008', '张三2', '/static/data/upic/4000001.png', '男', '421381199802116035', '主管', '人事部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000009', '张三3', '/static/data/upic/4000001.png', '男', '421381199802116035', '主管', '人事部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000010', '张三4', '/static/data/upic/4000001.png', '男', '421381199802116035', '会计', '人事部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000011', '张三5', '/static/data/upic/4000001.png', '男', '421381199802116035', '会计', '人事部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000012', '张三6', '/static/data/upic/4000001.png', '男', '421381199802116035', '会计', '市场部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000013', '张三7', '/static/data/upic/4000001.png', '男', '421381199802116035', '会计', '市场部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000014', '王五1', '/static/data/upic/4000001.png', '男', '421381199802116035', '助理', '市场部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000015', '王五2', '/static/data/upic/4000001.png', '男', '421381199802116035', '助理', '市场部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000016', '王五3', '/static/data/upic/4000001.png', '男', '421381199802116035', '助理', '行政部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000017', '王五4', '/static/data/upic/4000001.png', '男', '421381199802116035', '助理', '行政部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000018', '王五5', '/static/data/upic/4000001.png', '男', '421381199802116035', '助理', '行政部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000019', '李刚1', '/static/data/upic/4000001.png', '男', '421381199802116035', '助理', '后勤部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000020', '李刚2', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '后勤部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000021', '李刚3', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '后勤部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000022', '李刚4', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '后勤部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000023', '李刚5', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '后勤部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '在席', '');
INSERT INTO `user_` VALUES ('4000024', '李刚6', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '技术部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000025', '李刚7', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '技术部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000026', '王建1', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '技术部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000027', '王建2', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '技术部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000028', '王建3', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '技术部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000029', '王建4', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '技术部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000030', '王建5', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '经理部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000031', '刘思1', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '经理部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000032', '刘思2', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '经理部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000033', '刘思3', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '经理部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000034', '刘思4', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '经理部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000035', '刘思5', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '经理部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000036', '刘思6', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '经理部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
INSERT INTO `user_` VALUES ('4000037', '刘思7', '/static/data/upic/4000001.png', '男', '421381199802116035', '文员', '技术部', '保安', '123@qq.com', '123@qq.com', '18772805296', '18772805296', '18772805296', '', '');
