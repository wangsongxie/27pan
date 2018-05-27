<?php
namespace Home\Controller;

use Vendor\Page;

use Vendor\Tree;

class VodController extends ComController
{
	public function index($id=0,$p=1){
		$this->username = $_SESSION['name'];
		$p = intval($p) > 0 ? $p : 1;
		$prefix = C('DB_PREFIX');
		$article = M('vod');
        $pagesize = 20;#每页数量
        $offset = $pagesize * ($p - 1);//计算记录偏移量
        $keyword = isset($_GET['username']) ? htmlentities($_GET['username']) : '';
        $where['uid'] = $_SESSION['id'];
		if($_GET['id']){
			$where['cid'] = $_GET['id'];
		}
		
        $count = $article->where($where)->count();
        $list = $article->field("{$prefix}vod.*,{$prefix}category.name,{$prefix}ucat.ucat")->where($where)->join("{$prefix}category ON {$prefix}category.id = {$prefix}vod.cid")->join("{$prefix}ucat ON {$prefix}ucat.id = {$prefix}vod.mid")->order($orderby)->limit($offset . ',' . $pagesize)->select();
        
        $page = new \Think\Page($count, $pagesize);
        $page = $page->show();
        $this->num = M('vod')->where(array('uid'=>$_SESSION['id']))->count();
		$this->cate = M('category')->field('id,name')->order('o')->select();
        $this->assign('list', $list);
        $this->assign('page', $page);
		$this->display();
	}
	
	public function pic(){
		$this->display();
	}

	public function uclass(){
		$this->username = $_SESSION['name'];
		$uid = M('user')->where(array('username'=>$this->username))->find();
		$this->number = M('user')->where(array('uid'=>$uid['id']))->count();
		$this->cat = M('ucat')->where(array('uid'=>$uid['id']))->select();
		$this->display();
	}
	
	public function delete(){
		if($_GET['id']){
			if(M('ucat')->where(array('id'=>$_GET['id']))->delete()){
				$this->success('删除成功');
			}else{
				$this->error('删除失败');
			}
		}else{
			$this->error('请求失败');
		}
	}

	public function eclass(){
		$this->username = $_SESSION['name'];
		$uid = M('user')->where(array('username'=>$this->username))->find();
		//我的分类
        $cate = M('ucat')->field('id,pid,ucat')->where(array('uid'=>$_SESSION['id']))->select();
        $tree = new Tree($cate);
        $str = "<option value=\$id \$selected>\$spacer\$ucat</option>"; //生成的形式
        $cate = $tree->get_tree(0, $str, 0);
        $this->assign('mycat', $cate);//导航
		if(IS_POST){
			$data = array(
				'ucat' => trim($_POST['ucat']),
				'pid' => $_POST['pid'],
				'u_id' => $uid['id']
				);
			if(M('ucat')->data($data)->add()){
				$this->success('添加成功');
			}else{
				$this->error('添加失败');
			}
		}else{
			$this->number = M('user')->where(array('uid'=>$uid['id']))->count();
			if($_GET['id']){
				$this->cat = M('ucat')->where(array('id'=>$_GET['id']))->find();
			}			
			
		}
		$this->display();
		
	}

	public function help(){
		
		$this->username = $_SESSION['name'];
		$this->display();
	}

	public function fav($id=0,$p=1){
		$this->username = $_SESSION['name'];
		$p = intval($p) > 0 ? $p : 1;
		$prefix = C('DB_PREFIX');
		$article = M('fav');
        $pagesize = 20;#每页数量
        $offset = $pagesize * ($p - 1);//计算记录偏移量
        $keyword = isset($_GET['username']) ? htmlentities($_GET['username']) : '';
        $where['uid'] = $_SESSION['id'];
		$where['status'] = 1;
		if($_GET['id']){
			$where['cid'] = $_GET['id'];
		}
		
        $count = $article->where($where)->count();
        $list = $article->field("{$prefix}fav.*,{$prefix}category.name")->where($where)->join("{$prefix}category ON {$prefix}category.id = {$prefix}fav.cid")->order($orderby)->limit($offset . ',' . $pagesize)->select();
        
        $page = new \Think\Page($count, $pagesize);
        $page = $page->show();
        $this->num = M('fav')->where(array('uid'=>$_SESSION['id']))->count();
		$this->cate = M('category')->field('id,name')->order('o')->select();
        $this->assign('list', $list);
        $this->assign('page', $page);
		$this->display();
	}

