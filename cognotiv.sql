/*
 Navicat Premium Data Transfer

 Source Server         : Localhost - MySQL
 Source Server Type    : MySQL
 Source Server Version : 100419
 Source Host           : localhost:3306
 Source Schema         : cognotiv

 Target Server Type    : MySQL
 Target Server Version : 100419
 File Encoding         : 65001

 Date: 11/10/2023 08:57:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `publish_date` date NULL DEFAULT NULL,
  `is_publish` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'yes',
  `is_delete` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'no',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (2, 3, 'Test Post 1', 'content bla bla bla', '2023-10-11', 'yes', 'no', '2023-10-11 03:40:44', '2023-10-11 03:51:16');
INSERT INTO `blog` VALUES (3, 3, 'Test Post 2', 'content bla bla bla', '2023-10-11', 'yes', 'no', '2023-10-11 03:51:07', '2023-10-11 03:51:07');
INSERT INTO `blog` VALUES (4, 12, 'Test Post 2', 'content bla bla bla', '2023-10-11', 'yes', 'no', '2023-10-11 04:41:48', '2023-10-11 04:41:48');

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(255) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_like` int(11) NULL DEFAULT NULL,
  `total_dislake` int(11) NULL DEFAULT NULL,
  `is_delete` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'no',
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_blog`(`blog_id`) USING BTREE,
  INDEX `fl_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_blog` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fl_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES (1, 2, 12, 'commen bla-bla', NULL, NULL, 'no', '2023-10-11 05:00:58', '2023-10-11 05:00:58');
INSERT INTO `blog_comment` VALUES (2, 3, 12, 'commen bla-bla', NULL, NULL, 'no', '2023-10-11 05:01:06', '2023-10-11 05:01:06');

-- ----------------------------
-- Table structure for blog_comment_like
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment_like`;
CREATE TABLE `blog_comment_like`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_comment_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `is_like` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'yes',
  `is_delete` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'no',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blog_comment_id`(`blog_comment_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `blog_comment_like_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_comment_like_ibfk_3` FOREIGN KEY (`blog_comment_id`) REFERENCES `blog_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_comment_like
-- ----------------------------
INSERT INTO `blog_comment_like` VALUES (1, 1, 12, 'no', 'no', '2023-10-11 05:27:16', '2023-10-11 05:27:16');
INSERT INTO `blog_comment_like` VALUES (2, 2, 12, 'no', 'no', '2023-10-11 05:27:23', '2023-10-11 05:27:23');
INSERT INTO `blog_comment_like` VALUES (3, 2, 12, 'yes', 'no', '2023-10-11 05:27:37', '2023-10-11 05:27:37');

-- ----------------------------
-- Table structure for blog_like
-- ----------------------------
DROP TABLE IF EXISTS `blog_like`;
CREATE TABLE `blog_like`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `is_like` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_delete` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `blog_id`(`blog_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `blog_like_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `blog_like_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_like
-- ----------------------------
INSERT INTO `blog_like` VALUES (3, 2, 12, 'yes', NULL, '2023-10-11 05:21:28', '2023-10-11 05:21:28');
INSERT INTO `blog_like` VALUES (4, 3, 12, 'yes', NULL, '2023-10-11 05:21:34', '2023-10-11 05:21:34');
INSERT INTO `blog_like` VALUES (5, 3, 12, 'yes', NULL, '2023-10-11 05:21:42', '2023-10-11 05:21:42');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` enum('admin','user','') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_active` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'yes',
  `is_delete` enum('yes','no') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'no',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (3, 'user', 'dendie.sanjaya@gmail.com', '$2y$10$GHLB3fxSSncE3x6ecBYRTepqqPSW9PNdg./Yje3VgqMFBlyDddpLC', 'Dendie Sanjaya', '49ac609d435e662ff05f4580450c3449', 'yes', 'no', '2023-10-10 20:44:40', '2023-10-10 21:25:41');
INSERT INTO `users` VALUES (12, 'user', 'anisa.mutiara.adelia@gmail.com', '$2y$10$DzbvL96chiSy0MsXszyq7esa/JEd2rfc4bG5/eEj24QIAacZ9Wtdq', 'Anisa Mutiara Adelia', '88d9e97efa086184ecc70a58603afc4f', 'yes', 'no', '2023-10-11 04:38:05', '2023-10-11 04:41:01');

SET FOREIGN_KEY_CHECKS = 1;
