-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-06-01 16:25:04
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
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `t` int(10) UNSIGNED NOT NULL COMMENT '时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_article`
--

INSERT INTO `qw_article` (`aid`, `title`, `content`, `t`) VALUES
(1, '如何使用我的分类功能？', '<p style="color:#6A757E;font-size:14px;font-family:&quot;">\r\n	"我的分类"分为一级分类和二级分类。一级分类为父栏目，二级分类为子栏目。\r\n</p>\r\n<p style="color:#6A757E;font-size:14px;font-family:&quot;">\r\n	在创建分类上级分类为空时默认创建父栏目，选择父栏目时创建的为子栏目。\r\n</p>\r\n<p style="color:#6A757E;font-size:14px;font-family:&quot;">\r\n	视频只能发布在子栏目内，点击子栏目链接可看到该子栏目下所有的视频。个人分类仅自己可见。\r\n</p>\r\n<p style="color:#6A757E;font-size:14px;font-family:&quot;">\r\n	该功能为方便站长对视频分类、检索，如上传"人民的名义"全集，可新建父栏目"国产电视剧"，再在此父栏目下新建子栏目"人民的名义全集"，上传所有视频时私人分类选项选择"国产电视剧"-"人民的名义全集"。\r\n</p>', 1527601243),
(2, '如何正确使用视频、预览图api接口', '<p style="color:#6A757E;font-size:14px;font-family:&quot;">\r\n	为防止CDN域名被墙，现全部改用API调用视频。当视频源地址被屏蔽时，官方后台更换域名即可，再无须站长批量替换数据库字段。\r\n</p>\r\n<p style="color:#6A757E;font-size:14px;font-family:&quot;">\r\n	例：http://api2.my230.com/?vid=27pandDrclN2ZEgl4skz2 为一个视频的API接口。其中：http://api2.my230.com/?vid= 为固定接口，27pandDrclN2ZEgl4skz2为内容值（视频ID）。\r\n</p>\r\n<p style="color:#6A757E;font-size:14px;font-family:&quot;">\r\n	站长只需和以往一样在调用视频时填写视频API接口地址，该地址永不失效且不会被屏蔽。\r\n</p>\r\n<p style="color:#6A757E;font-size:14px;font-family:&quot;">\r\n	预览图API接口同理，在网页代码src=""处填写接口地址即可。默认调用第一张图片。\r\n</p>\r\n<p style="color:#6A757E;font-size:14px;font-family:&quot;">\r\n	如想调用其他图片请在接口地址后加"&amp;no=2",如调用某视频第二章预览图地址：http://api2.my230.com/apitu.php?vid=27pandDrclN2ZEgl4skz2&amp;no=2。\r\n</p>', 1527601282),
(3, '上传类别分类与使用限制', '<p style="color:#6A757E;font-size:14px;font-family:&quot;">\r\n	为方便管理员审核内容，上传视频时必须按照视频内容选择对应类别。短片、搞笑小视频等归为"其他视频"，伦理片一律归为"成人视频"。\r\n</p>\r\n<p style="color:#6A757E;font-size:14px;font-family:&quot;">\r\n	上传的视频中不得带有明显广告水印，引诱文字水印，内置推广视频等。\r\n</p>\r\n<p style="color:#6A757E;font-size:14px;font-family:&quot;">\r\n	视频内容必须遵循美国法律和联邦宪法，严禁上传涉及幼兽、恐暴、宗教、政治、反动等国际上禁止的内容。\r\n</p>\r\n<p style="color:#6A757E;font-size:14px;font-family:&quot;">\r\n	违反者我们会第一时间永久封停该帐号，并配合IDC公司将涉事者相关资料递交给当地警局处理。\r\n</p>', 1527601318);

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
(25, 24, 'Article/index', '使用说明', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 25, '网站虽然重要，身体更重要，出去走走吧。'),
(26, 24, 'Article/add', '新增文章', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 26, ''),
(27, 24, 'Article/edit', '编辑文章', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 27, ''),
(29, 24, 'Article/update', '保存文章', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 29, ''),
(30, 24, 'Article/del', '删除文章', '', 1, 1, '', 0, 30, ''),
(31, 24, 'Category/index', '分类管理', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 31, ''),
(32, 24, 'Category/add', '新增分类', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 32, ''),
(33, 24, 'Category/edit', '编辑分类', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 33, ''),
(34, 24, 'Category/update', '保存分类', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 34, ''),
(36, 24, 'Category/del', '删除分类', '', 1, 1, '', 0, 36, ''),
(66, 24, 'Ser/index', '服务管理', '', 1, 1, '', 1, 0, ''),
(67, 24, 'User/index', '用户管理', '', 1, 1, '', 1, 0, ''),
(68, 24, 'User/cate', '用户分类', '', 1, 1, '', 1, 0, ''),
(69, 24, 'User/vod', '用户视频', '', 1, 1, '', 1, 0, ''),
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
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(100) NOT NULL COMMENT '分类名称',
  `o` int(11) NOT NULL COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_category`
--

INSERT INTO `qw_category` (`id`, `pid`, `name`, `o`) VALUES
(36, 0, '电影', 1),
(37, 0, '电视剧', 2),
(38, 0, '其他视频', 3),
(39, 0, '成人视频', 4),
(40, 0, '动漫里番', 5);

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
-- 表的结构 `qw_fav`
--

CREATE TABLE `qw_fav` (
  `id` int(10) UNSIGNED NOT NULL,
  `cid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `titlepic` varchar(255) NOT NULL,
  `mid` int(255) NOT NULL,
  `size` varchar(50) NOT NULL,
  `odownpath1` varchar(255) NOT NULL,
  `share` varchar(255) NOT NULL,
  `videoid` varchar(100) NOT NULL,
  `fileurl` varchar(255) NOT NULL,
  `videofileurl` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_fav`
--

INSERT INTO `qw_fav` (`id`, `cid`, `title`, `titlepic`, `mid`, `size`, `odownpath1`, `share`, `videoid`, `fileurl`, `videofileurl`, `uid`, `addtime`, `status`) VALUES
(1, 36, '误导.mp4', 'http://img.rizhi98.com?img=/20180526/误导/1.jpg', 2, '23.9', 'http://www.rizhi98.com?vip=/20180526/误导/index.m3u8', 'http://www.rizhi98.com?vip=/share/xBY6MgJXbql6gpwV', 'xBY6MgJXbql6gpwV', 'http://www.rizhi98.com/?vip=/20180526/误导.mp4', 'http://www.rizhi98.com/?vip=/20180526/误导.mp4', 1, 1527347725, 1),
(2, 36, '广场.mp4', '/20180526/广场/1.jpg', 2, '19.7', '/20180526/广场/index.m3u8', '/share/jtfj64KmKJTjB33U', 'jtfj64KmKJTjB33U', '/20180526/广场.mp4', '/20180526/广场.mp4', 1, 1527603267, 1);

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
(5, 'admin', 1526782233, '::1', '登录成功。'),
(6, 'admin', 1527294445, '::1', '登录成功。'),
(7, 'admin', 1527294465, '::1', '新增分类，ID：36，名称：电影'),
(8, 'admin', 1527294481, '::1', '新增分类，ID：37，名称：电视剧'),
(9, 'admin', 1527294493, '::1', '新增分类，ID：38，名称：其他视频'),
(10, 'admin', 1527294507, '::1', '新增分类，ID：39，名称：成人视频'),
(11, 'admin', 1527294531, '::1', '新增分类，ID：40，名称：动漫里番'),
(12, 'admin', 1527294843, '::1', '新增菜单，名称：服务管理'),
(13, 'admin', 1527294884, '::1', '新增服务，AID：1'),
(14, 'admin', 1527296521, '::1', '新增服务，AID：2'),
(15, 'admin', 1527408100, '::1', '登录成功。'),
(16, 'admin', 1527414860, '::1', '新增菜单，名称：用户管理'),
(17, 'admin', 1527414912, '::1', '新增菜单，名称：视频管理'),
(18, 'admin', 1527414960, '::1', '编辑菜单，ID：68'),
(19, 'admin', 1527414977, '::1', '编辑菜单，ID：68'),
(20, 'admin', 1527415158, '::1', '新增菜单，名称：用户视频'),
(21, 'admin', 1527600542, '::1', '登录成功。'),
(22, 'admin', 1527600944, '::1', '编辑菜单，ID：25'),
(23, 'admin', 1527600983, '::1', '编辑菜单，ID：26'),
(24, 'admin', 1527601243, '::1', '新增文章，AID：1'),
(25, 'admin', 1527601282, '::1', '新增文章，AID：2'),
(26, 'admin', 1527601318, '::1', '新增文章，AID：3'),
(27, 'admin', 1527770419, '::1', '登录成功。');

-- --------------------------------------------------------

--
-- 表的结构 `qw_login`
--

CREATE TABLE `qw_login` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(100) NOT NULL,
  `client` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `logintime` int(11) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_login`