	public function up(){

		$category = M('category')->field('id,pid,name')->order('o asc')->select();
        $tree = new Tree($category);
        $str = "<option value=\$id \$selected>\$spacer\$name</option>"; //生成的形式
        $category = $tree->get_tree(0, $str, 0);
        $this->assign('category', $category);//导航
        //我的分类
        $cate = M('ucat')->field('id,pid,ucat')->where(array('uid'=>$_SESSION['id']))->select();
        $tree = new Tree($cate);
        $str = "<option value=\$id \$selected>\$spacer\$ucat</option>"; //生成的形式
        $cate = $tree->get_tree(0, $str, 0);
        $this->assign('mycat', $cate);//导航
		$this->ser = M('ser')->where(array('status'=>1))->order('id desc')->select();
		$this->display();
	}

	public function upd(){
		$data = array(
			'cid' => $_POST['cid'],
			'size' => $_POST['size'],
			'title' => $_POST['s_title'],
			'titlepic' => $_POST['titlepic'],
			'mid' => $_POST['mid'],
			'odownpath1' => $_POST['odownpath1'],
			'share' => $_POST['share'],
			'videoid' => $_POST['videoid'],
			'uid' => $_SESSION['id'],
			'fileurl' => $_POST['fileurl'],
			'videofileurl' => $_POST['videofileurl'],
			'addtime' => time(),
		);
		if(M('vod')->data($data)->add()){
			$this->success('提交成功');
		}else{
			$this->error('提交失败');
		}
	}

	public function vodFav(){

		$where['id'] = $_GET['id'] ? $_GET['id'] : $this->ajaxReturn(array('msg'=>'请选择收藏的视频'));

		$vod = M('vod')->where($where)->find();

		$arr = explode(',',$vod['fid']);
		if(in_array($_SESSION['id'],$arr)){
			$this->ajaxReturn(array('msg'=>'您已经收藏过了!'));
			exit;
		}
		$map = array(
			'fid' => $vod['fid'].$_SESSION['id'].',',
		);
		
		$data = array(
			'cid' => $vod['cid'],
			'size' => $vod['size'],
			'title' => $vod['title'],
			'titlepic' => $vod['titlepic'],
			'mid' => $vod['mid'],
			'odownpath1' => $vod['odownpath1'],
			'share' => $vod['share'],
			'videoid' => $vod['videoid'],
			'uid' => $_SESSION['id'],
			'fileurl' => $vod['fileurl'],
			'videofileurl' => $vod['videofileurl'],
			'addtime' => $vod['addtime'],
		);
		if(M('fav')->data($data)->add() && M('vod')->where($where)->save($map)){
			$this->ajaxReturn(array('msg'=>'ok'));
			exit;
		}else{
			$this->ajaxReturn(array('msg'=>'error'));
			exit;
		}
	}

	public function lists($id = 0, $p = 1){
		
		$this->username = $_SESSION['name'];
		$p = intval($p) > 0 ? $p : 1;
		$prefix = C('DB_PREFIX');
		$article = M('vod');
        $pagesize = 20;#每页数量
        $offset = $pagesize * ($p - 1);//计算记录偏移量
        $keyword = isset($_GET['username']) ? htmlentities($_GET['username']) : '';
        $where['cid'] = $_GET['id'];

        $count = $article->where($where)->count();
        $list = $article->field("{$prefix}vod.*,{$prefix}category.name,{$prefix}user.username")->where($where)->join("{$prefix}category ON {$prefix}category.id = {$prefix}vod.cid")->join("{$prefix}user ON {$prefix}user.id = {$prefix}vod.uid")->order($orderby)->limit($offset . ',' . $pagesize)->select();
        
        $page = new \Think\Page($count, $pagesize);
        $page = $page->show();
        $this->num = $count;
		
        $this->assign('list', $list);
        $this->assign('page', $page);
		$this->display();
	}
	public function serach($id = 0, $p = 1){
		
		$this->username = $_SESSION['name'];
		$p = intval($p) > 0 ? $p : 1;
		$prefix = C('DB_PREFIX');
		$article = M('vod');
        $pagesize = 20;#每页数量
        $offset = $pagesize * ($p - 1);//计算记录偏移量
        $keyword = isset($_GET['username']) ? htmlentities($_GET['username']) : '';
        $where['title'] = array('like','%'.$_GET['key'].'%');

        $count = $article->where($where)->count();
        $list = $article->field("{$prefix}vod.*,{$prefix}category.name,{$prefix}user.username")->where($where)->join("{$prefix}category ON {$prefix}category.id = {$prefix}vod.cid")->join("{$prefix}user ON {$prefix}user.id = {$prefix}vod.uid")->order($orderby)->limit($offset . ',' . $pagesize)->select();
        
        $page = new \Think\Page($count, $pagesize);
        $page = $page->show();
        $this->num = $count;
		
        $this->assign('list', $list);
        $this->assign('page', $page);
		$this->display();
	}

	
}