<?php
namespace Home\Controller;

use Vendor\Page;

use Vendor\Tree;

class VodController extends ComController
{
	public function index(){
		$this->username = $_SESSION['name'];
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
		if(IS_POST){
			$data = array(
				'ucat' => trim($_POST['ucat']),
				'pid' => $_POST['pid'],
				'uid' => $uid['id']
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
			$this->display();
		}
		
	}

	public function help(){
		
		$this->username = $_SESSION['name'];
		$this->display();
	}

	public function fav(){
		$this->username = $_SESSION['name'];

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
		$this->display();
	}

	public function upd(){
		$data = array(
			'cid' => $_POST['cid'],
			'title' => $_POST['title'],
			'titlepic' => $_POST['titlepic'],
			'mid' => $_POST['mid'],
			'odownpath1' => $_POST['odownpath1'],
			'share' => $_POST['share'],
			'videoid' => $_POST['videoid'],
			'uid' => $_SESSION['id'],
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
		M('vod')->where($where)->save($map);
		$data = array(
			'cid' => $vod['cid'],
			'uid' => $_SESSION['id'],
			'vid' => $where['id']
		);
		if(M('fav')->data($data)->add()){
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
        $list = $article->where($where)->order($orderby)->limit($offset . ',' . $pagesize)->select();
        
        $page = new \Think\Page($count, $pagesize);
        $page = $page->show();
        $this->num = $count;
        $this->assign('list', $list);
        $this->assign('page', $page);
		$this->display();
	}

	
}