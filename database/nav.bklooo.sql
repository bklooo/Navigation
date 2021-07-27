/*
 Navicat MySQL Data Transfer

 Source Server         : 连接1
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : nav.bklooo

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 27/07/2021 18:38:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add msg', 7, 'add_msg');
INSERT INTO `auth_permission` VALUES (26, 'Can change msg', 7, 'change_msg');
INSERT INTO `auth_permission` VALUES (27, 'Can delete msg', 7, 'delete_msg');
INSERT INTO `auth_permission` VALUES (28, 'Can view msg', 7, 'view_msg');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'Navigation', 'msg');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2021-07-27 10:30:40.076023');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2021-07-27 10:30:53.867511');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2021-07-27 10:30:57.106118');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2021-07-27 10:30:57.253958');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2021-07-27 10:30:57.409199');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2021-07-27 10:30:59.216876');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2021-07-27 10:31:00.426789');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2021-07-27 10:31:00.788799');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2021-07-27 10:31:00.922161');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2021-07-27 10:31:02.069769');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2021-07-27 10:31:02.215588');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2021-07-27 10:31:02.379531');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2021-07-27 10:31:04.006276');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2021-07-27 10:31:05.406594');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2021-07-27 10:31:05.766977');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2021-07-27 10:31:05.892067');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2021-07-27 10:31:07.355158');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2021-07-27 10:31:08.617085');
INSERT INTO `django_migrations` VALUES (19, 'Navigation', '0001_initial', '2021-07-27 10:31:28.537832');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for navigation_msg
-- ----------------------------
DROP TABLE IF EXISTS `navigation_msg`;
CREATE TABLE `navigation_msg`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `time` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of navigation_msg
-- ----------------------------
INSERT INTO `navigation_msg` VALUES (1, '亚马逊', NULL, 'https://www.amazon.cn', NULL, '亚马逊中国（z.cn）坚持“以客户为中心”的理念，秉承“天天低价，正品行货”信念，销售图书、电脑、数码家电、母婴百货、服饰箱包等上千万种产品。亚马逊中国提供专业服务：正品行货天天低价，机打发票全国联保。货到付款，30天内可退换货。亚马逊为中国消费者提供便利、快捷的网购体验。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (2, '当当网', NULL, 'http://www.dangdang.com/', NULL, '全球领先的综合性网上购物中心。超过100万种商品在线热销！图书、音像、母婴、美妆、家居、数码3C、服装、鞋包等几十大类，正品行货，低至2折，700多城市货到付款，（全场购物满59元免运费。当当网一贯秉承提升顾客体验的承诺，自助退换货便捷又放心）。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (3, '淘宝', NULL, 'https://ai.taobao.com/', NULL, NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (4, '观察者', NULL, 'https://www.guancha.cn/', '//i.guancha.cn/images/favorite.ico', NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (5, '搜狐新闻', NULL, 'https://news.sohu.com/', '//statics.itc.cn/web/static/images/pic/sohu-logo/favicon.ico', '搜狐新闻,24小时提供时政新闻,国内新闻,国际新闻,生活新闻,时事热点,新闻图片,军事,历史,生活,的专业时事报道门户网站', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (6, '澎湃新闻', NULL, 'http://www.thepaper.cn', '//file.thepaper.cn/www/v3/img/thepaper.ico', NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (7, '网易新闻', NULL, 'http://news.163.com/', NULL, '新闻,新闻中心,包含有时政新闻,国内新闻,国际新闻,社会新闻,时事评论,新闻图片,新闻专题,新闻论坛,军事,历史,的专业时事报道门户网站', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (8, '腾讯新闻', NULL, 'http://news.qq.com/', '//mat1.gtimg.com/www/icon/favicon2.ico', '腾讯网从2003年创立至今，已经成为集新闻信息，区域垂直生活服务、社会化媒体资讯和产品为一体的互联网媒体平台。腾讯网下设新闻、科技、财经、娱乐、体育、汽车、时尚等多个频道，充分满足用户对不同类型资讯的需求。同时专注不同领域内容，打造精品栏目，并顺应技术发展趋势，推出网络直播等创新形式，改变了用户获取资讯的方式和习惯。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (9, '环球网', NULL, 'http://www.huanqiu.com/', '//rs2.huanqiucdn.cn/huanqiu/image/www/common/favicon1.ico', '环球网是中国领先的国际资讯门户，拥有独立采编权的中央重点新闻网站。环球网秉承环球时报的国际视野，力求及时、客观、权威、独立地报道新闻，致力于应用前沿的互联网技术，为全球化时代的中国互联网用户提供与国际生活相关的资讯服务、互动社区。未来会致力于打造全球化在线生活平台，成为中国与国际之间沟通与交流的桥梁。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (10, '龙珠直播', NULL, 'http://www.longzhu.com/', NULL, '龙珠直播，超全的足球赛事直播，丰富的游戏，运动，美食视频直播互动平台，提供世界杯，欧洲杯，美洲杯，中超，传奇世界私服，新开传奇私服，魔域私服，奇迹私服，完美私服，章鱼直播，户外直播，欢迎各位玩家，户外运动爱好者一起来直播互动。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (11, '界面', NULL, 'https://www.jiemian.com/', 'https://www.jiemian.com/./favicon.ico', '界面新闻是中国具有影响力的原创财经新媒体，以财经、商业新闻为核心，布局近40个内容频道，旗下同时拥有正午故事、箭厂视频、歪楼等数个知名新媒体品牌。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (12, '战旗直播', NULL, 'https://www.zhanqi.tv/', NULL, NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (13, '斗鱼直播', NULL, 'https://www.douyu.com/', NULL, '斗鱼 - 每个人的直播平台提供高清、快捷、流畅的视频直播和游戏赛事直播服务，包含英雄联盟lol直播、穿越火线cf直播、dota2直播、美女直播等各类热门游戏赛事直播和各种名家大神游戏直播，内容丰富，推送及时，带给你不一样的视听体验，一切尽在斗鱼 - 每个人的直播平台。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (14, '企鹅电竞', NULL, 'https://egame.qq.com/', 'https://egame.qq.com/favicon.ico', '企鹅电竞-超越游戏快乐，腾讯游戏官方直播平台，包含英雄联盟,主机单机,绝地求生,娱乐,王者荣耀,和平精英,穿越火线,地下城与勇士,CF手游,LOL云顶之弈,梦工厂,王牌战士等热门游戏直播以及单机游戏、手游等游戏直播，热门赛事直播与游戏直播，热门手游直播尽在企鹅电竞', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (15, '凤凰网', NULL, 'http://www.ifeng.com/', '//y0.ifengimg.com/index/favicon.ico', '凤凰网是中国领先的综合门户网站，提供含文图音视频的全方位综合新闻资讯、深度访谈、观点评论、财经产品、互动应用、分享社区等服务，同时与凤凰无线、凤凰宽频形成三屏联动，为全球主流华人提供互联网、无线通信、电视网三网融合无缝衔接的新媒体优质体验。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (16, '虎牙直播', NULL, 'http://www.huya.com/', NULL, NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (17, '直播吧', NULL, 'https://www.zhibo8.cc/', NULL, NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (18, '花椒直播', NULL, 'http://www.huajiao.com/', 'https://p5.ssl.qhimg.com/d/inn/e95686a7/favicon-32x32.png', '花椒直播，一个聚集超高颜值明星大咖、美女帅哥、热门网红、校花校草、逗比萌妹的手机直播社交平台，这里有明星发布会、花边新闻、才艺展示、生活趣闻、聊天互动、唱歌跳舞等等海量内容。花椒直播，全球首创萌颜直播，创造最萌潮流。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (19, '搜狐视频', NULL, 'https://tv.sohu.com/', NULL, '搜狐视频是搜狐旗下专业的综合视频网站，提供正版高清电影、电视剧、综艺、纪录片、动漫等。网罗最新最热新闻、娱乐资讯，同时提供免费视频空间和视频分享服务。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (20, '乐视视频', NULL, 'http://www.le.com/', NULL, '乐视视频是以正版,高清影视剧为主的视频门户,乐视旗下专业影视剧视频网站。为用户提供正版高清电影,电视剧,动漫,综艺等视频在线观看,以及视频分享,视频搜索等服务。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (21, 'CCTV', NULL, 'http://tv.cctv.com/', NULL, 'CCTV节目官网是中央电视台电视节目官方呈现平台，提供央视19个频道的直播、点播、节目预告等服务，集纳央视所有栏目、电影、电视剧、纪录片、动画片、体育赛事、特别节目资源，提供节目搜索、检索、点赞、分享、收藏等多种功能，用户覆盖210多个国家和地区，是网民了解央视、收看央视、参与央视的最佳渠道。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (22, '企鹅直播', NULL, 'http://live.qq.com/', 'http://live.qq.com/./nextStatic/favicon.ico', '免费看高清NBA直播、NFL橄榄球直播、足球直播、台球直播、CBA、欧冠意甲西甲直播同时还有国家健美冠军直播健身教你减肥练出好身材，更有高颜值美女主播解说体育赛事。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (23, 'YY直播', NULL, 'http://www.yy.com/', NULL, 'YY致力于打造全民娱乐的互动直播平台，以多样的美女互动、优质的直播内容、极致的互动体验，满足用户音乐、舞蹈、户外等直播及绝地求生、王者荣耀等热门游戏直播的观看需求。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (24, '哔哩哔哩', NULL, 'https://www.bilibili.com/', 'https://www.bilibili.com/./favicon.ico?v=1', 'bilibili是国内知名的视频弹幕网站，这里有及时的动漫新番，活跃的ACG氛围，有创意的Up主。大家可以在这里找到许多欢乐。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (25, '中华英才网', NULL, 'http://www.chinahr.com/', '//img.58cdn.com.cn/job/pc/chinahr/common/0.2/favicon.ico', '中华英才网重庆招聘网，为您提供重庆招聘，重庆找工作，重庆人才网，重庆求职信息，同时覆盖校园招聘、求职指导、职业测评、猎头服务等求职服务，中华英才网助您找到知名企业和高薪职位！', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (26, '芒果TV', NULL, 'http://www.mgtv.com/', 'http://www.mgtv.com/./favicon.ico', '芒果TV-大家都在看的在线视频网站-热门综艺最新电影电视剧在线观看', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (27, '土豆网', NULL, 'http://www.tudou.com/', NULL, '视频服务平台,提供视频播放,视频发布,视频搜索,视频分享', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (28, '五百丁', NULL, 'http://www.500d.me/', NULL, '五百丁创办于2014年，目前已有全球超过800万精英用户正在使用，是国内使用人数最多的免费简历制作工具，智能-高效-便捷-实用，广受求职者和专业HR喜爱，平台汇集了海量优秀行业范例，精美模板，可以满足求职者的各类简历需求，有效提升求职成功率，做好简历就上五百丁！', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (29, '腾讯视频', NULL, 'https://v.qq.com/', '//v.qq.com/favicon.ico', '腾讯视频致力于打造中国领先的在线视频媒体平台，以丰富的内容、极致的观看体验、便捷的登录方式、24小时多平台无缝应用体验以及快捷分享的产品特性，主要满足用户在线观看视频的需求。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (30, '京东商城', NULL, 'https://union-click.jd.com/', '//www.jd.com/favicon.ico', '京东JD.COM-专业的综合网上购物商城，为您提供正品低价的购物选择、优质便捷的服务体验。商品来自全球数十万品牌商家，囊括家电、手机、电脑、服装、居家、母婴、美妆、个护、食品、生鲜等丰富品类，满足各种购物需求。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (31, '猎聘网', NULL, 'https://www.liepin.com/', 'https://concat.lietou-static.com/fe-www-pc/v5/static/favicon.e6edbc00.ico', '猎聘是专业高效的招聘求职平台，为求职者提供海量高薪职位，在线沟通，快速反馈！为企业招聘方提供免费招人服务，优质人才，精准推荐，招人找工作就用猎聘聊！', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (32, '博客园', NULL, 'https://www.cnblogs.com/', '//common.cnblogs.com/favicon.svg', '博客园是一个面向开发者的知识分享社区。自创建以来，博客园一直致力并专注于为开发者打造一个纯净的技术交流社区，推动并帮助开发者通过互联网分享知识，从而让更多开发者从中受益。博客园的使命是帮助开发者用代码改变世界。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (33, '前程无忧', NULL, 'http://www.51job.com/', 'http://www.51job.com/./favicon.ico', '前程无忧人才网面向全国,提供2021准确的招聘网站信息,为企业和求职者提供人才招聘、求职、找工作、培训等在内的全方位的人力资源服务,更多求职找工作信息尽在前程无忧!', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (34, 'BOSS直聘', NULL, 'https://www.zhipin.com/', NULL, 'BOSS直聘重庆招聘网站，为求职者提供海量2021年重庆人才招聘信息。BOSS直聘重庆招聘网让求职者与Boss直接开聊、加快面试、即时反馈，找工作就来BOSS直聘和Boss开聊吧！', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (35, '智联招聘', NULL, 'http://www.zhaopin.com/', '//common-bucket.zhaopin.cn/img/zhilian-ico/zhilian-ico-1.0.0.png', '智联招聘全国招聘网是全国权威的求职找工作平台,为您提供真实准确的全国求职招聘信息,每天几百万的高薪职位招聘信息供您选择,找工作上智联招聘', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (36, 'Segmentfault', NULL, 'https://segmentfault.com/', 'https://cdn.segmentfault.com/r-339a8976/favicon.ico', 'SegmentFault 思否是中国领先的开发者技术社区。我们以技术问答、技术专栏、技术课程、技术资讯为核心的产品形态，为开发者提供纯粹、高质的技术交流平台。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (37, '苏宁数码', NULL, 'https://www.suning.com/', '//www.suning.com/favicon.ico', '苏宁易购-综合网上购物平台，商品涵盖家电、手机、电脑、超市、母婴、服装、百货、海外购等品类。送货更准时、价格更超值、上新货更快，正品行货、全国联保、可门店自提，全网更低价，让您放心去喜欢！', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (38, '开发者头条', NULL, 'https://toutiao.io/', 'https://toutiao.io/./android-icon-192x192.png', '开发者头条，程序员必装的App。使用开发者头条App，程序员可以阅读头条新闻、分享技术文章、发布开源项目，订阅技术极客/技术团队开通的独家号/团队号和关注编程牛人。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (39, '拉勾网', NULL, 'https://www.lagou.com/', NULL, '拉勾招聘是专业的互联网求职招聘网站。致力于提供真实可靠的互联网岗位求职招聘找工作信息，拥有海量的互联网人才储备，互联网行业找工作就上拉勾招聘，值得信赖的求职招聘网站。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (40, 'IT之家', NULL, 'https://www.ithome.com/', '//www.ithome.com/favicon.ico', 'IT之家，百度指数排名第一的前沿科技门户网站，青岛软媒旗下。快速播报科技行业新闻头条快讯和手机数码产品评测，关注智能车电动车、AR/VR虚拟现实、苹果iOS/iPadOS、鸿蒙OS、谷歌Android、微软Win11/Win10/Win7，紧盯iPhone/iPad、安卓智能设备手机等数码潮流。提供技术攻略教程、壁纸和App软件游戏资源下载。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (41, '京东数码', NULL, 'https://shuma.jd.com', '//www.jd.com/favicon.ico', '数码潮物天天好价', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (42, 'Chiphell', NULL, 'https://www.chiphell.com/', 'https://www.chiphell.com/./favicon-32x32.png', 'Chiphell - 分享与交流用户体验 ,Chiphell - 分享与交流用户体验', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (43, 'CSDN', NULL, 'https://www.csdn.net/', 'https://g.csdnimg.cn/static/logo/favicon32.ico', 'CSDN是全球知名中文IT技术交流平台,创建于1999年,包含原创博客、精品问答、职业培训、技术论坛、资源下载等产品服务,提供原创、优质、完整内容的专业IT技术开发社区.', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (44, '嘀哩嘀哩', NULL, 'http://www.dilidili.name/', NULL, NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (45, '数字尾巴', NULL, 'http://www.dgtle.com/', NULL, '致力于分享美好数字生活体验，囊括你闻所未闻的最丰富数码资讯，触所未触最抢鲜产品评测，随时随地感受尾巴们各式数字生活精彩图文、摄影感悟、旅行游记、爱物分享。旗下产品：精品电商平台「尾巴良品」 ；移动客户端「数字尾巴」 ，覆盖 iOS、Android 两大主流平台。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (46, 'ZEALER', NULL, 'http://www.zealer.com/', 'http://www.zealer.com/./favicon.ico', '是中国具有影响力的科技视频平台。创始人兼CEO王自如 和 ZEALER 坚持打造兼具行业洞察力与品质感的科技视频内容，输出「科技 Plus」生活主张。目前涵盖消费电子、智能家居、出行方式、娱乐游戏等科技生活内容。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (47, '汽车用品', NULL, 'https://che.jd.com/', '//www.jd.com/favicon.ico', NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (48, '中关村在线', NULL, 'http://www.zol.com', NULL, NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (49, '太平洋电脑', NULL, 'http://www.pconline.com', NULL, NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (50, '有妖气', NULL, 'http://www.u17.com/', 'http://www.u17.com/./favicon.ico', '中国唯一且最大的纯原创漫画网站，数千名中国原创漫画作者汇聚于此，在线连载最热门的全新漫画作品，为中国原创漫画作者提供最肥沃的漫画创作土壤。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (51, '开源中国', NULL, 'http://www.oschina.net/', 'https://static.oschina.net/new-osc/img/favicon.ico', 'OSCHINA.NET 是目前领先的中文开源技术社区。我们传播开源的理念，推广开源项目，为 IT 开发者提供了一个发现、使用、并交流开源技术的平台', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (52, '快看漫画', NULL, 'http://www.kuaikanmanhua.com/', 'https://festatic.v3mh.com/static-resource/img/32x32/favicon.ico', '快看漫画是引领行业的新生代漫画阅读平台和兴趣社区。它为用户提供优质原创漫画内容，营造良好的二次元社区氛围，成为年轻一代的潮流文化阵地。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (53, 'Engadget中国', NULL, 'https://cn.engadget.com/', 'https://s.yimg.com/cv/apiv2/engadget/engadget-favicon-32x32.png', '来自 Engadget 中国版团队的科技新闻和评测。掌握最新消费性电子产品消息。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (54, 'M站', NULL, 'http://www.missevan.com/', 'http://www.missevan.com/./images/index/favicon.ico', 'M站(猫耳FM)是第一家弹幕音图站,同时也是中国声优基地,在这里可以听电台,音乐,翻唱,小说和广播剧,用二次元声音连接三次元.', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (55, '半次元', NULL, 'https://bcy.net/', 'https://p3-bcy.bcyimg.com/obj/ttfe/bcy/web/bcy.ico', '半次元是ACG爱好者社区，汇聚了包括Coser、绘师、写手等创作者在内的众多ACG同好，提供cosplay、绘画和小说创作发表、二次元同好交流等社群服务。网站共设cosplay、绘画、写作、漫展、话题、视频、弹幕等多个频道。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (56, '腾讯动漫', NULL, 'http://ac.qq.com/', NULL, NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (57, 'AcFun', NULL, 'http://www.acfun.cn/', '//cdn.aixifan.com/ico/favicon.ico', 'AcFun是国内首家弹幕视频网站，这里有全网独家动漫新番， 友好的弹幕氛围，有趣的UP主，好玩有科技感的虚拟偶像，年轻人都在用。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (58, '优信二手车', NULL, 'https://www.xin.com/', '//www.xin.com/favicon.ico', '优信集团是国内首家美国上市二手车企业。通过专业的选品、严苛的检测标准、完善的售后服务，让消费者拥有好车更简单。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (59, '掘金', NULL, 'https://juejin.im/', 'https://juejin.im/./favicons/favicon-32x32.png', '掘金是一个帮助开发者成长的社区,是给开发者用的 Hacker News,给设计师用的 Designer News,和给产品经理用的 Medium。掘金的技术文章由稀土上聚集的技术大牛和极客共同编辑为你筛选出最优质的干货,其中包括：Android、iOS、前端、后端等方面的内容。用户每天都可以在这里找到技术世界的头条内容。与此同时,掘金内还有沸点、掘金翻译计划、线下活动、专栏文章等内容。即使你是 GitHub、StackOverflow、开源中国的用户,我们相信你也可以在这里有所收获。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (60, '瓜子二手车', NULL, 'https://www.guazi.com/', '//sta.guazi.com/static/c2c/wap/common/favicon.png', '北京二手车,急卖二手车,直面个人买家 好车卖出好价,瓜子二手车均经过259项检测,标准无事故,优质个人二手车,14天可退1年质保,个人二手车买卖首选瓜子二手车!', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (61, '易车网', NULL, 'http://www.yiche.com/', '//image.bitautoimg.com/yc-common/icon/favicon.ico', '作为中国领先的汽车互联网企业，易车公司为中国汽车用户提供专业、丰富的互联网资讯和导购服务，并为汽车厂商和汽车经销商提供卓有成效的互联网营销解决方案。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (62, '虎扑体育', NULL, 'https://www.hupu.com/', '//w1.hoopchina.com.cn/images/pc/old/favicon.ico', '虎扑是以体育赛事和日常生活为主的专业直文化社区网站,专注于NBA直播,NBA视频,NBA赛程,NBA常规赛,NBA季后赛,NBA总决赛,NBA新闻,英超,西甲,意甲,法甲,德甲,中超,欧冠,亚冠,游戏电竞,英雄联盟等全部篮球足球电竞排球赛事,以步行街为代表的专业论坛', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (63, '网易体育', NULL, 'http://sports.163.com/', NULL, '体育,体育频道,包含体育新闻,NBA,CBA,英超,意甲,西甲,冠军杯,体育比分,足彩,福彩,体育秀色,网球,F1,棋牌,乒羽,体育论坛,中超,中国足球,综合体育等专业体育门户网站', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (64, '网易漫画', NULL, 'https://manhua.163.com/', NULL, NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (65, '腾讯体育', NULL, 'http://sports.qq.com/', '//mat1.gtimg.com/www/icon/favicon2.ico', '腾讯体育是中国知名的体育门户网站，主要为您提供以下栏目：国内足球、国际足球、NBA、CBA、综合体育、奥运、直播、彩票、竞猜等，在各项指标中均树立了绝对领先地位。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (66, 'CCTV5', NULL, 'http://sports.cctv.com/', NULL, '央视网(cctv.com)体育提供最全面专业的体育赛事直播点播、图文资讯、评论报道，内容涵盖世界杯、国足、NBA、CBA、篮球、欧冠、亚冠、英超、意甲、法甲、欧洲国家联赛、欧洲杯、世界杯、足球、综合体育、奥运会等国内外重大赛事，以及CCTV所有体育类节目、栏目的信息和内容。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (67, '去哪儿', NULL, 'https://www.qunar.com', NULL, '去哪儿Qunar.com提供机票,飞机票,特价机票,打折机票的查询预订；99元春秋航空特惠折扣机票，百元南航、海航惊喜特价机票任您挑选,国航、深航1折特价机票和折扣机票一网打尽，更多打折机票尽在Qunar.com。实时提供上百家旅游预订网站机票报价和航空公司直销机票价格，为您找到最实惠的飞机票信息,是你查询特价机票和机票预订的最佳途径。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (68, '途牛', NULL, 'http://www.tuniu.com', NULL, NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (69, 'NBA', NULL, 'http://china.nba.com/', '//mat1.gtimg.com/chinanba/images/favicon.ico', 'NBA中国官方网站', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (70, '同程网', NULL, 'https://www.ly.com', NULL, '同程旅行(LY.COM)是一家专业的一站式旅游预订平台，提供近万家景点门票、特价机票、出国旅游、周边游、自驾游及酒店预订服务；专业旅游线路服务、让您的旅行更安心！', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (71, '人人车', NULL, 'https://www.renrenche.com/', '//img1.rrcimg.com/dist/pc/images/favicon-60ac45c9.ico', '人人车重庆二手车市场,重庆二手车交易市场,为您提供重庆二手车交易信息,重庆二手车出手转让信息,免费提供重庆二手车评估,重庆二手车报价,详询4000350113！', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (72, '懂球帝', NULL, 'http://www.dongqiudi.com/', 'http://www.dongqiudi.com/./favicon.ico', '懂球帝是中超官方合作伙伴，提供免费高清中超比赛直播，全方位报道中超联赛新闻资讯，覆盖广州、山东泰山、北京国安、上海海港、上海申花、大连人、天津津门虎、深圳等球队动态，提供直播、集锦、数据、图集等多种形式的优质内容', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (73, '驴妈妈', NULL, 'http://www.lvmama.com', NULL, NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (74, '穷游网', NULL, 'https://www.qyer.com/', '//www.qyer.com/favicon.ico', '【穷游网】鼓励和帮助中国旅行者以自己的视角和方式体验世界，为旅行者提供专业、实用、全面的游旅行指南和旅游攻略，是中国旅行者们分享旅游目的地信息和游记攻略的平台。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (75, '酷狗音乐', NULL, 'http://www.kugou.com/', 'https://www.kugou.com/root/favicon.ico', '酷狗音乐旗下最新最全的在线正版音乐网站，本站为您免费提供最全的在线音乐试听下载，以及全球海量电台和MV播放服务、最新音乐播放器下载。酷狗音乐 和音乐在一起。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (76, '酷我音乐', NULL, 'http://www.kuwo.cn/', 'http://www.kuwo.cn/./favicon.ico', '酷我音乐-无损音质正版在线试听网站，酷我音乐为您提供高品质音乐，无损音乐下载，拥有各类音乐榜单，快捷的新歌速递，完善的主题电台，个性化的歌曲推荐，高品质音乐在线听，好音质，用酷我。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (77, '虾米音乐', NULL, 'http://www.xiami.com/', '//img.alicdn.com/tfs/TB1qP4zgY5YBuNjSspoXXbeNFXa-550-550.png', NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (78, '荔枝FM', NULL, 'https://www.lizhi.fm/', 'https://www.lizhi.fm/./assets/images/7e999851b414e3618f538e52561987a9-favicon.ico?y=2018', '荔枝是专业的音频分享平台,汇集了听音乐,英语,睡前故事,儿童故事,有声小说,相声段子,历史人文,有声书等数亿条音频,超过2亿用户选择的网络FM,随时随地，想听就听，你喜爱的音频尽在荔枝。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (79, '搜狐体育', NULL, 'http://sports.sohu.com/', '//statics.itc.cn/web/static/images/pic/sohu-logo/favicon.ico', '搜狐体育是中国知名的体育媒体，是受体育迷欢迎的网络资讯及互动平台。频道集赛事新闻报道、赛事视频转播、体育资讯服务、自媒体内容互动于一体，着力打造国内有影响力的体育媒体。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (80, '喜马拉雅', NULL, 'http://www.ximalaya.com/', NULL, '喜马拉雅是专业的音频分享平台,汇集了有声小说,有声读物,有声书,FM电台,儿童睡前故事,相声小品,鬼故事等数亿条音频,超过6亿用户选择的网络电台,随时随地,听我想听。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (81, 'QQ音乐', NULL, 'https://y.qq.com/', '//y.qq.com/favicon.ico?max_age=2592000', 'QQ音乐是腾讯公司推出的一款免费音乐服务，海量音乐在线试听、最流行音乐在线首发、歌词翻译、手机铃声下载、高品质音乐试听、正版音乐下载、免费空间背景音乐设置、MV观看等，是互联网音乐播放和下载的首选', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (82, '携程网', NULL, 'https://www.ctrip.com/', NULL, '携程旅行网是中国领先的在线旅行服务公司，向超过9000万会员提供酒店预订、酒店点评及特价酒店查询、机票预订、飞机票查询、时刻表、票价查询、航班查询、度假预订、商旅管理、为您的出行提供全方位旅行服务。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (83, '网易云音乐', NULL, 'http://music.163.com/', '//s1.music.126.net/style/favicon.ico?v20180823', '网易云音乐是一款专注于发现与分享的音乐产品，依托专业音乐人、DJ、好友推荐及社交功能，为用户打造全新的音乐生活。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (84, '蜻蜓FM', NULL, 'http://www.qingting.fm/', NULL, '蜻蜓FM，不仅囊括数千家FM广播电台，还涵盖有声小说、儿童故事、相声评书、戏曲、音乐、脱口秀、鬼故事、情感故事、财经科技、新闻历史人文、健康教育等30多类的有声读物或音频节目。更有高晓松、老梁、张召忠、蒋勋等精品有声读物和音频在线收听。蜻蜓FM作为用户喜爱的有声听书应用，为广大听众呈现前沿丰富的有声读物、有声小说和广播电台节目。下载蜻蜓fm，听书听小说听电台，更多的世界用听的。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (85, '爱卡汽车', NULL, 'http://www.xcar.com', NULL, '爱卡汽车网为您提供最新汽车报价、汽车图片、车型资料、汽车论坛、汽车资讯信息,XCAR-爱卡汽车网是中国领先的汽车主题社区,其中包括85个主流品牌车型俱乐部,国内32个省市和地区分会,36个特色讨论区。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (86, '花瓣网', NULL, 'https://huaban.com', NULL, '花瓣网, 设计师寻找灵感的天堂！图片素材领导者，帮你采集、发现网络上你喜欢的事物。你可以用它收集灵感,保存有用的素材,计划旅行,晒晒自己想要的东西', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (87, '汽车之家', NULL, 'https://www.autohome.com', NULL, '汽车之家为您提供最新汽车报价，汽车图片，汽车价格大全，最精彩的汽车新闻、行情、评测、导购内容，是提供信息最快最全的中国汽车网站。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (88, '包图网', NULL, 'https://ibaotu.com/', NULL, '包图网汇集了各种视觉冲击力强的原创广告图片设计、电商淘宝、企业办公模板、视频、配乐、音效、字体、插画动图、装饰模型等素材，由顶尖的设计师供稿，符合各个行业的商用需求，下载高品质正版素材就到包图网。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (89, '摄图网', NULL, 'http://699pic.com/', NULL, '摄图网是一家专注于正版摄影高清图片素材免费下载的图库作品网站,提供手绘插画,海报,ppt模板,科技,城市,商务,建筑,风景,美食,家居,外景,背景等好看的图片设计素材大全可供下载。摄图摄影师5000+入驻并进行交流成长，百万图片量和设计师在这里找到满意的图片素材和设计灵感!', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (90, 'Iconfont', NULL, 'https://www.iconfont.cn', '//img.alicdn.com/imgextra/i2/O1CN01ZyAlrn1MwaMhqz36G_!!6000000001499-73-tps-64-64.ico', 'iconfont-国内功能很强大且图标内容很丰富的矢量图标库，提供矢量图标下载、在线存储、格式转换等功能。阿里巴巴体验团队倾力打造，设计和前端开发的便捷工具', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (91, '猫扑网', NULL, 'http://www.mop.com/', 'http://www.mop.com/./favicon.ico', '猫扑网络流行文化发源地，汇集大杂烩，贴贴、视频、娱乐新闻、文学、汽车等内容为一体的娱乐资讯聚合移动新媒体。坚持BT和YY的娱乐精神，结合大数据，深度挖掘新闻背后的故事，为用户推荐最热门的流行资讯。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (92, '天涯社区', NULL, 'http://focus.tianya.cn/', NULL, '天涯社区首页, 天涯首页. 网络人物网络事件的发源地, 网络名词网络流行语的创造者.', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (93, '西祠胡同', NULL, 'http://www.xici.net/', 'http://www.xici.net/./assets/favicon.ico', '西祠胡同(www.xici.net),是国内首创的网友“自行开版、自行管理、自行发展”的开放式社区平台,致力于为各地用户提供便捷的生活交流空间与本地生活服务平台。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (94, '站酷', NULL, 'https://www.zcool.com', '//img.sedoparking.com/templates/logos/sedo_logo.png', NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (95, 'Dribbble', NULL, 'https://dribbble.com', 'https://cdn.dribbble.com/assets/favicon-b38525134603b9513174ec887944bde1a869eb6cd414f4d640ee48ab2a15a26b.ico', 'Dribbble is where designers gain inspiration, feedback, community, and jobs and is your best resource to discover and connect with designers worldwide.', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (96, '豆瓣FM', NULL, 'https://douban.fm/', 'https://img3.doubanio.com/f/fm/55cc7ebd1777d5101a82d7d6ce47ffc5e114131d/pics/fm/san_favicon.ico', NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (97, '中国经济网', NULL, 'http://www.ce.cn/', NULL, NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (98, '豆瓣', NULL, 'https://www.douban.com/', NULL, '提供图书、电影、音乐唱片的推荐、评论和价格比较，以及城市独特的文化生活。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (99, '知乎', NULL, 'https://www.zhihu.com/', 'https://static.zhihu.com/heifetz/favicon.ico', '知乎，中文互联网高质量的问答社区和创作者聚集的原创内容平台，于 2011 年 1 月正式上线，以「让人们更好地分享知识、经验和见解，找到自己的解答」为品牌使命。知乎凭借认真、专业、友善的社区氛围、独特的产品机制以及结构化和易获得的优质内容，聚集了中文互联网科技、商业、影视、时尚、文化等领域最具创造力的人群，已成为综合性、全品类、在诸多领域具有关键影响力的知识分享社区和创作者聚集的原创内容平台，建立起了以社区驱动的内容变现商业模式。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (100, '网易财经', NULL, 'http://money.163.com/', NULL, '网易财经，新闻报道以内容整合、网友互动、主动出击为核心链条，为网友提供宏观、股票、商业、理财等财经领域的终结式报道；依托网易强大的的技术优势，提供实时的全球金融市场数据更新和实时解读，并提供操盘建议，挖掘投资机会。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (101, '第一财经', NULL, 'https://www.yicai.com/', 'https://www.yicai.com/./favicon.ico', '第一财经官方网站，7X24小时提供股市行情、经济大势、金融政策、行业动态、专家分析等财经资讯；全网独家直播谈股论金、今日股市、公司与行业、解码财商、头脑风暴等第一财经电视节目。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (102, '和讯财经', NULL, 'http://www.hexun.com/', NULL, '和讯网-中国财经网络领袖和中产阶级网络家园，创立于1996年，为您全方位提供财经资讯及全球金融市场行情，覆盖股票、基金、期货、股指期货、外汇、债券、保险、银行、黄金、理财、股吧、博客等财经综合信息', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (103, '财新网', NULL, 'http://www.caixin.com/', NULL, '财新网（caixin.com）与财新《财新周刊》、财新《中国改革》、《比较》同属财新传媒。财新网定位于原创财经新媒体，整合资讯、观点、多媒体、互动等信息时代形态丰富的媒体产品，以客观、专业的视角，实时输出高品质原创内容，为中国政界、学界和产业界精英提供每日经济活动必需的财经新闻和资讯评论', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (104, '东方财富', NULL, 'http://www.eastmoney.com/', '//g1.dfcfw.com/g1/special/favicon_shortcut.ico', '东方财富网，专业的互联网财经媒体，提供7*24小时财经资讯及全球金融市场报价，汇聚全方位的综合财经资讯和金融市场资讯，覆盖股票、财经、证券、金融、美股、港股、行情、基金、债券、期货、外汇、科创板、保险、信托、黄金、理财、商业、银行、博客、股吧、财迷、论坛等财经综合信息', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (105, '雪球财经', NULL, 'https://xueqiu.com/', '//assets.imedao.com/images/favicon.png', '雪球，聪明的投资者都在这里 - 3500万投资者都在用的投资社区，沪深港美全球市场实时行情，股票基金债券免费资讯，与投资高手实战交流。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (106, '证券之星', NULL, 'http://www.stockstar.com/', NULL, '证券之星——专为华人交易者提供服务的财经门户网站；作为资深交易者门户，证券之星是全球华人交易者获取全方位海量金融资讯信息、交流投资经验的平台。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (107, '环球军事', NULL, 'http://mil.huanqiu.com/', '//rs2.huanqiucdn.cn/huanqiu/image/www/common/favicon1.ico', '环球网军事新闻频道是中国权威的军事新闻网站之一,为您报道中国、国际等军事新闻及军情谍报。包括:中国军事、国际军事、军事热点等独家军事报道。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (108, '凤凰军事', NULL, 'http://news.ifeng.com/', '//y0.ifengimg.com/index/favicon.ico', NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (109, '百度贴吧', NULL, 'https://tieba.baidu.com/', '//tb1.bdstatic.com/tb/favicon.ico', NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (110, '米尔网', NULL, 'http://www.miercn.com/', NULL, NULL, '2021-07-27');
INSERT INTO `navigation_msg` VALUES (111, '腾讯军事', NULL, 'https://new.qq.com/', '//mat1.gtimg.com/www/icon/favicon2.ico', '腾讯网从2003年创立至今，已经成为集新闻信息，区域垂直生活服务、社会化媒体资讯和产品为一体的互联网媒体平台。腾讯网下设新闻、科技、财经、娱乐、体育、汽车、时尚等多个频道，充分满足用户对不同类型资讯的需求。同时专注不同领域内容，打造精品栏目，并顺应技术发展趋势，推出网络直播等创新形式，改变了用户获取资讯的方式和习惯。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (112, '军事头条', NULL, 'http://mil.eastday.com/', 'http://mil.eastday.com/./ns/_public/images/favicon.ico', '东方军事网是东方网旗下的专业军事新闻网站，为军事迷提供中国军事，国际军事报道，深度解析全球军力,及时追踪尖端军事武器装备,海陆空军事图库等。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (113, '网易严选', NULL, 'http://you.163.com/', 'http://you.163.com/./favicon.ico?r=newgold', '网易严选秉承网易一贯的严谨态度，深入世界各地，严格把关所有商品的产地、工艺、原材料，甄选居家、厨房、饮食等各类商品，力求给你最优质的商品。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (114, '中华网军事', NULL, 'http://military.china.com/', NULL, '中华网军事频道是中国权威军事网站，主要有以下栏目：军事新闻、每日军情参考、台海形势、中国军情、国际军情、军事专题、网友原创、军事视频、军事图库。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (115, '铁血军事', NULL, 'http://www.tiexue.net/', NULL, '铁血网', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (116, '网易考拉', NULL, 'https://www.kaola.com', '//img.alicdn.com/tfs/TB13g4aqXP7gK0jSZFjXXc5aXXa-32-32.ico', '考拉海购-阿里巴巴旗下以跨境业务为主的会员电商，主打官方自营，全球直采的模式，为会员精选全球品质好货，保证极致性价比，全方位服务黑卡会员。', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (117, '优酷', NULL, 'http://www.youku.com', NULL, '视频服务平台,提供视频播放,视频发布,视频搜索,视频分享', '2021-07-27');
INSERT INTO `navigation_msg` VALUES (118, '爱奇艺', NULL, 'http://www.iqiyi.com', '//www.iqiyipic.com/common/fix/128-128-logo.png', '爱奇艺（iQIYI.COM）是拥有海量、优质、高清的网络视频的大型视频网站，专业的网络视频播放平台。爱奇艺影视内容丰富多元，涵盖电影、电视剧、动漫、综艺、生活、音乐、搞笑、财经、军事、体育、片花、资讯、微电影、儿童、母婴、教育、科技、时尚、原创、公益、游戏、旅游、拍客、汽车、纪录片、爱奇艺自制剧等剧目。视频播放清晰流畅，操作界面简单友好，真正为用户带来“悦享品质”的在线观看体验。', '2021-07-27');

SET FOREIGN_KEY_CHECKS = 1;
