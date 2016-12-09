-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 09, 2016 at 08:20 PM
-- Server version: 5.7.11
-- PHP Version: 5.5.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `FreeSource`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_emailaddress`
--

INSERT INTO `account_emailaddress` (`id`, `email`, `verified`, `primary`, `user_id`) VALUES
(1, 'cyixuan568@gmail.com', 0, 0, 1),
(9, 'erik.dyer@columbia.edu', 0, 1, 10),
(10, 'glalteva@gmail.com', 0, 1, 11),
(11, 'gla2112@barnard.edu', 0, 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_emailconfirmation`
--

INSERT INTO `account_emailconfirmation` (`id`, `created`, `sent`, `key`, `email_address_id`) VALUES
(8, '2016-11-13 17:17:12.909610', '2016-11-13 17:17:14.119802', 'dqdvoyujmqxt5t6ane4fpjgwhjxxolwyhoxj3w1hlvhyemva1neoggcibwmuotrq', 9),
(9, '2016-11-13 17:22:16.737218', '2016-11-13 17:22:17.737425', 'kfvj3m6tncxkfqxxiunoqksdbzvsbrzt8swkciwsdnba7nseybmbtozp9bz3jsz2', 10),
(10, '2016-11-15 15:24:27.415268', '2016-11-15 15:24:28.685050', 'mc7tdqwx1t1szkeiv8xuroasek09nvfskc14ici2bds3liadvursru5bavfz0rmp', 11);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add site', 7, 'add_site'),
(20, 'Can change site', 7, 'change_site'),
(21, 'Can delete site', 7, 'delete_site'),
(22, 'Can add email address', 8, 'add_emailaddress'),
(23, 'Can change email address', 8, 'change_emailaddress'),
(24, 'Can delete email address', 8, 'delete_emailaddress'),
(25, 'Can add email confirmation', 9, 'add_emailconfirmation'),
(26, 'Can change email confirmation', 9, 'change_emailconfirmation'),
(27, 'Can delete email confirmation', 9, 'delete_emailconfirmation'),
(28, 'Can add social application', 10, 'add_socialapp'),
(29, 'Can change social application', 10, 'change_socialapp'),
(30, 'Can delete social application', 10, 'delete_socialapp'),
(31, 'Can add social account', 11, 'add_socialaccount'),
(32, 'Can change social account', 11, 'change_socialaccount'),
(33, 'Can delete social account', 11, 'delete_socialaccount'),
(34, 'Can add social application token', 12, 'add_socialtoken'),
(35, 'Can change social application token', 12, 'change_socialtoken'),
(36, 'Can delete social application token', 12, 'delete_socialtoken'),
(37, 'Can add marker', 13, 'add_marker'),
(38, 'Can change marker', 13, 'change_marker'),
(39, 'Can delete marker', 13, 'delete_marker'),
(40, 'Can add filter', 14, 'add_filter'),
(41, 'Can change filter', 14, 'change_filter'),
(42, 'Can delete filter', 14, 'delete_filter');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$24000$9mShwCNI1Q4K$2ij3C4uW/5XCOhSASUpm/w3ab0MVxNfKH20k4jGF5nI=', '2016-11-14 05:54:58.700123', 1, 'cyixuan', '', '', 'cyixuan568@gmail.com', 1, 1, '2016-10-16 17:47:59.885543'),
(10, 'pbkdf2_sha256$24000$YWviz7e95Q0Q$qIBO0QINUujFLQ3kbH7fuWxaHfkOOhMGAZWDJ05UaLw=', '2016-12-08 16:28:31.136955', 0, 'erik.dyer', '', '', 'erik.dyer@columbia.edu', 0, 1, '2016-11-13 17:17:12.859326'),
(11, 'pbkdf2_sha256$24000$lsEMFKvh1GTo$bCHL2C6Mk+RVMn0cwbBZJbsfobOknaPyA4zwfmA62Jo=', '2016-11-13 17:22:17.764103', 0, 'glalteva', '', '', 'glalteva@gmail.com', 0, 1, '2016-11-13 17:22:16.709471'),
(12, 'pbkdf2_sha256$24000$SDECtRIF3DS5$DP53NacS25cZrbMu/7caf/ZV6DVda0ToMW387XlehpA=', '2016-11-15 15:24:28.719243', 0, 'gla2112', '', '', 'gla2112@barnard.edu', 0, 1, '2016-11-15 15:24:27.351363');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2016-11-09 21:13:18.783890', '1', 'freesources.com', 2, 'Changed domain and name.', 7, 1),
(2, '2016-11-09 23:16:33.965134', '2', 'erikdyer5', 2, 'Changed username.', 4, 1),
(3, '2016-11-13 17:18:24.199686', '3', '1185908623', 3, '', 4, 1),
(4, '2016-11-13 17:18:24.201331', '5', 'abc', 3, '', 4, 1),
(5, '2016-11-13 17:18:24.202881', '6', 'abc2', 3, '', 4, 1),
(6, '2016-11-13 17:18:24.204414', '9', 'bird', 3, '', 4, 1),
(7, '2016-11-13 17:18:24.205511', '8', 'bye', 3, '', 4, 1),
(8, '2016-11-13 17:18:24.206414', '2', 'erikdyer5', 3, '', 4, 1),
(9, '2016-11-13 17:18:24.207459', '4', 'glalteva', 3, '', 4, 1),
(10, '2016-11-13 17:18:24.208484', '7', 'hey', 3, '', 4, 1),
(11, '2016-11-13 17:21:24.862950', '3', '1185908623', 3, '', 4, 1),
(12, '2016-11-13 17:21:24.864890', '5', 'abc', 3, '', 4, 1),
(13, '2016-11-13 17:21:24.866298', '6', 'abc2', 3, '', 4, 1),
(14, '2016-11-13 17:21:24.867537', '9', 'bird', 3, '', 4, 1),
(15, '2016-11-13 17:21:24.868661', '8', 'bye', 3, '', 4, 1),
(16, '2016-11-13 17:21:24.869736', '2', 'erikdyer5', 3, '', 4, 1),
(17, '2016-11-13 17:21:24.870606', '4', 'glalteva', 3, '', 4, 1),
(18, '2016-11-13 17:21:24.871985', '7', 'hey', 3, '', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'account', 'emailaddress'),
(9, 'account', 'emailconfirmation'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(14, 'freesources', 'filter'),
(13, 'freesources', 'marker'),
(6, 'sessions', 'session'),
(7, 'sites', 'site'),
(11, 'socialaccount', 'socialaccount'),
(10, 'socialaccount', 'socialapp'),
(12, 'socialaccount', 'socialtoken');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2016-10-16 02:21:56.141475'),
(2, 'auth', '0001_initial', '2016-10-16 02:21:56.358649'),
(3, 'admin', '0001_initial', '2016-10-16 02:21:56.401537'),
(4, 'admin', '0002_logentry_remove_auto_add', '2016-10-16 02:21:56.425911'),
(5, 'contenttypes', '0002_remove_content_type_name', '2016-10-16 02:21:56.477121'),
(6, 'auth', '0002_alter_permission_name_max_length', '2016-10-16 02:21:56.495338'),
(7, 'auth', '0003_alter_user_email_max_length', '2016-10-16 02:21:56.512158'),
(8, 'auth', '0004_alter_user_username_opts', '2016-10-16 02:21:56.527424'),
(9, 'auth', '0005_alter_user_last_login_null', '2016-10-16 02:21:56.553467'),
(10, 'auth', '0006_require_contenttypes_0002', '2016-10-16 02:21:56.555094'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2016-10-16 02:21:56.566859'),
(12, 'sessions', '0001_initial', '2016-10-16 02:21:56.586232'),
(13, 'account', '0001_initial', '2016-11-09 19:35:46.884899'),
(14, 'account', '0002_email_max_length', '2016-11-09 19:35:46.908169'),
(15, 'sites', '0001_initial', '2016-11-09 19:35:47.011697'),
(16, 'sites', '0002_alter_domain_unique', '2016-11-09 19:35:47.023481'),
(17, 'socialaccount', '0001_initial', '2016-11-09 19:57:24.739275'),
(18, 'socialaccount', '0002_token_max_lengths', '2016-11-09 19:57:24.858316'),
(19, 'socialaccount', '0003_extra_data_default_dict', '2016-11-09 19:57:24.888576'),
(20, 'freesources', '0001_initial', '2016-12-08 16:21:14.908018');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9htzid0345zbke2poau45wj6k92505vq', 'Mzc5Yjc1YmQ2MzJhNTcwZDA4ZmM3MmYwOWZhMjg5ZjRhY2UwNTk3Mzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiYjQ3ODU2ZGJkYmJjZGU4YmUxNGYxYTZjNTM5YWMzZTAxMmQzYWUwMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-11-26 03:45:10.944763'),
('nrukrflayp9ee3c532pmptx6x8if596l', 'ZjY0ZDUzMmM2YmFmODM3MmQzODZkOTQzZWJjOWY2MTk2MDFlZGNjYjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiNTU5MGM0MDI1NThlZmVkMzkyZjBmNzEwM2FmMjVlOWEyNTU5MGQ0YiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImFsbGF1dGguYWNjb3VudC5hdXRoX2JhY2tlbmRzLkF1dGhlbnRpY2F0aW9uQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMCJ9', '2016-12-22 16:28:31.142196'),
('xvneitc625iihyvrw4znbnra3op0wdi0', 'MmI5MDJlMjQxMDc3NmU0ZmU5NjU2YmI1Y2YwZDg2OGY1MTFmMjNmMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI0Nzg1NmRiZGJiY2RlOGJlMTRmMWE2YzUzOWFjM2UwMTJkM2FlMDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-10-31 03:48:51.731635');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'freesources.com', 'freesources.com');

-- --------------------------------------------------------

--
-- Table structure for table `freesources_filter`
--

CREATE TABLE `freesources_filter` (
  `id` int(11) NOT NULL,
  `tag_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `freesources_marker`
--

CREATE TABLE `freesources_marker` (
  `id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fs_feedback`
--

CREATE TABLE `fs_feedback` (
  `feedback_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `feedback_type` varchar(20) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fs_feedback`
--

INSERT INTO `fs_feedback` (`feedback_id`, `item_id`, `feedback_type`, `user_id`) VALUES
(1, 11, 'rej_false', 1),
(2, 12, 'rej_exp', 1),
(4, 8, 'confirm', 1),
(5, 9, 'rej_false', 1),
(35, 11, 'rej_false', 10),
(36, 72, 'confirm', 10);

-- --------------------------------------------------------

--
-- Table structure for table `fs_item`
--

CREATE TABLE `fs_item` (
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tag_id` int(10) NOT NULL,
  `longitude` decimal(10,6) NOT NULL,
  `latitude` decimal(10,6) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `expire_type` varchar(20) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `expiration` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fs_item`
--

INSERT INTO `fs_item` (`item_id`, `user_id`, `tag_id`, `longitude`, `latitude`, `location`, `description`, `expire_type`, `start_time`, `expiration`) VALUES
(3, 1, 1, '-70.434029', '43.409152', '43 Buster Lane', 'AED available', 'Permanent', '2016-10-15 00:00:00', NULL),
(4, 1, 2, '-74.005941', '40.712784', 'Matt\'s taco trunck, 456 Clone Dr', 'They are giving out free sample foods, with chicken and fish options!', 'Temporary', '2016-10-17 12:00:00', '2016-10-17 16:00:00'),
(8, 1, 4, '-73.960779', '40.809651', ' Science and Engineering Library, 550 W 120th St', 'Restroom at the 5th floor', 'Permanent', '2016-10-16 00:00:00', NULL),
(9, 1, 7, '-73.959969', '40.809382', '500 W 120th St #510, NY 10027', 'Free water available at the mudd building', 'Recurrent', '2016-10-17 09:00:00', '2016-10-17 10:00:00'),
(10, 1, 4, '-73.963220', '40.806403', 'Butler Library, Columbia University, 535 W 114th St,New York, NY 10027', 'restroom at each level', 'Permanent', '2016-10-16 00:00:00', NULL),
(11, 1, 1, '-73.963220', '40.806403', 'Bulter Library, Columbia University, New York', NULL, 'Permanent', '2016-10-17 00:00:00', NULL),
(12, 1, 2, '-73.960368', '40.806975', 'Columbia Law School, 435 W 116th St, New York, NY 10027', NULL, 'Temporary', '2016-10-17 11:00:00', '2016-10-17 12:00:00'),
(71, 10, 1, '-73.967149', '40.805374', '610 W 111th St, New York, New York, 10025', 'free AED for emergency', 'Temporary', '2016-12-08 12:00:00', '2016-12-09 14:00:00'),
(72, 10, 2, '-73.961957', '40.808200', '553 W 116th St, New York, New York, 10027', 'free pizza in lobby', 'Temporary', '2016-12-08 15:00:00', '2016-12-08 15:30:00'),
(75, 10, 3, '-73.963823', '40.807380', '2941 Broadway, New York, New York, 10025', 'free beer limited time', 'Temporary', '2016-12-09 16:00:00', '2016-12-09 17:00:00'),
(76, 10, 2, '-73.962450', '40.803856', '1050 Amsterdam Ave, New York, New York, 10025', 'test for expiration past', 'Temporary', '2016-12-09 00:00:00', '2016-12-09 09:00:00'),
(77, 10, 2, '-73.956163', '40.806130', '421 Manhattan Ave, New York, New York, 10026', 'test for expiration past', 'Temporary', '2016-12-08 00:00:00', '2016-12-09 00:00:00'),
(78, 10, 1, '-73.957579', '40.804116', '345 Manhattan Ave, New York, New York, 10026', 'test for expiration past', 'Temporary', '2016-12-09 00:00:00', '2016-12-08 00:00:00'),
(79, 10, 7, '-73.970282', '40.804814', 'Henry Hudson Pkwy, New York, New York, 10025', 'test for null time', 'Permanent', NULL, NULL),
(80, 10, 7, '-73.960368', '40.806975', 'No.12 : Geolocation[40.806975,-73.960368]', 'test for null time', 'Permanent', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fs_tag`
--

CREATE TABLE `fs_tag` (
  `tag_id` int(10) NOT NULL,
  `tag_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fs_tag`
--

INSERT INTO `fs_tag` (`tag_id`, `tag_name`) VALUES
(1, 'AED'),
(2, 'Food'),
(3, 'Event'),
(4, 'Restroom'),
(5, 'Vaccines'),
(6, 'Health Check-ups'),
(7, 'Water');

-- --------------------------------------------------------

--
-- Table structure for table `fs_tag_suggestion`
--

CREATE TABLE `fs_tag_suggestion` (
  `tag_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tag_title` varchar(255) NOT NULL,
  `tag_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialaccount`
--

CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp`
--

CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp_sites`
--

CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialtoken`
--

CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` (`email_address_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indexes for table `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- Indexes for table `freesources_filter`
--
ALTER TABLE `freesources_filter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `freesources_marker`
--
ALTER TABLE `freesources_marker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fs_feedback`
--
ALTER TABLE `fs_feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `event_idx` (`item_id`),
  ADD KEY `user_idx` (`user_id`);

--
-- Indexes for table `fs_item`
--
ALTER TABLE `fs_item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `tag_idx` (`tag_id`) USING BTREE,
  ADD KEY `user_idx` (`user_id`);

--
-- Indexes for table `fs_tag`
--
ALTER TABLE `fs_tag`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `fs_tag_suggestion`
--
ALTER TABLE `fs_tag_suggestion`
  ADD PRIMARY KEY (`tag_id`),
  ADD KEY `user_idx_tagsug` (`user_id`);

--
-- Indexes for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialaccount_provider_fc810c6e_uniq` (`provider`,`uid`),
  ADD KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  ADD KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`);

--
-- Indexes for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialtoken_app_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  ADD KEY `socialacco_account_id_951f210e_fk_socialaccount_socialaccount_id` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `freesources_filter`
--
ALTER TABLE `freesources_filter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `freesources_marker`
--
ALTER TABLE `freesources_marker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fs_feedback`
--
ALTER TABLE `fs_feedback`
  MODIFY `feedback_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `fs_item`
--
ALTER TABLE `fs_item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `fs_tag`
--
ALTER TABLE `fs_tag`
  MODIFY `tag_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `fs_tag_suggestion`
--
ALTER TABLE `fs_tag_suggestion`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `fs_feedback`
--
ALTER TABLE `fs_feedback`
  ADD CONSTRAINT `item_constraint` FOREIGN KEY (`item_id`) REFERENCES `fs_item` (`item_id`),
  ADD CONSTRAINT `user_constraint` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `fs_item`
--
ALTER TABLE `fs_item`
  ADD CONSTRAINT `tag_item_constraint` FOREIGN KEY (`tag_id`) REFERENCES `fs_tag` (`tag_id`),
  ADD CONSTRAINT `user_item_constraint` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `fs_tag_suggestion`
--
ALTER TABLE `fs_tag_suggestion`
  ADD CONSTRAINT `user_constraint_tagsug` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD CONSTRAINT `socialaccoun_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  ADD CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`);

--
-- Constraints for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD CONSTRAINT `socialacco_account_id_951f210e_fk_socialaccount_socialaccount_id` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  ADD CONSTRAINT `socialaccount_soci_app_id_636a42d7_fk_socialaccount_socialapp_id` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
