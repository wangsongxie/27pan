<?php
namespace Home\Controller;

use Vendor\Page;

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

	public function lists($id){
		
		$this->display();
	}
}