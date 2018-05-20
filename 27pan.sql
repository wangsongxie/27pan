-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-05-20 14:40:51
-- 服务器版本： 5.7.15-log
-- PHP Version: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `27pan`
--

-- --------------------------------------------------------

--
-- 表的结构 `qw_article`
--

CREATE TABLE `qw_article` (
  `aid` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT '分类id',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `seotitle` varchar(255) DEFAULT NULL COMMENT 'SEO标题',
  `keywords` varchar(255) NOT NULL COMMENT '关键词',
  `description` varchar(255) NOT NULL COMMENT '摘要',
  `thumbnail` varchar(255) NOT NULL COMMENT '缩略图',
  `content` text NOT NULL COMMENT '内容',
  `t` int(10) UNSIGNED NOT NULL COMMENT '时间',
  `n` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '点击'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `qw_auth_group`
--

CREATE TABLE `qw_auth_group` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_auth_group`
--

INSERT INTO `qw_auth_group` (`id`, `title`, `status`, `rules`) VALUES
(1, '超级管理员', 1, '1,2,58,65,59,60,61,62,3,56,4,6,5,7,8,9,10,51,52,53,57,11,54,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,36,37,38,39,40,41,42,43,44,45,46,47,63,48,49,50,55'),
(2, '管理员', 1, '13,14,23,22,21,20,19,18,17,16,15,24,36,34,33,32,31,30,29,27,26,25,1'),
(3, '普通用户', 1, '1'),
(6, '333', 0, '1,2');

-- --------------------------------------------------------

--
-- 表的结构 `qw_auth_group_access`
--

CREATE TABLE `qw_auth_group_access` (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_auth_group_access`
--

INSERT INTO `qw_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `qw_auth_rule`
--

CREATE TABLE `qw_auth_rule` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `islink` tinyint(1) NOT NULL DEFAULT '1',
  `o` int(11) NOT NULL COMMENT '排序',
  `tips` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_auth_rule`
--

INSERT INTO `qw_auth_rule` (`id`, `pid`, `name`, `title`, `icon`, `type`, `status`, `condition`, `islink`, `o`, `tips`) VALUES
(1, 0, 'Index/index', '控制台', 'menu-icon fa fa-tachometer', 1, 1, '', 1, 1, '友情提示：经常查看操作日志，发现异常以便及时追查原因。'),
(2, 0, '', '系统设置', 'menu-icon fa fa-cog', 1, 1, '', 1, 2, ''),
(3, 2, 'Setting/setting', '网站设置', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 3, '这是网站设置的提示。'),
(4, 2, 'Menu/index', '后台菜单', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 4, ''),
(5, 2, 'Menu/add', '新增菜单', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 5, ''),
(6, 4, 'Menu/edit', '编辑菜单', '', 1, 1, '', 0, 6, ''),
(7, 2, 'Menu/update', '保存菜单', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 7, ''),
(8, 2, 'Menu/del', '删除菜单', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 8, ''),
(10, 9, 'Database/recovery', '数据库还原', '', 1, 1, '', 0, 10, ''),
(12, 2, 'Update/devlog', '开发日志', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 12, ''),
(13, 0, '', '用户及组', 'menu-icon fa fa-users', 1, 1, '', 1, 13, ''),
(14, 13, 'Member/index', '用户管理', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 14, ''),
(15, 13, 'Member/add', '新增用户', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 15, ''),
(16, 13, 'Member/edit', '编辑用户', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 16, ''),
(17, 13, 'Member/update', '保存用户', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 17, ''),
(18, 13, 'Member/del', '删除用户', '', 1, 1, '', 0, 18, ''),
(19, 13, 'Group/index', '用户组管理', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 19, ''),
(20, 13, 'Group/add', '新增用户组', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 20, ''),
(21, 13, 'Group/edit', '编辑用户组', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 21, ''),
(22, 13, 'Group/update', '保存用户组', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 22, ''),
(23, 13, 'Group/del', '删除用户组', '', 1, 1, '', 0, 23, ''),
(24, 0, '', '网站内容', 'menu-icon fa fa-desktop', 1, 1, '', 1, 24, ''),
(25, 24, 'Article/index', '文章管理', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 25, '网站虽然重要，身体更重要，出去走走吧。'),
(26, 24, 'Article/add', '新增文章', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 26, ''),
(27, 24, 'Article/edit', '编辑文章', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 27, ''),
(29, 24, 'Article/update', '保存文章', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 29, ''),
(30, 24, 'Article/del', '删除文章', '', 1, 1, '', 0, 30, ''),
(31, 24, 'Category/index', '分类管理', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 31, ''),
(32, 24, 'Category/add', '新增分类', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 32, ''),
(33, 24, 'Category/edit', '编辑分类', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 33, ''),
(34, 24, 'Category/update', '保存分类', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 34, ''),
(36, 24, 'Category/del', '删除分类', '', 1, 1, '', 0, 36, ''),
(48, 0, 'Personal/index', '个人中心', 'menu-icon fa fa-user', 1, 1, '', 1, 48, ''),
(49, 48, 'Personal/profile', '个人资料', 'menu-icon fa fa-user', 1, 1, '', 1, 49, ''),
(50, 48, 'Logout/index', '退出', '', 1, 1, '', 1, 50, ''),
(51, 9, 'Database/export', '备份', '', 1, 1, '', 0, 51, ''),
(52, 9, 'Database/optimize', '数据优化', '', 1, 1, '', 0, 52, ''),
(53, 9, 'Database/repair', '修复表', '', 1, 1, '', 0, 53, ''),
(54, 11, 'Update/updating', '升级安装', '', 1, 1, '', 0, 54, ''),
(55, 48, 'Personal/update', '资料保存', '', 1, 1, '', 0, 55, ''),
(56, 3, 'Setting/update', '设置保存', '', 1, 1, '', 0, 56, ''),
(57, 9, 'Database/del', '备份删除', '', 1, 1, '', 0, 57, ''),
(59, 58, 'variable/add', '新增变量', '', 1, 1, '', 0, 0, ''),
(60, 58, 'variable/edit', '编辑变量', '', 1, 1, '', 0, 0, ''),
(61, 58, 'variable/update', '保存变量', '', 1, 1, '', 0, 0, ''),
(62, 58, 'variable/del', '删除变量', '', 1, 1, '', 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `qw_category`
--

CREATE TABLE `qw_category` (
  `id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0正常，1单页，2外链',
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(100) NOT NULL COMMENT '分类名称',
  `dir` varchar(100) NOT NULL COMMENT '目录名称',
  `seotitle` varchar(200) DEFAULT NULL COMMENT 'SEO标题',
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `cattemplate` varchar(100) NOT NULL,
  `contemplate` varchar(100) NOT NULL,
  `o` int(11) NOT NULL COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `qw_devlog`
--

CREATE TABLE `qw_devlog` (
  `id` int(11) NOT NULL,
  `v` varchar(225) NOT NULL COMMENT '版本号',
  `y` int(4) NOT NULL COMMENT '年分',
  `t` int(10) NOT NULL COMMENT '发布日期',
  `log` text NOT NULL COMMENT '更新日志'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_devlog`
--

INSERT INTO `qw_devlog` (`id`, `v`, `y`, `t`, `log`) VALUES
(1, '1.0.0', 2016, 1440259200, 'QWADMIN第一个版本发布。'),
(2, '1.0.1', 2016, 1440259200, '修改cookie过于简单的安全风险。');

-- --------------------------------------------------------

--
-- 表的结构 `qw_flash`
--

CREATE TABLE `qw_flash` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `o` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `qw_links`
--

CREATE TABLE `qw_links` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `o` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `qw_log`
--

CREATE TABLE `qw_log` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `t` int(10) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `log` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_log`
--

INSERT INTO `qw_log` (`id`, `name`, `t`, `ip`, `log`) VALUES
(1, 'admin', 1526697966, '::1', '登录成功。'),
(2, 'admin', 1526697990, '::1', '修改网站配置。'),
(3, 'admin', 1526698127, '::1', '删除菜单ID：Array'),
(4, 'admin', 1526698139, '::1', '删除菜单ID：Array'),
(5, 'admin', 1526782233, '::1', '登录成功。');

-- --------------------------------------------------------

--
-- 表的结构 `qw_member`
--

CREATE TABLE `qw_member` (
  `uid` int(11) NOT NULL,
  `user` varchar(225) NOT NULL,
  `head` varchar(255) NOT NULL COMMENT '头像',
  `sex` tinyint(1) NOT NULL COMMENT '0保密1男，2女',
  `birthday` int(10) NOT NULL COMMENT '生日',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `qq` varchar(20) NOT NULL COMMENT 'QQ',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `password` varchar(32) NOT NULL,
  `t` int(10) UNSIGNED NOT NULL COMMENT '注册时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_member`
--

INSERT INTO `qw_member` (`uid`, `user`, `head`, `sex`, `birthday`, `phone`, `qq`, `email`, `password`, `t`) VALUES
(1, 'admin', '/Public/attached/201601/1453389194.png', 1, 1420128000, '13800138000', '331349451', 'xieyanwei@qq.com', '66d6a1c8748025462128dc75bf5ae8d1', 1442505600);

-- --------------------------------------------------------

--
-- 表的结构 `qw_setting`
--

CREATE TABLE `qw_setting` (
  `k` varchar(100) NOT NULL COMMENT '变量',
  `v` varchar(255) NOT NULL COMMENT '值',
  `type` tinyint(1) NOT NULL COMMENT '0系统，1自定义',
  `name` varchar(255) NOT NULL COMMENT '说明'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_setting`
--

INSERT INTO `qw_setting` (`k`, `v`, `type`, `name`) VALUES
('sitename', '27盘', 0, ''),
('title', '27盘', 0, ''),
('keywords', '关键词', 0, ''),
('description', '网站描述', 0, ''),
('footer', '2016©恰维网络', 0, ''),
('test', '测试', 1, '测试变量');

-- --------------------------------------------------------

--
-- 表的结构 `qw_ucat`
--

CREATE TABLE `qw_ucat` (
  `id` int(10) UNSIGNED NOT NULL,
  `ucat` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_ucat`
--

INSERT INTO `qw_ucat` (`id`, `ucat`, `pid`, `uid`) VALUES
(2, 'wawa', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `qw_user`
--

CREATE TABLE `qw_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(60) NOT NULL,
  `userpass` varchar(40) NOT NULL,
  `useremail` varchar(100) NOT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `web` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `addtime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_user`
--

INSERT INTO `qw_user` (`id`, `username`, `userpass`, `useremail`, `qq`, `web`, `status`, `addtime`) VALUES
(1, '张三', 'zhangsan', 'wangsongxie@163.com', '89797899', 'www.baidu.com', 1, 1526771455);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `qw_article`
--
ALTER TABLE `qw_article`
  ADD PRIMARY KEY (`aid`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `qw_auth_group`
--
ALTER TABLE `qw_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qw_auth_group_access`
--
ALTER TABLE `qw_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `qw_auth_rule`
--
ALTER TABLE `qw_auth_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qw_category`
--
ALTER TABLE `qw_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fsid` (`pid`);

--
-- Indexes for table `qw_devlog`
--
ALTER TABLE `qw_devlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qw_flash`
--
ALTER TABLE `qw_flash`
  ADD PRIMARY KEY (`id`),
  ADD KEY `o` (`o`);

--
-- Indexes for table `qw_links`
--
ALTER TABLE `qw_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `o` (`o`);

--
-- Indexes for table `qw_log`
--
ALTER TABLE `qw_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qw_member`
--
ALTER TABLE `qw_member`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `qw_setting`
--
ALTER TABLE `qw_setting`
  ADD PRIMARY KEY (`k`),
  ADD KEY `k` (`k`);

--
-- Indexes for table `qw_ucat`
--
ALTER TABLE `qw_ucat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qw_user`
--
ALTER TABLE `qw_user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `qw_article`
--
ALTER TABLE `qw_article`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `qw_auth_group`
--
ALTER TABLE `qw_auth_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `qw_auth_rule`
--
ALTER TABLE `qw_auth_rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- 使用表AUTO_INCREMENT `qw_category`
--
ALTER TABLE `qw_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- 使用表AUTO_INCREMENT `qw_devlog`
--
ALTER TABLE `qw_devlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `qw_flash`
--
ALTER TABLE `qw_flash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `qw_links`
--
ALTER TABLE `qw_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `qw_log`
--
ALTER TABLE `qw_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `qw_member`
--
ALTER TABLE `qw_member`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `qw_ucat`
--
ALTER TABLE `qw_ucat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `qw_user`
--
ALTER TABLE `qw_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
