<?php
//服务器管理类

namespace Qwadmin\Controller;

use Vendor\Tree;


class SerController extends ComController{
	
	public function add()
    {

        
        $this->display('form');
    }
	
	 public function index($sid = 0, $p = 1)
    {


        $p = intval($p) > 0 ? $p : 1;

        $article = M('ser');
        $pagesize = 20;#每页数量
        $offset = $pagesize * ($p - 1);//计算记录偏移量
        $prefix = C('DB_PREFIX');
        $keyword = isset($_GET['keyword']) ? htmlentities($_GET['keyword']) : '';
        $order = isset($_GET['order']) ? $_GET['order'] : 'DESC';
        $where = '1 = 1 ';
        
        if ($keyword) {
            $where .= "and {$prefix}ser.name like '%{$keyword}%' ";
        }
        //默认按照时间降序
        $orderby = "addtime desc";
        if ($order == "asc") {

            $orderby = "t asc";
        }


        $count = $article->where($where)->count();
        $list = $article->field("{$prefix}ser.*")->where($where)->order($orderby)->limit($offset . ',' . $pagesize)->select();

        $page = new \Think\Page($count, $pagesize);
        $page = $page->show();
        $this->assign('list', $list);
        $this->assign('page', $page);
        $this->display();
    }
	public function del()
    {

        $aids = isset($_REQUEST['aids']) ? $_REQUEST['aids'] : false;
        if ($aids) {
            if (is_array($aids)) {
                $aids = implode(',', $aids);
                $map['id'] = array('in', $aids);
            } else {
                $map = 'id=' . $aids;
            }
            if (M('ser')->where($map)->delete()) {
                addlog('删除文章，AID：' . $aids);
                $this->success('恭喜，文章删除成功！');
            } else {
                $this->error('参数错误！');
            }
        } else {
            $this->error('参数错误！');
        }

    }

    public function edit($aid)
    {

        $aid = intval($aid);
        $article = M('ser')->where('id=' . $aid)->find();
        if ($article) {

            $this->assign('article', $article);
        } else {
            $this->error('参数错误！');
        }
        $this->display('form');
    }
	
	public function status(){
		$where['id'] = $_GET['id'] ? $_GET['id'] : $this->error('参数错误');
		$data['status'] = $_GET['status'] ? $_GET['status'] : $this->error('参数错误');
		if(M('Ser')->where($where)->save($data)){
			$this->success('操作成功');
		}else{
			$this->error('操作失败');
		}
	}
	
    public function update($aid = 0)
    {

        $aid = intval($aid);
        //$data['id'] = isset($_POST['sid']) ? intval($_POST['sid']) : 0;
        $data['name'] = isset($_POST['name']) ? $_POST['name'] : false;
        $data['ip'] = isset($_POST['ip']) ? $_POST['ip'] : '';
        $data['domain'] = isset($_POST['domain']) ? $_POST['domain'] : '';;
        $data['addtime'] = time();
		
        if (!$data['name'] or !$data['ip']) {
            $this->error('警告！名称和ip为必填项目。');
        }
        if ($aid) {
            M('ser')->data($data)->where('id=' . $aid)->save();
            addlog('编辑服务，AID：' . $aid);
            $this->success('恭喜！服务编辑成功！');
        } else {
            $aid = M('ser')->data($data)->add();
            if ($aid) {
                addlog('新增服务，AID：' . $aid);
                $this->success('恭喜！服务新增成功！');
            } else {
                $this->error('抱歉，未知错误！');
            }

        }
    }
	
}