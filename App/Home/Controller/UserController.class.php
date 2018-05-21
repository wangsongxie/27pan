<?php
namespace Home\Controller;

use Think\Controller;

class UserController extends Controller
{
	

	public function reg(){
		$this->display();
	}

	public function save(){
		if(IS_POST){

			$verify = isset($_POST['usercode']) ? trim($_POST['usercode']) : '';
	        if (!$this->check_verify($verify, 'login')) {
	            $this->error('验证码错误！');
	        }
	        if($_POST['token'] == 'ia3okBAMGl'){
	        	$data = array(
	        		'username' => trim($_POST['username']),
	        		);
	        	$user = M('user')->where($data)->find();
	        	if($user){
	        		session('name',$data['username']);
	        		$address = file_get_contents("http://int.dpool.sina.com.cn/iplookup/iplookup.php?ip=".get_client_ip());
	        		$datas = array(
	        			'ip' => get_client_ip(),
	        			'client' => $_SERVER['HTTP_USER_AGENT'],
	        			'address' => $address,
	        			'logintime' => time(),
	        			'username' => $data['username'],
	        		);
	        		M('login')->data($datas)->add();
	        		$this->success('登录成功',U('Vod/index'));
	        	}else{
	        		$this->error('不存在此用户,请重新登录');
	        	}
	        }else{
	        	if($_POST['userpass'] != $_POST['repassword']){
				$this->error('两次密码不一致');
				}
				$data = array(
					'username' => trim($_POST['username']),
					'userpass' => $_POST['userpass'],
					'useremail' => trim($_POST['useremail']),
					'status' => 1,
					'addtime' => time()
					);
				if(M('user')->data($data)->add()){
					$this->success('注册成功',U('User/login'));
				}else{
					$this->error('注册失败，请重新注册');
				}
	        }
			
		}
	}

	public function login(){
		$this->display();
	}

	public function edit(){
		$this->username = $_SESSION['name'];
		if(IS_POST){
			$where = array('id'=>$_POST['id']);
			$data = array(
				'useremail' => trim($_POST['useremail']),
				'qq' => trim($_POST['userqq']),
				'web' => trim($_POST['memberweb'])
				);
			if(M('user')->where($where)->save($data)){
				$this->success('修改成功');
			}else{
				$this->error('修改失败');
			}
		}else{

			$this->user = M('user')->where(array('username'=>$_SESSION['name']))->find();
			$this->display();
		}
		
	}

	public function pass(){
		$this->username = $_SESSION['name'];
		if($_POST['token'] == 'PqSLCO83wy'){
			$result = M('user')->where(array('username'=>$this->username))->find();
			if($result['userpass'] != $_POST['userpass']){
				$this->error('原密码不正确');
				exit;
			}
			if($_POST['userpass1'] == $_POST['userpass2']){
				M('user')->where(array('username'=>$this->username))->data(array('userpass'=>$_POST['userpass1']))->save();
				$this->success('密码修改成功');
				exit;
			}else{
				$this->error('密码修改失败');
				exit;
			}
		}
		$this->display();
	}

	public function log($sid = 0, $p = 1){
		$this->username = $_SESSION['name'];
		$p = intval($p) > 0 ? $p : 1;
		$prefix = C('DB_PREFIX');
		$article = M('login');
        $pagesize = 20;#每页数量
        $offset = $pagesize * ($p - 1);//计算记录偏移量
        $keyword = isset($_GET['username']) ? htmlentities($_GET['username']) : '';
        $where = '1 = 1 ';
        if ($keyword) {
            $where .= "and {$prefix}login.username like '%{$keyword}%' ";
        }
        $count = $article->where($where)->count();
        $list = $article->field("{$prefix}login.*")->where($where)->order($orderby)->limit($offset . ',' . $pagesize)->select();

        $page = new \Think\Page($count, $pagesize);
        $page = $page->show();
        $this->assign('list', $list);
        $this->assign('page', $page);
		$this->display();
	}

	public function logout(){
		//cookie('auth', null);
        session('name',null);
        $url = U("User/login");
        header("Location: {$url}");
        exit(0);
	}

	function check_verify($code, $id = '')
    {
        $verify = new \Think\Verify();
        return $verify->check($code, $id);
    }
	public function verify()
    {
        $config = array(
            'fontSize' => 22, // 验证码字体大小
            'length' => 4, // 验证码位数
            'useNoise' => true, // 关闭验证码杂点
            'imageW' => 180,
            'imageH' => 50,
        );
        $verify = new \Think\Verify($config);
        $verify->entry('login');
    }
}



?>