/*
Navicat MySQL Data Transfer

Source Server         : 本地ROOT
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : lanbweb

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-08-28 18:02:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for code_info
-- ----------------------------
DROP TABLE IF EXISTS `code_info`;
CREATE TABLE `code_info` (
  `code_info_id` varchar(255) NOT NULL COMMENT '代码信息ID',
  `code_type_id` varchar(255) DEFAULT NULL COMMENT '代码类型ID',
  `name` varchar(255) DEFAULT NULL COMMENT '代码名',
  `value` varchar(255) DEFAULT NULL COMMENT '代码值',
  `sort` int(255) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`code_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for code_type
-- ----------------------------
DROP TABLE IF EXISTS `code_type`;
CREATE TABLE `code_type` (
  `code_type_id` varchar(255) NOT NULL DEFAULT '' COMMENT '代码类型ID',
  `code_type_name` varchar(255) DEFAULT NULL COMMENT '代码类型名',
  PRIMARY KEY (`code_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `config_id` varchar(255) NOT NULL COMMENT '配置ID',
  `config_name` varchar(255) DEFAULT NULL COMMENT '配置名',
  `config_value` varchar(255) DEFAULT NULL COMMENT '配置值',
  `sort_no` int(11) DEFAULT '0' COMMENT '排序',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo` (
  `demo_id` varchar(255) NOT NULL DEFAULT '' COMMENT '例子ID',
  `demo_name` varchar(255) DEFAULT '' COMMENT '例子名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`demo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menu_id` varchar(255) NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(255) DEFAULT '' COMMENT '菜单名称',
  `parent_menu_id` varchar(255) DEFAULT '' COMMENT '父菜单ID',
  `menu_url` varchar(255) DEFAULT '' COMMENT '菜单地址',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `visible` int(11) DEFAULT '0' COMMENT '是否可见',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Table structure for org
-- ----------------------------
DROP TABLE IF EXISTS `org`;
CREATE TABLE `org` (
  `org_id` varchar(255) NOT NULL COMMENT '机构ID',
  `org_name` varchar(255) DEFAULT NULL COMMENT '机构名',
  `parent_org_id` varchar(255) DEFAULT NULL COMMENT '父机构ID',
  `sort_no` int(11) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` varchar(255) NOT NULL COMMENT '角色ID',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `options` varchar(255) DEFAULT NULL COMMENT '角色配置项',
  `parent_role_id` varchar(255) DEFAULT NULL COMMENT '父角色ID',
  `sort_id` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `role_user_id` varchar(255) NOT NULL COMMENT '角色用户ID',
  `role_id` varchar(255) DEFAULT NULL COMMENT '角色ID',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `system_id` varchar(255) NOT NULL COMMENT '系统ID',
  `system_name` varchar(255) DEFAULT NULL COMMENT '系统名称',
  `last_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `test_id` varchar(255) NOT NULL COMMENT '测试ID',
  `test_name` varchar(255) DEFAULT '' COMMENT '测试名',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL COMMENT '用户ID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `last_date` datetime DEFAULT NULL COMMENT '最后修改',
  `try_count` int(11) DEFAULT '0' COMMENT '尝试登录次数',
  `enable` tinyint(4) DEFAULT '0' COMMENT '是否可用',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Function structure for getChildLst
-- ----------------------------
DROP FUNCTION IF EXISTS `getChildLst`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getChildLst`(rootId INT) RETURNS varchar(1000) CHARSET utf8
BEGIN
			DECLARE sTemp VARCHAR(1000);
			DECLARE sTempChd VARCHAR(1000);

			SET sTemp = '$';
			SET sTempChd =cast(rootId as CHAR);

			WHILE sTempChd is not null DO
				SET sTemp = concat(sTemp,',',sTempChd);
				SELECT group_concat(menu_id) INTO sTempChd FROM menu where FIND_IN_SET(parent_menu_id,sTempChd)>0;
			END WHILE;
			RETURN sTemp;
		END
;;
DELIMITER ;
