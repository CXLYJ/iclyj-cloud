/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : 127.0.0.1:3307
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 28/05/2020 15:36:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (92, 'iclyj-system-dev.yml', 'DEFAULT_GROUP', 'spring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3307/iclyj-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root\r\n\r\nmybatis:\r\n  # 指定别名设置的包为所有entity\r\n  type-aliases-package: com.lyj\r\n  configuration:\r\n    map-underscore-to-camel-case: true # 驼峰命名规范\r\n  mapper-locations: # mapper映射文件位置\r\n    - classpath:mapper/*.xml', '523bc594929718f44059e466416e3544', '2020-05-28 12:42:15', '2020-05-28 14:49:39', NULL, '127.0.0.1', '', '', '系统模块配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (94, 'iclyj-auth-dev.yml', 'DEFAULT_GROUP', 'spring: \r\n  main: \r\n    allow-bean-definition-overriding: true\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3307/iclyj-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root\r\n  redis:\r\n    host: 127.0.0.1\r\n    port: 6379\r\n    password: 123456 ', '57f2cea9b0819a77b04f5bbe6a6d3dcf', '2020-05-28 12:43:30', '2020-05-28 12:44:02', NULL, '127.0.0.1', '', '', '认证服务模块', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (109, 'iclyj-application-dev.yml', 'DEFAULT_GROUP', '#请求处理的超时时间\r\nribbon:\r\n  ReadTimeout: 10000\r\n  ConnectTimeout: 10000\r\n\r\n# feign 配置\r\nfeign:\r\n  hystrix:\r\n    enabled: true\r\n  okhttp:\r\n    enabled: true\r\n  httpclient:\r\n    enabled: false\r\n  client:\r\n    config:\r\n      default:\r\n        connectTimeout: 10000\r\n        readTimeout: 10000\r\n  compression:\r\n    request:\r\n      enabled: true\r\n    response:\r\n      enabled: true\r\n\r\n# hystrix 配置\r\nhystrix:\r\n  command:\r\n    default:\r\n      execution:\r\n        isolation:\r\n          strategy: SEMAPHORE\r\n          thread:\r\n            timeoutInMilliseconds: 60000\r\n  shareSecurityContext: true\r\n\r\n# 暴露监控端点\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n\r\n# 认证配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: iclyj\r\n      client-secret: 123456\r\n      scope: server\r\n    resource:\r\n      loadBalanced: true\r\n      token-info-uri: http://iclyj-auth/oauth/check_token\r\n    ignore:\r\n      urls:\r\n        - /v2/api-docs\r\n        - /actuator/**\r\n        - /user/info/*\r\n        - /operlog', '53548cb0c64b2f0b942ee88929cfbac5', '2020-05-28 14:56:23', '2020-05-28 15:27:32', NULL, '127.0.0.1', '', '', '共享配置', 'null', 'null', 'yaml', 'null');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime(0) NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint(64) UNSIGNED NOT NULL,
  `nid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (74, 83, 'application-dev.yml', 'DEFAULT_GROUP', '', '#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# feign 配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n# hystrix 配置\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          strategy: SEMAPHORE\n          thread:\n            timeoutInMilliseconds: 60000\n  shareSecurityContext: true\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\n# 认证配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ruoyi\n      client-secret: 123456\n      scope: server\n    resource:\n      loadBalanced: true\n      token-info-uri: http://ruoyi-auth/oauth/check_token\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n', '5d9234a0efea9ae9f8449f8f550788e3', '2010-05-05 00:00:00', '2020-05-25 18:03:51', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (74, 84, 'application-dev.yml', 'DEFAULT_GROUP', '', '#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# feign 配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n# hystrix 配置\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          strategy: SEMAPHORE\n          thread:\n            timeoutInMilliseconds: 60000\n  shareSecurityContext: true\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\n# 认证配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ruoyi\n      client-secret: 123456\n      scope: server\n    resource:\n      loadBalanced: true\n      token-info-uri: http://ruoyi-auth/oauth/check_token\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n        - /user/info/*\n        - /operlog', '1390d8121eee87877580f5e3a24d5184', '2010-05-05 00:00:00', '2020-05-25 18:05:13', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (75, 85, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring: \r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password: \r\n  cloud:\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          lowerCaseServiceId: true\r\n          enabled: true\r\n      routes:\r\n        # 认证中心\r\n        - id: ruoyi-auth\r\n          uri: lb://ruoyi-auth\r\n          predicates:\r\n            - Path=/auth/**\r\n          filters:\r\n            # 验证码处理\r\n            - ImageCodeFilter\r\n            - StripPrefix=1\r\n        # 代码生成\r\n        - id: ruoyi-gen\r\n          uri: lb://ruoyi-gen\r\n          predicates:\r\n            - Path=/code/**\r\n          filters:\r\n            - StripPrefix=1\r\n        # 定时任务\r\n        - id: ruoyi-job\r\n          uri: lb://ruoyi-job\r\n          predicates:\r\n            - Path=/schedule/**\r\n          filters:\r\n            - StripPrefix=1\r\n        # 系统模块\r\n        - id: ruoyi-system\r\n          uri: lb://ruoyi-system\r\n          predicates:\r\n            - Path=/system/**\r\n          filters:\r\n            - StripPrefix=1\r\n\r\n# 不校验验证码终端\r\nignore:\r\n  clients:\r\n    - ruoyi\r\n', '8c980ade5250e98121f5207c3a97f35f', '2010-05-05 00:00:00', '2020-05-26 11:00:27', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (78, 86, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# Spring\r\nspring: \r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: password\r\n\r\n# Mybatis配置\r\nmybatis:\r\n    # 搜索指定包别名\r\n    typeAliasesPackage: com.ruoyi.system\r\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n    mapperLocations: classpath:mapper/**/*.xml\r\n\r\n# swagger 配置\r\nswagger:\r\n  title: 系统模块接口文档\r\n  license: Powered By ruoyi\r\n  licenseUrl: https://ruoyi.vip\r\n  authorization:\r\n    name: RuoYi OAuth\r\n    auth-regex: ^.*$\r\n    authorization-scope-list:\r\n      - scope: server\r\n        description: 客户端授权范围\r\n    token-url-list:\r\n      - http://localhost:8080/auth/oauth/token\r\n', '4b9284d702b9ab819a698708254b0b06', '2010-05-05 00:00:00', '2020-05-26 11:04:49', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (79, 87, 'ruoyi-gen-dev.yml', 'DEFAULT_GROUP', '', '# Spring\r\nspring: \r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: password\r\n\r\n# Mybatis配置\r\nmybatis:\r\n    # 搜索指定包别名\r\n    typeAliasesPackage: com.ruoyi.gen.domain\r\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n    mapperLocations: classpath:mapper/**/*.xml\r\n\r\n# swagger 配置\r\nswagger:\r\n  title: 代码生成接口文档\r\n  license: Powered By ruoyi\r\n  licenseUrl: https://ruoyi.vip\r\n  authorization:\r\n    name: RuoYi OAuth\r\n    auth-regex: ^.*$\r\n    authorization-scope-list:\r\n      - scope: server\r\n        description: 客户端授权范围\r\n    token-url-list:\r\n      - http://localhost:8080/auth/oauth/token\r\n\r\n# 代码生成\r\ngen: \r\n  # 作者\r\n  author: ruoyi\r\n  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool\r\n  packageName: com.ruoyi.system\r\n  # 自动去除表前缀，默认是false\r\n  autoRemovePre: false\r\n  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）\r\n  tablePrefix: sys_\r\n', 'aa7e94e2abbdeb408bd8981391ab82f8', '2010-05-05 00:00:00', '2020-05-26 11:05:08', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (80, 88, 'ruoyi-job-dev.yml', 'DEFAULT_GROUP', '', '# Spring\r\nspring: \r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: password\r\n\r\n# Mybatis配置\r\nmybatis:\r\n    # 搜索指定包别名\r\n    typeAliasesPackage: com.ruoyi.job.domain\r\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n    mapperLocations: classpath:mapper/**/*.xml\r\n\r\n# swagger 配置\r\nswagger:\r\n  title: 定时任务接口文档\r\n  license: Powered By ruoyi\r\n  licenseUrl: https://ruoyi.vip\r\n  authorization:\r\n    name: RuoYi OAuth\r\n    auth-regex: ^.*$\r\n    authorization-scope-list:\r\n      - scope: server\r\n        description: 客户端授权范围\r\n    token-url-list:\r\n      - http://localhost:8080/auth/oauth/token\r\n', '2904b375372b13f52baed5be2e497b21', '2010-05-05 00:00:00', '2020-05-26 11:05:31', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (76, 89, 'ruoyi-auth-dev.yml', 'DEFAULT_GROUP', '', 'spring: \r\n  main: \r\n    allow-bean-definition-overriding: true\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: password\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password: \r\n', 'e3db7475e43b8a83b0247ca8fd77339e', '2010-05-05 00:00:00', '2020-05-26 11:06:02', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (75, 90, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring: \r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password: \r\n  cloud:\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          lowerCaseServiceId: true\r\n          enabled: true\r\n      routes:\r\n        # 认证中心\r\n        - id: ruoyi-auth\r\n          uri: lb://ruoyi-auth\r\n          predicates:\r\n            - Path=/auth/**\r\n          filters:\r\n            # 验证码处理\r\n            # - ImageCodeFilter\r\n            - ValidateCodeFilter\r\n            - StripPrefix=1\r\n        # 代码生成\r\n        - id: ruoyi-gen\r\n          uri: lb://ruoyi-gen\r\n          predicates:\r\n            - Path=/code/**\r\n          filters:\r\n            - StripPrefix=1\r\n        # 定时任务\r\n        - id: ruoyi-job\r\n          uri: lb://ruoyi-job\r\n          predicates:\r\n            - Path=/schedule/**\r\n          filters:\r\n            - StripPrefix=1\r\n        # 系统模块\r\n        - id: ruoyi-system\r\n          uri: lb://ruoyi-system\r\n          predicates:\r\n            - Path=/system/**\r\n          filters:\r\n            - StripPrefix=1\r\n\r\n# 不校验验证码终端\r\nignore:\r\n  clients:\r\n    - ruoyi\r\n', '6ebdceea48b00a8cd04c5d28fd1dbf38', '2010-05-05 00:00:00', '2020-05-26 11:06:28', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (74, 91, 'application-dev.yml', 'DEFAULT_GROUP', '', '#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# feign 配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n# hystrix 配置\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          strategy: SEMAPHORE\n          thread:\n            timeoutInMilliseconds: 60000\n  shareSecurityContext: true\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\n# 认证配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ruoyi\n      client-secret: 123456\n      scope: server\n    resource:\n      loadBalanced: true\n      token-info-uri: http://ruoyi-auth/oauth/check_token\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n        # - /user/info/*\n        # - /operlog', '32479fc693586a6fc70ae7a002646d3f', '2010-05-05 00:00:00', '2020-05-26 11:11:19', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (75, 92, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring: \r\n  redis:\r\n    host: 118.25.26.200\r\n    port: 6379\r\n    password: 123456 \r\n  cloud:\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          lowerCaseServiceId: true\r\n          enabled: true\r\n      routes:\r\n        # 认证中心\r\n        - id: ruoyi-auth\r\n          uri: lb://ruoyi-auth\r\n          predicates:\r\n            - Path=/auth/**\r\n          filters:\r\n            # 验证码处理\r\n            # - ImageCodeFilter\r\n            - ValidateCodeFilter\r\n            - StripPrefix=1\r\n        # 代码生成\r\n        - id: ruoyi-gen\r\n          uri: lb://ruoyi-gen\r\n          predicates:\r\n            - Path=/code/**\r\n          filters:\r\n            - StripPrefix=1\r\n        # 定时任务\r\n        - id: ruoyi-job\r\n          uri: lb://ruoyi-job\r\n          predicates:\r\n            - Path=/schedule/**\r\n          filters:\r\n            - StripPrefix=1\r\n        # 系统模块\r\n        - id: ruoyi-system\r\n          uri: lb://ruoyi-system\r\n          predicates:\r\n            - Path=/system/**\r\n          filters:\r\n            - StripPrefix=1\r\n\r\n# 不校验验证码终端\r\nignore:\r\n  clients:\r\n    - ruoyi\r\n', '384603bf2e05843bdb715c7643cc8f37', '2010-05-05 00:00:00', '2020-05-26 17:31:03', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (75, 93, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring: \r\n  redis:\r\n    host: 118.25.26.200\r\n    port: 6379\r\n    password: 123456 \r\n  cloud:\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          lowerCaseServiceId: true\r\n          enabled: true\r\n      routes:\r\n        # 认证中心\r\n        - id: ruoyi-auth\r\n          uri: lb://ruoyi-auth\r\n          predicates:\r\n            - Path=/auth/**\r\n          filters:\r\n            # 验证码处理\r\n            - ImageCodeFilter\r\n            # - ValidateCodeFilter\r\n            - StripPrefix=1\r\n        # 代码生成\r\n        - id: ruoyi-gen\r\n          uri: lb://ruoyi-gen\r\n          predicates:\r\n            - Path=/code/**\r\n          filters:\r\n            - StripPrefix=1\r\n        # 定时任务\r\n        - id: ruoyi-job\r\n          uri: lb://ruoyi-job\r\n          predicates:\r\n            - Path=/schedule/**\r\n          filters:\r\n            - StripPrefix=1\r\n        # 系统模块\r\n        - id: ruoyi-system\r\n          uri: lb://ruoyi-system\r\n          predicates:\r\n            - Path=/system/**\r\n          filters:\r\n            - StripPrefix=1\r\n\r\n# 不校验验证码终端\r\nignore:\r\n  clients:\r\n    - ruoyi\r\n', '855d9242e8c2cdeb5c02ac7d4a8d5af0', '2010-05-05 00:00:00', '2020-05-27 18:08:50', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 94, 'iclyj-system-dev.yml', 'DEFAULT_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2010-05-05 00:00:00', '2020-05-28 12:42:15', NULL, '127.0.0.1', 'I', '');
INSERT INTO `his_config_info` VALUES (92, 95, 'iclyj-system-dev.yml', 'DEFAULT_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2010-05-05 00:00:00', '2020-05-28 12:42:57', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 96, 'iclyj-auth-dev.yml', 'DEFAULT_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2010-05-05 00:00:00', '2020-05-28 12:43:30', NULL, '127.0.0.1', 'I', '');
INSERT INTO `his_config_info` VALUES (94, 97, 'iclyj-auth-dev.yml', 'DEFAULT_GROUP', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2010-05-05 00:00:00', '2020-05-28 12:44:02', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (92, 98, 'iclyj-system-dev.yml', 'DEFAULT_GROUP', '', '# Spring\r\nspring: \r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3307/iclyj-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root\r\n\r\n# Mybatis配置\r\nmybatis:\r\n    # 搜索指定包别名\r\n    typeAliasesPackage: com.lyj.system\r\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n    mapperLocations: classpath:mapper/**/*.xml', 'bbc27250b1abaa5337548f91ade5865c', '2010-05-05 00:00:00', '2020-05-28 14:12:20', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (92, 99, 'iclyj-system-dev.yml', 'DEFAULT_GROUP', '', '# Spring\r\nspring: \r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3307/iclyj-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root\r\n\r\n# Mybatis配置\r\nmybatis:\r\n    # 搜索指定包别名\r\n    typeAliasesPackage: com.lyj.system\r\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n    mapperLocations: classpath:mapper/**/*.xml', 'bbc27250b1abaa5337548f91ade5865c', '2010-05-05 00:00:00', '2020-05-28 14:15:55', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (92, 100, 'iclyj-system-dev.yml', 'DEFAULT_GROUP', '', '# Spring\r\nspring: \r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3307/iclyj-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root\r\n\r\n# Mybatis配置\r\nmybatis:\r\n    # 搜索指定包别名\r\n    typeAliasesPackage: com.lyj.system\r\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n    mapperLocations: classpath*:mapper/**/*.xml', 'da82c7a6a1e987d6d2d2530739fdd0c5', '2010-05-05 00:00:00', '2020-05-28 14:16:50', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (92, 101, 'iclyj-system-dev.yml', 'DEFAULT_GROUP', '', '# Spring\r\nspring: \r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3307/iclyj-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root\r\n\r\n# Mybatis配置\r\nmybatis:\r\n    # 搜索指定包别名\r\n    typeAliasesPackage: com.lyj.system\r\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n    mapperLocations: classpath:mapper/**/*.xml', 'bbc27250b1abaa5337548f91ade5865c', '2010-05-05 00:00:00', '2020-05-28 14:19:58', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (92, 102, 'iclyj-system-dev.yml', 'DEFAULT_GROUP', '', '# Spring\r\nspring: \r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3307/iclyj-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root\r\n\r\n# Mybatis配置\r\nmybatis:\r\n    # 搜索指定包别名\r\n    typeAliasesPackage: com.lyj.system\r\n    # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n    mapperLocations: classpath*:/mapper/**/*.xml', '8bd5d4060a4e0a4022d5881c4094734e', '2010-05-05 00:00:00', '2020-05-28 14:24:14', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (92, 103, 'iclyj-system-dev.yml', 'DEFAULT_GROUP', '', '# # Spring\r\n# spring: \r\n#   datasource:\r\n#     driver-class-name: com.mysql.cj.jdbc.Driver\r\n#     url: jdbc:mysql://localhost:3307/iclyj-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n#     username: root\r\n#     password: root\r\n\r\n# # Mybatis配置\r\n# mybatis:\r\n#     # 搜索指定包别名\r\n#     typeAliasesPackage: com.lyj.system\r\n#     # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n#     mapperLocations: classpath*:/mapper/**/*.xml', '7ca07dce3ecbbda988d9087d9dc84a81', '2010-05-05 00:00:00', '2020-05-28 14:30:21', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (92, 104, 'iclyj-system-dev.yml', 'DEFAULT_GROUP', '', '# # Spring\r\n# spring: \r\n#   datasource:\r\n#     driver-class-name: com.mysql.cj.jdbc.Driver\r\n#     url: jdbc:mysql://localhost:3307/iclyj-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n#     username: root\r\n#     password: root\r\n\r\n# # Mybatis配置\r\n# mybatis:\r\n#     # 搜索指定包别名\r\n#     typeAliasesPackage: com.lyj.system\r\n#     # 配置mapper的扫描，找到所有的mapper.xml映射文件\r\n#     mapperLocations: classpath*:/mapper/**/*.xml\r\n\r\nspring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3307/iclyj-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root\r\n\r\nmybatis:\r\n  type-aliases-package: com.lyj.system\r\n  mapper-locations: classpath*:/mapper/**/*.xml', '4be1e1d27f3ca349f2371bb8f45dfe51', '2010-05-05 00:00:00', '2020-05-28 14:36:11', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (92, 105, 'iclyj-system-dev.yml', 'DEFAULT_GROUP', '', 'spring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3307/iclyj-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root\r\n\r\nmybatis:\r\n  type-aliases-package: com.lyj.*\r\n  mapper-locations: classpath*:/mapper/**/*.xml', 'bc9932d238835b1947e17207389a71cc', '2010-05-05 00:00:00', '2020-05-28 14:37:36', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (92, 106, 'iclyj-system-dev.yml', 'DEFAULT_GROUP', '', 'spring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3307/iclyj-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root\r\n\r\n# mybatis:\r\n#   type-aliases-package: com.lyj.*\r\n#   mapper-locations: classpath*:/mapper/**/*.xml', '7d29cd5ec47988a809522292c244cab8', '2010-05-05 00:00:00', '2020-05-28 14:38:30', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (92, 107, 'iclyj-system-dev.yml', 'DEFAULT_GROUP', '', 'spring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3307/iclyj-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root\r\n\r\n# mybatis:\r\n#   type-aliases-package: com.lyj\r\n#   mapper-locations: classpath*:/mapper/**/*.xml', 'b63af9044b105cf6565d95e769b6eac7', '2010-05-05 00:00:00', '2020-05-28 14:49:39', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (74, 108, 'application-dev.yml', 'DEFAULT_GROUP', '', '#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# feign 配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n# hystrix 配置\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          strategy: SEMAPHORE\n          thread:\n            timeoutInMilliseconds: 60000\n  shareSecurityContext: true\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\n# 认证配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ruoyi\n      client-secret: 123456\n      scope: server\n    resource:\n      loadBalanced: true\n      token-info-uri: http://ruoyi-auth/oauth/check_token\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n        - /user/info/*\n        - /operlog\n', '5ccdb3f6d02bf5afa7b7b4447075b8f2', '2010-05-05 00:00:00', '2020-05-28 14:50:04', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (74, 109, 'application-dev.yml', 'DEFAULT_GROUP', '', '#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# feign 配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n# hystrix 配置\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          strategy: SEMAPHORE\n          thread:\n            timeoutInMilliseconds: 60000\n  shareSecurityContext: true\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\n# 认证配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ruoyi\n      client-secret: 123456\n      scope: server\n    resource:\n      loadBalanced: true\n      token-info-uri: http://iclyj-auth/oauth/check_token\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n        - /user/info/*\n        - /operlog\n', 'd0afee7c6c1d8dbee5a3968e7f1b5abf', '2010-05-05 00:00:00', '2020-05-28 14:53:05', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (74, 110, 'application-dev.yml', 'DEFAULT_GROUP', '', '#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# feign 配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n# hystrix 配置\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          strategy: SEMAPHORE\n          thread:\n            timeoutInMilliseconds: 60000\n  shareSecurityContext: true\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\n# 认证配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ruoyi\n      client-secret: 123456\n      scope: server\n    resource:\n      loadBalanced: true\n      token-info-uri: http://ruoyi-auth/oauth/check_token\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n        # - /user/info/*\n        # - /operlog', '32479fc693586a6fc70ae7a002646d3f', '2010-05-05 00:00:00', '2020-05-28 14:55:16', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (0, 111, 'iclyj-application-dev.yml', 'DEFAULT_GROUP', '', '#请求处理的超时时间\r\nribbon:\r\n  ReadTimeout: 10000\r\n  ConnectTimeout: 10000\r\n\r\n# feign 配置\r\nfeign:\r\n  hystrix:\r\n    enabled: true\r\n  okhttp:\r\n    enabled: true\r\n  httpclient:\r\n    enabled: false\r\n  client:\r\n    config:\r\n      default:\r\n        connectTimeout: 10000\r\n        readTimeout: 10000\r\n  compression:\r\n    request:\r\n      enabled: true\r\n    response:\r\n      enabled: true\r\n\r\n# hystrix 配置\r\nhystrix:\r\n  command:\r\n    default:\r\n      execution:\r\n        isolation:\r\n          strategy: SEMAPHORE\r\n          thread:\r\n            timeoutInMilliseconds: 60000\r\n  shareSecurityContext: true\r\n\r\n# 暴露监控端点\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n\r\n# 认证配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: iclyj\r\n      client-secret: 123456\r\n      scope: server\r\n    resource:\r\n      loadBalanced: true\r\n      token-info-uri: http://iclyj-auth/oauth/check_token', '616297acefc6074cc71fd92725e4a2d7', '2010-05-05 00:00:00', '2020-05-28 14:56:23', NULL, '127.0.0.1', 'I', '');
INSERT INTO `his_config_info` VALUES (109, 112, 'iclyj-application-dev.yml', 'DEFAULT_GROUP', '', '#请求处理的超时时间\r\nribbon:\r\n  ReadTimeout: 10000\r\n  ConnectTimeout: 10000\r\n\r\n# feign 配置\r\nfeign:\r\n  hystrix:\r\n    enabled: true\r\n  okhttp:\r\n    enabled: true\r\n  httpclient:\r\n    enabled: false\r\n  client:\r\n    config:\r\n      default:\r\n        connectTimeout: 10000\r\n        readTimeout: 10000\r\n  compression:\r\n    request:\r\n      enabled: true\r\n    response:\r\n      enabled: true\r\n\r\n# hystrix 配置\r\nhystrix:\r\n  command:\r\n    default:\r\n      execution:\r\n        isolation:\r\n          strategy: SEMAPHORE\r\n          thread:\r\n            timeoutInMilliseconds: 60000\r\n  shareSecurityContext: true\r\n\r\n# 暴露监控端点\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n\r\n# 认证配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: iclyj\r\n      client-secret: 123456\r\n      scope: server\r\n    resource:\r\n      loadBalanced: true\r\n      token-info-uri: http://iclyj-auth/oauth/check_token', '616297acefc6074cc71fd92725e4a2d7', '2010-05-05 00:00:00', '2020-05-28 15:14:26', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (74, 113, 'application-dev.yml', 'DEFAULT_GROUP', '', '#请求处理的超时时间\nribbon:\n  ReadTimeout: 10000\n  ConnectTimeout: 10000\n\n# feign 配置\nfeign:\n  hystrix:\n    enabled: true\n  okhttp:\n    enabled: true\n  httpclient:\n    enabled: false\n  client:\n    config:\n      default:\n        connectTimeout: 10000\n        readTimeout: 10000\n  compression:\n    request:\n      enabled: true\n    response:\n      enabled: true\n\n# hystrix 配置\nhystrix:\n  command:\n    default:\n      execution:\n        isolation:\n          strategy: SEMAPHORE\n          thread:\n            timeoutInMilliseconds: 60000\n  shareSecurityContext: true\n\n# 暴露监控端点\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\n# 认证配置\nsecurity:\n  oauth2:\n    client:\n      client-id: ruoyi\n      client-secret: 123456\n      scope: server\n    resource:\n      loadBalanced: true\n      token-info-uri: http://ruoyi-auth/oauth/check_token\n    ignore:\n      urls:\n        - /v2/api-docs\n        - /actuator/**\n        # - /user/info/*\n        # - /operlog', '32479fc693586a6fc70ae7a002646d3f', '2010-05-05 00:00:00', '2020-05-28 15:20:52', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (109, 114, 'iclyj-application-dev.yml', 'DEFAULT_GROUP', '', '#请求处理的超时时间\r\nribbon:\r\n  ReadTimeout: 10000\r\n  ConnectTimeout: 10000\r\n\r\n# feign 配置\r\nfeign:\r\n  hystrix:\r\n    enabled: true\r\n  okhttp:\r\n    enabled: true\r\n  httpclient:\r\n    enabled: false\r\n  client:\r\n    config:\r\n      default:\r\n        connectTimeout: 10000\r\n        readTimeout: 10000\r\n  compression:\r\n    request:\r\n      enabled: true\r\n    response:\r\n      enabled: true\r\n\r\n# hystrix 配置\r\nhystrix:\r\n  command:\r\n    default:\r\n      execution:\r\n        isolation:\r\n          strategy: SEMAPHORE\r\n          thread:\r\n            timeoutInMilliseconds: 60000\r\n  shareSecurityContext: true\r\n\r\n# 暴露监控端点\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n\r\n# 认证配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: ruoyi\r\n      client-secret: 123456\r\n      scope: server\r\n    resource:\r\n      loadBalanced: true\r\n      token-info-uri: http://iclyj-auth/oauth/check_token', '6040b4888ecd64d3bc43aa07ac8c10e9', '2010-05-05 00:00:00', '2020-05-28 15:23:50', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (109, 115, 'iclyj-application-dev.yml', 'DEFAULT_GROUP', '', '#请求处理的超时时间\r\nribbon:\r\n  ReadTimeout: 10000\r\n  ConnectTimeout: 10000\r\n\r\n# feign 配置\r\nfeign:\r\n  hystrix:\r\n    enabled: true\r\n  okhttp:\r\n    enabled: true\r\n  httpclient:\r\n    enabled: false\r\n  client:\r\n    config:\r\n      default:\r\n        connectTimeout: 10000\r\n        readTimeout: 10000\r\n  compression:\r\n    request:\r\n      enabled: true\r\n    response:\r\n      enabled: true\r\n\r\n# hystrix 配置\r\nhystrix:\r\n  command:\r\n    default:\r\n      execution:\r\n        isolation:\r\n          strategy: SEMAPHORE\r\n          thread:\r\n            timeoutInMilliseconds: 60000\r\n  shareSecurityContext: true\r\n\r\n# 暴露监控端点\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n\r\n# 认证配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: iclyj\r\n      client-secret: 123456\r\n      scope: server\r\n    resource:\r\n      loadBalanced: true\r\n      token-info-uri: http://iclyj-auth/oauth/check_token\r\n    ignore:\r\n      urls:\r\n        - /v2/api-docs\r\n        - /actuator/**\r\n        - /user/info/*\r\n        - /operlog', '53548cb0c64b2f0b942ee88929cfbac5', '2010-05-05 00:00:00', '2020-05-28 15:27:32', NULL, '127.0.0.1', 'U', '');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('febs', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT '2010-05-05 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('iclyj', '$2a$10$xGR1fiiYRrC5Jp.3tiA5buCZO5aLFxKZKB5IBl3.dX/dqhKbOAmxi', 1);

SET FOREIGN_KEY_CHECKS = 1;
