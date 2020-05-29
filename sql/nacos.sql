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

 Date: 29/05/2020 18:09:12
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
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (92, 'iclyj-system-dev.yml', 'DEFAULT_GROUP', 'spring:\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3307/iclyj-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root\r\n\r\nmybatis:\r\n  # 指定别名设置的包为所有entity\r\n  type-aliases-package: com.lyj\r\n  configuration:\r\n    map-underscore-to-camel-case: true # 驼峰命名规范\r\n  mapper-locations: # mapper映射文件位置\r\n    - classpath:mapper/*.xml', '523bc594929718f44059e466416e3544', '2020-05-28 12:42:15', '2020-05-28 14:49:39', NULL, '127.0.0.1', '', '', '系统模块配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (94, 'iclyj-auth-dev.yml', 'DEFAULT_GROUP', 'spring: \r\n  main: \r\n    allow-bean-definition-overriding: true\r\n  datasource:\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    url: jdbc:mysql://localhost:3307/iclyj-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8\r\n    username: root\r\n    password: root\r\n  redis:\r\n    host: 118.25.26.200\r\n    port: 6379\r\n    password: 123456 ', '57f2cea9b0819a77b04f5bbe6a6d3dcf', '2020-05-28 12:43:30', '2020-05-28 12:44:02', NULL, '127.0.0.1', '', '', '认证服务模块', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (109, 'iclyj-application-dev.yml', 'DEFAULT_GROUP', 'ribbon:\r\n  eureka:\r\n    enabled: true # 开启eureka轮询\r\n  eager-load:\r\n    enabled: true  # 开启Ribbon的饥饿加载模式(防止第一次请求超时的问题)\r\n    clients: user,product # 指定需要开启的服务(需要开启Ribbon的饥饿加载模式)\r\n  ReadTimeout: 10000\r\n  ConnectTimeout: 10000\r\n  MaxAutoRetries: 0\r\n  MaxAutoRetriesNextServer: 1\r\n  OkToRetryOnAllOperations: false\r\n\r\n# 设置最大容错超时时间\r\n# 执行超时时间为9秒，会对服务熔断路由defaultfallback生效\r\nhystrix.command.default.execution.isolation.thread.timeoutInMilliseconds: 90000\r\n\r\n# feign 配置\r\nfeign:\r\n  hystrix:\r\n    enabled: true\r\n  okhttp:\r\n    enabled: true\r\n  httpclient:\r\n    enabled: false\r\n  client:\r\n    config:\r\n      default:\r\n        connectTimeout: 10000\r\n        readTimeout: 10000\r\n  compression:\r\n    request:\r\n      enabled: true\r\n    response:\r\n      enabled: true\r\n\r\n# 设置最大容错超时时间\r\nhystrix:\r\n  threadpool:\r\n    default:\r\n      coreSize: 100\r\n      maximumSize: 5000\r\n      allowMaximumSizeToDivergeFromCoreSize: true\r\n      maxQueueSize: -1\r\n  command:\r\n    default:\r\n      circuitBreaker:\r\n        # 是否强制将断路器设置成开启状态（true开启，false不开启）最好不开启否者会导致访问服务一直熔断\r\n        foreOpen: false\r\n      execution:\r\n        timeout:\r\n          enabled: true\r\n        isolation:\r\n          strategy: SEMAPHORE\r\n          thread:\r\n            timeoutInMilliseconds: 900000\r\n    shareSecurityContext: true\r\n\r\n# 暴露监控端点\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n\r\n# 认证配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: iclyj\r\n      client-secret: 123456\r\n      scope: server\r\n    resource:\r\n      loadBalanced: true\r\n      token-info-uri: http://iclyj-auth/oauth/check_token\r\n    ignore:\r\n      urls:\r\n        - /v2/api-docs\r\n        - /actuator/**\r\n        - /user/info/*\r\n        - /operlog', 'bf36068a142500d33731c4b98880d4d0', '2020-05-28 14:56:23', '2020-05-29 15:05:00', NULL, '127.0.0.1', '', '', '共享配置', 'null', 'null', 'yaml', 'null');
INSERT INTO `config_info` VALUES (114, 'iclyj-gateway-dev.yml', 'DEFAULT_GROUP', 'spring: \r\n  redis:\r\n    host: 118.25.26.200\r\n    port: 6379\r\n    password: 123456 \r\n  cloud:\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          lowerCaseServiceId: true\r\n          enabled: true\r\n      routes:\r\n        # 认证中心\r\n        - id: iclyj-auth\r\n          uri: lb://iclyj-auth\r\n          predicates:\r\n            - Path=/auth/**\r\n          filters:\r\n          #   # 验证码处理\r\n          #   # - ImageCodeFilter\r\n          #   - ValidateCodeFilter\r\n            - StripPrefix=1\r\n        # 系统模块\r\n        - id: iclyj-system\r\n          uri: lb://iclyj-system\r\n          predicates:\r\n            - Path=/system/**\r\n          filters:\r\n            - StripPrefix=1\r\n          \r\n\r\n# 不校验验证码终端\r\nignore:\r\n  clients:\r\n    - iclyj', 'd1225578aad91563352e14755f6aa9d', '2020-05-29 11:40:25', '2020-05-29 18:00:32', NULL, '127.0.0.1', '', '', '网关控制', 'null', 'null', 'yaml', 'null');

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
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (114, 119, 'iclyj-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring: \r\n  redis:\r\n    host: 118.25.26.200\r\n    port: 6379\r\n    password: 123456 \r\n  cloud:\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          lowerCaseServiceId: true\r\n          enabled: true\r\n      routes:\r\n        # 认证中心\r\n        - id: iclyj-auth\r\n          uri: lb://iclyj-auth\r\n          predicates:\r\n            - Path=/auth/**\r\n          # filters:\r\n          #   # 验证码处理\r\n          #   # - ImageCodeFilter\r\n          #   - ValidateCodeFilter\r\n          #   - StripPrefix=1\r\n        # 系统模块\r\n        - id: iclyj-system\r\n          uri: lb://iclyj-system\r\n          predicates:\r\n            - Path=/system/**\r\n          filters:\r\n            - StripPrefix=1\r\n\r\n\r\nribbon:\r\n  eureka:\r\n    enabled: true # 开启eureka轮询\r\n  eager-load:\r\n    enabled: true  # 开启Ribbon的饥饿加载模式(防止第一次请求超时的问题)\r\n    clients: iclyj-system # 指定需要开启的服务(需要开启Ribbon的饥饿加载模式)\r\n  ReadTimeout: 60000\r\n  ConnectTimeout: 60000\r\n  MaxAutoRetries: 0\r\n  MaxAutoRetriesNextServer: 1\r\n  OkToRetryOnAllOperations: false\r\n\r\n# 设置最大容错超时时间\r\n# 执行超时时间为9秒，会对服务熔断路由defaultfallback生效\r\nhystrix.command.default.execution.isolation.thread.timeoutInMilliseconds: 90000\r\n\r\n\r\n# 设置最大容错超时时间\r\nhystrix:\r\n  threadpool:\r\n    default:\r\n      coreSize: 100\r\n      maximumSize: 5000\r\n      allowMaximumSizeToDivergeFromCoreSize: true\r\n      maxQueueSize: -1\r\n  command:\r\n    default:\r\n      circuitBreaker:\r\n        # 是否强制将断路器设置成开启状态（true开启，false不开启）最好不开启否者会导致访问服务一直熔断\r\n        foreOpen: false\r\n      execution:\r\n        timeout:\r\n          enabled: true\r\n        isolation:\r\n          thread:\r\n            timeoutInMilliseconds: 900000\r\n\r\n          \r\n\r\n# 不校验验证码终端\r\nignore:\r\n  clients:\r\n    - iclyj', 'afe3dc625538a9c067bdd3bfa420d1a7', '2010-05-05 00:00:00', '2020-05-29 14:59:00', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (109, 120, 'iclyj-application-dev.yml', 'DEFAULT_GROUP', '', '#请求处理的超时时间\r\nribbon:\r\n  ReadTimeout: 10000\r\n  ConnectTimeout: 10000\r\n\r\n# feign 配置\r\nfeign:\r\n  hystrix:\r\n    enabled: true\r\n  okhttp:\r\n    enabled: true\r\n  httpclient:\r\n    enabled: false\r\n  client:\r\n    config:\r\n      default:\r\n        connectTimeout: 10000\r\n        readTimeout: 10000\r\n  compression:\r\n    request:\r\n      enabled: true\r\n    response:\r\n      enabled: true\r\n\r\n# hystrix 配置\r\nhystrix:\r\n  command:\r\n    default:\r\n      execution:\r\n        isolation:\r\n          strategy: SEMAPHORE\r\n          thread:\r\n            timeoutInMilliseconds: 60000\r\n  shareSecurityContext: true\r\n\r\n# 暴露监控端点\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'\r\n\r\n# 认证配置\r\nsecurity:\r\n  oauth2:\r\n    client:\r\n      client-id: iclyj\r\n      client-secret: 123456\r\n      scope: server\r\n    resource:\r\n      loadBalanced: true\r\n      token-info-uri: http://iclyj-auth/oauth/check_token\r\n    ignore:\r\n      urls:\r\n        - /v2/api-docs\r\n        - /actuator/**\r\n        - /user/info/*\r\n        - /operlog', '53548cb0c64b2f0b942ee88929cfbac5', '2010-05-05 00:00:00', '2020-05-29 15:05:00', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (114, 121, 'iclyj-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring: \r\n  redis:\r\n    host: 118.25.26.200\r\n    port: 6379\r\n    password: 123456 \r\n  cloud:\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          lowerCaseServiceId: true\r\n          enabled: true\r\n      routes:\r\n        # 认证中心\r\n        - id: iclyj-auth\r\n          uri: lb://iclyj-auth\r\n          predicates:\r\n            - Path=/auth/**\r\n          # filters:\r\n          #   # 验证码处理\r\n          #   # - ImageCodeFilter\r\n          #   - ValidateCodeFilter\r\n          #   - StripPrefix=1\r\n        # 系统模块\r\n        - id: iclyj-system\r\n          uri: lb://iclyj-system\r\n          predicates:\r\n            - Path=/system/**\r\n          filters:\r\n            - StripPrefix=1\r\n          \r\n\r\n# 不校验验证码终端\r\nignore:\r\n  clients:\r\n    - iclyj', '11c06b26cc65f4c4af1925e506953d20', '2010-05-05 00:00:00', '2020-05-29 17:57:58', NULL, '127.0.0.1', 'U', '');
INSERT INTO `his_config_info` VALUES (114, 122, 'iclyj-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring: \r\n  redis:\r\n    host: 118.25.26.200\r\n    port: 6379\r\n    password: 123456 \r\n  cloud:\r\n    gateway:\r\n      discovery:\r\n        locator:\r\n          lowerCaseServiceId: true\r\n          enabled: true\r\n      routes:\r\n        # 认证中心\r\n        - id: iclyj-auth\r\n          uri: lb://iclyj-auth\r\n          predicates:\r\n            - Path=/auth/**\r\n          # filters:\r\n          #   # 验证码处理\r\n          #   # - ImageCodeFilter\r\n          #   - ValidateCodeFilter\r\n            - StripPrefix=1\r\n        # 系统模块\r\n        - id: iclyj-system\r\n          uri: lb://iclyj-system\r\n          predicates:\r\n            - Path=/system/**\r\n          filters:\r\n            - StripPrefix=1\r\n          \r\n\r\n# 不校验验证码终端\r\nignore:\r\n  clients:\r\n    - iclyj', '8e9b8e4094fcac74ea50d9b7ca4cf59b', '2010-05-05 00:00:00', '2020-05-29 18:00:32', NULL, '127.0.0.1', 'U', '');

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