--

INSERT INTO `qw_login` (`id`, `ip`, `client`, `address`, `logintime`, `username`) VALUES
(1, '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', '1	-1	-1	', 1527293786, '张三'),
(2, '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', '1	-1	-1	', 1527407939, '张三'),
(3, '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', '1	-1	-1	', 1527600591, '张三'),
(4, '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', '1	-1	-1	', 1527770178, '张三'),
(5, '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', '1	-1	-1	', 1527860355, '张三'),
(6, '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', '1	-1	-1	', 1527860477, '张三'),
(7, '0.0.0.0', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36', '1	-1	-1	', 1527865431, '张三');

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
-- 表的结构 `qw_ser`
--

CREATE TABLE `qw_ser` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `addtime` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_ser`
--

INSERT INTO `qw_ser` (`id`, `name`, `ip`, `domain`, `addtime`, `status`) VALUES
(1, '美国服务管理', 'http://127.0.0.1:2000', 'http://www.baidu.com', 1527294884, 2),
(2, '深圳服务器', 'http://127.0.0.1:2000', 'http://www.baidu.com', 1527296521, 1);

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
  `u_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_ucat`
--

INSERT INTO `qw_ucat` (`id`, `ucat`, `pid`, `u_id`) VALUES
(3, 'wawa', 0, 1),
(4, 'haha', 0, 1),
(5, 'lisi', 3, 1);

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

-- --------------------------------------------------------

--
-- 表的结构 `qw_vod`
--

CREATE TABLE `qw_vod` (
  `id` int(10) UNSIGNED NOT NULL,
  `cid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL DEFAULT 'http://api.rizhi98.com/?vp=',
  `titlepic` varchar(255) NOT NULL,
  `mid` int(255) NOT NULL,
  `size` varchar(50) NOT NULL,
  `odownpath1` varchar(255) NOT NULL,
  `share` varchar(255) NOT NULL,
  `videoid` varchar(100) NOT NULL,
  `fileurl` varchar(255) NOT NULL,
  `videofileurl` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `fid` varchar(255) NOT NULL DEFAULT ',',
  `addtime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `qw_vod`
--

INSERT INTO `qw_vod` (`id`, `cid`, `title`, `url`, `titlepic`, `mid`, `size`, `odownpath1`, `share`, `videoid`, `fileurl`, `videofileurl`, `uid`, `fid`, `addtime`) VALUES
(2, 38, '误导', 'http://api.rizhi98.com/?vp=', 'http://img.rizhi98.com?img=/20180526/误导/1.jpg', 2, '23.9', 'http://www.rizhi98.com?vip=/20180526/误导/index.m3u8', 'http://www.rizhi98.com?vip=/share/xBY6MgJXbql6gpwV', 'xBY6MgJXbql6gpwV', 'http://www.rizhi98.com/?vip=/20180526/误导.mp4', 'http://www.rizhi98.com/?vip=/20180526/误导.mp4', 1, ',', 1527313119),
(3, 36, '误导.mp4', 'http://api.rizhi98.com/?vp=', 'http://img.rizhi98.com?img=/20180526/误导/1.jpg', 2, '23.9', 'http://www.rizhi98.com?vip=/20180526/误导/index.m3u8', 'http://www.rizhi98.com?vip=/share/xBY6MgJXbql6gpwV', 'xBY6MgJXbql6gpwV', 'http://www.rizhi98.com/?vip=/20180526/误导.mp4', 'http://www.rizhi98.com/?vip=/20180526/误导.mp4', 1, ',1,', 1527347725),
(4, 36, '广场.mp4', 'http://api.rizhi98.com/?vp=', '/20180526/广场/1.jpg', 2, '19.7', '/20180526/广场/index.m3u8', '/share/jtfj64KmKJTjB33U', 'jtfj64KmKJTjB33U', '/20180526/广场.mp4', '/20180526/广场.mp4', 1, ',1,', 1527603267),
(5, 36, '广场.mp4', 'http://api.rizhi98.com/?vp=', 'http://198.40.54.138/20180526/广场/1.jpg', 2, '19.7', 'http://198.40.54.138/20180526/广场/index.m3u8', 'http://198.40.54.138/share/jtfj64KmKJTjB33U', 'jtfj64KmKJTjB33U', 'http://198.40.54.138/20180526/广场.mp4', 'http://198.40.54.138/20180526/广场.mp4', 1, ',', 1527603943);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `qw_article`
--
ALTER TABLE `qw_article`
  ADD PRIMARY KEY (`aid`);

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
-- Indexes for table `qw_fav`
--
ALTER TABLE `qw_fav`
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
-- Indexes for table `qw_login`
--
ALTER TABLE `qw_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qw_member`
--
ALTER TABLE `qw_member`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `qw_ser`
--
ALTER TABLE `qw_ser`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `qw_vod`
--
ALTER TABLE `qw_vod`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `qw_article`
--
ALTER TABLE `qw_article`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `qw_auth_group`
--
ALTER TABLE `qw_auth_group`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `qw_auth_rule`
--
ALTER TABLE `qw_auth_rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- 使用表AUTO_INCREMENT `qw_category`
--
ALTER TABLE `qw_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- 使用表AUTO_INCREMENT `qw_devlog`
--
ALTER TABLE `qw_devlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `qw_fav`
--
ALTER TABLE `qw_fav`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- 使用表AUTO_INCREMENT `qw_login`
--
ALTER TABLE `qw_login`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `qw_member`
--
ALTER TABLE `qw_member`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `qw_ser`
--
ALTER TABLE `qw_ser`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `qw_ucat`
--
ALTER TABLE `qw_ucat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `qw_user`
--
ALTER TABLE `qw_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `qw_vod`
--
ALTER TABLE `qw_vod`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
