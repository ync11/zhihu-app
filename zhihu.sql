/*
 Navicat Premium Data Transfer

 Source Server         : 47.102.113.246
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : 47.102.113.246:3306
 Source Schema         : zhihu

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 24/07/2020 11:23:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answers
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(0) UNSIGNED NOT NULL,
  `question_id` int(0) UNSIGNED NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `votes_count` int(0) NOT NULL DEFAULT 0,
  `comments_count` int(0) NOT NULL DEFAULT 0,
  `is_hidden` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `close_comment` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `answers_user_id_index`(`user_id`) USING BTREE,
  INDEX `answers_question_id_index`(`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answers
-- ----------------------------
INSERT INTO `answers` VALUES (1, 1, 2, '<p>不够</p>', 0, 0, 'F', 'F', '2020-06-18 16:10:45', '2020-06-18 16:10:45');
INSERT INTO `answers` VALUES (2, 1, 2, '<p>不够123456</p>', 0, 0, 'F', 'F', '2020-06-18 16:14:04', '2020-06-18 16:14:04');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2020_05_18_102957_create_questions_table', 2);
INSERT INTO `migrations` VALUES (4, '2020_05_22_144019_create_topics_table', 3);
INSERT INTO `migrations` VALUES (5, '2020_05_22_145822_create_questions_topics_table', 3);
INSERT INTO `migrations` VALUES (6, '2020_06_04_153401_create_answers_table', 4);
INSERT INTO `migrations` VALUES (7, '2020_06_19_163051_create_user_question_table', 5);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for question_topic
-- ----------------------------
DROP TABLE IF EXISTS `question_topic`;
CREATE TABLE `question_topic`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_id` int(0) UNSIGNED NOT NULL,
  `topic_id` int(0) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `question_topic_question_id_index`(`question_id`) USING BTREE,
  INDEX `question_topic_topic_id_index`(`topic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_topic
-- ----------------------------
INSERT INTO `question_topic` VALUES (1, 7, 5, '2020-05-26 17:08:07', '2020-05-26 17:08:07');
INSERT INTO `question_topic` VALUES (2, 7, 1, '2020-05-26 17:08:07', '2020-05-26 17:08:07');
INSERT INTO `question_topic` VALUES (4, 7, 6, '2020-05-29 17:20:06', '2020-05-29 17:20:06');

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(0) UNSIGNED NOT NULL,
  `comments_count` int(0) NOT NULL DEFAULT 0,
  `followers_count` int(0) NOT NULL DEFAULT 1,
  `answers_count` int(0) NOT NULL DEFAULT 0,
  `close_comment` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `is_hidden` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (1, '123124', '<p>21324124</p>', 1, 0, 1, 0, 'F', 'F', '2020-05-18 16:33:10', '2020-05-18 16:33:10');
INSERT INTO `questions` VALUES (2, '对程序员来说 512G 的 MacBook Pro 够用吗？', '<p>有必要，求求你了，除非你日后想到处挂着外接SSD或者只在有网络的地方用NAS存东西。如果再给我一次机会，我一定买最大的硬盘……否则可能出现：</p><ul class=\" list-paddingleft-2\"><li><p>pd虚拟机用一次reset一次</p></li><li><p>docker一周清理一次run c</p></li><li><p>相对于Jetbrains IDE更倾向于选择要一大堆插件还不那么好用的VSC</p></li><li><p>音乐不敢缓存无损</p></li><li><p>看剧看一季删一季（或者移到NAS</p></li><li><p>Dota这个大小的游戏基本不敢装</p></li></ul><p>如果说除了日常生活和写代码之外还有别的需求，可能还有：</p><ul class=\" list-paddingleft-2\"><li><p>RAW照片只能放NAS，本地留筛选过的</p></li><li><p>做视频素材只能从NAS取，保证体验需要SSD+万兆局域网</p></li><li><p>图集的印刷版DMG文件只能放NAS，本地留个PDF</p></li></ul><p>对于Macbook，写代码为主要用途的话，选购标准一般是：乞丐版/乞丐版高一级的CPU，16G内存，价格接受范围内<strong>最大的</strong>硬盘。</p><p>加钱顺序是：（如果明确有大量内存需要先加到32g内存）更大的硬盘，更大的内存，更高的CPU。</p>', 1, 0, 1, 2, 'F', 'F', '2020-05-18 16:38:33', '2020-06-18 16:14:05');
INSERT INTO `questions` VALUES (3, '12321312', '<p>122132142<img src=\"http://localhost/storage/uploads/image/2020/05/20/ff0659c5ad846994f746a72b41aa4a86.jpg\" title=\"/uploads/image/2020/05/20/ff0659c5ad846994f746a72b41aa4a86.jpg\" alt=\"test.jpg\"/></p>', 1, 0, 1, 0, 'F', 'F', '2020-05-20 11:57:36', '2020-05-20 11:57:36');
INSERT INTO `questions` VALUES (4, '12321312434', '<p>122132142<img src=\"http://localhost/storage/uploads/image/2020/05/20/ff0659c5ad846994f746a72b41aa4a86.jpg\" title=\"/uploads/image/2020/05/20/ff0659c5ad846994f746a72b41aa4a86.jpg\" alt=\"test.jpg\"/><img src=\"http://localhost/storage/uploads/image/2020/05/20/9477e00b88afd2fac940bbb82d11d9cc.jpg\" title=\"/uploads/image/2020/05/20/9477e00b88afd2fac940bbb82d11d9cc.jpg\" alt=\"default.jpg\"/></p>', 1, 0, 1, 0, 'F', 'F', '2020-05-20 13:45:50', '2020-05-20 13:45:50');
INSERT INTO `questions` VALUES (5, '1232123122112', '<p><img src=\"http://localhost/storage/uploads/image/2020/05/20/4b3c7af31ab7f868205b673a8b356213.jpg\" style=\"\" title=\"/uploads/image/2020/05/20/4b3c7af31ab7f868205b673a8b356213.jpg\"/></p><p><img src=\"http://localhost/storage/uploads/image/2020/05/20/3611bf82b317a3e9543acc92e554bcba.jpg\" style=\"\" title=\"/uploads/image/2020/05/20/3611bf82b317a3e9543acc92e554bcba.jpg\"/></p><p><br/></p>', 1, 0, 1, 0, 'F', 'F', '2020-05-20 13:51:12', '2020-05-20 13:51:12');

-- ----------------------------
-- Table structure for topics
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `questions_count` int(0) NOT NULL DEFAULT 0,
  `followers_count` int(0) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topics
-- ----------------------------
INSERT INTO `topics` VALUES (1, 'PHP', 'Aliquid velit eos fugiat et fuga maiores autem omnis. Beatae voluptates sint facere quasi. Ratione at placeat minus. Quaerat blanditiis facilis beatae.', 4, 0, '2020-05-26 15:35:47', '2020-05-29 17:20:06');
INSERT INTO `topics` VALUES (2, 'Laravel', 'Temporibus suscipit eos voluptatem et nihil. Quia omnis quis non consequatur.', 1, 0, '2020-05-26 15:35:47', '2020-05-26 15:35:47');
INSERT INTO `topics` VALUES (3, '前端', 'Deserunt nemo eligendi quasi nihil qui. Laboriosam molestias aut in expedita nihil. Eum ut odio magnam cupiditate. Velit asperiores tempore et. Esse rem sint quos sed reprehenderit.', 1, 0, '2020-05-26 15:35:47', '2020-05-26 15:35:47');
INSERT INTO `topics` VALUES (4, '框架', 'Fuga accusamus aperiam unde aut. Et sit libero inventore sequi eius animi voluptatem. Et necessitatibus autem ex deleniti inventore libero. Non sit sint nihil assumenda quam odit aperiam vel.', 1, 0, '2020-05-26 15:35:47', '2020-05-26 15:35:47');
INSERT INTO `topics` VALUES (5, 'Laravel 框架', 'Et recusandae velit vero sapiente ab et optio quis. Nam vitae dolores autem omnis. Repellat odio quasi possimus ullam blanditiis qui. Iste dolores ipsam corporis magnam earum. Labore animi inventore cumque ea praesentium ad harum quasi.', 4, 0, '2020-05-26 15:35:47', '2020-05-29 17:20:06');
INSERT INTO `topics` VALUES (6, '前端框架', 'Et et sunt voluptatem officiis necessitatibus est placeat. Modi adipisci ea sit perferendis. Adipisci illum et rerum aspernatur eos.', 2, 0, '2020-05-26 15:35:47', '2020-05-29 17:20:06');
INSERT INTO `topics` VALUES (7, '学习', 'Facere in dolore consequatur magni. Maxime qui molestiae sint doloremque rerum maiores neque. Reprehenderit error veritatis rem neque. Qui in ut harum.', 1, 0, '2020-05-26 15:35:47', '2020-05-26 15:35:47');
INSERT INTO `topics` VALUES (8, 'rerum', 'Ex veritatis sit culpa ut et qui laborum. Et odit nesciunt consequatur sit ipsum omnis dolorem quas. Ut optio eaque eum rem dolores illum consequatur voluptas. Possimus veniam minus vero quae error quia alias.', 1, 0, '2020-05-26 15:35:47', '2020-05-26 15:35:47');
INSERT INTO `topics` VALUES (9, 'ipsa', 'Dolorum fugit culpa adipisci enim. Ut architecto at rerum. Voluptatibus occaecati aperiam minus quod ducimus.', 1, 0, '2020-05-26 15:35:47', '2020-05-26 15:35:47');
INSERT INTO `topics` VALUES (10, 'sed', 'Ducimus rem debitis esse sed fuga et nemo. Neque dolor veritatis ducimus quo molestiae illo laudantium. Sed aut aperiam voluptas ut.', 1, 0, '2020-05-26 15:35:47', '2020-05-26 15:35:47');
INSERT INTO `topics` VALUES (11, 'adipisci', 'Exercitationem rerum qui voluptas minus quo provident quo. Itaque voluptas expedita iure nostrum. Quo sint et maiores voluptates enim eum. Porro eaque libero similique ipsam.', 1, 0, '2020-05-26 15:35:47', '2020-05-26 15:35:47');
INSERT INTO `topics` VALUES (12, 'Test', NULL, 1, 0, '2020-05-26 17:08:07', '2020-05-26 17:08:07');

-- ----------------------------
-- Table structure for user_question
-- ----------------------------
DROP TABLE IF EXISTS `user_question`;
CREATE TABLE `user_question`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(0) UNSIGNED NOT NULL,
  `question_id` int(0) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_question_user_id_index`(`user_id`) USING BTREE,
  INDEX `user_question_question_id_index`(`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_question
-- ----------------------------
INSERT INTO `user_question` VALUES (2, 1, 2, '2020-06-22 15:32:09', '2020-06-22 15:32:09');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmation_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` smallint(0) NOT NULL DEFAULT 0,
  `questions_count` int(0) NOT NULL DEFAULT 0,
  `answers_count` int(0) NOT NULL DEFAULT 0,
  `comments_count` int(0) NOT NULL DEFAULT 0,
  `favorites_count` int(0) NOT NULL DEFAULT 0,
  `likes_count` int(0) NOT NULL DEFAULT 0,
  `followers_count` int(0) NOT NULL DEFAULT 0,
  `followings_count` int(0) NOT NULL DEFAULT 0,
  `settings` json NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'ync11', '1137547202@qq.com', NULL, '$2y$10$GgpCO02yWk2XJPc3.EJFXeEZRDdjRTOOSQ0OGGWLIIaOHi0qmA0Gy', '/images/avatars/default.jpg', 'dNrP6duBngu6rEFpEPkUV6meJslU6cx4G1uksAlA', 1, 0, 0, 0, 0, 0, 0, 0, NULL, 'Z7aNuFI0BsvCa4As4mzop1PQPKC5jgp7no5wLxEJviWz9YKZoQjBvFkZNx7V', '2020-05-14 09:39:58', '2020-05-14 17:06:00');

SET FOREIGN_KEY_CHECKS = 1;
