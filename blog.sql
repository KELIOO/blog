/*
 Navicat MySQL Data Transfer

 Source Server         : 192.168.164.128
 Source Server Type    : MySQL
 Source Server Version : 50740 (5.7.40)
 Source Host           : 192.168.164.128:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50740 (5.7.40)
 File Encoding         : 65001

 Date: 07/11/2022 19:56:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ms_admin
-- ----------------------------
DROP TABLE IF EXISTS `ms_admin`;
CREATE TABLE `ms_admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_admin
-- ----------------------------
INSERT INTO `ms_admin` VALUES (1, 'admin', '8628d1f407f72e10ac947a032fe5ad29');
INSERT INTO `ms_admin` VALUES (2, 'mszlu', '$2a$10$RZECQ90DjOT/t1mhnXsl5.XSuZWc0Sa1XduPxj2rb4yaSYcje3nWW');

-- ----------------------------
-- Table structure for ms_admin_permission
-- ----------------------------
DROP TABLE IF EXISTS `ms_admin_permission`;
CREATE TABLE `ms_admin_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_admin_permission
-- ----------------------------
INSERT INTO `ms_admin_permission` VALUES (1, 1, 1);
INSERT INTO `ms_admin_permission` VALUES (2, 2, 1);

-- ----------------------------
-- Table structure for ms_article
-- ----------------------------
DROP TABLE IF EXISTS `ms_article`;
CREATE TABLE `ms_article`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_counts` int(11) NULL DEFAULT NULL COMMENT '评论数量',
  `create_date` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `view_counts` int(11) NULL DEFAULT NULL COMMENT '浏览数量',
  `weight` int(11) NOT NULL COMMENT '是否置顶',
  `author_id` bigint(20) NULL DEFAULT NULL COMMENT '作者id',
  `body_id` bigint(20) NULL DEFAULT NULL COMMENT '内容id',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '类别id',
  `author_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章作者发布地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1588395383005204482 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_article
-- ----------------------------
INSERT INTO `ms_article` VALUES (1585525930441613313, 1, 1666853814119, '12', 'test', 52, 0, 1585208317123518465, 1585525930450001923, 1, '江西省赣州市');

-- ----------------------------
-- Table structure for ms_article_body
-- ----------------------------
DROP TABLE IF EXISTS `ms_article_body`;
CREATE TABLE `ms_article_body`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content_html` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `article_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1588395383005204484 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_article_body
-- ----------------------------
INSERT INTO `ms_article_body` VALUES (1, '# 1. Spring Boot介绍\r\n\r\n## 1.1 简介\r\n\r\n在您第1次接触和学习Spring框架的时候，是否因为其繁杂的配置而退却了？\r\n\r\n在你第n次使用Spring框架的时候，是否觉得一堆反复黏贴的配置有一些厌烦？\r\n\r\n那么您就不妨来试试使用Spring Boot来让你更易上手，更简单快捷地构建Spring应用！\r\n\r\nSpring Boot让我们的Spring应用变的更轻量化。\r\n\r\n我们不必像以前那样繁琐的构建项目、打包应用、部署到Tomcat等应用服务器中来运行我们的业务服务。\r\n\r\n通过Spring Boot实现的服务，只需要依靠一个Java类，把它打包成jar，并通过`java -jar`命令就可以运行起来。\r\n\r\n这一切相较于传统Spring应用来说，已经变得非常的轻便、简单。\r\n\r\n**总结一下Spring Boot的主要优点：**\r\n\r\n1. 为所有Spring开发者更快的入门\r\n2. 开箱即用，提供各种默认配置来简化项目配置\r\n3. 内嵌式容器简化Web项目\r\n4. 没有冗余代码生成和XML配置的要求\r\n5. 统一的依赖管理\r\n6. 自动装配，更易使用，更易扩展\r\n\r\n## 1.2 使用版本说明\r\n\r\nSpringboot版本：使用最新的2.5.0版本\r\n\r\n教程参考了官方文档进行制作，权威。\r\n\r\n其他依赖版本：\r\n\r\n	1. Maven  需求：3.5+\r\n\r\n   	2. JDK 需求  8+\r\n   	3. Spring Framework 5.3.7以上版本\r\n   	4. Tomcat 9.0\r\n   	5. Servlet版本 4.0  但是可以部署到Servlet到3.1+的容器中\r\n\r\n# 2. 快速入门\r\n\r\n快速的创建一个Spring Boot应用，并且实现一个简单的Http请求处理。通过这个例子对Spring Boot有一个初步的了解，并体验其结构简单、开发快速的特性。\r\n\r\n教程使用的Idea版本：2019.3\r\n\r\n## 2.1 创建基础项目\r\n\r\n**第一步：** 创建maven项目\r\n\r\npom.xml :\r\n\r\n~~~xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<project xmlns=\"http://maven.apache.org/POM/4.0.0\"\r\n         xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n         xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd\">\r\n    <modelVersion>4.0.0</modelVersion>\r\n\r\n    <groupId>com.xiaopizhu</groupId>\r\n    <artifactId>helloSpringBoot</artifactId>\r\n    <version>1.0-SNAPSHOT</version>\r\n	<!--springboot的父工程其中定义了常用的依赖，并且无依赖冲突-->\r\n    <parent>\r\n        <groupId>org.springframework.boot</groupId>\r\n        <artifactId>spring-boot-starter-parent</artifactId>\r\n        <version>2.5.0</version>\r\n    </parent>\r\n</project>\r\n~~~\r\n\r\n注意上方的parent必须加，其中定义了springboot官方支持的n多依赖，基本上常用的已经有了，所以接下来导入依赖的时候，绝大部分都可以不加版本号。\r\n\r\n此时的工程结构为：\r\n\r\n![image-20210523173241557](img/image-20210523173241557.png)\r\n\r\n**第二步：** 添加web依赖\r\n\r\n~~~xml\r\n<dependencies>\r\n    <dependency>\r\n        <groupId>org.springframework.boot</groupId>\r\n        <artifactId>spring-boot-starter-web</artifactId>\r\n    </dependency>\r\n</dependencies>\r\n~~~\r\n\r\n添加上方的web依赖，其中间接依赖了spring-web，spring-webmvc，spring-core等spring和springmvc的包，并且集成了tomcat。\r\n\r\n**第三步：** 编写启动类\r\n\r\n~~~java\r\npackage com.xiaopizhu.springboot;\r\n\r\nimport org.springframework.boot.SpringApplication;\r\nimport org.springframework.boot.autoconfigure.SpringBootApplication;\r\n\r\n@SpringBootApplication\r\npublic class HelloApp {\r\n\r\n    public static void main(String[] args) {\r\n        SpringApplication.run(HelloApp.class,args);\r\n    }\r\n}\r\n\r\n~~~\r\n\r\n@SpringBootApplication注解标识了HelloApp为启动类，也是Spring Boot的核心。\r\n\r\n**第四步：** 运行启动类的main方法\r\n\r\n![image-20210523173712142](img/image-20210523173712142.png)\r\n\r\n看到如上配置，证明启动成功，tomcat端口号默认为8080。\r\n\r\n**第五步：**  如果想要修改端口号，可以在resources目录下新建application.properties\r\n\r\n~~~properties\r\nserver.port=8082\r\n~~~\r\n\r\n**第六步：** 重新运行\r\n\r\n![image-20210523174011613](img/image-20210523174011613.png)\r\n\r\n此时的项目结构为：\r\n\r\n![image-20210523174032053](img/image-20210523174032053.png)\r\n\r\n**src/main/java :**  编写java代码，注意启动类需要放在项目的根包下。\r\n\r\n**src/main/resources:**  放置资源的目录，比如springboot的配置文件，静态文件，mybatis配置，日志配置等。\r\n\r\n**src/test/java:**  测试代码\r\n\r\n## 2.2 编写一个Http接口\r\n\r\n**第一步：**创建`HelloController`类，内容如下：\r\n\r\n~~~java\r\npackage com.xiaopizhu.springboot.controller;\r\n\r\nimport org.springframework.web.bind.annotation.GetMapping;\r\nimport org.springframework.web.bind.annotation.RequestMapping;\r\nimport org.springframework.web.bind.annotation.RestController;\r\n\r\n@RestController\r\n@RequestMapping(\"hello\")\r\npublic class HelloController {\r\n\r\n    @GetMapping(\"boot\")\r\n    public String hello(){\r\n        return \"hello spring boot\";\r\n    }\r\n\r\n}\r\n\r\n~~~\r\n\r\n**注意包名，必须在启动类所在的包名下。**\r\n\r\n**第二步：**重启程序，使用postman或者直接在浏览器输入http://localhost:8082/hello/boot\r\n\r\n得到结果：hello spring boot\r\n\r\n## 2.3 编写单元测试用例\r\n\r\n**第一步：**添加spring boot测试依赖\r\n\r\n~~~xml\r\n		<dependency>\r\n            <groupId>org.springframework.boot</groupId>\r\n            <artifactId>spring-boot-starter-test</artifactId>\r\n            <scope>test</scope>\r\n        </dependency>\r\n~~~\r\n\r\n**第二步：**在src/test 下，编写测试用例\r\n\r\n~~~java\r\npackage com.xiaopizhu.springboot.controller;\r\n\r\nimport org.junit.jupiter.api.BeforeAll;\r\nimport org.junit.jupiter.api.BeforeEach;\r\nimport org.junit.jupiter.api.Test;\r\nimport org.springframework.boot.test.context.SpringBootTest;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.test.web.servlet.MockMvc;\r\nimport org.springframework.test.web.servlet.request.MockMvcRequestBuilders;\r\nimport org.springframework.test.web.servlet.setup.MockMvcBuilders;\r\n\r\nimport static org.hamcrest.Matchers.equalTo;\r\nimport static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;\r\nimport static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;\r\n\r\n@SpringBootTest\r\npublic class TestHelloController {\r\n\r\n    private MockMvc mockMvc;\r\n\r\n    @BeforeEach\r\n    public void beforeEach(){\r\n        mockMvc = MockMvcBuilders.standaloneSetup(new HelloController()).build();\r\n    }\r\n    @Test\r\n    public void testHello() throws Exception {\r\n        mockMvc.perform(MockMvcRequestBuilders.get(\"/hello/boot\")\r\n                .accept(MediaType.APPLICATION_JSON))\r\n                .andExpect(status().isOk())\r\n                .andExpect(content().string(equalTo(\"hello spring boot\")));\r\n    }\r\n}\r\n\r\n~~~\r\n\r\n上面的测试用例，是构建一个空的`WebApplicationContext`，并且在before中加载了HelloController，得以在测试用例中mock调用，模拟请求。\r\n\r\n## 2.4 打包为jar运行\r\n\r\n**第一步：**添加打包(maven构建springboot)插件\r\n\r\n~~~xml\r\n  <build>\r\n        <plugins>\r\n            <plugin>\r\n                <groupId>org.springframework.boot</groupId>\r\n                <artifactId>spring-boot-maven-plugin</artifactId>\r\n            </plugin>\r\n        </plugins>\r\n    </build>\r\n~~~\r\n\r\n在idea的右侧 maven中，使用package来打包程序，打包完成后，在target目录下生成helloSpringBoot-1.0-SNAPSHOT.jar\r\n\r\n![image-20210523181737720](img/image-20210523181737720.png)\r\n\r\n**第二步：**打开cmd：找到jar对应的目录\r\n\r\n输入命令\r\n\r\n~~~shell\r\njava -jar helloSpringBoot-1.0-SNAPSHOT.jar\r\n~~~\r\n\r\n![image-20210523182426404](img/image-20210523182426404.png)\r\n\r\n**第三步：**测试，使用postman或者直接在浏览器输入http://localhost:8082/hello/boot\r\n\r\n得到结果：hello spring boot\r\n\r\n## 2.5 查看jar包内容\r\n\r\n~~~shell\r\njar tvf helloSpringBoot-1.0-SNAPSHOT.jar\r\n~~~\r\n\r\n# 3. 小结\r\n\r\n1. 通过Maven构建了一个空白Spring Boot项目，再通过引入web模块实现了一个简单的请求处理。\r\n2. 通过修改配置文件，更改端口号\r\n3. 编写了测试用例\r\n4. 打包jar包运行\r\n\r\n', '<h2>2018-01-04</h2>\n<pre><code class=\"lang-\"># 使用vue的Webpack模板生成脚手架\n</code></pre>\n<h2>2018-01-05</h2>\n<pre><code class=\"lang-\"># 引入ElementUI\n\n# babel-plugin-component自定义主题\n# 首页\n# 登陆页\n# 注册页面\n# 日志页\n</code></pre>\n<h2>2018-01-07</h2>\n<pre><code class=\"lang-\"># 调整底部栏始终固定在底部\n# 日志页 添加时间轴\n# 首页的文章列表\n</code></pre>\n<h2>2018-01-08</h2>\n<pre><code class=\"lang-\"># 使用组件-博客作者tab页 \n# 添加第三方图标\n</code></pre>\n<h2>2018-01-09</h2>\n<pre><code class=\"lang-\"># 调整顶部导航栏：激活文字颜色，click点击\n# 组件-最新文章tab页\n\n# 最新文章、最热文章使用相同组件\n# 底部栏设计\n# 页面与两边边距改为100\n</code></pre>\n<h2>2018-01-10</h2>\n<pre><code class=\"lang-\"># 写博客 引入mavonEditor编辑器\n# 顶部导航栏都放入一个Menu中\n# 写文章页面\n#　mavonEditor局部引入\n\n#　页面的中间区域固定宽度，自动居中\n# 发布和取消\n# 发布dialog\n\n</code></pre>\n<h2>2018-01-11</h2>\n<pre><code class=\"lang-\"># 文章组件用守卫来改变body背景色\n# 调整登陆和注册页面，使其居中\n\n#子页面调整根元素为div\n#文章详情页\n\n</code></pre>\n<h2>2018-01-12</h2>\n<pre><code class=\"lang-\"># 文章详情页  内容  评论等\n\n</code></pre>\n<h2>2018-01-13</h2>\n<pre><code class=\"lang-\">## 重新调整页面结构	\n#顶部和底部 抽成  BaseHeader BaseFooter 组件\n#BlogView为单独页，以前是Home的子路由\n\n</code></pre>\n<h2>2018-01-15</h2>\n<pre><code class=\"lang-\"># 文章分类去掉子级\n# 将首页的文章列表抽成 ArticleItem组件\n# 增加文章的评论展示\n# 增加文章分类、标签页\n\n</code></pre>\n<h2>2018-01-15  2</h2>\n<pre><code class=\"lang-\"># 回到顶部去掉过渡动画（影响顶部导航栏）\n# 顶部导航栏 增加登录后菜单\n# 首页增加 最热标签\n# 增加 文章分类 标签的详情页\n# 将文章详情页、 文章分类标签页 改为Home的子路由（以前单独页）\n# Home组件增加路由判断：更正导航栏的状态、条件显示底部栏\n\n</code></pre>\n<h2>2018-01-16</h2>\n<pre><code class=\"lang-\"># 将写文章的顶部Header合并到BaseHeader中\n# 图片都放到了static目录下\n\n</code></pre>\n<h2>2018-01-24</h2>\n<pre><code class=\"lang-\"># 将自定义的theme放到assets下\n# 加入axios\n# 加入vuex\n# 实现登录\n# 实现退出\n\n</code></pre>\n<h2>2018-01-25</h2>\n<pre><code class=\"lang-\"># 实现注册逻辑\n# 写文章功能实现\n# 写文章时支持插入图片\n\n</code></pre>\n<h2>2018-01-26</h2>\n<pre><code class=\"lang-\"># 引入lodash工具类\n# 优化写文章的工具栏：滚动时固定顶部\n# 写文章 后台获取文章分类和标签\n\n# 首页的文章列表\n\n</code></pre>\n<h2>2018-01-27</h2>\n<pre><code class=\"lang-\"># 修改首页文章列表的样式\n# 首页加载文章功能\n# 文章查看功能\n# 文章分类和标签功能列表\n\n</code></pre>\n<h2>2018-01-28</h2>\n<pre><code class=\"lang-\"># 文章分类和标签详情\n\n</code></pre>\n<h2>2018-01-29</h2>\n<pre><code class=\"lang-\"># 文章分类和标签的文章数\n# 首页最热文章\n# 首页最新文章\n# 首页最热标签\n\n</code></pre>\n<h2>2018-01-30</h2>\n<pre><code class=\"lang-\"># BaseHeader放回views中\n# 修改Axios后置拦截，全局处理错误\n# 将登录 退出 和头像 放到一起\n\n</code></pre>\n', 1);
INSERT INTO `ms_article_body` VALUES (1585443102391611395, '123', '<p>123</p>\n', 1585443102391611393);
INSERT INTO `ms_article_body` VALUES (1585525930450001923, 'q', '<p>q</p>\n', 1585525930441613313);
INSERT INTO `ms_article_body` VALUES (1585544490182295556, '123', '<p>123</p>\n', 1585544490182295554);
INSERT INTO `ms_article_body` VALUES (1585837933731258372, '13', '<p>13</p>\n', 1585837933731258370);
INSERT INTO `ms_article_body` VALUES (1588395383005204483, 'test', '<p>test</p>\n', 1588395383005204481);

-- ----------------------------
-- Table structure for ms_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `ms_article_tag`;
CREATE TABLE `ms_article_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE,
  INDEX `tag_id`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1588395383005204483 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_article_tag
-- ----------------------------
INSERT INTO `ms_article_tag` VALUES (1, 1, 7);
INSERT INTO `ms_article_tag` VALUES (1585443102391611394, 1585443102391611393, 5);
INSERT INTO `ms_article_tag` VALUES (1585525930450001922, 1585525930441613313, 5);
INSERT INTO `ms_article_tag` VALUES (1585544490182295555, 1585544490182295554, 5);
INSERT INTO `ms_article_tag` VALUES (1585837933731258371, 1585837933731258370, 7);
INSERT INTO `ms_article_tag` VALUES (1588395383005204482, 1588395383005204481, 6);

-- ----------------------------
-- Table structure for ms_category
-- ----------------------------
DROP TABLE IF EXISTS `ms_category`;
CREATE TABLE `ms_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_category
-- ----------------------------
INSERT INTO `ms_category` VALUES (1, '/static/category/front.png', '前端', '前端是什么，大前端');
INSERT INTO `ms_category` VALUES (2, '/static/category/back.png', '后端', '后端掉头发');
INSERT INTO `ms_category` VALUES (3, '/static/category/lift.jpg', '生活', '生活趣事');
INSERT INTO `ms_category` VALUES (4, '/static/category/database.png', '数据库', '没数据库，啥也不管用');
INSERT INTO `ms_category` VALUES (5, '/static/category/language.png', '编程语言', '好多语言，该学哪个？');

-- ----------------------------
-- Table structure for ms_comment
-- ----------------------------
DROP TABLE IF EXISTS `ms_comment`;
CREATE TABLE `ms_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `to_uid` bigint(20) NOT NULL,
  `level` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1589559768822063107 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_comment
-- ----------------------------
INSERT INTO `ms_comment` VALUES (1585439473056165889, '123\n', 1666833201073, 1, 1585208317123518465, 0, 0, '1');
INSERT INTO `ms_comment` VALUES (1585456783322066945, '123', 1666837328173, 1585443102391611393, 1585208317123518465, 0, 0, '1');
INSERT INTO `ms_comment` VALUES (1585456842029740034, '123', 1666837342171, 1585443102391611393, 1585208317123518465, 1585456783322066945, 1585208317123518465, '2');
INSERT INTO `ms_comment` VALUES (1585836980349181954, '123', 1666927974212, 1585544490182295554, 1585612642077437954, 0, 0, '1');
INSERT INTO `ms_comment` VALUES (1585836992802070529, '123', 1666927977171, 1585544490182295554, 1585612642077437954, 1585836980349181954, 1585612642077437954, '2');
INSERT INTO `ms_comment` VALUES (1585837558848561154, '123', 1666928112128, 1585544490182295554, 1585612642077437954, 1585836980349181954, 1585612642077437954, '2');
INSERT INTO `ms_comment` VALUES (1585837637504344066, '123', 1666928130881, 1585544490182295554, 1585612642077437954, 0, 0, '1');
INSERT INTO `ms_comment` VALUES (1585837654927482881, '123', 1666928135032, 1585544490182295554, 1585612642077437954, 1585837637504344066, 1585612642077437954, '2');
INSERT INTO `ms_comment` VALUES (1585837753657204738, '123', 1666928158569, 1585544490182295554, 1585612642077437954, 1585836980349181954, 1585612642077437954, '2');
INSERT INTO `ms_comment` VALUES (1585838210370772994, '123', 1666928267465, 1585525930441613313, 1585612642077437954, 0, 0, '1');
INSERT INTO `ms_comment` VALUES (1585855958031282178, '123', 1666932498829, 1585837933731258370, 1585612642077437954, 0, 0, '1');
INSERT INTO `ms_comment` VALUES (1585877889614884865, '32', 1666937727735, 1585837933731258370, 1585612642077437954, 0, 0, '1');
INSERT INTO `ms_comment` VALUES (1585877917423120386, '23', 1666937734358, 1585837933731258370, 1585612642077437954, 1585855958031282178, 1585612642077437954, '2');
INSERT INTO `ms_comment` VALUES (1585877931973160961, '23\n', 1666937737831, 1585837933731258370, 1585612642077437954, 0, 0, '1');

-- ----------------------------
-- Table structure for ms_message_board
-- ----------------------------
DROP TABLE IF EXISTS `ms_message_board`;
CREATE TABLE `ms_message_board`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ms_message_board
-- ----------------------------
INSERT INTO `ms_message_board` VALUES (1, 'qwe', '添加了登录注册返回按钮', '2022-11-03 10:49:27');

-- ----------------------------
-- Table structure for ms_permission
-- ----------------------------
DROP TABLE IF EXISTS `ms_permission`;
CREATE TABLE `ms_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_permission
-- ----------------------------
INSERT INTO `ms_permission` VALUES (1, '查询权限列表', '/admin/permission/permissionList', '查询权限列表');
INSERT INTO `ms_permission` VALUES (2, '11', '11', '111');
INSERT INTO `ms_permission` VALUES (7, '1213', '123', '123');
INSERT INTO `ms_permission` VALUES (8, '删除权限', '/admin/permission/add', '删除权限');

-- ----------------------------
-- Table structure for ms_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `ms_sys_log`;
CREATE TABLE `ms_sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` bigint(20) NULL DEFAULT NULL,
  `ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `module` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `nickname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `operation` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `time` bigint(20) NULL DEFAULT NULL,
  `userid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for ms_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `ms_sys_user`;
CREATE TABLE `ms_sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `admin` bit(1) NULL DEFAULT NULL COMMENT '是否管理员',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_date` bigint(20) NULL DEFAULT NULL COMMENT '注册时间',
  `deleted` bit(1) NULL DEFAULT NULL COMMENT '是否删除',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `last_login` bigint(20) NULL DEFAULT NULL COMMENT '最后登录时间',
  `mobile_phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密盐',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1589577775824809987 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_sys_user
-- ----------------------------
INSERT INTO `ms_sys_user` VALUES (1, 'admin', b'1', 'static/user/admin.jpg', 20210622223122, b'0', '11', 20210630223130, '12', '管理员', '8628d1f407f72e10ac947a032fe5ad29', '12', '1');
INSERT INTO `ms_sys_user` VALUES (1585208317123518465, '1234567890', b'1', '/static/img/logo.b3a48c0.png', 1666778089205, b'0', '', 1666778089205, NULL, '雷霆', '6a17c7d92b5a2b2ab9c74ba9497546ac', '', '');
INSERT INTO `ms_sys_user` VALUES (1585612642077437954, '1472583690', b'1', '/static/img/logo.b3a48c0.png', 1666874487790, b'0', '', 1666874487790, NULL, 'qwe', '8628d1f407f72e10ac947a032fe5ad29', '', '');
INSERT INTO `ms_sys_user` VALUES (1589577775824809986, '1231231231', b'1', '/static/img/logo.b3a48c0.png', 1667819849340, b'0', '', 1667819849340, NULL, '啊撒大苏打实打实大苏', '8628d1f407f72e10ac947a032fe5ad29', '', '');

-- ----------------------------
-- Table structure for ms_tag
-- ----------------------------
DROP TABLE IF EXISTS `ms_tag`;
CREATE TABLE `ms_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tag_num` bigint(20) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ms_tag
-- ----------------------------
INSERT INTO `ms_tag` VALUES (5, '/static/tag/java.png', 'javase', 3);
INSERT INTO `ms_tag` VALUES (6, '/static/tag/java.png', 'spring', 1);
INSERT INTO `ms_tag` VALUES (7, '/static/tag/html.png', 'html', 2);
INSERT INTO `ms_tag` VALUES (11, '/static/tag/css.png', 'css', 0);
INSERT INTO `ms_tag` VALUES (12, '/static/tag/js.png', 'js', 0);
INSERT INTO `ms_tag` VALUES (13, '/static/tag/vue.png', 'vue', 0);
INSERT INTO `ms_tag` VALUES (14, '/static/tag/maven.png', 'maven', 0);
INSERT INTO `ms_tag` VALUES (15, '/static/tag/docker.jpg', 'docker', 0);
INSERT INTO `ms_tag` VALUES (16, '/static/tag/tomcat.png', 'tomcat', 0);
INSERT INTO `ms_tag` VALUES (17, '/static/tag/activemq.png', 'activemq', 0);
INSERT INTO `ms_tag` VALUES (18, '/static/tag/rabbitmq.svg', 'rabbitmq', 0);
INSERT INTO `ms_tag` VALUES (19, '/static/tag/nginx.png', 'nginx', 0);
INSERT INTO `ms_tag` VALUES (20, '/static/tag/redis.png', 'redis', 0);
INSERT INTO `ms_tag` VALUES (21, '/static/tag/mysql.jpg', 'mysql', 0);

-- ----------------------------
-- Table structure for ms_zan
-- ----------------------------
DROP TABLE IF EXISTS `ms_zan`;
CREATE TABLE `ms_zan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` bigint(50) NOT NULL DEFAULT 0 COMMENT '点赞数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ms_zan
-- ----------------------------
INSERT INTO `ms_zan` VALUES (1, 30);

SET FOREIGN_KEY_CHECKS = 1;
