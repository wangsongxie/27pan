<?php
//服务器管理类

namespace Qwadmin\Controller;

use Vendor\Tree;


class UserController extends ComController{
	
	
	
	 public function index($sid = 0, $p = 1)
    {


        $p = intval($p) > 0 ? $p : 1;

        $article = M('user');
        $pagesize = 20;#每页数量
        $offset = $pagesize * ($p - 1);//计算记录偏移量
        $prefix = C('DB_PREFIX');
        $keyword = isset($_GET['keyword']) ? htmlentities($_GET['keyword']) : '';
        $order = isset($_GET['order']) ? $_GET['order'] : 'DESC';
        $where = '1 = 1 ';
        
        if ($keyword) {
            $where .= "and {$prefix}ser.title like '%{$keyword}%' ";
        }
        //默认按照时间降序
        $orderby = "addtime desc";
        if ($order == "asc") {

            $orderby = "t asc";
        }


        $count = $article->where($where)->count();
        $list = $article->field("{$prefix}user.*")->where($where)->order($orderby)->limit($offset . ',' . $pagesize)->select();

        $page = new \Think\Page($count, $pagesize);
        $page = $page->show();
        $this->assign('list', $list);
        $this->assign('page', $page);
        $this->display();
    }
	
	
}